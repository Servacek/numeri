
#include "main.h"
#include "string.h"
#include "clock.h"
#include "utils/reg.h"
#include "config.h"
#include "const.h"
#include "display.h"
#include "fading.h"
#include "services/logging.h"

namespace Display {

// Jedine zdielane definicie — boli v display.h ako static, kazde TU malo svoju kopiu.
uint8_t          _DIGITS[DIGIT_COUNT]  = {0, 0, 0, 0};
volatile uint8_t _target_brightness    = Display::DEFAULT_BRIGHTNESS;

// Pozn.: Jasovy strop zijе v Config (DISPLAY_BRIGHTNESS_CAP) - dochovany v EEPROM,
// chrany min/max v entries_meta. Nemame teda lokalnu kopiu.
static bool    _emergency_shutdown = false;
static uint8_t _disabled_mask      = 0; // bitova maska vadnych numitronov (bit i = numitron i)

// Nastavovanie jasu s histereziou.
void setBrightness(const uint8_t value, const uint8_t histeresis) {
    const uint8_t new_brightness = value > 0
        ? CONSTRAIN(value, Display::MIN_BRIGHTNESS, Display::MAX_BRIGHTNESS)
        : 0; // Nula je specialny pripad pre vypnuty displej.

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

void setConfigBrightness(uint8_t value) {
    // Strop drzime v Config (perzistentne v EEPROM, validacia rozsahu vo valid()).
    // Config::set zaroven uplatni meta_min/meta_max, takze value < MIN_BRIGHTNESS
    // alebo > MAX_BRIGHTNESS sa odmietne a hodnota sa nezmeni.
    if (!Config::set(Config::DISPLAY_BRIGHTNESS_CAP, value)) {
        return;
    }
    Config::save(Config::DISPLAY_BRIGHTNESS_CAP);

    // V manualnom rezime sa strop = aktualny jas; nastavime ho hned.
    // V AUTO rezime nechame LDR slucku aplikovat novy strop na nasledujucom ticku,
    // ale ak je momentalne nad stropom, znizime hned (chrana Numitronov).
    if (Config::get(Config::DISPLAY_BRIGHTNESS_MODE) == Config::BRIGHTNESS_MANUAL) {
        setBrightness(value);
    } else if (_target_brightness > value) {
        setBrightness(value);
    }
}

uint8_t getConfigBrightness() {
    return Config::get(Config::DISPLAY_BRIGHTNESS_CAP);
}

void setSymbolRawOnNumitron(const uint8_t numitron_index, const uint8_t symbol) {
    if (numitron_index >= DIGIT_COUNT) {
        return;
    }

    _DIGITS[numitron_index] = symbol;
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

    bool needs_update = false;
    for (uint8_t digit = 0; digit < DIGIT_COUNT; digit++) {
        if (_disabled_mask & (1u << digit)) continue;
        const uint8_t val = getTimeDigitWithIndex(digit, counter_minutes, counter_hours);
        uint8_t new_symbol = GET_SEGMENT_SYMBOL(val);

        if (_DIGITS[digit] != new_symbol) {
            setSymbolRawOnNumitron(digit, new_symbol);
            needs_update = true;
        }
    }

    if (needs_update) {
        Crossfading::startTransition();
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

    Crossfading::startTransition();
}

// Pre nastavovanie jednotlivych segmentov (hlavne pri desatinnej ciarke)
// kedy nechceme menit cely symbol len upravit nejaky zo segmentov.
void addNumitronSegmentMask(uint8_t digit, uint8_t mask, bool state) {
    if (digit >= DIGIT_COUNT) {
        issue(F("addNumitronSegmentMask: Neplatny index numitronu: ")); sprintln(digit);
        return;
    }

    uint8_t&      byte    = _DIGITS[digit];
    const uint8_t updated = (byte & ~mask) | (state ? mask : 0u);

    if (updated != byte) {
        byte = updated;
        Crossfading::startTransition();
    }
}

// Rozsvieti vsetky segmenty — uzivatel vie povedat ktore su vypalene.
void showAllSegments() {
    sprintln(F("Spúštanie diagnostiky... (rozsviecanie všetkých segmentov displeja)"));
    setSymbolRawOnNumitron(DIGIT_HOR_TENS, GET_SEGMENT_SYMBOL(ALL_ON_SYMBOL));
    setSymbolRawOnNumitron(DIGIT_HOR_ONES, GET_SEGMENT_SYMBOL(ALL_ON_SYMBOL));
    setSymbolRawOnNumitron(DIGIT_MIN_TENS, GET_SEGMENT_SYMBOL(ALL_ON_SYMBOL));
    setSymbolRawOnNumitron(DIGIT_MIN_ONES, GET_SEGMENT_SYMBOL(ALL_ON_SYMBOL));
    Crossfading::startTransition();
}

void clear() {
    putDigitsToInputRegs(_DIGITS, DIGIT_COUNT);
    pushToOutputRegs();
}

void disableNumitron(uint8_t i) {
    if (i < DIGIT_COUNT) _disabled_mask |= (uint8_t)(1u << i);
}

void emergencyShutdown() {
    critical("emergencyShutdown()\n");

    _emergency_shutdown = true;

    // 1. Immediately stop PWM and pull the brightness pin low
    //    to cut power to the numitrons as fast as possible.
    NO_INTERRUPTS_SECTION {
        STOP_DISPLAY_PWM();
        SBI(PORTD, _G_PORTD); // Same as the ramp-down path does at PWM=0
    }

    // 2. Zero out the digit buffer and push blank state to shift registers.
    //    This ensures that if PWM is ever re-enabled, no segments light up.
    memset(_DIGITS, 0, sizeof(_DIGITS));
    putDigitsToInputRegs(_DIGITS, DIGIT_COUNT);
    pushToOutputRegs();

    // 3. Bypass the ramp — force PWM register to 0 directly.
    //    _target_brightness must also be zeroed so brightnessRampTick()
    //    does not try to ramp back up on the next ISR tick.
    NO_INTERRUPTS_SECTION {
        DISPLAY_PWM_REG    = 0;
        _target_brightness = 0;
    }
}

void boot() {
    clear();

    // Zapneme PWM ovladajuci jas.
    NO_INTERRUPTS_SECTION {
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

ONLY_IN_ISR static uint8_t _brightness_counter  = 0;
static volatile uint8_t    _brightness_ramp_speed = BRIGHTNESS_CNT_TOP;

void setBrightnessRampDuration(uint16_t ms) {
    const uint8_t steps = MAX_BRIGHTNESS - MIN_BRIGHTNESS;
    _brightness_ramp_speed = (uint8_t)MAX(ms / steps, (uint16_t)1);
}

static void _brightnessRampTick() {
    // Pomaly prechod z jedneho stavu jasu do druheho, pre zvysenie zivotnosti vlakien.
    if (_target_brightness != DISPLAY_PWM_REG &&
        _target_brightness <= MAX_BRIGHTNESS) {
        if ((++_brightness_counter) == _brightness_ramp_speed) {
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

    _brightnessRampTick();
    Crossfading::onISRTick();
}

} // namespace Display
