#include <avr/wdt.h>

#include "utils/math.h"
#include <serial.h>

#include "main.h"

#include "drivers/buttons.h"
#include "drivers/led.h"

#include "clock.h"
#include "display.h"
#include "edit.h"
#include "isr.h"
#include "modules.h"
#include "pins.h"
#include "reg.h"
#include "sync.h"
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

// uint16_t EEMEM reset_count_eeprom = 0;

// const char* resetReasonToString(uint8_t resetReason) {
//     if (resetReason & (1 << PORF))  return "POR: Power-on Reset";
//     if (resetReason & (1 << EXTRF)) return "EXT: External Reset (RESET pin)";
//     if (resetReason & (1 << BORF))  return "BOR: Brown-out Reset";
//     if (resetReason & (1 << WDRF))  return "WDT: Watchdog Reset";
//     return "Unknown";
// }

// void reportResetAndCount() {
//   uint16_t c = eeprom_read_word(&reset_count_eeprom);
//   c++;
//   eeprom_write_word(&reset_count_eeprom, c);
// }

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

#define STACK_CANARY_MAGIC      0xC5u   // Magic byte pattern for canary
#define STACK_CANARY_SIZE       24u     // Size of canary region (bytes)
#define RAM_SAFETY_THRESHOLD    64u     // Minimum acceptable free RAM (bytes)

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
    Led::onMainLoopTick();

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
        NO_INTERRUPTS_SECTION { tc = timer_counter; }
        if (tc == 0 && t_counter_minutes == 0) {
            Timers::onHourTick(t_counter_hours);
        }

        onNewSecond();

        Modules::updateConnectionStatus();

        // TODO:
        #if INA_ENABLED
            Monitor::onSecondTick(handleDisplayFault);
        #endif

        #if DCF77_ENABLED
            DCF77Sync::onSecondTick();
        #endif

        #if LDR_ENABLED
        // TODO: Toto treba vyriesit nejakym polopatistickym algoritmom.
        if (Config::get(Config::TIME_BRIGHTNESS_MODE)) {
            if (!BIS(MODE, MODE_DIAG) && !BIS(MODE, MODE_EDIT)) {
                // IIR low-pass filter with adaptive speed:
                // Fast response when light changes significantly, slow when stable.
                // This prevents flickering in stable conditions while staying
                // responsive to sudden changes (e.g. lights turning on/off).
                static int16_t ldr_filtered = 512;
                const int16_t ldr_raw = (int16_t)ADC_READ_AND_RESTORE_MODE(LDR_PIN_PORTC);
                const int16_t ldr_delta = ldr_raw - ldr_filtered;

                // Adaptive alpha: fast (1/2) for large changes, slow (1/8) for small ones.
                // Thresholds tuned for a 10-bit ADC (0–1023 range).
                if (ldr_delta > 80 || ldr_delta < -80) {
                    ldr_filtered += ldr_delta >> 1; // alpha = 1/2: fast track
                } else if (ldr_delta > 30 || ldr_delta < -30) {
                    ldr_filtered += ldr_delta >> 2; // alpha = 1/4: medium
                } else {
                    ldr_filtered += ldr_delta >> 3; // alpha = 1/8: slow, stable
                }

                sprint(F("[LDR] raw=")); sprint(ldr_raw);
                sprint(F(" filtered=")); sprintln(ldr_filtered);

                const int16_t mapped = MAP(
                    (int)ldr_filtered, 0, 1023,
                    (int)Display::getConfigBrightness(), (int)MIN_BRIGTHNESS
                );
                const uint8_t brightness = (uint8_t)CONSTRAIN(
                    mapped, (int)MIN_BRIGTHNESS, (int)Display::getConfigBrightness()
                );

                Display::setBrightness(brightness, 2);
            }
        }
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
        if (Timers::isNightMode()) {
            Timers::nightModeMillisecondLoop();
            return; // Nespracovavame nic ine kym sme v night mode
        }

        Buttons::millisecondInputHandler();
        tickEditMode(); // Timeout sa overuje az po obsluhe tlacidiel, tie ho mozu zresetovat.

        #if DCF77_ENABLED
        // When synced, the second handler manages the LED (green = synced).
        // The DCF module is powered off after sync so the comparator sees a
        // floating pin (random ACO) — suppress the millis handler to avoid
        // wiping the green sync indicator 999 times per second.
        if (!BIS(FLAG, FLAG_DCF_SYNC)) {
            if (BIS(FLAG, FLAG_DCF_LEDONN)) {
                Led::setColorBrightness(Led::Color::RED, led_brightness);

                const uint8_t state = DCF77_Clock::get_clock_state();
                if (state == Clock::dirty) {
                    Led::setColorBrightness(Led::Color::RED, led_brightness / 2);
                    Led::setColorBrightness(Led::Color::GREEN, led_brightness / 2);
                }
            } else {
                Led::setBrightness(0);
            }
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
    sprint(F("Sensor prúdu (INA219):        "));
    sprintln(Modules::isConnected(Modules::MODULE_INA219) ? F("Pripojený") : F("Nepripojený"));
    sprintln(F("---------------------------------"));
}

