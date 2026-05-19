#include <avr/wdt.h>

#include "utils/math.h"
#include <serial.h>

#include "main.h"

#include "drivers/buttons.h"
#include "drivers/led.h"

#include "clock.h"
#include "state.h"
#include "drivers/display.h"
#include "edit.h"
#include "modules.h"
#include "utils/pins.h"
#include "utils/reg.h"
#include "services/sync.h"
#include "timers.h"
#include "night_mode.h"
#include "utils/utils.h"

#include "config.h"
#include "services/monitor.h"
#include "services/ldr.h"
#include "utils/ram.h"

using namespace Clock;

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

static void executeTimerAction(TimerAction action) {
    switch (action) {
    case TIMER_ACTION_SLEEP:
        NightMode::enter();
        break;
    case TIMER_ACTION_WAKE:
        if (NightMode::isActive())
            NightMode::exit();
        break;
    // case TIMER_ACTION_BRIGHTNESS:
    //     Display::setConfigBrightness(MAX_BRIGHTNESS / 2);
    //     sprintln(F("[Timers] Jas nastaveny na 50%."));
    //     break;
    case TIMER_ACTION_DCF_SYNC:
#if DCF77_ENABLED
        DCF77Sync::startSynchronization();
        sprintln(F("[Timers] DCF77 synchronizacia spustena."));
#endif
        break;
    case TIMER_ACTION_NONE:
    default:
        break;
    }
}

void loop() {
    if (State::isFlagSet(FLAG_NEW_SECOND)) {
        RAM::checkSafety(); // Kazduu sekundu overime, ze RAM este nevytiekla.

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
            Timers::onHourTick(t_counter_hours, executeTimerAction);
        }

        Edit::onSecondTick();

        Modules::updateConnectionStatus();

        #if INA_ENABLED
        if (Config::get(Config::IND_MONITOR_ENABLED)) {
            Monitor::onSecondTick();
        }
        #endif

        #if DCF77_ENABLED
                DCF77Sync::onSecondTick();
        #endif

        LDR::onSecondTick();

        State::clearFlag(FLAG_NEW_SECOND);
    }

    if (State::isFlagSet(FLAG_NEW_MILLIS)) {
        Buttons::onMillisecondTick();
        DCF77Sync::onMillisecondTick();

        if (NightMode::isActive()) {
            NightMode::onMillisecondTick();
        } else {
            // Timeout sa overuje az po obsluhe tlacidiel,
            // tie ho mozu zresetovat.
            Edit::onMillisecondTick();
        }

        State::clearFlag(FLAG_NEW_MILLIS);
    }

    #if WATCHDOG_ENABLED
        wdt_reset();
    #endif
}

void printSystemInfo() {
    sprintln(F("---------------------------------"));
    sprint(F("Voľná pamäť RAM:      "));
    sprint(RAM::free());
    sprintln(" bytes");
    sprint(F("RTC Modul (DS3231):       "));
    sprintln(Modules::isConnected(Modules::MODULE_DS3231) ? F("Pripojený") : F("Nepripojený"));
    sprint(F("Sensor prúdu (INA219):        "));
    sprintln(Modules::isConnected(Modules::MODULE_INA219) ? F("Pripojený") : F("Nepripojený"));
    sprintln(F("---------------------------------"));
}

