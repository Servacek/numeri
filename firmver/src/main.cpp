#include <avr/wdt.h>

#include "reg.h"
#include "config.h"
#include "main.h"

#if ARDUINO_FRAMEWORK
#include <Arduino.h>
#endif

// POZNAMKY:
// Rok je dolezity kvoli priestupným rokom. (29 februar)
// Ak nemáme pripojenie cez DCF77, prepinanie na letny cas
// prebehne vzdy poslednu marcovu nedelu a prepinanie na zimny cas vzdy poslednu oktobrovu nedelu.
// Tak ze po 01:59 sa zobrazí 03:00 alebo z 02.59 bude nasledovat 01:00

// Na nepouzitých pinoch by sa mal zapnut pull-up rezistor (interny staci ak nebude moc resetovat pri baterii).

////////////////////////////////////

void setDigit(uint8_t digit_index, uint8_t value) {
    OLD_DIGITS[digit_index] = DIGITS[digit_index];
    DIGITS[digit_index] = value;
}

void showDigits() {
    putDigitsToInputRegs(DIGITS, DIGIT_COUNT);
    if (!BIS(MODE, MODE_CRSF)) {
        digit_flipper = CROSSFADING_WRAP;
        crossfade_flip_counter = 0;
        crossfade_step_counter = 0;
        MODE |= MODE_CRSF;
    }
}

// Pre nastavovanie jednotlivych segementov (hlavne pri desatinnej ciarke)
void setNumitronSegment(uint8_t digit, uint8_t index, bool state) {
    if (BIS(MODE, MODE_CRSF)) {
        return;
    }

    // TODO: Flashuje ak DIGITS[digit] este nepreslo kompletnou tranziciou,
    OLD_DIGITS[digit] = DIGITS[digit];

    if (state) {
        DIGITS[digit] |= (1 << index);
    } else {
        DIGITS[digit] &= ~(1 << index);
    }

    showDigits();
}

void enterEditMode() {
    MODE |= MODE_EDIT;
    blink_timer_counter = 0;
    setNumitronSegment(selected_digit, SEGMENT_DP, ON);
}

void exitEditMode() {
    MODE |= MODE_EDIT;
    blink_timer_counter = 0;
    setNumitronSegment(selected_digit, SEGMENT_DP, OFF);

    // Vysli sme s nastavovacieho rezimu - ulozme zmeny
    saveEEConfig();
}

// Skonvertuje uint8_t reprezentujuci cislo zapisane v tvare 7 segmentovky na jeho index v zozname symbolov,
// takze nam staci si pamatat len symbol cisla pre zapis do registrov.
// Mozno by bolo lepsie si tento index niekde pamatat.
// Stacilo by pamatat si dve cisla: hodiny a minuty a vzdy ich prelozit pri zobrazovani.
uint8_t getSelectedNumSymbolIndex(uint8_t digit) {
    uint8_t masked_digit = DIGITS[digit] & DIGIT_MASK;
    for (uint8_t num_symbol_index = 0; num_symbol_index < NUM_SYMBOL_COUNT; num_symbol_index++) {
        if (PROGMEM_READ(NUM_SYMBOL_uint8_tS, num_symbol_index) == masked_digit) {
            return num_symbol_index;
        }
    }

    return 0;
}

void setBrightness(uint8_t value) {
    // TODO: DEBUG SETUP
    uint8_t new_brightness = value < DEFAULT_BRIGHTNESS ? value : DEFAULT_BRIGHTNESS;
    if (new_brightness != _target_brightness) {
        _target_brightness = new_brightness;
        // sprintln("Nový jas: " + String((target_brightness * 100) / MAX_BRIGHTNESS) + "%");
    }
}

void configBrightness(uint8_t value) {
    configured_brightness = value;
    setBrightness(configured_brightness);
    saveEEConfig();
}

void toggleNumitronSegment(uint8_t digit, uint8_t index) {
    setNumitronSegment(digit, index, !(DIGITS[digit] & (1 << index)));
}

void setSelectedDigit(uint8_t digit) {
    setNumitronSegment(selected_digit, SEGMENT_DP, OFF);
    blink_timer_counter = 0;
    setNumitronSegment(digit, SEGMENT_DP, ON);
    selected_digit = digit;
}

void setSymbolOnNumitron(uint8_t numitron_index, uint8_t symbol_index) {
    if (PROGMEM_READ(NUM_SYMBOL_uint8_tS, numitron_index) == symbol_index) {
        return; // No change
    }

    OLD_DIGITS[numitron_index] = DIGITS[numitron_index];
    DIGITS[numitron_index] = PROGMEM_READ(NUM_SYMBOL_uint8_tS, numitron_index);
    showDigits();
}

void setSymbolRawOnNumitron(uint8_t numitron_index, uint8_t symbol) {
    if (DIGITS[numitron_index] == symbol) {
        return; // No change
    }

    OLD_DIGITS[numitron_index] = DIGITS[numitron_index];
    DIGITS[numitron_index] = symbol;
    showDigits();
}

