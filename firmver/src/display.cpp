
#include "main.h"
#include "reg.h"
#include "config.h"
#include "isr.h"
#include "const.h"
#include "clock.h"
#include "display.h"
#include "fading.h"
#include "views.h"

int16_t readInternalTemperature() {
    // Save current ADC configuration
    const uint8_t _ADMUX  = ADMUX;
    const uint8_t _ADCSRA = ADCSRA;

    // Set voltage reference to internal 1.1V and select temperature sensor (ADC8)
    ADMUX = (1 << REFS1) | (1 << REFS0) | (1 << MUX3);

    // Enable ADC and set prescaler to 128 (for 16MHz clock -> 125kHz ADC clock)
    ADCSRA = (1 << ADEN) | (1 << ADPS2) | (1 << ADPS1) | (1 << ADPS0);

    wait(20); // Pockame chvilu kym si to sadne.

    ADCSRA |= (1 << ADSC);
    while (ADCSRA & (1 << ADSC))
        ;
    const uint16_t adcValue = ADC;

    // Obnovime konfiguracie ADC.
    ADMUX  = _ADMUX;
    ADCSRA = _ADCSRA;

    // Vracia hodnoty okolo 322 pre 23 °C
    // Tuto kalibraciu je treba vykonat pre kazdy cip.
    const int32_t temp        = (int32_t)(adcValue - 300) * 9259;
    const int16_t temperature = (int16_t)(temp / 10000);

    return temperature;
}

void displayTemperature() {
#if RTC_ENABLED
    int8_t temperature;
    if (!Modules::DS3231::getTemperature(temperature)) {
        temperature =
            readInternalTemperature(); // Default value if reading fails
    }
#else
    int temperature = readInternalTemperature();
#endif

    sprint("Teplota: ");
    sprintln(temperature);

    uint8_t tens = temperature / 10;
    uint8_t ones = temperature % 10;
    Display::setSymbolOnNumitron(DIGIT_HOR_TENS, ABS(tens));
    if (temperature < 0) {
        Display::setSymbolOnNumitron(DIGIT_HOR_TENS, MINUS_SYMBOL);
        if (temperature < -9) {
            ones = -9; // Cap it at -9
        }
    }
    Display::setSymbolOnNumitron(DIGIT_HOR_ONES, ABS(ones));
    Display::setSymbolOnNumitron(DIGIT_MIN_TENS, DEGREE_SYMBOL);
    Display::setSymbolOnNumitron(DIGIT_MIN_ONES, C_SYMBOL);

    Display::Crossfading::transitionTo(Display::DIGITS);
}

void displayDate() {
    uint8_t day = 0, month = 0;

#if RTC_ENABLED
    if (!Modules::DS3231::readDate(day, month))
#endif
#if DCF77_ENABLED
    {
        Clock::time_t now;
        DCF77_Clock::get_current_time(now);
        day   = bcd_to_int(now.day);
        month = bcd_to_int(now.month);
    }
#else
    {
        day   = 12;
        month = 12;
    }
#endif
    sprint(day);
    sprint(".");
    sprint(month);
    sprintln(".");

    const uint8_t day_ones   = day % 10;
    const uint8_t month_ones = month % 10;
    const uint8_t day_tens   = day / 10;
    const uint8_t month_tens = month / 10;

    Display::setSymbolOnNumitron(DIGIT_HOR_TENS, day_tens);
    Display::setSymbolOnNumitron(DIGIT_HOR_ONES, day_ones);
    Display::setSymbolOnNumitron(DIGIT_MIN_TENS, month_tens);
    Display::setSymbolOnNumitron(DIGIT_MIN_ONES, month_ones);

    Display::Crossfading::transitionTo(Display::DIGITS);
}

