#include <avr/wdt.h>

#include "libs/EEPROM.h"
#include "utils/math.h"

#include "main.h"

#include "reg.h"
#include "input.h"
#include "isr.h"
#include "display.h"
#include "clock.h"
#include "edit.h"
#include "modules.h"
#include "led.h"
#include "timers.h"

#include "config.h"
#include "monitor.h"

////////////////////////////////////
// Watchdog
////////////////////////////////////

// https://www.nongnu.org/avr-libc/user-manual/group__avr__watchdog.html
uint8_t _MCUSR __attribute__ ((section (".noinit")));

// .initN sections fall through — they are NEVER called, so naked is mandatory
// (a ret at the end would pop a garbage address and corrupt startup).
//
// IMPORTANT: The function body must be 100% pure inline asm with NO C code.
// Mixed naked+C is unreliable: avr-libc's wdt_disable() macro uses a "=d"
// output constraint that requires the compiler to allocate a scratch register,
// which without a prologue may be in an undefined state — the timed write
// sequence then silently fails and the WDT keeps firing every reset.
//
// This pure-asm version only uses r24 and r1 (__zero_reg__), which .init2
// guarantees to be available (r1=0, SP set up) by the time .init3 runs.
void get_mcusr(void) __attribute__((naked)) __attribute__((section(".init3")));
void get_mcusr(void)
{
    __asm__ __volatile__ (
        "in   r24, %[mcusr_io]\n\t"   /* r24 = MCUSR                        */
        "sts  _MCUSR, r24\n\t"        /* save to .noinit global             */
        "out  %[mcusr_io], r1\n\t"    /* MCUSR = 0  (clears WDRF)           */
        /* ATmega328P datasheet §11.8.2 timed WDT disable sequence:           */
        /* Step 1 — set WDCE+WDE simultaneously.                             */
        /* Step 2 — within the NEXT 4 cycles write 0 to WDE.                */
        "wdr\n\t"                      /* pet WDT before touching WDTCSR    */
        "ldi  r24, %[wdce_wde]\n\t"   /* r24 = WDCE|WDE (0x18)              */
        "sts  %[wdtcsr], r24\n\t"     /* WDTCSR = WDCE|WDE  ←timed start   */
        "sts  %[wdtcsr], r1\n\t"      /* WDTCSR = 0, WDE cleared ≤4 cycles */
        :
        : [mcusr_io]  "I" (_SFR_IO_ADDR(MCUSR)),
          [wdtcsr]    "n" (_SFR_MEM_ADDR(WDTCSR)),
          [wdce_wde]  "n" ((uint8_t)(_BV(WDCE) | _BV(WDE)))
        : "r24"
    );
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
// Stack canary: detects stack growth past safe bounds.
// Paint STACK_CANARY_SIZE bytes at the base of free RAM at startup, then
// check periodically. Corruption means the stack exceeded the safe zone.
////////////////////////////////////

#define STACK_CANARY_MAGIC  0xC5
#define STACK_CANARY_SIZE   24 // bytes
#define RAM_SAFETY_THRESHOLD 64 // minimum acceptable free RAM in bytes

// The canary array lives right above the BSS/data sections.
// Placed in .noinit so the C runtime does NOT zero it between checks.
static uint8_t _stack_canary[STACK_CANARY_SIZE] __attribute__((section(".noinit")));

void initStackCanary() {
    for (uint8_t i = 0; i < STACK_CANARY_SIZE; i++) {
        _stack_canary[i] = STACK_CANARY_MAGIC;
    }
}

// Returns true if all canary bytes are still intact (stack has not overrun them).
bool stackCanaryIntact() {
    for (uint8_t i = 0; i < STACK_CANARY_SIZE; i++) {
        if (_stack_canary[i] != STACK_CANARY_MAGIC) return false;
    }
    return true;
}

// Call once per second from loop(). Forces an immediate WDT reset if RAM is
// critically low or the stack has already smashed the canary.
void checkRamSafety() {
    const int free = freeRam();
    const bool canary_ok = stackCanaryIntact();

    if (!canary_ok || free < RAM_SAFETY_THRESHOLD) {
        sprintln(F("[CRITICAL] RAM overflow! Free="));
        sprint(free);
        sprintln(F(" Canary="));
        sprintln(canary_ok ? F("OK") : F("CORRUPTED"));

        // Force an immediate watchdog reset — safest recovery on AVR.
        wdt_enable(WDTO_15MS);
        for (;;); // spin until watchdog fires
    }
}

////////////////////////////////////

volatile uint8_t led_brightness = DEFAULT_LED_BRIGHTNESS;

#if DCF77_ENABLED
inline uint8_t sample_input_pin() {
    // if (!DCF77_Present()) {
    //     return 0; // Ak modul nie je zapnuty, nechajme LED-ku vypnutu.
    // }

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

    // wait(NUMBER_TRANS_DUR + 6000);

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
    uint16_t year = 2025;
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
    const int32_t temp        = (int32_t)(adcValue - 300) * 9259;
    const int16_t temperature = (int16_t)(temp / 10000);

    return temperature;
}

void displayTemperature() {
    #if RTC_ENABLED
    int8_t temperature;
    if (!Modules::DS3231::getTemperature(temperature)) {
        temperature = readInternalTemperature(); // Default value if reading fails
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

    const uint8_t day_ones = day % 10;
    const uint8_t month_ones = month % 10;
    const uint8_t day_tens = day / 10;
    const uint8_t month_tens = month / 10;

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
        sprintln(F("  ram_status          - Vypíše voľnú RAM a stav canary"));
        sprintln(F("  ram_test_canary     - Poškodí canary -> WDT reset (test!)"));
        sprintln(F("  ram_test_threshold  - Simuluje nedostatok RAM -> WDT reset (test!)"));
        sprintln(F("-------------------------"));
    } else if (command == "z_datum") {
        displayDate();
    }
    else if (command == "z_cas(hm)") {
        sprint(t_counter_hours);
        sprint(":");
        sprintln(t_counter_minutes);
        displayTimeFromCounters(t_counter_minutes, t_counter_hours);
    } else if (command == "z_cas(ms)") {
        #if RTC_ENABLED
        uint8_t h = 0, m = 0;
        Modules::DS3231::readTime(h, m);
        sprint(m);
        sprint(":");
        sprintln(0);
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

        SET_ALL_LED_BRIGHT(0);

        // Zelena indikuje uspesne zosynchronizovanie.
        SET_LED_COLOR(LED_G, led_brightness);
        last_state = Clock::useless;
    } else {
        last_state = state;
    }
}
#endif

// ──────────────────────────────────────────────────────────────────────────────
// Display current fault handler
// ──────────────────────────────────────────────────────────────────────────────

#if INA_ENABLED
static void handleDisplayFault(const Monitor::FaultReport& r) {
    sprintln(F("\n========================================"));
    sprint(F("[FAULT] Typ:     "));
    switch (r.type) {
        case Monitor::FAULT_OPEN:  sprintln(F("OPEN CIRCUIT (prepalene vlakno)")); break;
        case Monitor::FAULT_SHORT: sprintln(F("SHORT CIRCUIT (skrat)")); break;
        default:                   sprintln(r.type); break;
    }
    sprint(F("[FAULT] Merany prud:     ")); sprint(r.measured_x10 / 10);
    sprint(F(".")); sprint(r.measured_x10 % 10); sprintln(F(" mA"));
    sprint(F("[FAULT] Ocakavany prud:  ")); sprint(r.expected_x10 / 10);
    sprint(F(".")); sprint(r.expected_x10 % 10); sprintln(F(" mA"));
    sprint(F("[FAULT] Postihute cifry: "));
    for (uint8_t i = 0; i < DIGIT_COUNT; i++) {
        if (r.digit_fault_mask & (1u << i)) {
            sprint(i); sprint(F(" "));
        }
    }
    sprintln(F(""));
    sprintln(F("========================================"));

    // Visual indicator: solid red LED = fault present.
    SET_LED_COLOR(LED_R, MAX_LED_BRIGHTNESS);
    SET_LED_COLOR(LED_G, 0);
    SET_LED_COLOR(LED_B, 0);
}
#endif

void loop() {
    if (Timers::isNightMode()) {
        Timers::nightModeLoop();
        return; // Nespracovavame nic ine kym sme v night mode
    }

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

    if(BIS(FLAG, FLAG_NEW_SECOND)) {
        checkRamSafety(); // Kazduu sekundu overime, ze RAM este nevytiekla.

        // static uint8_t reset_held_seconds = 0;
        // if (IS_PRESSED(L_BTN)) {
        //     reset_held_seconds++;
        //     if (reset_held_seconds == 1) {
        //         sprintln(F("=== RAM STATUS ==="));
        //         sprint(F("Volna RAM:     ")); sprint(freeRam());            sprintln(F(" B"));
        //         sprint(F("Limit (reset): ")); sprint(RAM_SAFETY_THRESHOLD); sprintln(F(" B"));
        //         sprint(F("Canary:        ")); sprintln(stackCanaryIntact() ? F("OK") : F("CORRUPTED"));
        //         sprintln(F("=================="));
        //     } else if (reset_held_seconds >= 3) {
        //         sprintln(F("[TEST] Korupcia canary oblasti -> WDT reset..."));
        //         _stack_canary[0] = 0xDE;
        //         _stack_canary[1] = 0xAD;
        //         checkRamSafety(); // Okamzity WDT reset.
        //     }
        // } else {
        //     reset_held_seconds = 0;
        // }

        // Spusti timery na zaciatku hodiny (HH:00:00)
        uint16_t tc;
        ATOMIC_BLOCK(ATOMIC_RESTORESTATE) { tc = timer_counter; }
        if (tc == 0 && t_counter_minutes == 0) {
            Timers::onHourTick(t_counter_hours);
        }

        onNewSecond();

        Modules::updateConnectionStatus();

        // TODO:
        // #if INA_ENABLED
        //     Monitor::onSecondTick(handleDisplayFault);
        // #endif

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
                Modules::DS3231::DateTime dt{
                    /*minute=*/t_counter_minutes,
                    /*hour=*/t_counter_hours,
                    /*day=*/bcd_to_int(now.day),
                    /*month=*/bcd_to_int(now.month),
                    /*year=*/(uint16_t)(bcd_to_int(now.year) + 2000)
                };
                Modules::DS3231::adjust(dt);
            #endif

            sprintln(F("Zobrazovanie nového času..."));
            // addNewMinuteToCounters();
            displayTimeFromCounters(t_counter_minutes, t_counter_hours);
        } else {
            handleDCF77ClockState();
        }
        #endif

        #if LDR_ENABLED
        // if (Config::get(Config::TIME_BRIGHTNESS_MODE)) {
        //     // Ak bude jas nastaveny na "AUTOMATICKY", tak sa pouzije tento LDR,
        //     // inak sa pouzije nastavenie uzivatela.
        //     static uint16_t measured_brightness = 0;
        //     if (!BIS(MODE, MODE_DIAG) && !BIS(MODE, MODE_EDIT)) {
        //         measured_brightness = ADC_READ(LDR_PIN_PORTC);

        //         uint16_t m = CONSTRAIN(measured_brightness, MIN_BRIGTHNESS, MAX_BRIGHTNESS);
        //         int adj = MAP(m, MIN_BRIGTHNESS, MAX_BRIGHTNESS, 0, configured_brightness);
        //         int brightness = CONSTRAIN(
        //             configured_brightness - adj, MIN_BRIGTHNESS, configured_brightness
        //         );

        //         setDisplayBrightness(brightness, 0);
        //     }
        // }
        #endif

        CBI(FLAG, FLAG_NEW_SECOND);
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
        tickEditMode(); // Timeout sa overuje az po obsluhe tlacidiel, tie ho mozu zresetovat.

        #if DCF77_ENABLED
        if (BIS(FLAG, FLAG_DCF_LEDONN)) {
            SET_LED_COLOR(LED_R, led_brightness);

            const uint8_t state = DCF77_Clock::get_clock_state();
            if (state == Clock::dirty) {
                SET_LED_COLOR(LED_R, led_brightness / 2);
                SET_LED_COLOR(LED_G, led_brightness / 2);
            }
        } else {
            SET_ALL_LED_BRIGHT(0);
        }

        CBI(FLAG, FLAG_DCF_LEDONN);
        #endif

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
    sprintln(Modules::isConnected(Modules::MODULE_DS3231) ? F("Pripojený") : F("Nepripojený"));
    // sprint(F("DCF77 Prijímač:       "));
    // sprintln(Modules::isConnected(Modules::MODULE_DCF77) ? F("Pripojený") : F("Nepripojený"));
    sprint(F("Sensor prúdu (INA219):        "));
    sprintln(Modules::isConnected(Modules::MODULE_INA219) ? F("Pripojený") : F("Nepripojený"));
    sprintln(F("---------------------------------"));
}

void setup() {
    // Ihned oznacime canary oblast aby sme mohli neskor detekovat pretecenie zasobniku.
    initStackCanary();

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

    // TODO: Tieto nepouzivane periferie budeme vypinat az na konci vyvoja firmveru.

    // Vypneme digital bufery pre vsetky piny.
    // Piny ktore ich pouzivaju nech si ich zapnu explicitne u seba.
    // ! Pre I2C zbernicu, vypada, ze tieto musia byt zapnute, inak sa neinicializuje spravne.
    // DIDR0 = (1<<ADC0D)|(1<<ADC1D)|(1<<ADC2D)|(1<<ADC3D)|(1<<ADC4D)|(1<<ADC5D);
    // DIDR1 = (1<<AIN0D)|(1<<AIN1D);

    // // SPI (MISO, MOSI, SCK) pouzivame len pri programovani.
    // SPCR &= ~(1<<SPE);  // vypneme vsetky SPI periferie
    // PRR  |= (1<<PRSPI);  // fyzicky vypneme SPI

    // // Vypneme pin change interupty pre vsetky piny.
    // PCMSK0  = 0;
    // PCMSK1  = 0;
    // PCMSK2  = 0;
    // PCICR   = 0;

    // // Vypneme externe interupty.
    // EIMSK &= ~((1<<INT0)|(1<<INT1)); // disable external ints if not used
    // EIFR  |=  (1<<INTF0)|(1<<INTF1); // clear any pending flags

    // // Toto riesime na zaciatku, ak by nahodou nejake z tychto pinov predsa
    // // len niekedy neskor pouzite boli.
    // sprintln(F("Definovanie pevných logických hodnôt pre nepoužité piny..."));

    // // Kvoli bezpecnosti, nepouzite piny definujeme explicitne.
    // // Je lepsie ak nejaky pin ostane vo vzduchu ako by sme mali nieco poskodit.
    // // !! Treba sa uistit, ze na tychto pinoch naozaj nie je nic pripojene.
    // UNUSED_PIN(C, PC2);
    // UNUSED_PIN(D, PD6);

    // // PC6 - Pouzivame ako RESET

    // #if !SERIAL_ENABLED
    //     // tieto piny sa pouzivaju len ak je serial zapnuty.
    //     UNUSED_PIN(D, PD0); // Serial RX
    //     UNUSED_PIN(D, PD1); // Serial TX

    //     UCSR0B &= ~((1<<TXEN0) | (1<<RXEN0));  // disable tx/rx
    //     PRR |= (1<<PRUSART0);                  // optional deeper powerdown
    // #endif

    // #if I2C_ENABLED
    //     // DIDR0 &= ~((1<<ADC4D)|(1<<ADC5D)); // ! Je ton potrebne vobec?
    // #else
    //     PRR |= (1 << PRTWI);

    //     UNUSED_PIN(C, PC4);
    //     UNUSED_PIN(C, PC5);
    // #endif

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
        // SBI(PORTC, DCF_OUT); // TODO: INPUT PULLUP? pre lahsiu detekciu?

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

    /****************************************
     * Prerušenia
     ****************************************/

    sprintln(F("Spúšťanie prerušení..."));
    INTERRUPTS_ON;

    /****************************************
     * I2C zbernica
     ****************************************/

    #if I2C_ENABLED
        sprintln(F("Inicializácia I2C zbernice..."));

        // Nastavy piny PC4 a PC5 ako INPUT_PULLUP
        Wire.begin();

        // Zistime pripojenie modulov uz tu, aby RTC begin() mohol byt
        // zavolany este pred vstupom do hlavnej slucky.
        Modules::updateConnectionStatus();
    #endif

    /****************************************
     * RTC modul
     ****************************************/

    #if RTC_ENABLED
        if (Modules::isConnected(Modules::MODULE_DS3231)) {
            sprintln(F("RTC modul inicializovaný."));

            Modules::DS3231::begin();
        } else {
            sprintln(F("[Varovanie] RTC modul nebol nájdený!"));
        }
        // if (Modules::isConnected(Modules::MODULE_DS3231)) { // Taktiez vyzaduje I2C aby bol zapnuty.
        //     // if (RTC.lostPower()) {
        //     //     sprintln(F("Nastavovanie času pre RTC modul."));
        //     //     // RTC.adjust(DateTime(F(__DATE__), F(__TIME__)));
        //     //     RTC.adjust(DateTime(2025, 8, 22, 16, 33, 0));
        //     // }

        //     // Uistime sa, ze tieto veci su vypnute aby zbytocne neodoberali prud.
        //     Modules::RTC.enable32kHz(false);
        //     Modules::RTC.enableOscillator(false, false, 0);
        //     Modules::RTC.turnOffAlarm(1);
        //     Modules::RTC.turnOffAlarm(2);

        //     sprintln(F("RTC modul inicializovaný."));
        // } else {
        //     sprintln(F("[Varovanie] RTC modul nebol nájdený!"));
        // }
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

        bootDisplay();
    #endif

    /****************************************
     * Senzor Prudu
     ****************************************/

    // ! Potrebujeme mat povolene prerusenia kvoli I2C komunikacii.
    // https://www.ti.com/lit/ds/symlink/ina219.pdf
    #if INA_ENABLED
        sprintln(F("Inicializácia senzora prúdu..."));

        if (Modules::INA219::begin()) {
            // INA potrebuje nakalibrovat po kazdom restarte systemu,
            // kedze vsetky jej registre su volatilne.
            // if (!Modules::INA219::isCalibrated()) {
            //     Modules::INA219::setBusVoltageRange(16); // len 32 alebo 16
            //     Modules::INA219::setMaxCurrentShunt(INA_MAX_CURRENT, INA_SHUNT_R);

            //     // Berieme co najviac vzorkov aby boli merania co najpresnejsie.
            //     Modules::INA219::setShuntSamples(7); // ! Resolution velmi zvysuje odchylky.
            //     // INA.setModeShuntContinuous(); // Ak by sme chceli merat len shunt
            // }
        } else {
            sprintln(F("Prúdový senzor nebol nájdený!"));
        }
    #endif

    /****************************************
     * Monitor kalibracia
     ****************************************/

    setDisplayBrightness(DEFAULT_BRIGHTNESS);

    #if INA_ENABLED && MONITOR_CALIBRATION_ENABLED
        // Ak nemame nic ulozene, tak spusti autokalibraciu vzdy pri spusteni hodin.
        // TODO: SPustaj len ak je zapnuty detektor chyb.
        if (Monitor::hasCalibrationSaveInEEPROM()) {
            sprintln("=== Kalibrace senzoru prudu nactena z EEPROM ===");
            Monitor::loadCalibration();
        } else {
            sprintln("=== Spúštanie autokalibracie ===");
            // Zapneme autokalibraciu (blokuje)
            if (Monitor::runCalibration()) {
                sprintln("=== Autokalibracia dokončená, uloženie kalibracie do "
                         "EEPROM ===");
                Monitor::saveCalibration();
            } else {
                sprintln("=== Autokalibracia zlyhala! ===");
            }
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
        Config::saveAll();

        // trikrat zablikame ledku, na znak uspesneho resetu.
        for (uint8_t i = 0; i < 3; i++) {
            SET_ALL_LED_BRIGHT(led_brightness); wait(500);
            SET_ALL_LED_BRIGHT(0); wait(500);
        }

        #if RTC_ENABLED
            sprintln(F("Resetovanie času v RTC module."));
            Modules::DS3231::DateTime dt{33, 16, 22, 8, 2025};
            Modules::DS3231::adjust(dt);
        #endif

        sprintln(F("Resetovanie kalibračných údajov senzoru prúdu."));
        Monitor::clearCalibration();
    } else {
        sprintln(F("Načítavanie uložených konfigurácií z EEPROM..."));
    }

    setupConfig();

    // if (Config::get(Config::TIME_BRIGHTNESS_MODE) == 0) {
    //     // Manualny jas, nacitame ulozenu hodnotu.
    //     const uint8_t saved_value = Config::get(Config::TIME_BRIGHTNESS_VALUE);
    //     setDisplayBrightness(MAP(saved_value, 0, 9, MIN_BRIGTHNESS, MAX_BRIGHTNESS), 0);
    // } else {
        // Automaticky jas, zacneme s predvolenou hodnotou a nechame LDR senzor nech si to upravi.
        setDisplayBrightness(DEFAULT_BRIGHTNESS);
    // }

    sprintln(F("Zobrazovanie času..."));
    updateTimeCountersFromTimeSources();
    displayTimeFromCounters(t_counter_minutes, t_counter_hours);

    #if DCF77_ENABLED
        SBI(DDRB, DCF_PON); // Zapneme modul

        // Vypneme indikacnu LED, odteraz si ju riadi DCF77 prijimac.
        SET_ALL_LED_BRIGHT(0);

        COMPARATOR_ADC_MODE();

        DCF77_Clock::setup();
        DCF77_Clock::set_input_provider(sample_input_pin);

        sprintln(F("Spúšťanie DCF77 prijímača..."));

        // !NOTE: 25.02.2026: Zatial nechavame deketekciu DCF77 prijimaca tak,
        // Kedze urobit to spolahlivo by vyzadovalo zmeny v hardveri.
        // Pulldown rezistor na moduly je prilis slaby pre spolahlivu detekciu.
        // if (Modules::isConnected(Modules::MODULE_DCF77)) {
        //     sprintln(F("DCF77 prijímač inicializovaný."));
        // } else {
        //     sprintln("[Varovanie] DCF77 prijímač nebol nájdený!");
        // }

        // Za 15 minut je drift priblizne 100 ms, co znaci, ze presnost
        // nasho krystalu je (0.04 / 1020) * 1000 = ~39 ppm.
        // Velkost driftu v hertzoch je:
        // (dT1 / dT2) * F_CPU
        // Ci uz original cip alebo klon, rozdiel je minimalny.
        // https://blog.blinkenlight.net/experiments/dcf77/crystal-frequency-compensation/
        Internal::Generic_1_kHz_Generator::adjust(CLOCK_DRIFT_HZ);
        sprintln(F("DCF77 prijímač inicializovaný."))
    #else
        // Vypneme indikacnu ledku, ktora indikovala spustanie zltou farbou.
        SET_ALL_LED_BRIGHT(0);
    #endif

    printSystemInfo();
    sprintln(F("Spúšťanie hodín dokončené!"));
}

int main(void) {
    // Zaloha: ak .init3 pure-asm sekvencia z nejakeho dovodu nezafungovala
    // (napr. iny prekladac, ine optimalizacie), disablujeme WDT este raz tu,
    // skor ako cokolkol ine stihne prebehnut. C-runtime uz bezi korektne,
    // takze avr-libc wdt_disable() funguje spolahlivo.
    MCUSR = 0;
    wdt_disable();

    INTERRUPTS_OFF;

    // I2C pull-upy — Wire ich nastavi sam cez Wire.begin(),
    // ale explicitne ich nastavime tu pre istotu
    PORTC |= (1 << PC4) | (1 << PC5);
    DDRC &= ~((1 << PC4) | (1 << PC5)); // vstup

    setup();

    // Inicializacia hodin prebehla uspesne, zapneme watchdog.
    #if WATCHDOG_ENABLED
        // Zapneme watchdog, ak sa 2 sekundy nezresetuje, zresetuje hodiny.
        wdt_enable(WDTO_2S);
        wdt_reset();
    #endif

    for (;;) {
        wdt_reset();
        loop();
    }

    // Sem sa nikdy nedostaneme, ale potlacime warning
    return 0;
}

// bool isModuleConnected() {
//     SBI(DDRB, DCF_PON); // Zapneme modul
//     return ADC_READ(DCF_OUT) == 0;
// }

// // Write up a simple main function for detecting DCF77 presence:
// int main(void) {
//     // WGM21 -> CTC rezim, zresetuje citac po dosiahnuti limitu
//     TCCR2A = (1 << WGM21);

//     // CS22 -> Delic 64
//     TCCR2B = (1 << CS22);

//     // Fcas = 16MHz / (64 x 250) = 1kHz
//     OCR2A = 249; // nastavime limit casovaca

//     // Zapne interupt, ktory sa vykona pri dosiahnuti limitu (TIMER2_COMPA_vect)
//     TIMSK2 = (1 << OCIE2A);
//     TCNT2 = 0; // Zaciname pocitat od nuly.

//     INTERRUPTS_ON;
//     // Inicializace sériové komunikace pro debugování
//     Serial.begin(9600);
//     sprintln("Spouštím detekci DCF77...");

//     sprintln(F("Konfigurácia pinov DCF77 prijímača..."));

//     CBI(DDRC, DCF_OUT); // INPUT
//     // CBI(PORTC, DCF_OUT); // Vypneme pullup rezistor.
//     SBI(PORTC, DCF_OUT); // TODO: INPUT PULLUP? pre lahsiu detekciu?

//     CBI(DDRB, DCF_PON);
//     // V hardveri by mala byt dioda ktora zabrani pripadnemu poskodeniu.
//     CBI(PORTB, DCF_PON); // POZOR! 3V3 logika

//     ADMUX  = (ADMUX & 0xF0) | (DCF_OUT & 0x07);
//     ADCSRA = (1 << ADPS2) | (1 << ADPS1) | (1 << ADPS0); // /128 prescaler
//     ACSR   = (1 << ACBG);

//     ADMUX  = (1 << REFS0) | (DCF_OUT & 0x0F); // AVCC ref, select channel
//     ADCSRA |= (1 << ADSC);

//     // Ak pin DCF_OUT floatuje, tak modul pripojeny urcite nie je:

//     uint16_t mils = 0;
//     char buf[100];
//     bool connected = false;
//     while (true) {
//         if (Modules::isConnected(Modules::MODULE_DCF77) && !connected) {
//             connected = true;
//             sprintln("Module pripojený!");
//         } else if (!Modules::isConnected(Modules::MODULE_DCF77) && connected == true) {
//             connected = false;
//             sprintln("Module odpojen!");
//         }

//         COMPARATOR_ADC_MODE();
//         if (ACSR & (1 << ACO)) { // invertovana logika
//             buf[mils] = 'X';
//         } else {
//             buf[mils] = '#';
//         }
//         NORMAL_ADC_MODE();

//         if (mils >= 100) {
//             mils = 0;
//             sprintln(ADC_READ(DCF_OUT));
//             sprintln(buf);
//         }

//         mils++;
//         wait(10);

//         Modules::updateConnectionStatus();
//     }

//     return 0;
// }