void displayTime(uint16_t time_in_minutes) {
    if (MODE) {
        return;
    }

    bool needs_update = false;
    for (uint8_t digit = 0; digit < DIGIT_COUNT; digit++) {
        // Cele cislo, bud minut alebo hodin
        uint8_t num = digit > DIGIT_HOR_UNITS ? (time_in_minutes % 60) : (time_in_minutes / 60);
        if (!BIS(digit, 2) && BIS(getEEConfig(GENERAL), M12_24)) { // Okrem cifier 2 a 3
            // Pri 12 hod mode je polnoc 12:00
            num = (num == 0) ? 12 : ((num > 12) ? num - 12 : num);
        }
        uint8_t val = (digit & 1) ? num % 10 : num / 10; // Neparne cisla nemozu mat nastaveny prvy bit.

        uint8_t new_symbol = PROGMEM_READ(NUM_SYMBOL_uint8_tS, val);
        if (DIGITS[digit] != new_symbol) {
            OLD_DIGITS[digit] = DIGITS[digit];
            DIGITS[digit] = new_symbol;
            needs_update = true;

            // Ak mame vypnutu uvodnu nulu.
            if (digit == 0 && num < 10 && !BIS(getEEConfig(GENERAL), TRAILLING_ZERO)) {
                DIGITS[DIGIT_HOR_TENS] = 0;
            }
        }
    }

    if (needs_update) {
        showDigits();
    }
}

bool DS3231_Present() {
    #if RTC_ENABLED
    Wire.beginTransmission(DS3231_ADDR);
    uint8_t err = Wire.endTransmission(); // 0 == ACK (device present)
    return (err == 0);
    #else
    return false;
    #endif
}

uint16_t getTimeInMinutes() {
    // Cas pocitajme aj pocas diagnostiky ale nezobrazujme.
    // Aktualizujeme cas len ak sa nieco zmenilo.
    #if RTC_ENABLED
        if (DS3231_Present()) {
            DateTime time_now = RTC.now();
            if (MS_mode) {
                minutes_count = time_now.second() + (time_now.minute() * 60);
            } else {
                minutes_count = time_now.minute() + (time_now.hour() * 60);
            }
            return minutes_count;
        }
    #endif

    // Pokial modul nebude k dispozici, tak to budeme pocitat manulane.
    minutes_count++;
    if (minutes_count >= MAX_MINUTES_COUNT) {
        minutes_count = 0; // Zresetujme na 00:00 ked dosiahneme 24:00 (24 * 60)
    }

    return minutes_count;
}

void onNewMinute() {
    if (MODE) {
        return;
    }

    displayTime(getTimeInMinutes());
}

// Pri diagnostike chceme aby svietili vsetky segmenty,
// takze vieme povedat ktore su vypalene.
void startDiagnostics() {
    sprint("Spúštanie diagnostiky... (rozsviecanie všetkých segmentov displeja)");
    MODE |= MODE_DIAG;

    // Pri diagnostike sa potrebujeme uistit, ze jas je zretelne viditelny.
    configBrightness(_target_brightness);
    setBrightness(DEFAULT_BRIGHTNESS);

    setSymbolRawOnNumitron(DIGIT_HOR_TENS, 0b11111111);
    setSymbolRawOnNumitron(DIGIT_HOR_UNITS, 0b11111111);
    setSymbolRawOnNumitron(DIGIT_MIN_TENS, 0b11111111);
    setSymbolRawOnNumitron(DIGIT_MIN_UNITS, 0b11111111);
}

void stopDiagnostics() {
    sprint("Vypínanie diagnostiky...");
    MODE &= ~MODE_DIAG;

    setBrightness(configured_brightness);
}

#if DCF77_ENABLED
uint8_t sample_input_pin() {
    // while (ADCSRA & (1 << ADSC)) {} // wait if busy
    // ADMUX   = (1 << REFS0) | (DCF_OUT & 0x07);
    // ADCSRA |= (1 << ADSC);
    // while (ADCSRA & (1 << ADSC)) {}

    const uint8_t sampled_data = analogRead(DCF_OUT) > DCF77_ADC_THRESHOLD;
    const uint8_t state = DCF77_Clock::get_clock_state();

    if (sampled_data) {
        SBI(PORTB, LED_R);
        if (state == Clock::dirty) {
            SBI(PORTB, LED_G);
        }
    } else {
        CBI(PORTB, LED_R);
        CBI(PORTB, LED_G);
    }
    return sampled_data;
}
#endif

void bootDisplay() {
    // Uistime sa, ze registre su ciste
    putDigitsToInputRegs(DIGITS, DIGIT_COUNT);
    pushToOutputRegs();

    wait(1000);

    // Na par sekund zasvietime vsetky cifry v ramci diagnostiky pri starte.
    // V tomto pripade este pouzijeme predvolenu hodnotu jasu (teda polovicu z maxima),
    // pre pripad, ze by bola nastavena prilis mala hodnota jasu.

    sprintln(F("Úvodná diagnostika. Všetky segmenty budu postupne rozsvietene..."));
    startDiagnostics();

    wait(NUMBER_TRANS_DUR + 4000);

    stopDiagnostics();
    sprintln(F("Diagnostika dokončená. Pomalý prechod na uložený čas..."));
}

/*
 * CASOVACE:
 *   Timer0 - 8 bit (millis, delay, micros)
 *      - piny 5, 6
 *
 *   Timer1 - 16 bit
 *      - piny 9, 10
 *
 *   Timer2 - 8 bit
 *      - piny 11, 3
 */

//  * CS02 CS01 CS00 Description
//  * 0     0     0   No clock source (Timer/Counter stopped)
//  * 0     0     1   clk I/O /(no prescaling) -> 16MHz / (1 * 256) = 62 500 Hz
//  * 0     1     0   clk I/O /8 (from prescaler) -> 16MHz / (8 * 256) = 7812.5 Hz
//  * 0     1     1   clk I/O /64 (from prescaler) -> 16MHz / (64 * 256) = 976.5625 Hz
//  * 1     0     0   clk I/O /256 (from prescaler) -> 16MHz / (256 * 256) = 244.140625 Hz
//  * 1     0     1   clk I/O /1024 (from prescaler) -> 16MHz / (1024 * 256) = 61.03515625 Hz
//  * 1     1     0   External clock source on T0 pin. Clock on falling edge.
//  * 1     1     1   External clock source on T0 pin. Clock on rising edge.
//  */

