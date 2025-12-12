
#include <avr/wdt.h>

#include "reg.h"
#include "config.h"
#include "isr.h"

#include "main.h"

#if ARDUINO_FRAMEWORK
#include <Arduino.h>
#endif

#include <avr/io.h>
#include <avr/wdt.h>
#include <avr/eeprom.h>

// TODO: Ak mame na pravom tlacitku INPUT HIGH stav a jeho zmacknutie resetuje cip.

uint16_t EEMEM reset_count_eeprom = 0;

void report_reset_and_count() {
  uint8_t r = MCUSR;
  MCUSR = 0;            // clear flags so they don't persist
  wdt_disable();

  Serial.print(F("MCUSR=0x"));
  Serial.println(r, HEX);

  if (r & (1 << PORF))  Serial.println(F("POR: Power-on Reset"));
  if (r & (1 << EXTRF)) Serial.println(F("EXT: External Reset (RESET pin)"));
  if (r & (1 << BORF))  Serial.println(F("BOR: Brown-out Reset"));
  if (r & (1 << WDRF))  Serial.println(F("WDT: Watchdog Reset"));

  uint16_t c = eeprom_read_word(&reset_count_eeprom);
  c++;
  eeprom_write_word(&reset_count_eeprom, c);
  Serial.print(F("reset_count=")); Serial.println(c);
}

// POZNAMKY:
// Rok je dolezity kvoli priestupným rokom. (29 februar)
// Ak nemáme pripojenie cez DCF77, prepinanie na letny cas
// prebehne vzdy poslednu marcovu nedelu a prepinanie na zimny cas vzdy poslednu oktobrovu nedelu.
// Tak ze po 01:59 sa zobrazí 03:00 alebo z 02.59 bude nasledovat 01:00

// TODO: https://blog.blinkenlight.net/experiments/dcf77/binary-clock/
// https://www.grauonline.de/alexwww/ardumower/filter/filter.html

int freeRam() {
    extern int __heap_start, *__brkval;
    int v;
    int free_memory = (int) &v - (__brkval == 0 ? (int) &__heap_start : (int) __brkval);

    // If negative, you have stack/heap collision (critical!)
    if (free_memory < 0) {
        return 0; // Out of memory!
    }
    return free_memory;
}

////////////////////////////////////

void setSymbolRawOnNumitron(const uint8_t numitron_index, const uint8_t symbol) {
    if (numitron_index >= DIGIT_COUNT) {
        return; // No change
    }

    // OLD_DIGITS[numitron_index] = DIGITS[numitron_index];
    DIGITS[numitron_index] = symbol;

    // Ak je numitron vybraty v editovacom rezime, uistime sa ze desatinna ciarka je zobrazena.
    if (numitron_index == selected_digit && BIS(MODE, MODE_EDIT)) {
        DIGITS[numitron_index] |= S2;
    }
}

void setSymbolOnNumitron(const uint8_t numitron_index, const uint8_t symbol_index) {
    if (symbol_index >= NUM_SYMBOL_COUNT)
    setSymbolRawOnNumitron(numitron_index, GET_SEGMENT_SYMBOL(symbol_index));
}

void crossfadeFromOldDigitsToNew() {
    sprintln(F("crossfadeFromOldDigitsToNew"));
    #if CRSF_ENABLED
    if (BIS(MODE, MODE_CRSF)) {
        // Prebieha iny prechod, ulozme cisla zatial do bufferu,
        SBI(FLAG, FLAG_CRSF_DEFFERED);
        sprintln("DEFFERING");
    } else {
        sprintln("CROSSFADING");
        crsf_duty = CROSSFADING_PERIOD;
        crsf_cycle_counter = 0;
        crsf_duty_step_counter = 0;

        COPY_DIGIT_BUFFER(_fade_in_buffer, _fade_out_buffer);
        COPY_DIGIT_BUFFER(DIGITS, _fade_in_buffer);

        // Nastavme bit rezimu az po vsetkom, inak by
        // sa mohlo zavolat medzitym ISR-ko a riesit crossfading
        // este zo starymi hodnotami.
        SBI(MODE, MODE_CRSF);
    }
    #else
        putDigitsToInputRegs(DIGITS, DIGIT_COUNT);
        pushToOutputRegs();
    #endif
}

