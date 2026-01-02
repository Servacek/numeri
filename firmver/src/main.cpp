
#include <avr/wdt.h>

#include "reg.h"
#include "input.h"
#include "isr.h"
#include "display.h"
#include "clock.h"
#include "peripherals.h"
#include "views.h"
#include "led.h"

#include "main.h"
#include "config.h"

#if ARDUINO_FRAMEWORK
#include <Arduino.h>
#endif

#include <avr/io.h>
#include <avr/wdt.h>
#include <avr/eeprom.h>

////////////////////////////////////
// Watchdog
////////////////////////////////////

// https://www.nongnu.org/avr-libc/user-manual/group__avr__watchdog.html
uint8_t _MCUSR __attribute__ ((section (".noinit")));

void get_mcusr(void) __attribute__((naked)) __attribute__((section(".init3")));
void get_mcusr(void) {
  _MCUSR = MCUSR;
  MCUSR = 0;

  wdt_reset();
  wdt_disable();
}

////////////////////////////////////
// Resetovanie systemu
////////////////////////////////////

uint16_t EEMEM reset_count_eeprom = 0;

const char* resetReasonToString(uint8_t resetReason) {
    if (resetReason & (1 << PORF))  return "POR: Power-on Reset";
    if (resetReason & (1 << EXTRF)) return "EXT: External Reset (RESET pin)";
    if (resetReason & (1 << BORF))  return "BOR: Brown-out Reset";
    if (resetReason & (1 << WDRF))  return "WDT: Watchdog Reset";
    return "Unknown";
}

void reportResetAndCount() {
  uint16_t c = eeprom_read_word(&reset_count_eeprom);
  c++;
  eeprom_write_word(&reset_count_eeprom, c);
}

////////////////////////////////////
// RAM
////////////////////////////////////

int freeRam() {
    extern int __heap_start, *__brkval;
    int v;
    const int free_memory = (int) &v - (__brkval == 0 ? (int) &__heap_start : (int) __brkval);

    // If negative, you have stack/heap collision (critical!)
    if (free_memory < 0) {
        return 0; // Out of memory!
    }
    return free_memory;
}

////////////////////////////////////

volatile uint8_t led_brightness = DEFAULT_LED_BRIGHTNESS;

#if DCF77_ENABLED
inline uint8_t sample_input_pin() {
    if (ACSR & (1 << ACO)) { // invertovana logika
        CBI(FLAG, FLAG_DCF_LEDONN);
        return 0;
    }

    SBI(FLAG, FLAG_DCF_LEDONN);
    return 1;
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

void displayYear() {
    #if RTC_ENABLED
    const uint16_t year = RTC.now().year();
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
    const uint8_t year_centuries  = (year / 100)  % 10;
    const uint8_t year_decades    = (year / 10)   % 10;
    const uint8_t year_ones       =  year         % 10;

    setSymbolOnNumitron(DIGIT_HOR_TENS, year_milliennia);
    setSymbolOnNumitron(DIGIT_HOR_ONES, year_centuries);
    setSymbolOnNumitron(DIGIT_MIN_TENS, year_decades);
    setSymbolOnNumitron(DIGIT_MIN_ONES, year_ones);

    crossfadeFromOldDigitsToNew();
}

int16_t readInternalTemperature() {
    // Save current ADC configuration
    const uint8_t _ADMUX = ADMUX;
    const uint8_t _ADCSRA = ADCSRA;

    // Set voltage reference to internal 1.1V and select temperature sensor (ADC8)
    ADMUX = (1 << REFS1) | (1 << REFS0) | (1 << MUX3);

    // Enable ADC and set prescaler to 128 (for 16MHz clock -> 125kHz ADC clock)
    ADCSRA = (1 << ADEN) | (1 << ADPS2) | (1 << ADPS1) | (1 << ADPS0);

    wait(20); // Pockame chvilu kym si to sadne.

    ADCSRA |= (1 << ADSC);
    while (ADCSRA & (1 << ADSC));
    const uint16_t adcValue = ADC;

    // Obnovime konfiguracie ADC.
    ADMUX = _ADMUX;
    ADCSRA = _ADCSRA;

    // Vracia hodnoty okolo 322 pre 23 °C
    // Tuto kalibraciu je treba vykonat pre kazdy cip.
    const int16_t temperature = (int16_t)((adcValue - 300) / 1.08f);

    return temperature;
}

void displayTemperature() {
    #if RTC_ENABLED
    int temperature = round(RTC.getTemperature());
    #else
    int temperature = readInternalTemperature();
    #endif

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

    crossfadeFromOldDigitsToNew();
}

void displayDate() {
    #if RTC_ENABLED
    DateTime now = RTC.now();
    int day = now.day();
    int month = now.month();
    #elif DCF77_ENABLED
    Clock::time_t now;
    DCF77_Clock::get_current_time(now);
    int day = bcd_to_int(now.day);
    int month = bcd_to_int(now.month);
    #else
    int day = 12;
    int month = 12;
    #endif
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

    crossfadeFromOldDigitsToNew();
}

#if (SERIAL_ENABLED && COMMANDS_ENABLED)
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
        displayDate();
    }
    else if (command == "z_cas(hm)") {
        updateTimeCounters();
        sprint(t_counter_hours);
        sprint(":");
        sprintln(t_counter_minutes);
        displayTimeFromCounters(t_counter_minutes, t_counter_hours);
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
    } else if (command == "z_teplota") { displayTemperature(); }
    else if (command == "z_rok") { displayYear(); }
    else { sprintln(F("[Chyba] Neznámy príkaz...")); }
}
#endif

