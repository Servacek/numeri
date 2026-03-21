
#include "main.h"
#include "reg.h"
#include "config.h"
#include "isr.h"
#include "clock.h"
#include "display.h"


uint8_t selected_digit = DIGIT_HOR_TENS;

// ! POZOR: Tato hodnota by sa nikdy nemala nastavovat priamo!!
volatile uint8_t _target_brightness = MIN_BRIGTHNESS;

// Sem ulozime bajty ktore zobrazujeme,
// lebo ked chceme upravit len jedno cislo ostatne cisla si musime pamatat.
uint8_t DIGITS[DIGIT_COUNT] = {0, 0, 0, 0};

volatile uint8_t configured_brightness = DEFAULT_BRIGHTNESS; // Pre aplikovaný jas pozri register PWM_REGISTER

// Nastavovanie jasu s histereziou.
void setDisplayBrightness(const uint8_t value, const uint8_t histeresis) {
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

void configDisplayBrightness(uint8_t value) {
    configured_brightness = value;
    setDisplayBrightness(configured_brightness);
}

void setSymbolRawOnNumitron(const uint8_t numitron_index, const uint8_t symbol) {
    if (numitron_index >= DIGIT_COUNT) {
        return; // No change
    }

    DIGITS[numitron_index] = symbol;

    // Ak je numitron vybraty v editovacom rezime, uistime sa ze desatinna ciarka je zobrazena.
    if (numitron_index == selected_digit && BIS(MODE, MODE_EDIT)) {
        DIGITS[numitron_index] |= S2;
    }
}

// Numitrony su indexovane zpredu zľava ako: 0, 1, 2, 3
void setSymbolOnNumitron(const uint8_t numitron_index, const uint8_t symbol_index) {
    if (symbol_index < NUM_SYMBOL_COUNT) {
        setSymbolRawOnNumitron(numitron_index, GET_SEGMENT_SYMBOL(symbol_index));
    }
}

void crossfadeFromOldDigitsToNew() {
    // if (BIS(MODE, MODE_EDIT)) {
    //     // Edit mode: direct write, keep duties in sync.
    //     #if CRSF_ENABLED
    //     ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
    //         if (!SBI(MODE, MODE_CRSF)) {
    //             // Snap duties to current DIGITS so next fade starts clean.
    //             for (uint8_t d = 0; d < DIGIT_COUNT; d++)
    //                 for (uint8_t s = 0; s < 8; s++)
    //                     seg_duty[d*8+s] = (DIGITS[d] & (1<<s))
    //                         ? CROSSFADING_PERIOD : 0;
    //         }
    //     }
    //     #endif
    //     putDigitsToInputRegs(DIGITS, DIGIT_COUNT);
    //     pushToOutputRegs();
    //     return;
    // }

    #if CRSF_ENABLED
    ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
        if (SBI(MODE, MODE_CRSF)) {
            redirectCrossfade(); // updates seg_target[] to new DIGITS[]
        } else {
            triggerCrossfadeFromTo(/* from = current duties, to = */ DIGITS);
        }
    }
    #else
    putDigitsToInputRegs(DIGITS, DIGIT_COUNT);
    pushToOutputRegs();
    #endif
}

// void crossfadeFromOldDigitsToNew() {
//     if (BIS(MODE, MODE_EDIT)) {
//         // V editacnom mode nepouzivame crossfading — priamo zapisujeme cifry.
//         // Ale stale aktualizujeme buffery aby boli konzistentne po ukonceni editu.
//         #if CRSF_ENABLED
//         ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
//             if (!BIS(MODE, MODE_CRSF)) {
//                 COPY_DIGIT_BUFFER(_fade_in_buffer, _fade_out_buffer);
//                 COPY_DIGIT_BUFFER(DIGITS, _fade_in_buffer);
//             }
//         }
//         #endif
//         putDigitsToInputRegs(DIGITS, DIGIT_COUNT);
//         pushToOutputRegs();
//         return;
//     }