static void displayTimeFromCounters() {
    sprintln(F("displayTimeFromCounters"));
    if (BIS(MODE, MODE_DIAG)) {
        return;
    }

    bool needs_update = false;
    for (uint8_t digit = 0; digit < DIGIT_COUNT; digit++) {
        const uint8_t minute_digit = (digit == DIGIT_MIN_TENS || digit == DIGIT_MIN_ONES);
        // Cele cislo, bud minut alebo hodin
        uint8_t num = (minute_digit) ? t_counter_minutes : t_counter_hours;
        // if (!minute_digit && BIS(getEEConfig(GENERAL), M12_24)) { // Okrem cifier 2 a 3
        //     // Pri 12 hod mode je polnoc 12:00
        //     num = (num == 0) ? 12 : ((num > 12) ? num - 12 : num);
        // }
        const uint8_t val = (digit == DIGIT_HOR_TENS || digit == DIGIT_MIN_TENS)
            ? num / 10 : num % 10; // Neparne cisla nemozu mat nastaveny prvy bit.

        sprint("DIGIT: ");
        sprintln(digit);
        sprint("VAL: ");
        sprintln(val);

        const uint8_t new_symbol = GET_SEGMENT_SYMBOL(val);
        // OLD_DIGITS[digit] = DIGITS[digit];
        if (_fade_in_buffer[digit] != new_symbol) {
            setSymbolRawOnNumitron(digit, new_symbol);
            needs_update = true;

            // Ak mame vypnutu uvodnu nulu.
            // if (digit == DIGIT_HOR_TENS && num < 10 && !BIS(getEEConfig(GENERAL), TRAILLING_ZERO)) {
            //     setSymbolRawOnNumitron(digit, 0);
            // }
        }
    }

    if (needs_update) {
        crossfadeFromOldDigitsToNew();
    }
}

