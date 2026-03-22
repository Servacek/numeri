#include "timers.h"

#include "config.h"
#include "display.h"
#include "isr.h"
#include "main.h"
#include "reg.h"
#include "buttons.h"
#include "display.h"


#include <avr/interrupt.h>
#include <avr/sleep.h>


// Po prebudeni tlacidlom zobrazime cas na tuto dobu, potom sa znovu uspime.
#define NIGHT_PREVIEW_MS 5000u

namespace Timers {

static bool    _night_mode = false;
static uint8_t _ui_timer_index =
    0u; // Ktory timer prave editujeme (TIMER_NUM digit)

// Vrati Config::ID pre hodinu daneho timera.
// Timery su ulozene ako pary (HOUR, ACTION) za sebou zacinanajuc od TIMER_0_HOUR.
static inline Config::ID hourID(uint8_t t) {
    return (Config::ID)(Config::TIMER_0_HOUR + t * 2u);
}

static inline Config::ID actionID(uint8_t t) {
    return (Config::ID)(Config::TIMER_0_HOUR + t * 2u + 1u);
}

bool isNightMode() {
    return _night_mode;
}

// INT0 (PD2) a INT1 (PD3) — pouzivame ako wake-up zo sleep modu.
// ISR nemusí nic robit, prebudenie CPU je vedlajsi efekt prerusenia.
ISR(INT0_vect) {}
ISR(INT1_vect) {}

static void _enableButtonInterrupts() {
    // Aktivujeme INT0 a INT1 na akukovek zmenu logickej urovne (CHANGE).
    // Tlacitka su INPUT_PULLUP, takze LOW = stlacene.
    // LOW level interrupt je najspolahlivejsi pre wake-up zo sleep modu.
    EICRA = (1u << ISC01) | (0u << ISC00)    // INT0: falling edge
            | (1u << ISC11) | (0u << ISC10); // INT1: falling edge
    EIMSK = (1u << INT0) | (1u << INT1);
}

static void _disableButtonInterrupts() {
    EIMSK &= (uint8_t)~((1u << INT0) | (1u << INT1));
}

// Uspime CPU v POWER_SAVE mode.
// TIMER2 (nas 1kHz tick pre DCF77 + sekundovy citac) ostava aktivny —
// FLAG_NEW_SECOND sa bude nastavovat, takze onHourTick() prebudi zariadenie
// na kazdu sekundu. To je prijatelne — chceme vediet o prichadzajucich timeroch.
static void _sleepUntilWakeup() {
    set_sleep_mode(SLEEP_MODE_PWR_SAVE);
    sleep_enable();
    sei();
    sleep_cpu();
    sleep_disable();
}

void enterNightMode() {
    _night_mode = true;
    SBI(MODE, MODE_NGHT);

    // Vypneme displej — target 0 spusti ISR rampu, ktora zastaví PWM sama.
    Display::setBrightness(0);

    _enableButtonInterrupts();

    sprintln(F("[Timers] Night mode aktivovany."));
}

void exitNightMode() {
    _night_mode = false;
    CBI(MODE, MODE_NGHT);

    _disableButtonInterrupts();

    // Obnovime nakonfigurovany jas.
    Display::setBrightness(Display::getConfigBrightness());

    sprintln(F("[Timers] Night mode ukonceny."));
}

// Checkuje, ci je aktivny nigh mode, ak ano, vypneme obrazovku a uspime CPU
// dokym ho nezobudi bud tlacitko alebo casovac. Ked zmackenem tlacitko, rozsvieti
// sa displej tak na 10-15 sekund. Da sa tiez pristupovat k nastaveniam a pripadne
// tento nocny rezim vypnut.
static uint16_t _preview_end_ms = 0; // timer_counter value when preview expires

void nightModeMillisecondLoop() {
    if (!_night_mode)
        return;

    uint16_t tc;
    NO_INTERRUPTS_SECTION { tc = timer_counter; }

    if (Buttons::isAnyButtonPressed() && _preview_end_ms == 0) {
        Display::setBrightness(Display::getConfigBrightness());
        Display::displayTimeFromCounters(t_counter_minutes, t_counter_hours);
        _preview_end_ms = tc + NIGHT_PREVIEW_MS;
        return;
    }

    if (_preview_end_ms != 0 && tc >= _preview_end_ms) {
        _preview_end_ms = 0;
        if (_night_mode)
            Display::setBrightness(0);
        return;
    }

    if (_preview_end_ms == 0) {
        _sleepUntilWakeup();
    }
}

static void _executeAction(TimerAction action) {
    switch (action) {
    case TIMER_ACTION_SLEEP:
        enterNightMode();
        break;

    case TIMER_ACTION_WAKE:
        if (_night_mode)
            exitNightMode();
        break;

    case TIMER_ACTION_BRIGHTNESS: {
        Display::setConfigBrightness(MAX_BRIGHTNESS / 2);
        sprintln(F("[Timers] Jas nastaveny na 50%."));
        break;
    }

    case TIMER_ACTION_DCF_SYNC:
#if DCF77_ENABLED
        SBI(DDRB, DCF_PON); // Zapneme DCF prijimac
        sprintln(F("[Timers] DCF77 synchronizacia spustena."));
#endif
        break;

    case TIMER_ACTION_NONE:
    default:
        break;
    }
}

void onHourTick(uint8_t current_hour) {
    for (uint8_t t = 0u; t < N_TIMERS; t++) {
        const uint8_t     hour   = Config::get(hourID(t));
        const TimerAction action = (TimerAction)Config::get(actionID(t));

        if (action == TIMER_ACTION_NONE)
            continue;
        if (hour != current_hour)
            continue;

        sprint(F("[Timers] Timer "));
        sprint(t);
        sprint(F(" spusteny, hodina="));
        sprint(hour);
        sprint(F(", akcia="));
        sprintln(action);

        _executeAction(action);
    }
}

// UI stranka ma [H1][H2][ACTION][TIMER_NUM].
// Pri nacitani stranky nacitame data aktualneho timera (_ui_timer_index) do UI slotov.
// Pri ulozeni (zmena TIMER_NUM alebo both-buttons) ulozime UI sloty do dat timera.

static void _saveCurrentTimerFromUI() {
    const uint8_t h1     = Config::get(Config::TIMER_UI_H1);
    const uint8_t h2     = Config::get(Config::TIMER_UI_H2);
    const uint8_t action = Config::get(Config::TIMER_UI_ACTION);
    const uint8_t hour   = h1 * 10u + h2;

    Config::set(hourID(_ui_timer_index), hour);
    Config::set(actionID(_ui_timer_index), action);

    // Persist do EEPROM.
    Config::save(hourID(_ui_timer_index));
    Config::save(actionID(_ui_timer_index));

    sprint(F("[Timers] Timer "));
    sprint(_ui_timer_index);
    sprint(F(" ulozeny: hodina="));
    sprint(hour);
    sprint(F(" akcia="));
    sprintln(action);
}

static void _loadTimerToUI(uint8_t timer_index) {
    const uint8_t hour   = Config::get(hourID(timer_index));
    const uint8_t action = Config::get(actionID(timer_index));

    // Nastavime UI sloty — bez spustenia on_set callbacku (priamy set).
    Config::set(Config::TIMER_UI_H1, hour / 10u);
    Config::set(Config::TIMER_UI_H2, hour % 10u);
    Config::set(Config::TIMER_UI_ACTION, action);
    // TIMER_NUM digit nastavime na aktualny index.
    Config::set(Config::TIMER_UI_NUM, timer_index);
}

// Callback: zmena H1 alebo H2 — validacia hodiny (rovnako ako onTimeSet).
static void _onTimerHourSet(uint8_t /*page*/, uint8_t conf_index) {
    const uint8_t h1   = Config::get(Config::TIMER_UI_H1);
    const uint8_t h2   = Config::get(Config::TIMER_UI_H2);
    const uint8_t hour = h1 * 10u + h2;

    if (hour < MAX_HOURS_COUNT)
        return; // Platna hodina.

    // Korekcia — rovnaka logika ako v onTimeSet.
    if (conf_index == Config::indexInPage(Config::TIMER_UI_H1)) {
        Config::set(Config::TIMER_UI_H2, 3u);
    } else {
        Config::set(Config::TIMER_UI_H1, 1u);
    }
}

// Callback: zmena TIMER_NUM — uloz aktualny timer, nacitaj novy.
static void _onTimerNumSet(uint8_t /*page*/, uint8_t /*conf_index*/) {
    const uint8_t new_index = Config::get(Config::TIMER_UI_NUM);
    if (new_index == _ui_timer_index)
        return;

    _saveCurrentTimerFromUI();
    _ui_timer_index = new_index;
    _loadTimerToUI(_ui_timer_index);
}

// loadFn pre UI stranku — nacita data aktualneho timera do UI slotov.
static void _timerPageLoadFn(uint8_t /*page*/, uint8_t conf_index) {
    if (conf_index != 0u)
        return; // Vykoname len raz.
    _loadTimerToUI(_ui_timer_index);
}

// saveFn pre UI stranku — ulozi aktualny timer z UI slotov.
static void _timerPageSaveFn(uint8_t /*page*/, uint8_t conf_index) {
    if (conf_index != 0u)
        return; // Vykoname len raz.
    _saveCurrentTimerFromUI();
}

void setup() {
    // Registrujeme on_set callbacky pre UI stranku.
    Config::setCallback(Config::TIMER_UI_H1, _onTimerHourSet);
    Config::setCallback(Config::TIMER_UI_H2, _onTimerHourSet);
    Config::setCallback(Config::TIMER_UI_NUM, _onTimerNumSet);
    // ACTION nema validaciu — je ohranicena min/max v config entry.

    // Registrujeme save/load pre celu UI stranku.
    const uint8_t ui_page = Config::page(Config::TIMER_UI_H1);
    Config::setSaveCallbackForPage(ui_page, _timerPageSaveFn);
    Config::setLoadCallbackForPage(ui_page, _timerPageLoadFn);

    // Nacitame ulozene timer data z EEPROM.
    for (uint8_t t = 0u; t < N_TIMERS; t++) {
        Config::load(hourID(t));
        Config::load(actionID(t));
    }

    // Nacitame prvy timer do UI slotov.
    _loadTimerToUI(0u);
}

} // namespace Timers