void setup() {
    uint16_t boot_total_start_ms = 0;
    uint16_t boot_phase_start_ms = 0;

    auto bootMark = [&](const __FlashStringHelper* phase_name) {
        const uint16_t now_ms = timer_counter;
        sprint(F("[BOOT] "));
        sprint(phase_name);
        sprint(F(" took "));
        sprint(now_ms - boot_phase_start_ms);
        sprint(F(" ms (T+"));
        sprint(now_ms - boot_total_start_ms);
        sprintln(F(" ms)"));
        boot_phase_start_ms = now_ms;
    };

    /****************************************
     * Indikacna LED-ka
     ****************************************/

    // Indikacnu LED-ku chceme mat zapnutu uz od zaciatku
    // aby mohla indikovat pripadne chyby pri starte.
    Led::setupRegisters();

    // Indikacia zapinania (LED-ka svieti na zlto).
    Led::setColorBrightness(Led::Color::RED, DEFAULT_LED_BRIGHTNESS);
    Led::setColorBrightness(Led::Color::GREEN, DEFAULT_LED_BRIGHTNESS / 2);

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

    // SPI (MISO, MOSI, SCK) pouzivame len pri programovani.
    SPCR &= ~(1<<SPE);  // vypneme vsetky SPI periferie
    PRR  |= (1<<PRSPI);  // fyzicky vypneme SPI

    // // Vypneme pin change interupty pre vsetky piny.
    // PCMSK0  = 0;
    // PCMSK1  = 0;
    // PCMSK2  = 0;
    // PCICR   = 0;

    // Vypneme externe interupty.
    EIMSK &= ~((1<<INT0)|(1<<INT1));
    EIFR  |=  (1<<INTF0)|(1<<INTF1);

    // // Toto riesime na zaciatku, ak by nahodou nejake z tychto pinov predsa
    // // len niekedy neskor pouzite boli.
    // sprintln(F("Definovanie pevných logických hodnôt pre nepoužité piny..."));

    // Kvoli bezpecnosti, nepouzite piny definujeme explicitne.
    // Je lepsie ak nejaky pin ostane vo vzduchu ako by sme mali nieco poskodit.
    // !! Treba sa uistit, ze na tychto pinoch naozaj nie je nic pripojene.
    UNUSED_PIN(C, PC2);
    UNUSED_PIN(D, PD6);

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

    // Casovanie bootu spustime po zapnuti preruseni,
    // ked uz bezi 1 kHz timer_counter.
    boot_total_start_ms = timer_counter;
    boot_phase_start_ms = boot_total_start_ms;
    sprintln(F("[BOOT] Stopwatch started."));

    /****************************************
     * Bootovanie Displeja
     ****************************************/

    // Displej rozsvietime ihned po starte preruseni, este pred I2C/EEPROM init.
    // Pocas diagnostiky prebehne vsetka pomala inicializacia (I2C, RTC, INA, EEPROM)
    // a uzivatel vidi vsetky segmenty po celu dobu bootu.
    #if DISPLAY_ENABLED
        sprintln(F("Zapínanie displeja..."));

        const uint16_t _boot_diag_start = timer_counter;
        Display::boot();
        bootMark(F("Boot display start"));
    #endif

    /****************************************
     * Moduly
     ****************************************/

    sprintln(F("Inicializácia modulov..."));
    Modules::initializeModules();
    bootMark(F("Modules initialization"));

    /****************************************
     * Monitor kalibracia
     ****************************************/

    Display::setBrightness(MIN_BRIGTHNESS);

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

    bootMark(F("Monitor calibration"));

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
            Led::setBrightness(led_brightness); wait(500);
            Led::setBrightness(0); wait(500);
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

    bootMark(F("Reset/default config path"));

    setupConfig();
    bootMark(F("Configuration setup/load"));

    #if DISPLAY_ENABLED
        // Ak prebehla inicializacia prilis rychlo, pockame na minimalnu dobu diagnostiky.
        {
            const uint16_t elapsed = timer_counter - _boot_diag_start;
            if (elapsed < BOOT_DIAG_MIN_MS) {
                sprint("Čakame na dokončenie úvodnej diagnostiky...");
                sprintln(BOOT_DIAG_MIN_MS - elapsed);
                wait(BOOT_DIAG_MIN_MS - elapsed);
            }
        }
        bootMark(F("Diagnostics minimum duration"));

        // Vsetka inicializacia prebehla pocas diagnostiky — teraz ju ukoncime
        // a plynule prejdeme na zobrazenie casu.
        sprintln(F("Úvodná diagnostika dokončená."));
        Display::stopDiagnostics();
        CBI(MODE, MODE_BOOT);

        // Apply user-configured brightness AFTER diagnostics end.
        // This ensures smooth transitions without brightness jumps:
        // - During diagnostics, brightness ramps gradually (not disrupted by config)
        // - After diagnostics, smooth transition to configured brightness with hysteresis
        if (Config::get(Config::TIME_BRIGHTNESS_MODE) == 0) {
            // Manual brightness mode: restore user's saved brightness setting.
            const uint8_t saved_value = Config::get(Config::TIME_BRIGHTNESS_VALUE);
            sprint(F("Uložený jas (0-9): ")); sprintln(saved_value);
            // Clamp first, then map 0-9 -> MIN..MAX. Using 1-9 here would make
            // saved_value=0 underflow and jump toward MAX after uint8_t conversion.
            const uint8_t clamped_saved = (uint8_t)CONSTRAIN(saved_value, 0, 9);
            Display::setBrightness(
                (uint8_t)MAP(clamped_saved, 0, 9, MIN_BRIGTHNESS, MAX_BRIGHTNESS),
                2
            );
        } else {
            // Auto brightness mode: ensure configured brightness is set with hysteresis.
            Display::setBrightness(Display::getConfigBrightness(), 2);
        }

        bootMark(F("Diagnostics end + brightness restore"));
    #endif

    sprintln(F("Zobrazovanie času..."));
    updateTimeCountersFromTimeSources(); // Uistime sa, ze mame pocitadla aktualne.
    Display::displayTimeFromCounters(t_counter_minutes, t_counter_hours);
    bootMark(F("Initial time rendering"));

    #if DCF77_ENABLED
        sprintln(F("Spúšťanie DCF77 prijímača..."));
        // Pri zapnuti hned zahajime synchronizaciu.
        // Neviem totiz, ako dlho sme boli vypnuti.
        DCF77Sync::startSynchronization();
        sprintln(F("DCF77 prijímač inicializovaný."));
        bootMark(F("DCF77 initialization"));
    #else
        // Vypneme indikacnu ledku, ktora indikovala spustanie zltou farbou.
        SET_ALL_LED_BRIGHT(0);
        bootMark(F("Finalize without DCF77"));
    #endif

    printSystemInfo();
    bootMark(F("System info print"));

    sprint(F("[BOOT] Total profiled startup time: "));
    sprint(timer_counter - boot_total_start_ms);
    sprintln(F(" ms"));

    sprintln(F("Spúšťanie hodín dokončené!"));
}

int main(void) {
    // Zaloha: ak .init3 pure-asm sekvencia z nejakeho dovodu nezafungovala
    // (napr. iny prekladac, ine optimalizacie), disablujeme WDT este raz tu,
    // skor ako cokolkol ine stihne prebehnut. C-runtime uz bezi korektne,
    // takze avr-libc wdt_disable() funguje spolahlivo.
    MCUSR = 0;
    wdt_disable();

    // Pocas setupu su interupty vypnute.
    INTERRUPTS_OFF;

    // Ihned oznacime canary oblast aby sme mohli neskor detekovat pretecenie zasobniku.
    initStackCanary();

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