// Pre nastavovanie jednotlivych segmentov (hlavne pri desatinnej ciarke)
void setNumitronSegment(uint8_t digit, uint8_t index, bool state, bool smooth) {
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

void setSelectedDigit(uint8_t digit) {
    setNumitronSegment(selected_digit, SEGMENT_DP, OFF, false);

    // blink_timer_counter = 0;
    setNumitronSegment(digit, SEGMENT_DP, ON, true);
    selected_digit = digit;
}

void enterEditMode() {
    sprintln(F("enterEditMode"));
    SBI(MODE, MODE_EDIT);
    setSelectedDigit(selected_digit);
}

void exitEditMode() {
    sprintln(F("exitEditMode"));
    // blink_timer_counter = 0;
    CBI(MODE, MODE_EDIT);
    setSelectedDigit(selected_digit);

    timer_counter = 0; // 0 sekund

    // // Ak sme zmenili nejake cifry, tak ich zobrazme.
    // Asi zbytocne.
    // displayTimeFromCounters();

    // Vysli sme s nastavovacieho rezimu - ulozme zmeny
    saveEEConfig();
}

// Skonvertuje uint8_t reprezentujuci cislo zapisane v tvare 7 segmentovky
// na jeho index v zozname symbolov,
// takze nam staci si pamatat len symbol cisla pre zapis do registrov.
// Mozno by bolo lepsie si tento index niekde pamatat.
// Stacilo by pamatat si dve cisla: hodiny a minuty a vzdy ich prelozit pri zobrazovani.
// uint8_t getSelectedNumSymbolIndex(uint8_t digit) {
//     uint8_t masked_digit = DIGITS[digit] & DIGIT_MASK;
//     for (uint8_t num_symbol_index = 0; num_symbol_index < NUM_SYMBOL_COUNT; num_symbol_index++) {
//         if (GET_SEGMENT_SYMBOL(num_symbol_index) == masked_digit) {
//             return num_symbol_index;
//         }
//     }

//     return 0;
// }

// Nastavovanie jasu s histereziou.
void setBrightness(const uint8_t value) {
    const uint8_t new_brightness = MIN(value, MAX_BRIGHTNESS);

    if (_target_brightness == new_brightness) {
        sprintln("JAS NIE JE ZMENENY");
        return; // Ziadna zmena
    }

    // sprintln("NASTAVUEJEM JAS:");
    // sprintln("OLD VALUE ");
    // sprint(_target_brightness);
    // sprintln(new_brightness);
    // sprintln(MAX_BRIGHTNESS);
    // sprintln(value);
    // sprintln(BRIGHTNESS_CNT_TOP);

    // Hodnota chce narast, musi splnat tazsiu podmienku,
    // TODO: Treba sa uistit, že _target_brightness + 5 nikdy nepretecie.
    // if (new_brightness > (_target_brightness + 5) || new_brightness < _target_brightness) {
        _target_brightness = new_brightness;
    // }
}

void configBrightness(uint8_t value) {
    configured_brightness = value;
    setBrightness(configured_brightness);
    saveEEConfig();
}

// void toggleNumitronSegment(uint8_t digit, uint8_t index) {
//     setNumitronSegment(digit, index, !(DIGITS[digit] & (1 << index)));
// }

bool DS3231_Present() {
    #if RTC_ENABLED
    Wire.beginTransmission(DS3231_ADDR);
    uint8_t err = Wire.endTransmission(); // 0 == ACK (device present)
    return (err == 0);
    #else
    return false;
    #endif
}

static void updateTimeCounters() {
    if (DS3231_Present()) { // ak RTC_ENABLED nie je 1, toto vrati vzdy 0
        #if RTC_ENABLED
        const DateTime time_now = RTC.now();
        t_counter_hours = time_now.hour();
        t_counter_minutes = time_now.hour();
        #endif
    } else { // Skusime este dostat presny cas z DCF77 modulu.
        #if DCF77_ENABLED
        const uint8_t clock_state = DCF77_Clock::get_clock_state();
        if (clock_state == Clock::locked || clock_state == Clock::synced) {
            Clock::time_t now;
            DCF77_Clock::get_current_time(now);

            t_counter_hours = bcd_to_int(now.hour);
            t_counter_minutes = bcd_to_int(now.minute);
        }
        #endif
    }
}

static uint8_t last_user_set_brightness;

// Pri diagnostike chceme aby svietili vsetky segmenty,
// takze vieme povedat ktore su vypalene.
void startDiagnostics() {
    if (!BIS(MODE, MODE_DIAG)) {
        SBI(MODE, MODE_DIAG);
        sprintln("Spúštanie diagnostiky... (rozsviecanie všetkých segmentov displeja)");

        last_user_set_brightness = _target_brightness;
        // Pri diagnostike sa potrebujeme uistit, ze jas je zretelne viditelny.
        // Takze minimalne na urovni DEFAULT_BRIGHTNESS.
        if (_target_brightness < DEFAULT_BRIGHTNESS) {
            setBrightness(DEFAULT_BRIGHTNESS);
        }

        setSymbolRawOnNumitron(DIGIT_HOR_TENS,  GET_SEGMENT_SYMBOL(ALL_ON_SYMBOL));
        setSymbolRawOnNumitron(DIGIT_HOR_ONES, GET_SEGMENT_SYMBOL(ALL_ON_SYMBOL));
        setSymbolRawOnNumitron(DIGIT_MIN_TENS,  GET_SEGMENT_SYMBOL(ALL_ON_SYMBOL));
        setSymbolRawOnNumitron(DIGIT_MIN_ONES, GET_SEGMENT_SYMBOL(ALL_ON_SYMBOL));

        crossfadeFromOldDigitsToNew();
    }
}

void stopDiagnostics() {
    if (BIS(MODE, MODE_DIAG)) {
        sprintln("Vypínanie diagnostiky...");
        setBrightness(last_user_set_brightness);

        CBI(MODE, MODE_DIAG);
    }
}

#if DCF77_ENABLED
void setup_dcf77_comparator() {
    ADCSRA &= ~(1 << ADEN);  // Disable ADC (required for ACME to work)
    ADCSRB |= (1 << ACME);   // Enable ADC multiplexer
    ADMUX = (DCF_OUT & 0x07); // Select ADC channel
    ACSR = (1 << ACBG);       // Use bandgap reference (~1.1V) as positive input
}

uint8_t sample_input_pin() {
    const uint8_t sample = !(ACSR & (1 << ACO));
    if (sample) {
        // FLAG = (FLAG & ~(1 << FLAG_DCF_LEDOFF)) | (1 << FLAG_DCF_LEDONN);
        SBI(FLAG, FLAG_DCF_LEDONN);
        CBI(FLAG, FLAG_DCF_LEDOFF);
    } else {
        // FLAG = (FLAG & ~(1 << FLAG_DCF_LEDONN)) | (1 << FLAG_DCF_LEDOFF);
        CBI(FLAG, FLAG_DCF_LEDONN);
        SBI(FLAG, FLAG_DCF_LEDOFF);
    }
    return sample;
}
#endif

void bootDisplay() {
    // Na par sekund zasvietime vsetky cifry v ramci diagnostiky pri starte.
    // V tomto pripade este pouzijeme predvolenu hodnotu jasu (teda polovicu z maxima),
    // pre pripad, ze by bola nastavena prilis mala hodnota jasu.
    SBI(MODE, MODE_BOOT);

    sprintln(F("Úvodná diagnostika. Všetky segmenty budú postupne rozsvietene..."));
    startDiagnostics();

    wait(NUMBER_TRANS_DUR + 6000);

    stopDiagnostics();
    sprintln(F("Úvodná diagnostika dokončená."));

    CBI(MODE, MODE_BOOT);
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

//////////////////////////////
/// CONTROLS
//////////////////////////////

static void handleInput() {
    // CBI(DDRD, L_BTN); SBI(PORTD, L_BTN);
    // CBI(DDRD, R_BTN); SBI(PORTD, R_BTN);

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
                    SBI(FLAG, FLAG_BOTH_BTNS_LONG);

                    sprintln("BOTH BUTTONS LONG PRESSED");
                    if (!BIS(MODE, MODE_EDIT)) { // spustime diagnostiku len mimo editovacieho rezimu
                        // Diagnostika na vyziadanie, zobrazujeme po celu dobu co su obe tlacidla dlho stlacene.
                        startDiagnostics();
                    }

                    long_press_cnt = 0;
                } else {
                    SBI(FLAG, FLAG_LONG_BTN_PRS);
                }
            } else if ((FLAG & MASK_BTN_FLAGS) && (STABLE_REG & BTN_MASK) == BTN_MASK) {
                sprintln("BOTH BUTTONS RELEASED");
                stopDiagnostics();
                if (!BIS(FLAG, FLAG_BOTH_BTNS_LONG)) {
                    // Prepinanie rezimu
                    if (BIS(MODE, MODE_EDIT)) { exitEditMode(); } else { enterEditMode(); }
                } else {
                    displayTimeFromCounters();
                }
                CBI(FLAG, FLAG_LONG_BTN_PRS);
                CBI(FLAG, FLAG_BOTH_BTNS_LONG);
            } else if (!(STABLE_REG & L_BTN_MASK) && long_press_cnt >= LONG_PRESS_CNT_TOP) {
                long_press_cnt = 0;
                // TODO: Podrzanim akciu opakujeme?
                sprint("LEFT BUTTON LONG PRESSED ");
                sprintln(PIND & BTN_MASK);
                // minimum_brightness = _target_brightness - DEFAULT_BRIGHTNESS * 0.1;
                // configBrightness(minimum_brightness);
            } else if (!(STABLE_REG & R_BTN_MASK) && long_press_cnt >= LONG_PRESS_CNT_TOP) {
                long_press_cnt = 0;
                // TODO: Podrzanim akciu opakujeme?
                sprint("RIGHT BUTTON LONG PRESSED ");
                sprintln(PIND & BTN_MASK);
                // minimum_brightness = _target_brightness + DEFAULT_BRIGHTNESS * 0.1;
                // configBrightness(minimum_brightness);
            } else if (!(FLAG & MASK_BTN_FLAGS) && (STABLE_REG & L_BTN_MASK) && !(PREV_STABLE_REG & L_BTN_MASK)) {
                sprintln("LEFT BUTTON RELEASED");
                if (BIS(MODE, MODE_EDIT)) {
                    setSelectedDigit((selected_digit + 1) % DIGIT_COUNT);
                     sprint("SELECTED DIGIT: ");
                    sprintln(selected_digit);
                } else {
                    minimum_brightness = MIN(
                        _target_brightness, MAX_BRIGHTNESS - BRIGHTNESS_STEP
                    ) + BRIGHTNESS_STEP;
                    configBrightness(minimum_brightness);
                }
            } else if (!(FLAG & MASK_BTN_FLAGS) && (STABLE_REG & R_BTN_MASK) && !(PREV_STABLE_REG & R_BTN_MASK))  {
                sprintln("RIGHT BUTTON RELEASED");
                if (BIS(MODE, MODE_EDIT)) {
                    if (selected_digit == DIGIT_HOR_TENS || selected_digit == DIGIT_HOR_ONES) {
                        const uint8_t hour_ones = t_counter_hours % 10;
                        const uint8_t hour_tens = t_counter_hours / 10;
                        if (selected_digit == DIGIT_HOR_TENS) {
                            t_counter_hours = ((hour_tens + 1) % (MAX_HOURS_TENS + 1)) * 10 + hour_ones;
                        } else if (selected_digit == DIGIT_HOR_ONES) {
                            t_counter_hours = hour_tens * 10 + ((hour_ones + 1) % 10);
                            if (t_counter_hours >= MAX_HOURS_COUNT) t_counter_hours = hour_tens * 10;
                        }
                    } else if (selected_digit == DIGIT_MIN_TENS || selected_digit == DIGIT_MIN_ONES) {
                        const uint8_t minute_ones = t_counter_minutes % 10;
                        const uint8_t minute_tens = t_counter_minutes / 10;
                        if (selected_digit == DIGIT_MIN_TENS) {
                            t_counter_minutes = ((minute_tens + 1) % 6) * 10 + minute_ones;
                        } else if (selected_digit == DIGIT_MIN_ONES) {
                            t_counter_minutes = minute_tens * 10 + ((minute_ones + 1) % 10);
                        }
                    }

                    displayTimeFromCounters();
                } else {
                    minimum_brightness = MAX(_target_brightness, BRIGHTNESS_STEP) - BRIGHTNESS_STEP;
                    configBrightness(minimum_brightness);
                }
            }

            PREV_STABLE_REG = STABLE_REG;
        }
    }
}