void disable_watchdog_on_startup(void) __attribute__((naked)) __attribute__((section(".init3")));
void disable_watchdog_on_startup(void) {
    // uint8_t mcusr = MCUSR;  // Save reset cause
    MCUSR = 0;              // Clear all reset flags

    wdt_reset();
    wdt_disable();
}

volatile uint16_t timer_counter = 0; // Pocita do 60 000 - 1 minuta v ms

volatile bool new_minute_flag = false;
volatile bool new_second_flag = false;

// Prerusenie sa spusti kazdu ms (1KHz)
ISR(TIMER2_COMPA_vect) {
    #if DCF77_ENABLED
    Internal::Generic_1_kHz_Generator::isr_handler();
    #endif

    // if (BIS(MODE, MODE_EDIT) && blink_timer_counter < EDIT_MODE_BLINK_F) { // Ak sme v edit mode, blikaj desatinnou ciarkou.
    //     blink_timer_counter++;
    // }

    LED_B_CNT += LED_B_STEP; // 0 - 255 (autmaticky sa vrapne na 0)

    timer_counter++;
    if (timer_counter % SECOND_MILLIS == 0) {
        new_second_flag = true;
    }
    if (timer_counter >= MINUTE_MILLIS) {
        new_minute_flag = true;
        timer_counter = 0;
    }

    if (ms_ticks > 0) {
        ms_ticks--;
    }

    if (_target_brightness != DISPLAY_PWM_REG) {
        brightness_counter++;
        // NOTE: Musi to byt tu lebo, to pouzivme v setupe.
        if (brightness_counter > BRIGHTNESS_CNT_TOP) {
            if (_target_brightness > DISPLAY_PWM_REG) {
                DISPLAY_PWM_REG++;

                TCCR0A = (1 << WGM00) | (1 << WGM01) | (1 << COM0B1) | (1 << COM0B0);
                CBI(PORTD, _G_PORTD);
            } else {
                DISPLAY_PWM_REG--;

                if (DISPLAY_PWM_REG == 0) {
                    SBI(PORTD, _G_PORTD);
                    TCCR0A = 0;
                }
            }
            brightness_counter = 0;
        }
    } else {
        brightness_counter = 0;
    }

    if (BIS(MODE, MODE_CRSF)) {
        crossfade_flip_counter++;
        if (crossfade_flip_counter > CROSSFADING_WRAP) {
            crossfade_flip_counter = 0;
        }

        // Po kolkych krokoch mame prenut cisla z novych na stare alebo naopak.
        if (crossfade_flip_counter == digit_flipper) {
            putDigitsToInputRegs(DIGITS, DIGIT_COUNT);
            pushToOutputRegs();
        } else if (crossfade_flip_counter == 1) { // Len pri prvom spusteni.
            putDigitsToInputRegs(OLD_DIGITS, DIGIT_COUNT);
            pushToOutputRegs();
        }

        crossfade_step_counter--;
        // Urcuje po kolkych krokoch mame znizt pwm-ku pre stare cisla v prospech novych.
        if (crossfade_step_counter) {
            crossfade_step_counter = (BIS(MODE, MODE_EDIT) ? NUMBER_TRANS_PER_EDIT : NUMBER_TRANS_PER);

            if (digit_flipper) {
                digit_flipper--;
            } else {
                MODE &= ~MODE_CRSF;

                // Pripravime na dalsi prechod.
                digit_flipper = CROSSFADING_WRAP;
            }
        }
    }

    if (debounce_cnt < DEBOUNCE_CNT_TOP) { debounce_cnt++; }
    if (long_press_cnt < LONG_PRESS_CNT_TOP) { long_press_cnt++; }
}

//////////////////////////////
/// CONTROLS
//////////////////////////////

