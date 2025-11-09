
#include <avr/wdt.h>

#include "reg.h"
#include "config.h"
#include "isr.h"

#include "main.h"

#if ARDUINO_FRAMEWORK
#include <Arduino.h>
#endif

// POZNAMKY:
// Rok je dolezity kvoli priestupným rokom. (29 februar)
// Ak nemáme pripojenie cez DCF77, prepinanie na letny cas
// prebehne vzdy poslednu marcovu nedelu a prepinanie na zimny cas vzdy poslednu oktobrovu nedelu.
// Tak ze po 01:59 sa zobrazí 03:00 alebo z 02.59 bude nasledovat 01:00

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

void crossfadeFromOldDigitsToNew() {
    if (!BIS(MODE, MODE_CRSF)) {
        crsf_duty = CROSSFADING_PERIOD;
        crsf_cycle_counter = 0;
        crsf_duty_step_counter = 0;

        // Nastavme bit rezimu az po vsetkom, inak by
        // sa mohlo zavolat medzitym ISR-ko a riesit crossfading
        // este zo starymi hodnotami.
        SBI(MODE, MODE_CRSF);
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

    crossfadeFromOldDigitsToNew();
}

void enterEditMode() {
    blink_timer_counter = 0;
    SBI(MODE, MODE_EDIT);
    setNumitronSegment(selected_digit, SEGMENT_DP, ON);
}

void exitEditMode() {
    blink_timer_counter = 0;
    CBI(MODE, MODE_EDIT);
    setNumitronSegment(selected_digit, SEGMENT_DP, OFF);

    // Vysli sme s nastavovacieho rezimu - ulozme zmeny
    saveEEConfig();
}

// Skonvertuje uint8_t reprezentujuci cislo zapisane v tvare 7 segmentovky
// na jeho index v zozname symbolov,
// takze nam staci si pamatat len symbol cisla pre zapis do registrov.
// Mozno by bolo lepsie si tento index niekde pamatat.
// Stacilo by pamatat si dve cisla: hodiny a minuty a vzdy ich prelozit pri zobrazovani.
uint8_t getSelectedNumSymbolIndex(uint8_t digit) {
    uint8_t masked_digit = DIGITS[digit] & DIGIT_MASK;
    for (uint8_t num_symbol_index = 0; num_symbol_index < NUM_SYMBOL_COUNT; num_symbol_index++) {
        if (PROGMEM_READ(NUM_SYMBOL, num_symbol_index) == masked_digit) {
            return num_symbol_index;
        }
    }

    return 0;
}

void setBrightness(uint8_t value) {
    uint8_t new_brightness = value < MAX_BRIGHTNESS ? value : MAX_BRIGHTNESS;
    if (new_brightness != _target_brightness) {
        Serial.println("NASTAVUJEME JAS!!!");
        _target_brightness = new_brightness;
        // sprintln("Nový jas: " + String((target_brightness * 100) / MAX_BRIGHTNESS) + "%");
    } else {
        Serial.println("ZIADNA ZMENA");
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

void setSymbolRawOnNumitron(uint8_t numitron_index, uint8_t symbol) {
    if (numitron_index >= DIGIT_COUNT) {
        return; // No change
    }

    OLD_DIGITS[numitron_index] = DIGITS[numitron_index];
    DIGITS[numitron_index] = symbol;
}

void setSymbolOnNumitron(uint8_t numitron_index, uint8_t symbol_index) {
    if (symbol_index >= NUM_SYMBOL_COUNT)
    setSymbolRawOnNumitron(numitron_index, PROGMEM_READ(NUM_SYMBOL, symbol_index));
}

static void displayTimeFromCounters() {
    bool needs_update = false;
    for (uint8_t digit = 0; digit < DIGIT_COUNT; digit++) {
        // Cele cislo, bud minut alebo hodin
        uint8_t num = digit > DIGIT_HOR_UNITS ? t_counter_minutes: t_counter_hours;
        if (!BIS(digit, 2) && BIS(getEEConfig(GENERAL), M12_24)) { // Okrem cifier 2 a 3
            // Pri 12 hod mode je polnoc 12:00
            num = (num == 0) ? 12 : ((num > 12) ? num - 12 : num);
        }
        const uint8_t val = (digit & 1) ? num % 10 : num / 10; // Neparne cisla nemozu mat nastaveny prvy bit.

        const uint8_t new_symbol = PROGMEM_READ(NUM_SYMBOL, val);
        // OLD_DIGITS[digit] = DIGITS[digit];
        if (DIGITS[digit] != new_symbol) {
            setSymbolRawOnNumitron(digit, new_symbol);
            needs_update = true;

            // Ak mame vypnutu uvodnu nulu.
            // if (digit == DIGIT_HOR_TENS && num < 10 && !BIS(getEEConfig(GENERAL), TRAILLING_ZERO)) {
            //     setSymbolRawOnNumitron(digit, 0);
            // }
        }
    }

    if (needs_update) {
        // crossfadeFromOldDigitsToNew();

        putDigitsToInputRegs(DIGITS, DIGIT_COUNT);
        pushToOutputRegs();
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
    sprint("Spúštanie diagnostiky... (rozsviecanie všetkých segmentov displeja)");
    SBI(MODE, MODE_DIAG);

    last_user_set_brightness = _target_brightness;
    // Pri diagnostike sa potrebujeme uistit, ze jas je zretelne viditelny.
    setBrightness(DEFAULT_BRIGHTNESS);

    setSymbolRawOnNumitron(DIGIT_HOR_TENS, 0b11111111);
    setSymbolRawOnNumitron(DIGIT_HOR_UNITS, 0b11111111);
    setSymbolRawOnNumitron(DIGIT_MIN_TENS, 0b11111111);
    setSymbolRawOnNumitron(DIGIT_MIN_UNITS, 0b11111111);

    crossfadeFromOldDigitsToNew();
}

void stopDiagnostics() {
    sprint("Vypínanie diagnostiky...");
    setBrightness(last_user_set_brightness);

    SBI(MODE, MODE_DIAG);
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
        FLAG = (FLAG & ~(1 << FLAG_DCF_LEDOFF)) | (1 << FLAG_DCF_LEDONN);
    } else {
        FLAG = (FLAG & ~(1 << FLAG_DCF_LEDONN)) | (1 << FLAG_DCF_LEDOFF);
    }
    return sample;
}
#endif

void bootDisplay() {
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

//////////////////////////////
/// CONTROLS
//////////////////////////////

static void handleInput() {
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
                } else {
                    BOTH_FLAG = 1;
                }
            } else if (BOTH_FLAG && (STABLE_REG & BTN_MASK) == BTN_MASK) {
                // sprintln("BOTH BUTTONS RELEASED");
                stopDiagnostics();
                if (!BIS(BOTH_FLAG, 2)) {
                    // Prepinanie rezimu
                    if (BIS(MODE, MODE_EDIT)) { exitEditMode(); } else { enterEditMode(); }
                }
                BOTH_FLAG = 0;
            } else if (!(STABLE_REG & L_BTN_MASK) && long_press_cnt >= LONG_PRESS_CNT_TOP) {
                long_press_cnt = 0;
                // TODO: Podrzanim akciu opakujeme?
                // sprintln("LEFT BUTTON LONG PRESSED");
                // minimum_brightness = _target_brightness - DEFAULT_BRIGHTNESS * 0.1;
                // configBrightness(minimum_brightness);
            } else if (!(STABLE_REG & R_BTN_MASK) && long_press_cnt >= LONG_PRESS_CNT_TOP) {
                long_press_cnt = 0;
                // TODO: Podrzanim akciu opakujeme?
                // sprintln("RIGHT BUTTON LONG PRESSED");
                // minimum_brightness = _target_brightness + DEFAULT_BRIGHTNESS * 0.1;
                // configBrightness(minimum_brightness);
            } else if (!BOTH_FLAG && (STABLE_REG & L_BTN_MASK) && !(PREV_STABLE_REG & L_BTN_MASK)) {
                SBI(PORTB, LED_B);
                // sprintln("LEFT BUTTON RELEASED");
                if (BIS(MODE, MODE_EDIT)) {
                    setSelectedDigit((selected_digit + 1) % DIGIT_COUNT);
                } else {
                    minimum_brightness = MIN(
                        _target_brightness, MAX_BRIGHTNESS - BRIGHTNESS_STEP
                    ) + BRIGHTNESS_STEP;
                    configBrightness(minimum_brightness);
                }
            } else if (!BOTH_FLAG && (STABLE_REG & R_BTN_MASK) && !(PREV_STABLE_REG & R_BTN_MASK))  {
                // sprintln("RIGHT BUTTON RELEASED");
                if (BIS(MODE, MODE_EDIT)) {
                    uint8_t selected_num_index = getSelectedNumSymbolIndex(selected_digit);
                    selected_num_index = (selected_num_index + 1) % NUM_SYMBOL_COUNT;
                    DIGITS[selected_digit] = PROGMEM_READ(NUM_SYMBOL, selected_num_index);
                    crossfadeFromOldDigitsToNew();
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

static void handleDCF77ClockState() {
    #if DCF77_ENABLED
    static uint8_t last_state = Clock::useless;

    uint8_t state = DCF77_Clock::get_clock_state();
    if (state != Clock::useless && state != Clock::dirty) { // Vypada to ze sme synchronizovani!
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

            addNewMinuteToCounters();
            displayTimeFromCounters();
        }

        CBI(PORTB, LED_R);
        CBI(PORTB, LED_B);

        // Zelena indikuje uspesne zosynchronizovanie.
        SBI(PORTB, LED_G);
    }

    last_state = state;
    #endif
}

static uint8_t nLitSegments() {
    uint8_t n = 0;
    for (uint8_t i = 0; i < DIGIT_COUNT; i++) {
        n += __builtin_popcount(DIGITS[i]);
    }

    return n;
}

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

    // if (BIS(FLAG, FLAG_NEW_SECOND)) {
    //     sprint(F("Free RAM: "));
    //     sprintln(freeRam());
    // }

    if (FLAG & MASK_DCF_LED_FLAGS) {
        if (BIS(FLAG, FLAG_DCF_LEDONN)) {
            SBI(PORTB, LED_R);

            const uint8_t state = DCF77_Clock::get_clock_state();
            if (state == Clock::dirty) {
                SBI(PORTB, LED_G);
            }
        } else {
            CBI(PORTB, LED_R);
            CBI(PORTB, LED_G);
        }

        FLAG &= ~MASK_DCF_LED_FLAGS;
    }

    if(BIS(FLAG, FLAG_NEW_SECOND)) {
        if (BIS(FLAG, FLAG_NEW_MINUTE)) {
            addNewMinuteToCounters();
            displayTimeFromCounters();

            CBI(FLAG, FLAG_NEW_MINUTE);
        }
        CBI(FLAG, FLAG_NEW_SECOND);

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

        // TODO: DCF77 modul OUT pin je pullnuty k 0 ak je zapojeny modul.
        // while (ADCSRA & (1 << ADSC)) {}
        // measured_brightness = analogRead(DCF_OUT);
        // sprint("Measured brightness: " + String(measured_brightness));

        // TODO: Vypnute zatiaľ, nastavovanim by sa mala nastaviť hodnota minimalneho jasu.
        // static volatile uint16_t measured_brightness = 0;
        // if (!diagnostics_mode && !edit_mode) {
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
    #endif

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
        SBI(PORTD,  _G_PORTD);      SBI(DDRD,   _G_PORTD);
    #endif

    /****************************************
     * PWM Jas
     ****************************************/

    #if DISPLAY_ENABLED
        sprintln(F("Konfigurácia PWM kanálu pre jas..."));

        CRITICAL_SECTION {
            TCCR0A = 0;
            TCCR0B = 0;

            OCR0A = DISPLAY_PWM_TOP;
            OCR0B = 1;

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

    // Indikácia zapínania.
    SBI(PORTB, LED_R);
    analogWrite(10, 128);

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
            TCCR0A = (1 << WGM00) | (1 << WGM01) | (1 << COM0B1) | (1 << COM0B0);
            TCCR0B = (1 << WGM02) | (1 << CS00);
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
        sprint(F("Ulozeny jas: "));
        sprintln(getEEConfig(BRIGHTNESS));

        // configBrightness(getEEConfig(BRIGHTNESS));
    }

    // sprintln(F("Zobrazovanie času..."));
    // updateTimeCounters();
    // displayTimeFromCounters();

    #if DCF77_ENABLED
        analogWrite(10, 0);
        sprintln(F("Spúšťanie DCF77 prijímača..."));
        SBI(DDRB, DCF_PON); // Zapneme modul
    #else
        // Indikácia zapínania.
        CBI(PORTB, LED_R);
        analogWrite(10, 0);
    #endif

    sprintln(F("Spúšťanie hodín dokončené!"));

    #if !ARDUINO_FRAMEWORK
    for (;;) {
		loop();
    }

    return 0;
    #endif

    // sprint(F("Free RAM: "));
    // sprintln(freeRam());
}