#if DCF77_ENABLED
static void handleDCF77ClockState() {
    static uint8_t last_state = Clock::useless;

    const uint8_t state = DCF77_Clock::get_clock_state();
    if (state != Clock::useless && state != Clock::dirty) { // Vypada to ze sme synchronizovani!
        sprintln(F("Hodiny zosynchronizované, vypínanie DCF77 modulu..."));
        CBI(DDRB, DCF_PON); // Vypneme DCF prijimač

        if (last_state == Clock::useless || last_state == Clock::dirty) {
            SBI(FLAG, FLAG_DCF_SYNC);
        }

        SET_ALL_CLR_BRIGHT(0);

        // Zelena indikuje uspesne zosynchronizovanie.
        SET_LED_COLOR(LED_G, led_brightness);
        last_state = Clock::useless;
    } else {
        last_state = state;
    }
}
#endif

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
    // Softvérové PWM pre modru ledku
    if (LED_B_REG == 0 || LED_B_CNT < LED_B_REG) {
        CBI(PORTB, LED_B);
    } else {
        SBI(PORTB, LED_B);
    }

    #if CRSF_ENABLED
    if (BIS(FLAG, FLAG_CRSF_DEFFERED) && !BIS(MODE, MODE_CRSF) && !COMPARE_DIGIT_BUFFERS(DIGITS, _fade_in_buffer)) {
        crossfadeFromOldDigitsToNew();
        CBI(FLAG, FLAG_CRSF_DEFFERED);
    }
    #endif

    #if DCF77_ENABLED
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

    CBI(FLAG, FLAG_DCF_LEDONN);
    #endif

    if(BIS(FLAG, FLAG_NEW_SECOND)) {
        // if (!BIS(MODE, MODE_EDIT)) {
        //     view_iter_counter++;
        //     const uint8_t period = is_any_view_shown ? view_iter_period / 2 : view_iter_period;
        //     if (view_iter_counter >= period) {
        //         view_iter_counter = 0;
        //         if (is_any_view_shown) {
        //             sprintln(F("Zobrazujem spat cas..."));
        //             displayTimeFromCounters(t_counter_minutes, t_counter_hours);
        //             is_any_view_shown = 0;
        //         } else {
        //             sprint(F("Zobrazujem view:"));
        //             sprintln(current_view_index);
        //             VIEWS[current_view_index]();
        //             current_view_index = getNextViewIndex(current_view_index);
        //             is_any_view_shown = 1;
        //         }
        //     }
        // } else {
        //     view_iter_counter = 0;
        // }

        // Ak sa riadime podla RTC modulu, tak chceme zobrazit novy cas
        // vzdy ked sa zmeni.
        if (updateTimeCountersFromTimeSources()) {
            if (!is_any_view_shown) { // Zobrazme cas len ak nezobrazujeme nieco ine.
                displayTimeFromCounters(t_counter_minutes, t_counter_hours);
            }
        }
        CBI(FLAG, FLAG_NEW_SECOND);

        // Blikanie desatinnej ciarky ako naznak kurzoru.
        // if (BIS(MODE, MODE_EDIT)) {
        //     toggleNumitronSegment(selected_digit, SEGMENT_DP);
        // }

        #if DCF77_ENABLED
        if (BIS(FLAG, FLAG_DCF_SYNC)) {
            SET_LED_COLOR(LED_G, led_brightness);

            Clock::time_t now;

            timer_counter = 0; // Zaciname od 0 -> 0 milisekund.

            // ! Caka do dalsej sekundy, preto musi byt ISR-ko zapnute!
            DCF77_Clock::get_current_time(now);
            t_counter_hours = bcd_to_int(now.hour);
            t_counter_minutes = bcd_to_int(now.minute);
            #if RTC_ENABLED
                RTC.adjust(DateTime(
                    bcd_to_int(now.year),
                    bcd_to_int(now.month),
                    bcd_to_int(now.day),
                    t_counter_hours, t_counter_minutes, 1
                ));
            #endif

            sprintln(F("Zobrazovanie nového času..."));
            // addNewMinuteToCounters();
            displayTimeFromCounters(t_counter_hours, t_counter_minutes);
        } else {
            handleDCF77ClockState();
        }
        #endif

        #if INA_ENABLED
            // if (INA.isConnected() != false) {
            //     float bus_voltage = INA.getBusVoltage();
            //     sprintln("----------- MERANIE -------------");
            //     sprint("Napájacie napätia [V]: \t");
            //     sprintln(bus_voltage, 2);
            //     sprint(F("Úbytok napätia na meracom rezistore [mV]:\t\t"));
            //     float shuntVoltage = INA.getShuntVoltage();
            //     sprintln(shuntVoltage, 2);

            //     float CONSUMPTION_MA_PER_SEGMENT_MAX = 12.5f; // 13.77f;
            //     float CONSUMPTION_MA_PER_SEGMENT_MIN = 10.0f; // 12.33

            //     // Vypocitajme predpokladany prudovy odber displeja:

            //     // Spocitajme, kolko segmentov by malo svietit.
            //     uint8_t n_segs = nLitSegments();
            //     // Zohladnime hodnotu napajacieho napatie
            //     float voltage_percentage = bus_voltage / MAX_DISPLAY_VOLTAGE;
            //     // Zohladnime aktualny jas.
            //     float brightness_percentage = ((float)_target_brightness) / ((float)MAX_BRIGHTNESS);
            //     float total_assumed_cons_min = ((float)n_segs) * (CONSUMPTION_MA_PER_SEGMENT_MIN * brightness_percentage * voltage_percentage);
            //     float total_assumed_cons_max = ((float)n_segs) * (CONSUMPTION_MA_PER_SEGMENT_MAX * brightness_percentage * voltage_percentage);
            //     float actual_consumption = INA.getCurrent_mA();

            //     sprint(F("Prúdový odber displeja [mA]:\t\t"));
            //     sprint(actual_consumption, 2);
            //     sprint(" ");
            //     sprint(shuntVoltage / INA_SHUNT_R, 2);
            //     sprint("\t\t Predpokladany (MAX): \t");
            //     sprintln(total_assumed_cons_max, 2);
            //     sprint("\t\t Predpokladany (MIN): \t");
            //     sprintln(total_assumed_cons_min, 2);
            //     sprintln("Odchylka: \t\t");
            //     sprintln(((total_assumed_cons_max + total_assumed_cons_min) / 2) / actual_consumption);
            //     sprintln("---------------------------------");
            // }
        #endif

        #if LDR_ENABLED
        // TODO: Dajme to ako volitelne nastavenie,
        // Ak bude jas nastaveny na "AUTOMATICKY", tak sa pouzije tento LDR,
        // inak sa pouzije nastavenie uzivatela.
        static uint16_t measured_brightness = 0;
        if (!BIS(MODE, MODE_DIAG) && !BIS(MODE, MODE_EDIT)) {
            measured_brightness = ADC_READ(LDR_PIN_PORTC);

            sprintln("Measured brightness: " + String(measured_brightness));

            // int brightness = max(configured_brightness - map(measured_brightness, 40, 800, 0, configured_brightness), MINIMUM_BRIGHTNESS);
            // setBrightness(brightness, 1);

            // sensor calibration bounds (tune to your sensor)
            const int SENSOR_MIN = 40;
            const int SENSOR_MAX = 800;

            // curvature: 1.0 -> near-linear, 5..15 -> stronger log-like compression
            const float LOG_ALPHA = 9.0f;

            // clamp measured value to expected range
            int m = measured_brightness;
            if (m < SENSOR_MIN) m = SENSOR_MIN;
            if (m > SENSOR_MAX) m = SENSOR_MAX;

            // normalized 0..1
            float norm = (float)(m - SENSOR_MIN) / (float)(SENSOR_MAX - SENSOR_MIN);

            // compute log-like compressed fraction in [0,1]:
            // scale = log(1 + alpha * norm) / log(1 + alpha)
            float scale = 0.0f;
            if (norm > 0.0f) {
                scale = logf(1.0f + LOG_ALPHA * norm) / logf(1.0f + LOG_ALPHA);
            }

            // scaled adjustment in same units as configured_brightness
            int adj = (int)(scale * (float)configured_brightness + 0.5f);

            // keep same sign/direction as original: subtract the adjustment from configured_brightness
            int brightness = configured_brightness - adj;
            if (brightness < MINIMUM_BRIGHTNESS) brightness = MINIMUM_BRIGHTNESS;

            // apply
            setDisplayBrightness(brightness, 0);
        }
        #endif
    }

    // static uint16_t counter = 0;
    // if (!counter) {
    //     // sprintln(F("LOOP"));
    // }
    // counter++;

    #if (SERIAL_ENABLED && COMMANDS_ENABLED)
    if (Serial.available()) {
        String command = Serial.readStringUntil('\n');
        command.trim();
        sprintln("Prikaz: " + command);
        if (command.length() > 0) {
            handleCommand(command);
        }
    }
    #endif

    if (BIS(FLAG, FLAG_NEW_MILLIS)) {
        millisecondInputHandler();
        CBI(FLAG, FLAG_NEW_MILLIS);
    }

    #if WATCHDOG_ENABLED
        wdt_reset();
    #endif
}