void handleInput() {
    // uint8_t _PIND = PIND;
    if (debounce_cnt >= DEBOUNCE_CNT_TOP && (
        (PIND & BTN_MASK) != (STABLE_REG & BTN_MASK) ||
        (long_press_cnt >= LONG_PRESS_CNT_TOP)
    )) {
        // Nastala zmena tlacidiel, overme ci je stabilna
        if ((TEMP_REG & BTN_MASK) != (PIND & BTN_MASK)) {
            debounce_cnt = 0;
            TEMP_REG = PIND;
            long_press_cnt = 0;
        } else {
            STABLE_REG = TEMP_REG;

            // sprint(PIND & BTN_MASK);
            // sprint(" ");
            // sprintln(PIND);
            // sprintln("ZMENA");

            if ((~STABLE_REG & BTN_MASK) == BTN_MASK) {
                if (long_press_cnt >= LONG_PRESS_CNT_TOP) {
                    SBI(BOTH_FLAG, 2);

                    // sprintln("BOTH BUTTONS LONG PRESSED");
                    if (!BIS(MODE, MODE_EDIT)) { // spustime diagnostiku len mimo editovacieho rezimu
                        // Diagnostika na vyziadanie, zobrazujeme po celu dobu co su obe tlacidla dlho stlacene.
                        startDiagnostics();
                    }

                    long_press_cnt = 0;
                }
                BOTH_FLAG = 1;
            } else if (BOTH_FLAG && (STABLE_REG & BTN_MASK) == BTN_MASK) {
                // sprintln("BOTH BUTTONS RELEASED");
                stopDiagnostics();
                if (!BIS(BOTH_FLAG, 2)) {
                    // Prepinanie rezimu
                    if (BIS(MODE, MODE_EDIT)) { exitEditMode(); } else { enterEditMode(); }
                }
                BOTH_FLAG = 0;
            } else if (!(STABLE_REG & (1 << 2)) && long_press_cnt >= LONG_PRESS_CNT_TOP) {
                long_press_cnt = 0;
                // TODO: Podrzanim akciu opakujeme?
                // sprintln("LEFT BUTTON LONG PRESSED");
                minimum_brightness = _target_brightness - DEFAULT_BRIGHTNESS * 0.1;
                configBrightness(minimum_brightness);
            } else if (!(STABLE_REG & (1 << 3)) && long_press_cnt >= LONG_PRESS_CNT_TOP) {
                long_press_cnt = 0;
                // TODO: Podrzanim akciu opakujeme?
                // sprintln("RIGHT BUTTON LONG PRESSED");
                minimum_brightness = _target_brightness + DEFAULT_BRIGHTNESS * 0.1;
                configBrightness(minimum_brightness);
            } else if (!BOTH_FLAG && (STABLE_REG & (1 << 2)) && !(PREV_STABLE_REG & (1 << 2))) {
                // sprintln("LEFT BUTTON RELEASED");
                if (BIS(MODE, MODE_EDIT)) {
                    setSelectedDigit((selected_digit + 1) % DIGIT_COUNT);
                } else {
                    minimum_brightness = _target_brightness - DEFAULT_BRIGHTNESS * 0.2;
                    configBrightness(minimum_brightness);
                }
            } else if (!BOTH_FLAG && (STABLE_REG & (1 << 3)) && !(PREV_STABLE_REG & (1 << 3)))  {
                // sprintln("RIGHT BUTTON RELEASED");
                if (BIS(MODE, MODE_EDIT)) {
                    uint8_t selected_num_index = getSelectedNumSymbolIndex(selected_digit);
                    selected_num_index = (selected_num_index + 1) % NUM_SYMBOL_COUNT;
                    DIGITS[selected_digit] = PROGMEM_READ(NUM_SYMBOL_uint8_tS, selected_num_index);
                    showDigits();
                } else {
                    minimum_brightness = _target_brightness + DEFAULT_BRIGHTNESS * 0.2;
                    configBrightness(minimum_brightness);
                }
            }

            PREV_STABLE_REG = STABLE_REG;
        }
    }
}

#if (SERIAL_ENABLED && DEBUG_MODE)
void handleCommand(String command) {
    if (command == "?") {
        sprintln(F("-------------------------"));
        sprintln(F("ZOZNAM PRIKAZOV:"));
        sprintln(F("  z_datum"));
        sprintln(F("  z_cas(hm) - zobrazí čas vo formáte [HODINY]:[MINUTY]"));
        sprintln(F("  z_teplotu"));
        sprintln(F("  z_rok"));
        sprintln(F("  z_cas(ms) - Zobrazí čas vo formate [MINUTY]:[SEKUNDY]"));
        sprintln(F("-------------------------"));
    } else if (command == "z_datum") {
        #if RTC_ENABLED
        DateTime now = RTC.now();
        int day = now.day();
        int month = now.month();
        sprint(day);
        sprint(".");
        sprint(month);
        sprintln(".");

        uint8_t day_units = day % 10;
        uint8_t month_units = month % 10;
        uint8_t day_tens = day / 10;
        uint8_t month_tens = month / 10;

        setSymbolOnNumitron(DIGIT_HOR_TENS, day_tens);
        setSymbolOnNumitron(DIGIT_HOR_UNITS, day_units);
        setSymbolOnNumitron(DIGIT_MIN_TENS, month_tens);
        setSymbolOnNumitron(DIGIT_MIN_UNITS, month_units);
        #endif
    } else if (command == "z_cas(hm)") {
        #if RTC_ENABLED
        DateTime now = RTC.now();
        int hour = now.hour();
        int minute = now.minute();
        sprint(hour);
        sprint(":");
        sprintln(minute);
        displayTime(getTimeInMinutes());
        #endif
    } else if (command == "z_cas(ms)") {
        #if RTC_ENABLED
        DateTime now = RTC.now();
        int minute = now.minute();
        int second = now.second();
        sprint(minute);
        sprint(":");
        sprintln(second);
        #endif
    } else if (command == "ledtest") {
        // LED_R
        for (uint16_t i = 0; i < 511; i++) {
            analogWrite(LED_R, i > 255 ? 255 - (i - 256) : i * 2);
            wait(10);
        }

        // LED_G
        for (uint16_t i = 0; i < 511; i++) {
            analogWrite(LED_G, (i > 255 ? 255 - (i - 256) : i) * 2);
            wait(10);
        }

        // LED_B
        for (uint16_t i = 1; i < 511; i++) {
            LED_B_REG = (i <= 255 ? i : 511 - i);
            wait(10);
        }
    } else if (command == "dcf_toggle") {
        DDRB ^= (1 << DCF_PON);
    } else if (command == "z_teplota") {
        #if RTC_ENABLED
        int temperature = round(RTC.getTemperature());
        sprint("Teplota: ");
        sprintln(temperature);

        uint8_t tens = temperature / 10;
        uint8_t units = temperature % 10;

        setSymbolOnNumitron(DIGIT_HOR_TENS, abs(tens));
        if (temperature < 0) {
            setSymbolOnNumitron(DIGIT_HOR_TENS, MINUS_SYMBOL);
            if (temperature < -9) {
                units = -9; // Cap it at -9
            }
        }

        setSymbolOnNumitron(DIGIT_HOR_UNITS, abs(units));
        setSymbolOnNumitron(DIGIT_MIN_TENS, DEGREE_SYMBOL);
        setSymbolOnNumitron(DIGIT_MIN_UNITS, C_SYMBOL);
        #endif
    } else if (command == "z_rok") {
        #if RTC_ENABLED
        int year = RTC.now().year();
        sprint("Rok: ");
        sprintln(year);

        uint8_t year_milliennia = (year / 1000) % 10;
        uint8_t year_centuries  = (year / 100)  % 10;
        uint8_t year_decades    = (year / 10)   % 10;
        uint8_t year_units      =  year         % 10;

        setSymbolOnNumitron(DIGIT_HOR_TENS, year_milliennia);
        setSymbolOnNumitron(DIGIT_HOR_UNITS, year_centuries);
        setSymbolOnNumitron(DIGIT_MIN_TENS, year_decades);
        setSymbolOnNumitron(DIGIT_MIN_UNITS, year_units);
        #endif
    } else {
        sprintln("[Chyba] Neznámy príkaz...");
    }
}
#endif