static void addNewMinuteToCounters() {
    sprintln("addNewMinuteToCounters");

    // Pocitame aj sami ak by nahodou neboli ziadne externe moduly k dispozicii.
    if (++t_counter_minutes > MAX_MINUTES_COUNT) {
        t_counter_minutes = 0;
        if (++t_counter_hours > MAX_HOURS_COUNT) {
            t_counter_hours = 0;
        }
    }
}

#if (SERIAL_ENABLED && DEBUG_MODE)
static void handleCommand(String command) {
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

        uint8_t day_ones = day % 10;
        uint8_t month_ones = month % 10;
        uint8_t day_tens = day / 10;
        uint8_t month_tens = month / 10;

        setSymbolOnNumitron(DIGIT_HOR_TENS, day_tens);
        setSymbolOnNumitron(DIGIT_HOR_ONES, day_ones);
        setSymbolOnNumitron(DIGIT_MIN_TENS, month_tens);
        setSymbolOnNumitron(DIGIT_MIN_ONES, month_ones);
        #endif
    } else if (command == "z_cas(hm)") {
        updateTimeCounters();
        sprint(t_counter_hours);
        sprint(":");
        sprintln(t_counter_minutes);
        displayTimeFromCounters();
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
            SET_LED_COLOR(LED_R, i > 255 ? 255 - (i - 256) : i * 2);
            wait(10);
        }

        // LED_G
        for (uint16_t i = 0; i < 511; i++) {
            SET_LED_COLOR(LED_G, (i > 255 ? 255 - (i - 256) : i) * 2);
            wait(10);
        }

        // LED_B
        for (uint16_t i = 1; i < 511; i++) {
            SET_LED_COLOR(LED_B, (i <= 255 ? i : 511 - i));
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
        uint8_t ones = temperature % 10;

        setSymbolOnNumitron(DIGIT_HOR_TENS, abs(tens));
        if (temperature < 0) {
            setSymbolOnNumitron(DIGIT_HOR_TENS, MINUS_SYMBOL);
            if (temperature < -9) {
                ones = -9; // Cap it at -9
            }
        }

        setSymbolOnNumitron(DIGIT_HOR_ONES, abs(ones));
        setSymbolOnNumitron(DIGIT_MIN_TENS, DEGREE_SYMBOL);
        setSymbolOnNumitron(DIGIT_MIN_ONES, C_SYMBOL);
        #endif
    } else if (command == "z_rok") {
        #if RTC_ENABLED
        uint16_t year = RTC.now().year();
        sprint("Rok: ");
        sprintln(year);

        const uint8_t year_milliennia = (year / 1000) % 10;
        const uint8_t year_centuries  = (year / 100)  % 10;
        const uint8_t year_decades    = (year / 10)   % 10;
        const uint8_t year_ones      =  year         % 10;

        setSymbolOnNumitron(DIGIT_HOR_TENS, year_milliennia);
        setSymbolOnNumitron(DIGIT_HOR_ONES, year_centuries);
        setSymbolOnNumitron(DIGIT_MIN_TENS, year_decades);
        setSymbolOnNumitron(DIGIT_MIN_ONES, year_ones);
        #endif
    } else {
        sprintln("[Chyba] Neznámy príkaz...");
    }
}
#endif