namespace Display {

// Sem ulozime bajty ktore zobrazujeme,
// lebo ked chceme upravit len jedno cislo ostatne cisla si musime pamatat.
uint8_t DIGITS[DIGIT_COUNT] = {0, 0, 0, 0};

uint8_t configured_brightness = DEFAULT_BRIGHTNESS; // Pre aplikovaný jas pozri register PWM_REGISTER

// Nastavovanie jasu s histereziou.
void setBrightness(const uint8_t value, const uint8_t histeresis = 0) {
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
    setConfigBrightness(MIN(MAX(_target_brightness + step, MIN_BRIGTHNESS), MAX_BRIGHTNESS));
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

    // Ak je numitron vybraty v editovacom rezime,
    // uistime sa ze desatinna ciarka je zobrazena.
    // if (numitron_index == selected_digit && BIS(MODE, MODE_EDIT)) {
    //     DIGITS[numitron_index] |= S2;
    // }
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
    if (BIS(MODE, MODE_DIAG)) {
        return;
    }

    // Podpora pre 12h format: polnoc aj poludnie je 12:00 (loop-invariant, compute once)
    const uint8_t hours = (Config::get(Config::TIME_HOUR_FORMAT) == 2)
        ? ((counter_hours % 12 == 0) ? 12 : counter_hours % 12)
        : counter_hours;

    bool needs_update = false;
    for (uint8_t digit = 0; digit < DIGIT_COUNT; digit++) {
        const uint8_t val = getTimeDigitWithIndex(digit, counter_minutes, hours);
        const uint8_t new_symbol = GET_SEGMENT_SYMBOL(val);
        // TODO: Je spravne pouzivat DIGITS?
        if (DIGITS[digit] != new_symbol) {
            setSymbolRawOnNumitron(digit, new_symbol);
            needs_update = true;

            // Ak mame vypnutu uvodnu nulu.
            if (digit == DIGIT_HOR_TENS && val == 0 && Config::get(Config::TIME_LEADING_ZERO) == 0) {
                setSymbolRawOnNumitron(digit, 0);
            }
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
void setNumitronSegment(uint8_t digit, uint8_t index, bool state) {
    if (digit >= DIGIT_COUNT || index >= 8u)
        return;

    uint8_t&      byte = DIGITS[digit];
    const uint8_t mask = (uint8_t)(1u << index);
    const uint8_t updated = (byte & ~mask) | (state ? mask : 0u);

    if (updated != byte) {
        byte = updated;
        Crossfading::transitionTo(DIGITS);
    }
}

// Pri diagnostike chceme aby svietili vsetky segmenty,
// takze uzivatel vie povedat ktore su vypalene.
void startDiagnostics() {
    if (!BIS(MODE, MODE_DIAG)) {
        SBI(MODE, MODE_DIAG);
        sprintln(F("Spúštanie diagnostiky... (rozsviecanie všetkých segmentov displeja)"));

        setSymbolRawOnNumitron(DIGIT_HOR_TENS,  GET_SEGMENT_SYMBOL(ALL_ON_SYMBOL));
        setSymbolRawOnNumitron(DIGIT_HOR_ONES, GET_SEGMENT_SYMBOL(ALL_ON_SYMBOL));
        setSymbolRawOnNumitron(DIGIT_MIN_TENS,  GET_SEGMENT_SYMBOL(ALL_ON_SYMBOL));
        setSymbolRawOnNumitron(DIGIT_MIN_ONES, GET_SEGMENT_SYMBOL(ALL_ON_SYMBOL));

        Crossfading::transitionTo(DIGITS);
    }
}

void stopDiagnostics() {
    if (BIS(MODE, MODE_DIAG)) {
        sprintln(F("Vypínanie diagnostiky..."));

        CBI(MODE, MODE_DIAG);
    }
}

void clear() {
    putDigitsToInputRegs(DIGITS, DIGIT_COUNT);
    pushToOutputRegs();
}

void boot() {
    clear();

    // Zapneme PWM ovladajuci jas.
    CRITICAL_SECTION {
        START_DISPLAY_PWM();
    }

    // Rozsvietime vsetky segmenty displeja ako vizualnu indikaciu startu.
    // Diagnostika prebieha pocas celej inicializacie modulov (I2C, RTC, INA, EEPROM).
    // stopDiagnostics() + CBI(MODE, MODE_BOOT) sa volaju az na konci setup(),
    // tesne pred zobrazenim casu — takze uzivatel vidi diagnostiku po celu dobu bootu.
    SBI(MODE, MODE_BOOT);
    sprintln(F("Úvodná diagnostika spustená — inicializácia prebieha..."));

    clear();

    // Pri diagnostike sa potrebujeme uistit, ze jas je zretelne viditelny,
    // ale nechceme zaciatok zbytocne presvietit.
    if (_target_brightness < MIN_BRIGTHNESS) {
        setBrightness(MIN_BRIGTHNESS);
    }

    startDiagnostics();
}

///////////////////////////////////////

ONLY_IN_ISR static uint8_t _brightness_counter = 0;

// ! POZOR: Tato hodnota by sa nikdy nemala nastavovat priamo!!
volatile uint8_t _target_brightness = MIN_BRIGTHNESS;

CALLED_FROM_ISR static void brightnessRampTick() {
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

CALLED_FROM_ISR void onMillisecondTick() {
    brightnessRampTick();
    Crossfading::onMillisecondTick();
}

} // namespace Display