// #define sprint(...)   sprint(__VA_ARGS__)
// #define sprintln(...) sprintln(__VA_ARGS__)

// const uint16_t samples_per_second = 1000;
// const uint8_t bins                = 100;
// const uint8_t samples_per_bin     = samples_per_second / bins;

// volatile uint8_t gbin[bins];
// volatile boolean samples_pending = false;


// void paddedPrint(BCD::bcd_t n) {
//     sprint(n.digit.hi);
//     sprint(n.digit.lo);
// }

void handleDCF77ClockState() {
    #if DCF77_ENABLED
    static uint8_t last_state = Clock::useless;

    uint8_t state = DCF77_Clock::get_clock_state();
    if (state != Clock::useless && state != Clock::dirty) { // Vypada to ze sme synchronizovani!
        Clock::time_t now;

        CBI(DDRB, DCF_PON); // Vypneme DCF prijimač

        if (last_state == Clock::useless || last_state == Clock::dirty) {
            DCF77_Clock::get_current_time(now);
            uint8_t hour = bcd_to_int(now.hour);
            uint8_t minute = bcd_to_int(now.minute);
            #if RTC_ENABLED
            RTC.adjust(DateTime(
                bcd_to_int(now.year),
                bcd_to_int(now.month),
                bcd_to_int(now.day),
                hour, minute, 0
            ));
            #endif
            minutes_count = hour * 60 + minute;
            timer_counter = 0; // Starting from 0 seconds.
            displayTime(minutes_count);
        }

        // DCF77_Clock::get_current_time(now);
        // if (now.month.val > 0) {
        //     switch (DCF77_Clock::get_clock_state()) {
        //         case Clock::useless: sprint(F("useless ")); break;
        //         case Clock::dirty:   sprint(F("dirty:  ")); break;
        //         case Clock::synced:  sprint(F("synced: ")); break;
        //         case Clock::locked:  sprint(F("locked: ")); break;
        //     }
        //     sprint(' ');

        //     sprint(F("20"));
        //     paddedPrint(now.year);
        //     sprint('-');
        //     paddedPrint(now.month);
        //     sprint('-');
        //     paddedPrint(now.day);
        //     sprint(' ');

        //     paddedPrint(now.hour);
        //     sprint(':');
        //     paddedPrint(now.minute);
        //     sprint(':');
        //     paddedPrint(now.second);

        //     sprint("+0");
        //     sprint(now.uses_summertime? '2': '1');
        //     sprintln();
        // }

        analogWrite(LED_R, 0);
        analogWrite(LED_G, led_brightness);
        analogWrite(LED_B, 0);
    }

    last_state = state;
    #endif
}

// We'll store the last ADC result here
volatile uint16_t measured_brightness = 0;
// Flag to indicate when a new ADC value is ready
// volatile bool adc_ready = false;
// volatile bool new_measurement_flag = false;
// volatile uint16_t samples = 0;

uint8_t nLitSegments() {
    uint8_t n = 0;
    for (uint8_t i = 0; i < DIGIT_COUNT; i++) {
        n += __builtin_popcount(DIGITS[i]);
    }

    return n;
}