static void handleDCF77ClockState() {
    #if DCF77_ENABLED
    static uint8_t last_state = Clock::useless;

    uint8_t state = DCF77_Clock::get_clock_state();
    if (state != Clock::useless && state != Clock::dirty) { // Vypada to ze sme synchronizovani!
        sprintln(F("Hodiny zosynchronizované, vypínanie DCF77 modulu..."));
        CBI(DDRB, DCF_PON); // Vypneme DCF prijimač

        if (last_state == Clock::useless || last_state == Clock::dirty) {
            Clock::time_t now;

            timer_counter = 0; // Zaciname od 0 -> 0 milisekund.

            DCF77_Clock::get_current_time(now);
            t_counter_hours = bcd_to_int(now.hour);
            t_counter_minutes = bcd_to_int(now.minute);
            #if RTC_ENABLED
                RTC.adjust(DateTime(
                    bcd_to_int(now.year),
                    bcd_to_int(now.month),
                    bcd_to_int(now.day),
                    t_counter_hours, t_counter_minutes, 0
                ));
            #endif

            sprintln(F("Zobrazovanie nového času..."));
            addNewMinuteToCounters();
            displayTimeFromCounters();
        }

        SET_ALL_CLR_BRIGHT(0);

        // Zelena indikuje uspesne zosynchronizovanie.
        SET_LED_COLOR(LED_G, led_brightness);
    }

    last_state = state;
    #endif
}