//     #if CRSF_ENABLED
//     // ATOMIC_BLOCK zabranuje preteku kde by ISR dokoncilo crossfading
//     // medzi kontrolou MODE_CRSF a nastavenim noveho stavu, cim by
//     // sa spustil prechod s neaktualnymi buffermi.
//     ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
//         if (BIS(MODE, MODE_CRSF)) {
//             // Prebieha prechod A→B — plynule ho presmerujeme na novy ciel C.
//             // redirectCrossfade() zameni buffery a invertuje _crsf_duty tak, aby
//             // vizualny pomer starych/novych cifiel zostal okamzite rovnaky —
//             // ziadny segment neskoci z 0% na 90% ani naopak.
//             redirectCrossfade();
//         } else {
//             // Pripravime buffery: stare "nove" sa stanu "starymi".
//             COPY_DIGIT_BUFFER(_fade_in_buffer, _fade_out_buffer);
//             COPY_DIGIT_BUFFER(DIGITS, _fade_in_buffer);
//             resetCrossfadeState();
//             SBI(MODE, MODE_CRSF);
//         }
//     }
//     #else
//         putDigitsToInputRegs(DIGITS, DIGIT_COUNT);
//         pushToOutputRegs();
//     #endif
// }

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
        crossfadeFromOldDigitsToNew();
    }
}

void displayPage(uint8_t page_index) {
    sprint("STRANKA: "); sprint(page_index); sprint(" HODNOTY NUMITRONOV:");
    for (uint8_t conf_index = 0; conf_index < CONFIG_PAGE_SIZE; conf_index++) {
        sprint(" ");
        sprint(Config::get(Config::toID(page_index, conf_index)));
        setSymbolOnNumitron(conf_index, Config::getSymbolIndex(Config::toID(page_index, conf_index)));
    }
    sprintln("");

    crossfadeFromOldDigitsToNew();
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

    crossfadeFromOldDigitsToNew();
}

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
    setSymbolOnNumitron(DIGIT_HOR_TENS, ABS(tens));
    if (temperature < 0) {
        setSymbolOnNumitron(DIGIT_HOR_TENS, MINUS_SYMBOL);
        if (temperature < -9) {
            ones = -9; // Cap it at -9
        }
    }
    setSymbolOnNumitron(DIGIT_HOR_ONES, ABS(ones));
    setSymbolOnNumitron(DIGIT_MIN_TENS, DEGREE_SYMBOL);
    setSymbolOnNumitron(DIGIT_MIN_ONES, C_SYMBOL);

    crossfadeFromOldDigitsToNew();
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

    setSymbolOnNumitron(DIGIT_HOR_TENS, day_tens);
    setSymbolOnNumitron(DIGIT_HOR_ONES, day_ones);
    setSymbolOnNumitron(DIGIT_MIN_TENS, month_tens);
    setSymbolOnNumitron(DIGIT_MIN_ONES, month_ones);

    crossfadeFromOldDigitsToNew();
}

// Pre nastavovanie jednotlivych segmentov (hlavne pri desatinnej ciarke)
void setNumitronSegment(uint8_t digit, uint8_t index, bool state, bool smooth) {
    (void)smooth; // Zatial nepodporujeme hladke prechody pri zapinani/vypinani jednotlivych segmentov, takze tento parameter ignorujeme.
    uint8_t old = DIGITS[digit];
    uint8_t mask = (1 << index);
    uint8_t updated = state ? (old | mask) : (old & ~mask);

    if (updated != old) {
        DIGITS[digit] = updated;

        // if (smooth) {
            crossfadeFromOldDigitsToNew();
        // } else {
        //     putDigitsToInputRegs(DIGITS, DIGIT_COUNT);
        //     pushToOutputRegs();
        // }
    }
}

// Pri diagnostike chceme aby svietili vsetky segmenty,
// takze vieme povedat ktore su vypalene.
void startDiagnostics() {
    if (!BIS(MODE, MODE_DIAG)) {
        SBI(MODE, MODE_DIAG);
        sprintln(F("Spúštanie diagnostiky... (rozsviecanie všetkých segmentov displeja)"));

        setSymbolRawOnNumitron(DIGIT_HOR_TENS,  GET_SEGMENT_SYMBOL(ALL_ON_SYMBOL));
        setSymbolRawOnNumitron(DIGIT_HOR_ONES, GET_SEGMENT_SYMBOL(ALL_ON_SYMBOL));
        setSymbolRawOnNumitron(DIGIT_MIN_TENS,  GET_SEGMENT_SYMBOL(ALL_ON_SYMBOL));
        setSymbolRawOnNumitron(DIGIT_MIN_ONES, GET_SEGMENT_SYMBOL(ALL_ON_SYMBOL));

        crossfadeFromOldDigitsToNew();
    }
}

void stopDiagnostics() {
    if (BIS(MODE, MODE_DIAG)) {
        sprintln(F("Vypínanie diagnostiky..."));

        CBI(MODE, MODE_DIAG);
    }
}