uint8_t count = 0;
void loop() {
    // if (blink_timer_counter >= EDIT_MODE_BLINK_F) {
    //     blink_timer_counter = 0;

    //     toggleNumitronSegment(selected_digit, SEGMENT_DP);
    // }

    // Softvérové PWM pre modru ledku
    if (LED_B_REG == 0 || LED_B_CNT < LED_B_REG) {
        CBI(PORTB, LED_B);
    } else {
        SBI(PORTB, LED_B);
    }

    // Minute timer
    if (new_minute_flag) {
        new_minute_flag = false;
        onNewMinute();
    }

    if (new_second_flag) {
        new_second_flag = false;

        // if (DISPLAY_PWM_REG > 0) {
        //     DISPLAY_PWM_REG = 0;
        //     _target_brightness = 0;
        // } else {
        //     DISPLAY_PWM_REG = configured_brightness;
        //     _target_brightness = configured_brightness;
        // }

        // Blikanie desatinnej ciarky ako naznak kurzoru.
        if (BIS(MODE, MODE_EDIT)) {
            toggleNumitronSegment(selected_digit, SEGMENT_DP);
        }

        handleDCF77ClockState();

        #if INA_ENABLED
            if (INA.isConnected() != false) {
                sprintln("----------- MERANIE -------------");
                sprint("Napájacie napätia [V]: \t");
                sprintln(INA.getBusVoltage(), 2);
                sprint(F("Úbytok napätia na meracom rezistore [mV]:\t\t"));
                sprintln(INA.getShuntVoltage_mV(), 2);

                float CONSUMPTION_MA_PER_SEGMENT_MAX = 13.77f;
                float CONSUMPTION_MA_PER_SEGMENT_MIN = 12.77f;

                // Vypocitajme predpokladany prudovy odber displeja:

                // Spocitajme, kolko segmentov by malo svietit.
                uint8_t n_segs = nLitSegments();
                // Zohladnime hodnotu napajacieho napatie
                float voltage_percentage = INA.getBusVoltage() * 0.2;
                // Zohladnime aktualny jas.
                float brightness_percentage = ((float)_target_brightness) / ((float)MAX_BRIGHTNESS);
                float total_assumed_cons_min = ((float)n_segs) * (CONSUMPTION_MA_PER_SEGMENT_MIN * brightness_percentage * voltage_percentage);
                float total_assumed_cons_max = ((float)n_segs) * (CONSUMPTION_MA_PER_SEGMENT_MAX * brightness_percentage * voltage_percentage);
                float actual_consumption = INA.getCurrent_mA();

                sprint(F("Prúdový odber displeja [mA]:\t\t"));
                sprint(INA.getCurrent_mA(), 2);
                sprint("\t\t Predpokladany (MAX): \t");
                sprintln(total_assumed_cons_max, 2);
                sprint("\t\t Predpokladany (MIN): \t");
                sprintln(total_assumed_cons_min, 2);
                sprintln("Odchylka: \t\t");
                sprintln(((total_assumed_cons_max + total_assumed_cons_min) / 2) / actual_consumption);
                sprintln("---------------------------------");
            }
        #endif


        // while (ADCSRA & (1 << ADSC)) {}
        // // Start next async ADC conversion
        // ADCSRA |= (1 << ADSC);
        // // enable ADC interrupt
        // ADCSRA |= (1 << ADIE);

        // TODO: DCF77 modul OUT pin je pullnuty k 0 ak je zapojeny modul.
        // while (ADCSRA & (1 << ADSC)) {}
        // measured_brightness = analogRead(DCF_OUT);
        // sprint("Measured brightness: " + String(measured_brightness));

        // TODO: Vypnute zatiaľ, nastavovanim by sa mala nastaviť hodnota minimalneho jasu.
        // if (!diagnostics_mode && !edit_mode) {
        //     while (ADCSRA & (1 << ADSC)) {}
        //     measured_brightness = analogRead(LDR_PIN_PORTC);
        //     // sprintln("Measured brightness: " + String(measured_brightness));

        //     // Compute brightness
        //     int brightness = max(configured_brightness - map(measured_brightness, 0, 1023, 0, configured_brightness), minimum_brightness);
        //     setBrightness(brightness * 1.5);
        // }
    }

    // if (adc_ready) {
    //     adc_ready = false;
    //     // new_measurement_flag = false;

    //     sprintln("Measured brightness: " + String(measured_brightness));

    //     // Compute brightness
    //     int brightness = max(configured_brightness - map(measured_brightness, 0, 1023, 0, configured_brightness), MINIMUM_BRIGHTNESS);
    //     setBrightness(brightness * 1.5);
    // }

    #if DEBUG_MODE
        if (!BIS(PIND, RESET_BUTTON)) {
            MS_mode = true;
        }
    #endif

    #if (SERIAL_ENABLED && DEBUG_MODE)
    if (Serial.available()) {
        String command = Serial.readStringUntil('\n');
        command.trim();
        sprintln("Prikaz: " + command);
        if (command.length() > 0) {
            handleCommand(command);
        }
    }
    #endif

    handleInput();

    // static int64_t count = 0;
    // uint8_t lbin[bins];

    // if (samples_pending) {
    //     CRITICAL_SECTION {
    //         memcpy(lbin, (void *)gbin, bins);
    //         samples_pending = false;
    //     }

    //     ++count;
    //     // ensure the count values will be aligned to the right
    //     for (int32_t val=count; val < 100000000; val *= 10) {
    //         sprint(' ');
    //     }
    //     sprint((int32_t)count);
    //     sprint(", ");
    //     for (uint8_t bin=0; bin<bins; ++bin) {
    //         switch (lbin[bin]) {
    //             case  0: sprint(bin%10? '-': '+'); break;
    //             case 10: sprint('X'); break;
    //             default: sprint(lbin[bin]);
    //         }
    //     }
    //     sprintln();
    //  }
}

// ISR runs when ADC conversion completes
// ISR(ADC_vect) {
//     // disable ADC interrupt so ISR won't be called again until we enable it
//     ADCSRA &= ~(1 << ADIE);

//     // uint16_t v = ADC; // read ADC result immediately
//     // sprint("ADMUX as bits: ");
//     // for (int i = 0; i < 16; ++i) {
//     //     sprint(((ADMUX >> i) & 1) ? '1' : '0');
//     // }
//     // sprintln();
//     measured_brightness = ADC; // Read ADC value (10-bit)
//     adc_ready = true;

//     // clear flag defensively (writing 1 clears)
//     ADCSRA |= (1 << ADIF);
// }