#if INA_ENABLED
static uint8_t nLitSegments() {
    uint8_t n = 0;
    for (uint8_t i = 0; i < DIGIT_COUNT; i++) {
        n += __builtin_popcount(DIGITS[i]);
    }

    return n;
}
#endif

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

    if (BIS(FLAG, FLAG_CRSF_DEFFERED) && !BIS(MODE, MODE_CRSF) && !COMPARE_DIGIT_BUFFERS(DIGITS, _fade_in_buffer)) {
        crossfadeFromOldDigitsToNew();
        CBI(FLAG, FLAG_CRSF_DEFFERED);
    }

    // if (BIS(FLAG, FLAG_NEW_SECOND)) {
    //     sprint(F("Free RAM: "));
    //     sprintln(freeRam());
    // }

    #if DCF77_ENABLED
    if (FLAG & MASK_DCF_LED_FLAGS) {
        if (BIS(FLAG, FLAG_DCF_LEDONN)) {
            SET_LED_COLOR(LED_R, led_brightness);

            const uint8_t state = DCF77_Clock::get_clock_state();
            if (state == Clock::dirty) {
                SET_LED_COLOR(LED_R, led_brightness / 2);
                SET_LED_COLOR(LED_G, led_brightness / 2);
            }
        } else {
            SET_ALL_CLR_BRIGHT(0);
        }

        FLAG &= ~MASK_DCF_LED_FLAGS;
    }
    #endif

    if(BIS(FLAG, FLAG_NEW_SECOND)) {
        if (BIS(FLAG, FLAG_NEW_MINUTE)) {
            // V edit mode nam nebezi cas.
            if (!BIS(MODE, MODE_EDIT)) {
                addNewMinuteToCounters();
                displayTimeFromCounters();
            }

            CBI(FLAG, FLAG_NEW_MINUTE);
        }
        CBI(FLAG, FLAG_NEW_SECOND);

        // Blikanie desatinnej ciarky ako naznak kurzoru.
        // if (BIS(MODE, MODE_EDIT)) {
        //     toggleNumitronSegment(selected_digit, SEGMENT_DP);
        // }

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
                float voltage_percentage = INA.getBusVoltage() * 0.2f;
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

        // TODO: DCF77 modul OUT pin je pullnuty k 0 ak je zapojeny modul.
        // while (ADCSRA & (1 << ADSC)) {}
        // measured_brightness = analogRead(DCF_OUT);
        // sprint("Measured brightness: " + String(measured_brightness));

        // TODO: Dajme to ako volitelne nastavenie,
        // Ak bude jas nastaveny na "AUTOMATICKY", tak sa pouzije tento LDR,
        // inak sa pouzije nastavenie uzivatela.
        //
        // static volatile uint16_t measured_brightness = 0;
        // if (!BIS(MODE, MODE_DIAG && !BIS(MODE, MODE_EDIT))) {
        //     while (ADCSRA & (1 << ADSC)) {}
        //     measured_brightness = analogRead(LDR_PIN_PORTC);
        //     // sprintln("Measured brightness: " + String(measured_brightness));

        //     // Compute brightness
        //     int brightness = max(configured_brightness - map(measured_brightness, 0, 1023, 0, configured_brightness), minimum_brightness);
        //     setBrightness(brightness * 1.5);
        // }
    }

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
}

