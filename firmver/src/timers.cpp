#include "timers.h"

#include "config.h"
#include "services/logging.h"
#include "utils/utils.h"
#include "utils/reg.h"
#include "drivers/buttons.h"
#include "drivers/display.h"
#include "clock.h"
#include "state.h"


// Po stlaceni tlacidla v night mode zobrazime cas po tuto dobu (ms).
#define NIGHT_PREVIEW_MS 5000u

namespace Timers {

using namespace Clock;

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

void enterNightMode() {
    _night_mode = true;
    State::setMode(State::NIGHT);

    Display::setBrightness(0);

    sprintln(F("[Timers] Night mode aktivovany."));
}

void exitNightMode() {
    _night_mode = false;
    State::clearMode();

    Display::setBrightness(Display::getConfigBrightness());

    sprintln(F("[Timers] Night mode ukonceny."));
}

// Po stlaceni tlacidla v night mode zobrazime cas na NIGHT_PREVIEW_MS ms.
// Pouzivame start-time + elapsed porovnanie, aby sme sa vyhli preteceniu uint16_t.
static bool     _preview_active   = false;
static uint16_t _preview_start_ms = 0;

void nightModeMillisecondLoop() {
    if (!_night_mode) {
        return;
    }

    uint16_t tc;
    NO_INTERRUPTS_SECTION { tc = timer_counter; }

    if (Buttons::isAnyButtonPressed() && !_preview_active) {
        info("Rezim nahladu pocas spanku...");
        Display::setBrightness(Display::getConfigBrightness());
        Display::displayTimeFromCounters(t_counter_minutes, t_counter_hours);
        _preview_active   = true;
        _preview_start_ms = tc;
        return;
    }

    if (_preview_active && (uint16_t)(tc - _preview_start_ms) >= NIGHT_PREVIEW_MS) {
        _preview_active = false;
        Display::setBrightness(0);
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