// void process_one_sample() {
//     static uint8_t sbin[bins];

//     const uint8_t sample = sample_input_pin();

//     static uint16_t ticks = 999;  // first pass will init the bins
//     ++ticks;

//     if (ticks == 1000) {
//         ticks = 0;
//         memcpy((void *)gbin, sbin, bins);
//         memset(sbin, 0, bins);
//         samples_pending = true;
//     }

//     sbin[ticks/samples_per_bin] += sample;
// }

// ISR(TIMER2_COMPA_vect) {
//     process_one_sample();
// }

// void stopTimer0() {
//     // ensure that the standard timer interrupts will not
//     // mess with msTimer2
//     TIMSK0 = 0;
// }

// void initTimer2() {
//     // Timer 2 CTC mode, prescaler 64
//     TCCR2B = (0<<WGM22) | (1<<CS22);
//     TCCR2A = (1<<WGM21) | (0<<WGM20);

//     // 16 MHz: 249 + 1 == 250 == 250 000 / 1000 =  (16 000 000 / 64) / 1000
//     //  8 MHz: 124 + 1 == 125 == 125 000 / 1000 =  ( 8 000 000 / 64) / 1000
//     OCR2A = (F_CPU / 64 / 1000) - 1;

//     // enable Timer 2 interrupts
//     TIMSK2 = (1<<OCIE2A);
// }

// void setupTimer() {
//     initTimer2();
//     stopTimer0();
// }