#if (ARDUINO_FRAMEWORK)
// int main(void) {
void setup() {
#else
int main(void) {
#endif
    // TODO: Treba analyzovat rast stacku aby sme sa uistili, ze za ziadnych okolnosti nepretecie.
    // sprint(F("Free RAM: "));
    // sprintln(freeRam());

    #if SERIAL_ENABLED
    // Serial pre debugovanie a logging
    Serial.begin(SERIAL_BANDWIDTH);
    // unsigned long start = millis();
    // while (!Serial && millis() - start < 2000) { delay(10); }
    #endif

    //report_reset_and_count();

    //PORTC |= (1 << PC6); // TODO: DEBUGING ONLY

    sprintln(F("Spúšťanie hodín..."));

    // sprint(F("Free RAM: "));
    // sprintln(freeRam());

    #if DCF77_ENABLED
    setup_dcf77_comparator();

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
    // !! Treba sa uistit, ze na tychto pinoch naozaj nie je nic pripojene.
    UNUSED_PIN(C, PC2);
    UNUSED_PIN(D, PD6);

    // Tento pin sme sa rozhodli nepouzit, ale kedze je na nom trimmer
    // ktory funguje ako 0-50K pullup musime sa uistit, ze ak bude trimmer
    // nastaveny na 0, nedojde k skratu, takze tento pin nikdy nemoze bit v stave OUTPUT LOW!
    SBI(DDRC,   LED_BRIGHTNESS_TRIM);
    SBI(PORTC,  LED_BRIGHTNESS_TRIM);

    /****************************************
     * Zbernica registrov.
     ****************************************/

    #if DISPLAY_ENABLED
        sprintln(F("Konfigurácia zbernice registrov pre displej..."));

        CBI(PORTB,  SRCK_PORTB);    SBI(DDRB,   SRCK_PORTB);
        CBI(PORTD,  RCK_PORTD);     SBI(DDRD,   RCK_PORTD);
        CBI(PORTB,  SERIN_PORTB);   SBI(DDRB,   SERIN_PORTB);
        // Musime pouzit OUTPUT rezim pretoze je tam 10K pullup (potrebujeme silnu hodnotu).
        SBI(PORTD,  _G_PORTD);      SBI(DDRD,   _G_PORTD);
    #endif

    /****************************************
     * PWM Jas
     ****************************************/

    #if DISPLAY_ENABLED
        sprintln(F("Konfigurácia PWM kanálu pre jas..."));

        CRITICAL_SECTION {
            STOP_DISPLAY_PWM();

            OCR0A = DISPLAY_PWM_TOP;
            OCR0B = 0;

            TIMSK0 = 0; // Vypneme prerusenie tohto casovaca.
        }
    #endif

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

    // Indikácia zapínania (LED-ka svieti na zlto).
    SET_LED_COLOR(LED_R, DEFAULT_LED_BRIGHTNESS);
    SET_LED_COLOR(LED_G, DEFAULT_LED_BRIGHTNESS);

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
     * Bootovanie Displeja
     ****************************************/

    #if DISPLAY_ENABLED
        sprintln(F("Zapínanie displeja..."));

        // Uistime sa, ze registre su ciste
        putDigitsToInputRegs(DIGITS, DIGIT_COUNT);
        pushToOutputRegs();

        // Zapneme PWM ovladajuci jas.
        CRITICAL_SECTION {
            START_DISPLAY_PWM();
        }

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

        // TODO:
        // sprint(F("Ulozeny jas: "));
        // sprintln(getEEConfig(BRIGHTNESS));

        // configBrightness(getEEConfig(BRIGHTNESS));
    }

    sprintln(F("Zobrazovanie času..."));
    updateTimeCounters();
    displayTimeFromCounters();

    #if DCF77_ENABLED
        SET_ALL_CLR_BRIGHT(0);
        sprintln(F("Spúšťanie DCF77 prijímača..."));
        SBI(DDRB, DCF_PON); // Zapneme modul

        // Za 15 minut je drift priblizne 100 ms, co znaci, ze presnost
        // nasho krystalu je (0.1 / 900) * 1000 = ~111 ppm.
        // Velkost driftu v hertzoch je:
        // (0.1 / 900) * 16 000 000 = 1778 Hz
        // Ci uz original cip alebo klon, rozdiel je minimalny.
        // https://blog.blinkenlight.net/experiments/dcf77/crystal-frequency-compensation/
        Internal::Generic_1_kHz_Generator::adjust(CLOCK_DRIFT_HZ);
    #else
        // Vypneme indikacnu ledku, ktora indikovala spustanie zltou farbou.
        SET_ALL_CLR_BRIGHT(0);
    #endif

    sprintln(F("Spúšťanie hodín dokončené!"));

    #if !ARDUINO_FRAMEWORK
    for (;;) {
		loop();
    }

    return 0;
    #endif

    // setBrightness(MAX_BRIGHTNESS);

    // sprint(F("Free RAM: "));
    // sprintln(freeRam());
}