void setup() {
    /****************************************
     * Indikacna LED-ka
     ****************************************/

    // Indikacnu LED-ku chceme mat zapnutu uz od zaciatku
    // aby mohla indikovat pripadne chyby pri starte.
    Led::setupRegisters();

    // Indikacia zapinania (LED-ka svieti na zlto).
    Led::setRGB(255, 255, 0);

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

    // WGM21 -> CTC rezim, zresetuje citac po dosiahnuti limitu
    TCCR2A = (1 << WGM21);

    // CS22 -> Delic 64
    TCCR2B = (1 << CS22);

    // Fcas = 16MHz / (64 x 250) = 1kHz
    OCR2A = 249; // nastavime limit casovaca
    TCNT2 = 0; // Zaciname pocitat od nuly.

    // Zapne interupt, ktory sa vykona pri dosiahnuti limitu (TIMER2_COMPA_vect)
    TIMSK2 = (1 << OCIE2A);

    sprintln(F("Spúšťanie prerušení..."));
    INTERRUPTS_ON; // Od tohto bodu funguje ISR-ko, takze hodiny uz "tikaju"...

    /****************************************
     * Bootovanie Displeja
     ****************************************/

    // Displej rozsvietime ihned po starte preruseni, este pred I2C/EEPROM init.
    // Pocas diagnostiky prebehne vsetka pomala inicializacia (I2C, RTC, INA, EEPROM)
    // a uzivatel vidi vsetky segmenty po celu dobu bootu.
    #if DISPLAY_ENABLED
        sprintln(F("Zapínanie displeja..."));
        Display::boot();
    #endif

    /****************************************
     * Moduly
     ****************************************/

    // Nechame moduly spustit, to zaberie nejaky cas.
    sprintln(F("Inicializácia modulov..."));
    Modules::initializeModules();

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

        // TODO: Cleanup a bit.
        // Trikrat zablikame ledku, na znak uspesneho resetu.
        for (uint8_t i = 0; i < 3; i++) {
            Led::setColor(Led::Color::RED);
            Led::setColor(Led::Color::GREEN);
            Led::setColor(Led::Color::BLUE);
            Utils::wait(500);
            Led::setRGB(0, 0, 0); Utils::wait(500);
        }

        #if RTC_ENABLED
            sprintln(F("Resetovanie času v RTC module."));
            Modules::DS3231::DateTime dt{33, 16, 22, 8, 2025};
            Modules::DS3231::adjust(dt);
        #endif

        sprintln(F("Resetovanie kalibračných údajov senzoru prúdu."));
        Monitor::clearCalibrationTable();
    } else {
        sprintln(F("Načítavanie uložených konfigurácií z EEPROM..."));
    }

    Edit::setupConfig();

    // ! Musime zabezpecit, ze monitorovanie je defaultne vypnute, aby v pripade, ze
    // ! sa tento volitelny system rozbije, sme ho mohli vypnutpodrzanim tlacidla RESET.
    if (Config::get(Config::IND_MONITOR_ENABLED)) {
        if (!Monitor::loadCalibrationTableFromEEPROM()) {
            sprintln("Nepodarilo sa nacitat kalibracnu tabulku pre Monitor s EEPROM.");
            sprintln("Spustame automaticku kalibraciu.");

            // V pripade, ze chceme kalibraciu opakovat, najprv vypneme monitorovanie
            // odberu displeja v nastaveniach, to vymaze celu kalibracnu tabulku z pamate.
            // Nasledne ju opat zapneme a restartujeme hodiny (staci cez tlacidlo RESET).
            Monitor::runCalibration();
        }
    }

    #if DISPLAY_ENABLED
        Utils::wait(BOOT_DIAG_MIN_MS);
        // Vsetka inicializacia prebehla pocas diagnostiky
        // — teraz ju ukoncime a plynule prejdeme na zobrazenie casu.
        sprintln(F("Úvodná diagnostika dokončená."));
    #endif

    sprintln(F("Zobrazovanie času..."));
    updateTimeCountersFromTimeSources(); // Uistime sa, ze mame pocitadla aktualne.
    Display::displayTimeFromCounters(t_counter_minutes, t_counter_hours);

    #if DCF77_ENABLED
        sprintln(F("Spúšťanie DCF77 prijímača..."));
        // Pri zapnuti hned zahajime synchronizaciu.
        // Neviem totiz, ako dlho sme boli vypnuti.
        DCF77Sync::startSynchronization();
        sprintln(F("DCF77 prijímač inicializovaný."));
    #else
        // Vypneme indikacnu ledku, ktora indikovala spustanie zltou farbou.
        SET_ALL_LED_BRIGHT(0);
    #endif

    // uint16_t ticks = 0;
    // while (true) {

    //     Led::setRGB(0, 0, 0);
    //     for (uint8_t i = 0; i < MAX_LED_BRIGHTNESS; i++) {
    //         Led::setRGB(i, 0, 0);
    //         Utils::wait(100);
    //     }
    //     Led::setRGB(0, 0, 0);
    //     for (uint8_t i = 0; i < MAX_LED_BRIGHTNESS; i++) {
    //         Led::setRGB(0, i, 0);
    //         Utils::wait(100);
    //     }
    //     Led::setRGB(0, 0, 0);
    //     for (uint8_t i = 0; i < MAX_LED_BRIGHTNESS; i++) {
    //         Led::setRGB(0, 0, i);
    //         Utils::wait(100);
    //     }
    // }

    printSystemInfo();

    sprintln(F("Spúšťanie hodín dokončené!"));

// #if NIGHT_MODE_SIM_ON_BOOT
//     sprintln(F("[SIM] Forcing night mode on boot."));
//     NightMode::enter();
// #endif
}

int main(void) {
    // Zaloha: ak .init3 pure-asm sekvencia z nejakeho dovodu nezafungovala
    // (napr. iny prekladac, ine optimalizacie), disablujeme WDT este raz tu,
    // skor ako cokolvek ine stihne prebehnut. C-runtime uz bezi korektne,
    // takze avr-libc wdt_disable() funguje spolahlivo.
    MCUSR = 0;
    wdt_disable();

    // Pocas setupu su interupty vypnute.
    INTERRUPTS_OFF;

    // Ihned oznacime canary oblast aby sme mohli neskor detekovat pretecenie zasobniku.
    RAM::initCanary();

    // I2C pull-upy - Wire ich nastavi sam cez Wire.begin(),
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

    // Test: prechod farbami (R->G->B->R), perioda ~3s
    // Led::setBrightness(255);
    // uint16_t ms_cnt = 0;
    // uint16_t hue    = 0; // 0-767
    for (;;) {
        wdt_reset();
        loop();
        // if (State::consumeFlag(FLAG_NEW_MILLIS)) {
        //     if (++ms_cnt >= 4) { // krok kazdych 4ms
        //         ms_cnt = 0;
        //         if (++hue >= 768) hue = 0;

        //         const uint8_t p = (uint8_t)(hue & 0xFF); // pozicia v aktualnom segmente
        //         uint8_t r, g, b;
        //         if      (hue < 256) { r = 255 - p; g = p;       b = 0;       }
        //         else if (hue < 512) { r = 0;       g = 255 - p; b = p;       }
        //         else                { r = p;       g = 0;       b = 255 - p; }
        //         Led::setRGB(r, g, b);
        //     }
        // }
    }

    // Sem sa nikdy nedostaneme, ale potlacime warning
    return 0;
}