#if (ARDUINO_FRAMEWORK)
// int main(void) {
void setup() {
#else
int main(void) {
#endif
    #if SERIAL_ENABLED
    // Serial pre debugovanie a logging
    Serial.begin(SERIAL_BANDWIDTH);
    #endif

    sprintln(F("Spúšťanie hodín..."));

    #if DCF77_ENABLED
    DCF77_Clock::setup();
    DCF77_Clock::set_input_provider(sample_input_pin);
    #endif

    /****************************************
     * Nepouzite piny
     ****************************************/

    // Toto riesime na zaciatku, ak by nahodou nejake z tychto pinov predsa
    // len niekedy neskor pouzite boli.
    sprintln(F("Definovanie pevných logických hodnôt pre nepoužité piny..."));

    // Kvoli bezpecnosti, nepouzite piny definujeme explicitne.
    // Je lepsie ak nejaky pin ostane vo vzduchu ako by sme mali nieco poskodit.
    UNUSED_PIN(C, PC2);
    UNUSED_PIN(D, PD6);

    /****************************************
     * PWM Jas
     ****************************************/

    #if DISPLAY_ENABLED
        sprintln(F("Konfigurácia PWM kanálu pre jas..."));

        CRITICAL_SECTION {
            OCR0A = DISPLAY_PWM_TOP;
            OCR0B = 0;

            TCCR0A = (1 << WGM00) | (1 << WGM01) | (1 << COM0B1) | (1 << COM0B0);
            TCCR0B = (1 << WGM02) | (1 << CS00);

            TIMSK0 = 0;
        }
    #endif

    /****************************************
     * Zbernica registrov.
     ****************************************/

    #if DISPLAY_ENABLED
        sprintln(F("Konfigurácia zbernice registrov pre displej..."));

        CBI(PORTB,  SRCK_PORTB);    SBI(DDRB,   SRCK_PORTB);
        CBI(PORTD,  RCK_PORTD);     SBI(DDRD,   RCK_PORTD);
        CBI(PORTB,  SERIN_PORTB);   SBI(DDRB,   SERIN_PORTB);
        CBI(PORTD,  _G_PORTD);      SBI(DDRD,   _G_PORTD);
    #endif

    /****************************************
     * Hlavny Casovac (1kHz)
     ****************************************/

    sprintln(F("Konfigurácia časovača..."));

    CRITICAL_SECTION {
        // WGM21 -> CTC rezim, zresetuje citac po dosiahnuti limitu
        TCCR2A = (1 << WGM21);

        // CS22 -> Delic 64
        TCCR2B = (1 << CS22);

        // Fcas = 16MHz / (64 x 250) = 1kHz
        OCR2A = 249; // nastavime limit casovaca

        // Zapne interupt, ktory sa vykona pri dosiahnuti limitu (TIMER2_COMPA_vect)
        TIMSK2 = (1 << OCIE2A);
        TCNT2 = 0; // Zaciname pocitat od nuly.
    }

    /****************************************
     * RTC modul
     ****************************************/

    #if RTC_ENABLED
        if (!RTC.begin()) {
            sprintln(F("[Varovanie] RTC modul nebol nájdený!"));
        } else {
            // if (RTC.lostPower()) {
            //     sprintln(F("Nastavovanie času pre RTC modul."));
            //     // RTC.adjust(DateTime(F(__DATE__), F(__TIME__)));
            //     RTC.adjust(DateTime(2025, 8, 22, 16, 33, 0));
            // }

            // Uistime sa, ze tieto veci su vypnute aby zbytocne neodoberali prud.
            RTC.disable32K();
            RTC.writeSqwPinMode(DS3231_OFF);
        }
    #endif

    /****************************************
     * DCF77 modul
     ****************************************/

    #if DCF77_ENABLED
        sprintln(F("Konfigurácia pinov DCF77 prijímača..."));

        CBI(DDRC, DCF_OUT);
        CBI(PORTC, DCF_OUT);

        CBI(DDRB, DCF_PON);
        // V hardveri by mala byt dioda ktora zabrani pripadnemu poskodeniu.
        CBI(PORTB, DCF_PON); // POZOR! 3V3 logika
    #endif

    /****************************************
     * Senzor Prudu
     ****************************************/

    #if INA_ENABLED
    sprintln(F("Inicializácia senzora prúdu..."));

    // sprint(F("INA219_LIB_VERSION: "));
    // sprintln(INA219_LIB_VERSION);

    Wire.begin();
    if (INA.begin()) {
        if (!INA.isCalibrated()) {
            sprintln(F("Prúdový senzor nie je kalibrovaný!"));
            sprintln(F("Kalibrácia..."));
            INA.setMaxCurrentShunt(0.4, 0.4);
            INA.setShuntSamples(7);
        }

        wait(1000);

        // sprintln("Rozsah napájacieho napätia INA219: " + INA.getBusVoltageRange());
    } else {
        sprintln(F("Prúdový senzor nebol nájdený!"));
    }
    #endif

    /****************************************
     * IO Piny
     ****************************************/

    sprintln(F("Inicializácia vstupno-výstupných pinov..."));

    CBI(DDRD,   L_BTN); SBI(PORTD, L_BTN); // INPUT PULLUP
    CBI(DDRD,   R_BTN); SBI(PORTD, R_BTN); // INPUT PULLUP

    // Zapneme slabych 5 V ktore su tahane dole cez LDR rezistor.
    CBI(DDRC,   LDR_PIN_PORTC); SBI(PORTC, LDR_PIN_PORTC); // INPUT PULLUP

    CBI(DDRD,   RESET_BUTTON);  SBI(PORTD,  RESET_BUTTON); // INPUT PULLUP

    SBI(DDRB, LED_R); CBI(PORTB, LED_R); // OUTPUT LOW
    SBI(DDRB, LED_G); CBI(PORTB, LED_G); // OUTPUT LOW
    SBI(DDRB, LED_B); CBI(PORTB, LED_B); // OUTPUT LOW

    /****************************************
     * PWM pre RGB LED-ku
     ****************************************/

    // CRITICAL_SECTION {
    //     OCR1A = 0;
    //     OCR1B = 0;

    //     // --- Configure Timer1 for Fast PWM, 10-bit mode ---
    //     // WGM13:0 = 0b0111 → Fast PWM, 10-bit (TOP = 1023)
    //     TCCR1A = (1 << WGM10) | (1 << WGM11);
    //     TCCR1B = (1 << WGM12);

    //     // Non-inverting mode for both OC1A and OC1B
    //     TCCR1A |= (1 << COM1A1) | (1 << COM1B1);

    //     // Prescaler = 1 → high frequency (~15.6 kHz)
    //     TCCR1B |= (1 << CS10);
    // }

    /****************************************
     * Bootovanie
     ****************************************/

    #if DISPLAY_ENABLED
        sprintln(F("Zapínanie displeja..."));

        setBrightness(DEFAULT_BRIGHTNESS);
        bootDisplay();
    #endif

    // Ak je tlacidlo RESET stlacene pri starte (po RESETovani cipu)
    // tak nenacitame ulozene konfiguracie -> pouziju sa vychodzie hodnoty.
    // Zaroven zresetujeme cas ulozeny v RTC module.
    if (IS_PRESSED(RESET_BUTTON)) {
        sprintln(F("RESET tlačidlo bolo stlačené, použijeme východzie hodnoty nastavení."));

        #if RTC_ENABLED
            sprintln(F("Resetovanie času v RTC module."));
            RTC.adjust(DateTime(0, 0, 0, 1, 1, 0));
        #endif
    } else {
        sprintln(F("Načítavanie uložených konfigurácií z EEPROM..."));

        // Nacitajme ulozeny cas
        // minutes_count = ((getEEConfig(HOURS) * 60) + (getEEConfig(MINUTES) * 60));
        // displayTime(minutes_count); // zobrazme ulozeny cas

        configBrightness(getEEConfig(BRIGHTNESS));
    }

    sprintln(F("Zobrazovanie času..."));
    displayTime(getTimeInMinutes());

    #if DCF77_ENABLED
        sprintln(F("Spúšťanie DCF77 prijímača..."));
        SBI(DDRB, DCF_PON); // Zapneme modul
    #endif

    sprintln(F("Spúšťanie hodín dokončené!"));

    // DEBUG
    // setBrightness(0);
    // configured_brightness = 0;

    // POZNAMKA: Pri trimri s max hodnotou odporu 10K je max hodnota ADC ~225
    // Kasleme na trimmer, vyzadovalo by to zbytocnu komplexitu softveru za ziadnu cenu.
    // sprintln("Nastavovanie jasu podľa trimmeru...");
    // setBrightness(10*log(map(analogRead(A0), 0, 1023, MINIMUM_BRIGHTNESS, DEFAULT_BRIGHTNESS)) + 1);

    // // Configure ADC
    // ADMUX = (1 << REFS0) | (LDR_PIN_PORTC & 0x07); // AVcc reference, select A1
    // ADCSRA = (1 << ADEN)  |  // Enable ADC
    //         (1 << ADIE)  |  // Enable ADC interrupt
    //         (1 << ADPS2) | (1 << ADPS1) | (1 << ADPS0); // Prescaler 128 for stable conversion
    // ADCSRA &= ~(1 << ADATE); // Disable auto trigger

    // ADCSRA |= (1 << ADIF);   // Clear any pending flag
    // ADCSRB = 0;
    // // Start first conversion
    // ADCSRA |= (1 << ADSC);

    #if !ARDUINO_FRAMEWORK
    for (;;) {
		loop();
    }

    return 0;
    #endif
}