void printSystemInfo() {
    sprintln(F("---------------------------------"));
    sprint(F("Voľná pamäť RAM:      "));
    sprint(freeRam());
    sprintln(" bytes");
    sprint(F("RTC Modul (DS3231):       "));
    sprintln(DS3231_Present() ? F("Pripojený") : F("Nepripojený"));
    sprint(F("DCF77 Prijímač:       "));
    sprintln(DCF77_Present() ? F("Pripojený") : F("Nepripojený"));
    sprint(F("Sensor prúdu (INA219):        "));
    sprintln(INA219_Present() ? F("Pripojený") : F("Nepripojený"));
    sprintln(F("---------------------------------"));
}

#if (ARDUINO_FRAMEWORK)
void setup() {
#else
int main(void) {
#endif
    INTERRUPTS_OFF;

    /****************************************
     * Indikacna LED-ka
     ****************************************/

    // Indikacnu LED-ku chceme mat zapnutu uz od zaciatku
    // aby mohla indikovat pripadne chyby pri starte.

    SBI(DDRB, LED_R); CBI(PORTB, LED_R); // OUTPUT LOW (620R)
    SBI(DDRB, LED_G); CBI(PORTB, LED_G); // OUTPUT LOW (470R)
    SBI(DDRB, LED_B); CBI(PORTB, LED_B); // OUTPUT LOW (470R)

    // Indikácia zapínania (LED-ka svieti na zlto).
    SET_LED_COLOR(LED_R, DEFAULT_LED_BRIGHTNESS);
    SET_LED_COLOR(LED_G, DEFAULT_LED_BRIGHTNESS / 2);

    /****************************************
     * Serial
     ****************************************/

    #if SERIAL_ENABLED
        // Serial pre debugovanie a logging
        Serial.begin(SERIAL_BANDWIDTH);

        sprintln(F("------------------------------------"));
        sprintln(F("Spúšťanie hodín..."));
    #endif

    /****************************************
     * Nepouzite piny a periferie
     ****************************************/

    // Vypneme digital bufery pre vsetky piny.
    // Piny ktore ich pouzivaju nech si ich zapnu explicitne u seba.
    DIDR0 = (1<<ADC0D)|(1<<ADC1D)|(1<<ADC2D)|(1<<ADC3D)|(1<<ADC4D)|(1<<ADC5D);
    DIDR1 = (1<<AIN0D)|(1<<AIN1D);

    // SPI (MISO, MOSI, SCK) pouzivame len pri programovani.
    SPCR &= ~(1<<SPE);  // vypneme vsetky SPI periferie
    PRR  |= (1<<PRSPI);  // fyzicky vypneme SPI

    // Vypneme pin change interupty pre vsetky piny.
    PCMSK0  = 0;
    PCMSK1  = 0;
    PCMSK2  = 0;
    PCICR   = 0;

    // Vypneme externe interupty.
    EIMSK &= ~((1<<INT0)|(1<<INT1)); // disable external ints if not used
    EIFR  |=  (1<<INTF0)|(1<<INTF1); // clear any pending flags

    // Toto riesime na zaciatku, ak by nahodou nejake z tychto pinov predsa
    // len niekedy neskor pouzite boli.
    sprintln(F("Definovanie pevných logických hodnôt pre nepoužité piny..."));

    // Kvoli bezpecnosti, nepouzite piny definujeme explicitne.
    // Je lepsie ak nejaky pin ostane vo vzduchu ako by sme mali nieco poskodit.
    // !! Treba sa uistit, ze na tychto pinoch naozaj nie je nic pripojene.
    UNUSED_PIN(C, PC2);
    UNUSED_PIN(D, PD6);

    // PC6 - Pouzivame ako RESET

    #if !SERIAL_ENABLED
        // tieto piny sa pouzivaju len ak je serial zapnuty.
        UNUSED_PIN(D, PD0); // Serial RX
        UNUSED_PIN(D, PD1); // Serial TX

        UCSR0B &= ~((1<<TXEN0) | (1<<RXEN0));  // disable tx/rx
        PRR |= (1<<PRUSART0);                  // optional deeper powerdown
    #endif

    #if INA_ENABLED || RTC_ENABLED
        // DIDR0 &= ~((1<<ADC4D)|(1<<ADC5D)); // ! Je ton potrebne vobec?
    #else
        PRR |= (1 << PRTWI);

        UNUSED_PIN(C, PC4);
        UNUSED_PIN(C, PC5);
    #endif

    // Tento pin sme sa rozhodli nepouzit, ale kedze je na nom trimmer
    // ktory funguje ako 0-50K pullup musime sa uistit, ze ak bude trimmer
    // nastaveny na 0, nedojde k skratu, takze tento pin nikdy nemoze bit v stave OUTPUT LOW!
    CBI(DDRC,   LED_BRIGHTNESS_TRIM);
    SBI(PORTC,  LED_BRIGHTNESS_TRIM);

    /****************************************
     * Zbernica registrov.
     ****************************************/

    #if DISPLAY_ENABLED
        sprintln(F("Konfigurácia zbernice registrov pre displej..."));

        CBI(PORTB,  SRCK_PORTB);    SBI(DDRB,   SRCK_PORTB);
        CBI(PORTD,  RCK_PORTD);     SBI(DDRD,   RCK_PORTD);
        CBI(PORTB,  SERIN_PORTB);   SBI(DDRB,   SERIN_PORTB);
        // Musime pouzit OUTPUT rezim pretoze je tam externy 10K pullup (potrebujeme silnu hodnotu).
        SBI(PORTD,  _G_PORTD);      SBI(DDRD,   _G_PORTD);
    #endif

    /****************************************
     * PWM Jas
     ****************************************/

    #if DISPLAY_ENABLED
        sprintln(F("Konfigurácia PWM kanálu pre jas..."));

        STOP_DISPLAY_PWM();

        OCR0A = DISPLAY_PWM_TOP;
        OCR0B = 0;

        TIMSK0 = 0; // Vypneme prerusenie tohto casovaca.
    #endif

    /****************************************
     * Nastavenie pinov DCF77 modulu
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
     * IO Piny
     ****************************************/

    sprintln(F("Inicializácia vstupno-výstupných pinov..."));

    CBI(DDRD,   L_BTN); SBI(PORTD, L_BTN); // INPUT PULLUP (620R v serii)
    CBI(DDRD,   R_BTN); SBI(PORTD, R_BTN); // INPUT PULLUP (620R v serii)

    #if DISPLAY_ENABLED
        // Zapneme slabych 5 V ktore su tahane dole cez LDR rezistor.
        CBI(DDRC,   LDR_PIN_PORTC); SBI(PORTC, LDR_PIN_PORTC); // INPUT PULLUP
    #else
        UNUSED_PIN(C, LDR_PIN_PORTC);
    #endif

    CBI(DDRD,   RESET_BUTTON);  SBI(PORTD,  RESET_BUTTON); // INPUT PULLUP (620R)

    /****************************************
     * Analogovy vstup
     ****************************************/

    #if ADC_ENABLED
        // Spolocne pre NORMAL_ADC_MODE aj pre COMPARATOR_ADC_MODE
        ADMUX = (ADMUX & 0xF0) | (DCF_OUT & 0x07);
        ADCSRA = (1 << ADPS2) | (1 << ADPS1) | (1 << ADPS0);  // /128 prescaler
        ACSR = (1 << ACBG);
    #endif

    /****************************************
     * Hlavny Casovac (1kHz)
     ****************************************/

    sprintln(F("Konfigurácia časovača..."));

    // CRITICAL_SECTION {
        // WGM21 -> CTC rezim, zresetuje citac po dosiahnuti limitu
        TCCR2A = (1 << WGM21);

        // CS22 -> Delic 64
        TCCR2B = (1 << CS22);

        // Fcas = 16MHz / (64 x 250) = 1kHz
        OCR2A = 249; // nastavime limit casovaca

        // Zapne interupt, ktory sa vykona pri dosiahnuti limitu (TIMER2_COMPA_vect)
        TIMSK2 = (1 << OCIE2A);
        TCNT2 = 0; // Zaciname pocitat od nuly.
    // }

    INTERRUPTS_ON;

    #if I2C_ENABLED
        // Nastavy piny PC4 a PC5 ako INPUT_PULLUP
        Wire.begin();
    #endif

    /****************************************
     * RTC modul
     ****************************************/

    #if RTC_ENABLED
        if (!RTC.begin()) { // Taktiez vyzaduje I2C aby bol zapnuty.
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

        setDisplayBrightness(DEFAULT_BRIGHTNESS);
        bootDisplay();
    #endif

    /****************************************
     * Senzor Prudu
     ****************************************/

    // ! Potrebujeme mat povolene prerusenia kvoli I2C komunikacii.
    // https://www.ti.com/lit/ds/symlink/ina219.pdf
    #if INA_ENABLED
        sprintln(F("Inicializácia senzora prúdu..."));

        Wire.begin(); // Nevracia nic
        if (INA.begin()) {
            // INA potrebuje nakalibrovat po kazdom restarte systemu,
            // kedze vsetky jej registre su volatilne.
            if (!INA.isCalibrated()) {
                INA.setBusVoltageRange(16); // len 32 alebo 16
                INA.setMaxCurrentShunt(INA_MAX_CURRENT, INA_SHUNT_R);

                // Berieme co najviac vzorkov aby boli merania co najpresnejsie.
                INA.setShuntSamples(7); // ! Resolution velmi zvysuje odchylky.
                // INA.setModeShuntContinuous(); // Ak by sme chceli merat len shunt
            }
        } else {
            sprintln(F("Prúdový senzor nebol nájdený!"));
        }
    #endif

    /****************************************
     * RESET Tlacitko
     ****************************************/

    // Ak je tlacidlo RESET stlacene pri starte (po RESETovani cipu)
    // tak nenacitame ulozene konfiguracie -> pouziju sa vychodzie hodnoty.
    // Zaroven zresetujeme cas ulozeny v RTC module.
    if (IS_PRESSED(RESET_BUTTON)) {
        sprintln(F("RESET tlačidlo bolo stlačené, použijeme východzie hodnoty nastavení."));

        // Ulozime vsetky konfiguracie do EEPROM este pred ich nacitanim z EEPROM,
        // takze pouzijeme vychodzie hodnoty.
        saveConfigForAllPages();

        // trikrat zablikame ledku, na znak uspesneho resetu.
        for (uint8_t i = 0; i < 3; i++) {
            SET_ALL_CLR_BRIGHT(led_brightness); wait(500);
            SET_ALL_CLR_BRIGHT(0); wait(500);
        }

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
    updateTimeCountersFromTimeSources();
    displayTimeFromCounters(t_counter_minutes, t_counter_hours);

    // setSymbolRawOnNumitron(DIGIT_HOR_TENS, 0);
    // setSymbolRawOnNumitron(DIGIT_HOR_ONES, 0);
    // setSymbolRawOnNumitron(DIGIT_MIN_TENS, 0);
    // setSymbolOnNumitron(DIGIT_MIN_ONES, MINUS_SYMBOL);

    // crossfadeFromOldDigitsToNew();

    // wait(2000);

    // setBrightness(MAX_BRIGHTNESS);

    #if DCF77_ENABLED
        // Vypneme indikacnu LED, odteraz si ju riadi DCF77 prijimac.
        SET_ALL_CLR_BRIGHT(0);

        // Spolocne pre NORMAL_ADC_MODE aj pre COMPARATOR_ADC_MODE
        COMPARATOR_ADC_MODE();

        DCF77_Clock::setup();
        DCF77_Clock::set_input_provider(sample_input_pin);

        sprintln(F("Spúšťanie DCF77 prijímača..."));
        SBI(DDRB, DCF_PON); // Zapneme modul

        // Za 15 minut je drift priblizne 100 ms, co znaci, ze presnost
        // nasho krystalu je (0.04 / 1020) * 1000 = ~39 ppm.
        // Velkost driftu v hertzoch je:
        // (dT1 / dT2) * F_CPU
        // Ci uz original cip alebo klon, rozdiel je minimalny.
        // https://blog.blinkenlight.net/experiments/dcf77/crystal-frequency-compensation/
        Internal::Generic_1_kHz_Generator::adjust(CLOCK_DRIFT_HZ);
    #else
        // TODO:
        // Vypneme indikacnu ledku, ktora indikovala spustanie zltou farbou.
        // SET_ALL_CLR_BRIGHT(0);
    #endif

    printSystemInfo();
    sprintln(F("Spúšťanie hodín dokončené!"));

    #if WATCHDOG_ENABLED
        // Zapneme watchdog, ak sa 2 sekundy nezresetuje, zresetuje hodiny.
        wdt_enable(WDTO_2S);
        wdt_reset();
    #endif

    #if !ARDUINO_FRAMEWORK
    for (;;) {
		loop();
    }

    return 0;
    #endif
}
