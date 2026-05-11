
#include "main.h"
#include "utils/reg.h"
#include "config.h"
#include "const.h"
#include "clock.h"
#include "display.h"
#include "fading.h"

namespace Display {

// Sem ulozime bajty ktore zobrazujeme,
// lebo ked chceme upravit len jedno cislo ostatne cisla si musime pamatat.
uint8_t DIGITS[DIGIT_COUNT] = {0, 0, 0, 0};

uint8_t configured_brightness = DEFAULT_BRIGHTNESS; // Pre aplikovaný jas pozri register PWM_REGISTER

static bool _emergency_shutdown = false;

// Nastavovanie jasu s histereziou.
void setBrightness(const uint8_t value, const uint8_t histeresis) {
    const uint8_t new_brightness = MIN(value, MAX_BRIGHTNESS);

    if (_target_brightness == new_brightness) {
        return; // Ziadna zmena
    }

    // Hodnota chce narast, musi splnat tazsiu podmienku.
    // Pouzivame odcitanie namiesto scitania, aby sme predisli preteceniu uint8_t
    // (napr. _target_brightness=250 + histeresis=10 by pretieklo na 4).
    if (new_brightness < _target_brightness ||
        (new_brightness > _target_brightness &&
         (new_brightness - _target_brightness) > histeresis)) {
        sprint("Nastavujem jas na: "); sprintln(new_brightness);
        _target_brightness = new_brightness;
    }
}

void incrementBrightness(int8_t step) {
    const int16_t next = (int16_t)_target_brightness + (int16_t)step;
    setConfigBrightness((uint8_t)CONSTRAIN(next, (int16_t)MIN_BRIGTHNESS, (int16_t)MAX_BRIGHTNESS));
}

void setConfigBrightness(uint8_t value) {
    setBrightness(value);
    configured_brightness = _target_brightness;
}

uint8_t getConfigBrightness() {
    return configured_brightness;
}

void setSymbolRawOnNumitron(const uint8_t numitron_index, const uint8_t symbol) {
    if (numitron_index >= DIGIT_COUNT) {
        return;
    }

    DIGITS[numitron_index] = symbol;
}

// Numitrony su indexovane zpredu zľava ako: 0, 1, 2, 3
void setSymbolOnNumitron(const uint8_t numitron_index, const uint8_t symbol_index) {
    if (symbol_index < NUM_SYMBOL_COUNT) {
        setSymbolRawOnNumitron(numitron_index, GET_SEGMENT_SYMBOL(symbol_index));
    }
}

uint8_t getTimeDigitWithIndex(uint8_t digit, uint8_t minutes, uint8_t hours) {
    const uint8_t minute_digit = (digit == DIGIT_MIN_TENS || digit == DIGIT_MIN_ONES);
    // Cele cislo, bud minut alebo hodin
    uint8_t num = (minute_digit) ? minutes : hours;
    return (digit == DIGIT_HOR_TENS || digit == DIGIT_MIN_TENS)
        ? num / 10 : num % 10; // Neparne cisla nemozu mat nastaveny prvy bit.
}

void displayTimeFromCounters(uint8_t counter_minutes, uint8_t counter_hours) {
    sprintln(F("displayTimeFromCounters"));

    // Podpora pre 12h format: polnoc aj poludnie je 12:00 (loop-invariant, compute once)
    const uint8_t hours =
        (Config::getSymbolIndex(Config::TIME_HOUR_FORMAT) ==
         Config::HOUR_FORMAT_12H)
            ? ((counter_hours % 12 == 0) ? 12 : counter_hours % 12)
            : counter_hours;

    bool needs_update = false;
    for (uint8_t digit = 0; digit < DIGIT_COUNT; digit++) {
        const uint8_t val = getTimeDigitWithIndex(digit, counter_minutes, hours);
        uint8_t new_symbol = GET_SEGMENT_SYMBOL(val);

        // Ak mame vypnutu uvodnu nulu, cielovy symbol je prazdny.
        if (digit == DIGIT_HOR_TENS && val == 0 && Config::get(Config::TIME_LEADING_ZERO) == 0) {
            new_symbol = 0;
        }

        if (DIGITS[digit] != new_symbol) {
            setSymbolRawOnNumitron(digit, new_symbol);
            needs_update = true;
        }
    }

    if (needs_update) {
        Crossfading::transitionTo(DIGITS);
    }
}

void displayYear() {
#if RTC_ENABLED
    uint16_t                  year = 2025;
    Modules::DS3231::DateTime now{};
    if (Modules::DS3231::now(now)) {
        year = now.year;
    }
#elif DCF77_ENABLED
    Clock::time_t now;
    DCF77_Clock::get_current_time(now);
    const uint16_t year = bcd_to_int(now.year);
#else
    const uint16_t year = 2025;
#endif
    sprint("Rok: ");
    sprintln(year);

    const uint8_t year_milliennia = (year / 1000) % 10;
    const uint8_t year_centuries  = (year / 100) % 10;
    const uint8_t year_decades    = (year / 10) % 10;
    const uint8_t year_ones       = year % 10;

    setSymbolOnNumitron(DIGIT_HOR_TENS, year_milliennia);
    setSymbolOnNumitron(DIGIT_HOR_ONES, year_centuries);
    setSymbolOnNumitron(DIGIT_MIN_TENS, year_decades);
    setSymbolOnNumitron(DIGIT_MIN_ONES, year_ones);

    Crossfading::transitionTo(DIGITS);
}

// Pre nastavovanie jednotlivych segmentov (hlavne pri desatinnej ciarke)
// kedy nechceme menit cely symbol len upravit nejaky zo segmentov.
void addNumitronSegmentMask(uint8_t digit, uint8_t mask, bool state) {
    if (digit >= DIGIT_COUNT) {
        return issue(F("addNumitronSegmentMask: Neplatny index numitronu: ")); sprintln(digit);
    }

    uint8_t&      byte    = DIGITS[digit];
    const uint8_t updated = (byte & ~mask) | (state ? mask : 0u);

    if (updated != byte) {
        byte = updated;
        Crossfading::transitionTo(DIGITS);
    }
}

// Rozsvieti vsetky segmenty — uzivatel vie povedat ktore su vypalene.
void showAllSegments() {
    sprintln(F("Spúštanie diagnostiky... (rozsviecanie všetkých segmentov displeja)"));
    setSymbolRawOnNumitron(DIGIT_HOR_TENS, GET_SEGMENT_SYMBOL(ALL_ON_SYMBOL));
    setSymbolRawOnNumitron(DIGIT_HOR_ONES, GET_SEGMENT_SYMBOL(ALL_ON_SYMBOL));
    setSymbolRawOnNumitron(DIGIT_MIN_TENS, GET_SEGMENT_SYMBOL(ALL_ON_SYMBOL));
    setSymbolRawOnNumitron(DIGIT_MIN_ONES, GET_SEGMENT_SYMBOL(ALL_ON_SYMBOL));
    Crossfading::transitionTo(DIGITS);
}

void clear() {
    putDigitsToInputRegs(DIGITS, DIGIT_COUNT);
    pushToOutputRegs();
}

void emergencyShutdown() {
    critical("emergencyShutdown()\n");

    _emergency_shutdown = true;

    // 1. Immediately stop PWM and pull the brightness pin low
    //    to cut power to the numitrons as fast as possible.
    CRITICAL_SECTION {
        STOP_DISPLAY_PWM();
        SBI(PORTD, _G_PORTD); // Same as the ramp-down path does at PWM=0
    }

    // 2. Zero out the digit buffer and push blank state to shift registers.
    //    This ensures that if PWM is ever re-enabled, no segments light up.
    memset(DIGITS, 0, sizeof(DIGITS));
    putDigitsToInputRegs(DIGITS, DIGIT_COUNT);
    pushToOutputRegs();

    // 3. Bypass the ramp — force PWM register to 0 directly.
    //    _target_brightness must also be zeroed so brightnessRampTick()
    //    does not try to ramp back up on the next ISR tick.
    CRITICAL_SECTION {
        DISPLAY_PWM_REG    = 0;
        _target_brightness = 0;
    }
}

void boot() {
    clear();

    // Zapneme PWM ovladajuci jas.
    CRITICAL_SECTION {
        START_DISPLAY_PWM();
    }

    // Uistime sa ze jas je zretelne viditelny pocas startu.
    if (_target_brightness < DEFAULT_BRIGHTNESS) {
        setBrightness(DEFAULT_BRIGHTNESS);
    }

    // Rozsvietime vsetky segmenty pocas inicializacie modulov ako vizualnu indikaciu startu.
    sprintln(F("Úvodná diagnostika spustená — inicializácia prebieha..."));
    showAllSegments();
}

///////////////////////////////////////

ONLY_IN_ISR static uint8_t _brightness_counter = 0;

// ! POZOR: Tato hodnota by sa nikdy nemala nastavovat priamo!!
volatile uint8_t _target_brightness = DEFAULT_BRIGHTNESS;

static void brightnessRampTick() {
    // Pomaly prechod z jedneho stavu jasu do druheho, pre zvysenie zivotnosti vlakien.
    if (_target_brightness != DISPLAY_PWM_REG &&
        _target_brightness <= MAX_BRIGHTNESS) {
        if ((++_brightness_counter) == BRIGHTNESS_CNT_TOP) {
            if (_target_brightness > DISPLAY_PWM_REG) {
                if (DISPLAY_PWM_REG == 0 && !IS_DISPLAY_PWM_ON()) {
                    START_DISPLAY_PWM();
                } else {
                    DISPLAY_PWM_REG++;
                }
            } else if (DISPLAY_PWM_REG && --DISPLAY_PWM_REG == 0) {
                SBI(PORTD, _G_PORTD);
                STOP_DISPLAY_PWM();
            }
            _brightness_counter = 0;
        }
    } else {
        _brightness_counter = 0;
    }
}

/****************************************
 * Obsluha
 ****************************************/

void onISRTick() {
    if (_emergency_shutdown) {
        return;
    }

    brightnessRampTick();
    Crossfading::onISRTick();
}

} // namespace Display
