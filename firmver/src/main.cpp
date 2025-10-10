#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/atomic.h>
#include <avr/sleep.h>
#include <stdint.h>
#include <math.h>

#include <Arduino.h>
#include <EEPROM.h>
#include <Wire.h>
#include <RTCLib.h>
#include <INA219.h>

#define CUSTOM_TIMER2_HANDLER 1
#include <dcf77.h>


#include "main.h"

void process_one_sample();

// POZNAMKY:
// Rok je dolezity kvoli priestupným rokom. (29 februar)
// Ak nemáme pripojenie cez DCF77, prepinanie na letny cas
// prebehne vzdy poslednu marcovu nedelu a prepinanie na zimny cas vzdy poslednu oktobrovu nedelu.
// Tak ze po 01:59 sa zobrazí 03:00 alebo z 02.59 bude nasledovat 01:00

// Na nepouzitých pinoch by sa mal zapnut pull-up rezistor (interny staci ak nebude moc resetovat pri baterii).

// DDRD
#define LEFT_BUTTON             3
#define RIGHT_BUTTON            2

#define SEGMENT_DP             7

#define DIGIT_COUNT            4

///////////////////////////

// // Adresy nastaveni v EEPROM
// enum CONFIG {
//     HOURS,
//     MINUTES,
//     BRIGHTNESS,
//     GENERAL, // Pozicie bitov podla CONFIG_GENERAL
// };

// // Indexi bitov v bajte vseobecnych nastaveni (GENERAL)
// // Ich pocet by mal byt nasobok 4 aby sme mohli ich zobrazit na jeden krat (jednu na kazdy numitron).
// enum CONFIG_GENERAL {
//     M12_24, // Prepinanie medzi 12 a 24 hodinovym rezimom.
//     TRAILLING_ZERO, // Ma sa zobrazovat prva nula (desiatky hodin)?

//     // Zatial neimplementovane kvoli letnemu casu.
//     // Ked sa budu hodiny synchronizovat cez DCF77, budu vediet automaticky
//     // prepinat medzi letnym a zimnym casom (v lete chceme prepinat do nocneho rezimu neskor ako v zime).
//     NIGHT_MODE_ENABLED,
//     NIGHT_MODE_TYPE,
// };

// Prvy bit urcuje ci bolo nastavenie uz nacitane z EEPROM.
// Kedze EEPROM citanie je pomale a zapisovanie ju opotrebovava
// (okolo 100 000 zapisov a mazani podla dokumentacie).
byte LAZY_EE[] = {
    // Cas sa oplati ukladat len v tedy ak by sa vybila
    // zalohovacia 3V bateria a bol by len chvilkovy vypadok napajania.
    // To by ale len o par minut skratilo opatovne zapnutie kym by sa hodiny,
    // aj tak neladili pomocou DCF77.
    // 0x00000000, // Ulozeny cas - hodiny 0 - 23
    // 0x00000000, // Ulozeny cas - minuty 0 - 59
    0b00000000, // Nastavenie jasu 0 - 127
    0b00000000, // Vseobecne 1 bitove nastavenia
    // GENERAL:0 -> 12/24
    // GENERAL:1 -> zaciatocna 0
    // GENERAL:2 -> nocny rezim ON/OFF
    // GENERAL:3 -> typ nocneho rezimu VYPNUTIE/ZTLMENIE

    // cas (hodiny, minuty) kedy sa mame prepnut do nocneho rezimu?
    //0b00000000,
    //0b00000000,
};

/*
 *  /|5|\
 * |6| |3|
 *  +|7|+
 * |9| |4|
 *  \|8|/
 */

#define DEGREE_SYMBOL 10
#define MINUS_SYMBOL  11
#define C_SYMBOL      12

// Byte pre konvertovanie cisiel na tvar zapisany cez 7 segmentov.
const byte NUM_SYMBOL_BYTES[] = {
    0b01111011, //0 - 3, 4, 5, 6, 8, 9
    0b01100000, //1 - 3, 4
    0b01010111, //2 - 3, 5, 7, 8, 9
    0b01110110, //3 - 3, 4, 5, 7, 8
    0b01101100, //4 - 3, 4, 6, 7
    0b00111110, //5 - 4, 5, 6, 7, 8
    0b00111111, //6 - 4, 5, 6, 7, 8, 9
    0b01110000, //7 - 3, 4, 5
    0b01111111, //8 - 3, 4, 5, 6, 7, 8, 9
    0b01111110, //9 - 3, 4, 5, 6, 7, 8

    // Special symbols
    0b01011100, //° - 5, 3, 7, 6
    0b00000100, //- - 7
    0b00011011, //C - 5, 6, 9, 8
    //23456789
};

// Sem ulozime bajty ktore zobrazujeme,
// lebo ked chceme upravit len jedno cislo ostatne cisla si musime pamatat.
byte DIGITS[] = {0, 0, 0, 0};
byte OLD_DIGITS[] = {0, 0, 0, 0};

volatile bool edit_mode = false;
volatile bool diagnostics_mode = false;
volatile uint8_t selected_digit = 0; // V zaklade mame vybratu prvu cifru.

uint8_t segments_lit = 0;

volatile uint8_t configured_brightness = DEFAULT_BRIGHTNESS; // Pre aplikovaný jas pozri register PWM_REGISTER
volatile uint8_t target_brightness = DEFAULT_BRIGHTNESS;

volatile uint8_t new_digit_flipper = 0;
volatile uint8_t old_digit_flipper = 20;

volatile bool crossfading = false;
volatile bool crossfading_toggle = false;
uint8_t crossfade_step_counter = 0;
volatile uint8_t crossfade_flip_counter = 0;

volatile uint8_t blink_timer_counter = 0;
volatile uint16_t brightness_counter = 0;

volatile bool MS_mode = false;

volatile uint16_t minutes_count = 0;

volatile uint16_t ms_ticks = 0; // must be volatile because ISR updates it

// TODO: ??? Nie je to uplne naefektivnejsie riesenie. Vyuzit SLEEP
inline void wait(uint16_t ms) {
    ms_ticks = ms;
    while (ms_ticks > 0) {
        NOP;
    }
}

RTC_DS3231 RTC;
INA219 INA(INA219_ADDR);

////////////////////////////////////

byte getEEConfig(uint8_t address) {
    if (!BIS(LAZY_EE[address], 7)) { // Nastavenie este nie je nacitane
        LAZY_EE[address] = EEPROM.read(address);
        SBI(LAZY_EE[address], 7);
    }

    return (LAZY_EE[address] & ~(1 << 7)); // Ignorujme najvacsi bit aby nezkresloval hodnotu
}

// Nastavi hodnotu na adrese v LAZY_EE a zapise do EEPROM.
void setEEConfig(uint8_t address, byte value) {
    if (getEEConfig(address) != value) { // Overme ci naozaj je treba hodnotu prenastavovat
        LAZY_EE[address] = value;
        SBI(LAZY_EE[address], 7);
        EEPROM.write(address, LAZY_EE[address]);
    }
}

void saveEEConfig() {
    setEEConfig(BRIGHTNESS, configured_brightness);
}

void enterEditMode() {
    edit_mode = true;
    blink_timer_counter = 0;
    setNumitronSegment(selected_digit, SEGMENT_DP, ON);
}

void exitEditMode() {
    edit_mode = false;
    blink_timer_counter = 0;
    setNumitronSegment(selected_digit, SEGMENT_DP, OFF);

    // Vysli sme s nastavovacieho rezimu - ulozme zmeny
    saveEEConfig();
}

void setDigit(uint8_t digit_index, byte value) {
    OLD_DIGITS[digit_index] = DIGITS[digit_index];
    DIGITS[digit_index] = value;
}

// Skonvertuje byte reprezentujuci cislo zapisane v tvare 7 segmentovky na jeho index v zozname symbolov,
// takze nam staci si pamatat len symbol cisla pre zapis do registrov.
// Mozno by bolo lepsie si tento index niekde pamatat.
// Stacilo by pamatat si dve cisla: hodiny a minuty a vzdy ich prelozit pri zobrazovani.
uint8_t getSelectedNumSymbolIndex(uint8_t digit) {
    byte masked_digit = DIGITS[digit] & DIGIT_MASK;
    for (uint8_t num_symbol_index = 0; num_symbol_index < NUM_SYMBOL_COUNT; num_symbol_index++) {
        if (NUM_SYMBOL_BYTES[num_symbol_index] == masked_digit) {
            return num_symbol_index;
        }
    }

    return 0;
}

// void startNumberTransition() {
//     number_transition = true;
//     setBrightness(0);
//     brightness_counter = 0;
//     pushToOutputRegs();

//     // Wait until number transition finishes.
//     while (number_transition) {
//         NOP;
//     }
// }

// void stopNumberTransition() {
//     number_transition = false;
//     brightness_counter = 0;
// }

void configBrightness(uint8_t value) {
    configured_brightness = value;
    setBrightness(configured_brightness);
}


void setBrightness(uint8_t value) {
    // TODO: DEBUG SETUP
    uint8_t new_brightness = value < DEFAULT_BRIGHTNESS ? value : DEFAULT_BRIGHTNESS;
    if (new_brightness != target_brightness) {
        target_brightness = new_brightness;
        // Serial.println("Nový jas: " + String((target_brightness * 100) / MAX_BRIGHTNESS) + "%");
    }
}

// Pre nastavovanie jednotlivych segementov (hlavne pri desatinnej ciarke)
void setNumitronSegment(uint8_t digit, uint8_t index, bool state) {
    if (crossfading) {
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

void toggleNumitronSegment(uint8_t digit, uint8_t index) {
    setNumitronSegment(digit, index, !(DIGITS[digit] & (1 << index)));
}

void setSelectedDigit(uint8_t digit) {
    setNumitronSegment(selected_digit, SEGMENT_DP, OFF);
    blink_timer_counter = 0;
    setNumitronSegment(digit, SEGMENT_DP, ON);
    selected_digit = digit;
}

// - Uistit sa ze dlzka impulzu je dostatocne dlha pre nase registre.
// - Cisla frekvencia zmien na hodinach je odstupnovana od prava.
// - Ak sa nejake cislo ma zmenit, vzdy sa zmenia aj cisla s prava od neho.
inline void putDigitsToInputRegs(byte* digits, uint8_t n) {
    CBI(PORTD, RCK_PORTD); // Write data and read data are valid only when RCK_PORTD is low.
    CBI(PORTB, SRCK_PORTB);
    for (uint8_t digit = 0; digit < n; digit++) {
        for (uint8_t i = 0; i < 8; i++) {
            if (BIS(digits[digit], i)) {
                SBI(PORTB, SERIN_PORTB);
            }
            else {
                CBI(PORTB, SERIN_PORTB);
            }

            // Setup time (aspon 10ns) zaisti dlzka operacie
            // Len na nabeznu hranu.
            SBI(PORTB, SRCK_PORTB);
            // Hold time (aspon 10ns) zaisti dlzka operacie.
            CBI(PORTB, SRCK_PORTB);
        }
    }
}

void setSymbolOnNumitron(uint8_t numitron_index, uint8_t symbol_index) {
    if (DIGITS[numitron_index] == NUM_SYMBOL_BYTES[symbol_index]) {
        return; // No change
    }

    OLD_DIGITS[numitron_index] = DIGITS[numitron_index];
    DIGITS[numitron_index] = NUM_SYMBOL_BYTES[symbol_index];
    showDigits();
}

void displayTime(uint16_t time_in_minutes) {
    // zobrazenim casu sa diagnostika vzdy vypne
    //stopDiagnostics();

    if (crossfading) {
        return;
    }

    uint8_t minutes = time_in_minutes % 60;
    uint8_t minutes_units = minutes % 10;
    uint8_t minutes_tens = minutes / 10;

    uint8_t hours = time_in_minutes / 60;
    uint8_t hours_units = hours % 10;
    uint8_t hours_tens = hours / 10;

    // if (BIS(getEEConfig(GENERAL), M12_24)) {
    //     if (hours == 0) {
    //         hours = 12; // Pri 12 hod mode je polnoc 12:00
    //     } else if (hours > 12) {
    //         hours -= 12;
    //     }
    // }

    OLD_DIGITS[DIGIT_MIN_UNITS] = DIGITS[DIGIT_MIN_UNITS];
    OLD_DIGITS[DIGIT_MIN_TENS] = DIGITS[DIGIT_MIN_TENS];
    OLD_DIGITS[DIGIT_HOR_UNITS] = DIGITS[DIGIT_HOR_UNITS];
    OLD_DIGITS[DIGIT_HOR_TENS] = DIGITS[DIGIT_HOR_TENS];

    bool needs_update = false;
    if ((!edit_mode || selected_digit != DIGIT_MIN_UNITS) && DIGITS[DIGIT_MIN_UNITS] != NUM_SYMBOL_BYTES[minutes_units]) {
        DIGITS[DIGIT_MIN_UNITS] = NUM_SYMBOL_BYTES[minutes_units];
        needs_update = true;
    }
    if ((!edit_mode || selected_digit != DIGIT_MIN_TENS) && DIGITS[DIGIT_MIN_TENS] != NUM_SYMBOL_BYTES[minutes_tens]) {
        DIGITS[DIGIT_MIN_TENS] = NUM_SYMBOL_BYTES[minutes_tens];
        needs_update = true;
    }
    if ((!edit_mode || selected_digit != DIGIT_HOR_UNITS) && DIGITS[DIGIT_HOR_UNITS] != NUM_SYMBOL_BYTES[hours_units]) {
        DIGITS[DIGIT_HOR_UNITS] = NUM_SYMBOL_BYTES[hours_units];
        needs_update = true;
    }
    if ((!edit_mode || selected_digit != DIGIT_HOR_TENS) && DIGITS[DIGIT_HOR_TENS] != NUM_SYMBOL_BYTES[hours_tens]) {
        // if (BIS(getEEConfig(GENERAL), TRAILLING_ZERO)) {
        //     DIGITS[DIGIT_HOR_TENS] = NUM_SYMBOL_BYTES[hours_tens];
        // } else {
        //     DIGITS[DIGIT_HOR_TENS] = 0;
        // }
        DIGITS[DIGIT_HOR_TENS] = NUM_SYMBOL_BYTES[hours_tens];
        needs_update = true;
    }

    if (needs_update) {
        showDigits();
    }
}

bool DS3231_Present() {
  Wire.beginTransmission(0x68);
  uint8_t err = Wire.endTransmission(); // 0 == ACK (device present)
  return (err == 0);
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
    if (diagnostics_mode || edit_mode) {
        return;
    }

    displayTime(getTimeInMinutes());
}

void pushToOutputRegs() {
    // Reaguje na nabeznu hranu.
    CBI(PORTD, RCK_PORTD);
    // Aspon 100ns impulz zaisti dlzka operacie.
    SBI(PORTD, RCK_PORTD);
    //CBI(PORTD, RCK_PORTD);
}


void showDigits() {
    putDigitsToInputRegs(DIGITS, DIGIT_COUNT);
    crossfading = true;
}

// Pri diagnostike chceme aby svietili vsetky segmenty,
// takze vieme povedat ktore su vypalene.
void startDiagnostics() {
    diagnostics_mode = true;
    // Diagnostika
    DIGITS[0] = 0b11111111;
    DIGITS[1] = 0b11111111;
    DIGITS[2] = 0b11111111;
    DIGITS[3] = 0b11111111;
    showDigits();
}

void stopDiagnostics() {
    diagnostics_mode = false;
}

uint8_t sample_input_pin() {
    // while (ADCSRA & (1 << ADSC)) {} // wait if busy
    // ADMUX   = (1 << REFS0) | (DCF_OUT & 0x07);
    // ADCSRA |= (1 << ADSC);
    while (ADCSRA & (1 << ADSC)) {}


    const uint8_t sampled_data = analogRead(DCF_OUT) > 200;//0;//ADC > 200;
    const uint8_t state = DCF77_Clock::get_clock_state();

    // if (sampled_data) {
    //     SBI(PORTB, LED_R);
    //     if (state == Clock::dirty) {
    //         SBI(PORTB, LED_G);
    //     }
    // } else {
    //     CBI(PORTB, LED_R);
    //     CBI(PORTB, LED_G);
    // }
    return sampled_data;
}

void bootDisplay() {
    // Uistime sa, ze registre su ciste
    putDigitsToInputRegs(DIGITS, DIGIT_COUNT);
    pushToOutputRegs();

    wait(1000);

    // Na par sekund zasvietime vsetky cifry v ramci diagnostiky pri starte.
    // V tomto pripade este pouzijeme predvolenu hodnotu jasu (teda polovicu z maxima),
    // pre pripad, ze by bola nastavena prilis mala hodnota jasu.

    Serial.println(F("Úvodná diagnostika. Všetky segmenty budu postupne rozsvietene..."));

    setBrightness(DEFAULT_BRIGHTNESS);

    Serial.println(F("Rozsviecanie segmentov numitronu č. 1"));
    DIGITS[DIGIT_HOR_TENS] = 0b11111111;
    // showDigits();
    // wait(NUMBER_TRANS_DUR + 1000);
    // OLD_DIGITS[DIGIT_HOR_TENS] = 0b11111111;

    Serial.println(F("Rozsviecanie segmentov numitronu č. 2"));
    DIGITS[DIGIT_HOR_UNITS] = 0b11111111;
    // showDigits();
    // wait(NUMBER_TRANS_DUR + 1000);
    // OLD_DIGITS[DIGIT_HOR_UNITS] = 0b11111111;

    Serial.println(F("Rozsviecanie segmentov numitronu č. 3"));
    DIGITS[DIGIT_MIN_TENS] = 0b11111111;
    // showDigits();
    // wait(NUMBER_TRANS_DUR + 1000);
    // OLD_DIGITS[DIGIT_MIN_TENS] = 0b11111111;

    Serial.println(F("Rozsviecanie segmentov numitronu č. 4"));
    DIGITS[DIGIT_MIN_UNITS] = 0b11111111;
    // showDigits();
    // wait(NUMBER_TRANS_DUR + 1000);
    // OLD_DIGITS[DIGIT_MIN_UNITS] = 0b11111111;

    showDigits();
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

void setup() {
    // Serial pre debugovanie a logging
    Serial.begin(SERIAL_BANDWIDTH);
    Serial.println(__FILE__);
    Serial.print(F("INA219_LIB_VERSION: "));
    Serial.println(INA219_LIB_VERSION);

    Serial.println(F("Spúšťanie hodín..."));

    /****************************************
     * Nepouzite Piny
     ****************************************/

     // TODO: Vsetky nepouzite piny by mali mat definovany nejaky stav.

    // Vsetky piny su defaultne INPUT, teda odpojene
    // akurat sa musime uistit, ze je tam zapnuty
    // pull-up rezistor kvoli definovanemu stavu.

    // piny PB6 a PB7 vyuzivame pre krystal.
    // DDRB    &= 0b00000011;
    // PORTB   |= 0b11111100;

    // DDRC     = 0b00000000;
    // PORTC    = 0b11111111;

    // // piny PD0 a PD1 vyuzivame pre Serial.
    // DDRD    &= 0b11111100;
    // PORTD   |= 0b11111100;

    /****************************************
     * PWM Jas
     ****************************************/

    #if DISPLAY_ENABLED
        Serial.println(F("Konfigurácia PWM kanálu pre jas..."));

        CRITICAL_SECTION {
            OCR0A = 0;

            // PHASE CORRECT PWM (32kHz)
            TCCR0A = (1 << COM0A1) | (1 << COM0A0) | (1 << WGM00);
            //TCCR0B = (1<<CS02) | (1<<CS00);; // CS02 -> prescaler 1024
            TCCR0B = (1 << CS00); // CS02 -> prescaler 1024
        }
    #endif

    // CRITICAL_SECTION {
    //     // Timer Interupt Mask Register
    //     TIMSK0 = 0; // Vypneme interupty pre casovac 0, ktory budeme pouzivat len na PWM.

    // // Zresetujeme nastavia registrov casovaca 0
    // TCCR0A = 0;
    // TCCR0B = 0;

    // // // COM1A1 pri rychlej PWM nastavi neinvertujuci rezim
    // // TCCR1A = (1 << COM1A1) | (1 << WGM11);
    // // // WGM11 | WGM12 | WMG13 -> rychla PWM kde ICR1 urcuje TOP
    // // // CS10 -> bez delica
    // // // Fpwm = (16MHz / 500) = 32kHz (nepocutelny rozsah)
    // // TCCR1B = (1 << WGM13) | (1 << WGM12) | (1 << CS10);

    // // Example: Fast PWM, non-inverting on OC0A, prescaler = 1 (safe, less impact on timing)
    // //TCCR0A = (1 << COM0A1) | (1 << COM0A0) | (1 << WGM01) | (1 << WGM00); // inverting, WGM0[1:0]=3 => fast PWM (TOP=0xFF)
    // TCCR0A = (1 << COM0B1) | (1 << COM0B0) | (1 << WGM00);
    // TCCR0B = (1 << CS00); // CS00 -> prescaler 1
    // // PWM frequency = 16MHz / (1 * 256) = 62 500 Hz


//         // // WGM02 | WGM01 | WGM00 -> Fast PWM, TOP = OCR0A
//         // // Timer Counter Control Register
//         // TCCR0A = (
//         //     (1 << COM0B1) | (1 << COM0B0) | // Invertujuci rezim, pouzivame OCR0B pre duty cycle.
//         //     //(1 << WGM02) | (1 << WGM01) | (1 << WGM00) // Fast PWM, TOP = OCR0A
//         //     (1 << WGM01) | (1 << WGM00)
//         // );

//         // OCR0A = 63; // TOP = 16MHz / (1 * 64) = 250 000 kHz

//         // /*
//         //  * CS02 CS01 CS00 Description
//         //  * 0     0     0   No clock source (Timer/Counter stopped)
//         //  * 0     0     1   clk I/O /(no prescaling) -> 16MHz / (1 * 256) = 62 500 Hz
//         //  * 0     1     0   clk I/O /8 (from prescaler) -> 16MHz / (8 * 256) = 7812.5 Hz
//         //  * 0     1     1   clk I/O /64 (from prescaler) -> 16MHz / (64 * 256) = 976.5625 Hz
//         //  * 1     0     0   clk I/O /256 (from prescaler) -> 16MHz / (256 * 256) = 244.140625 Hz
//         //  * 1     0     1   clk I/O /1024 (from prescaler) -> 16MHz / (1024 * 256) = 61.03515625 Hz
//         //  * 1     1     0   External clock source on T0 pin. Clock on falling edge.
//         //  * 1     1     1   External clock source on T0 pin. Clock on rising edge.
//         //  */
//         // // Mali by sme používať len ultrazvukové frekvencie, t.j. > 20kHz.
//         // TCCR0B = (1 << CS00);

//         // // Output Compare Register (rozsah jasu, od 10 do 160)
//         // OCR0B  = 0; // Zaciname s nulovym jasom.
//         // // OCR0A = 0;

// /* 1) Make PD6/OC0A an output so the timer hardware can drive the pin */
// // DDRD |= (1 << PD6);                // PD6 = OC0A (Arduino D6)

// /* 2) Set TOP and initial OCR0A value.
//    - TOP = OCR0A = 79 -> period = (1 + TOP) CPU ticks = 80 ticks
//      With F_CPU = 16 MHz and prescaler N = 1 => f = 16,000,000 / 80 = 200,000 Hz.
//    - OCR0A is also the compare for OC0A in this mode; initial value 79 gives a
//      specific starting duty (see notes below). */
// OCR0A = 79;                         // TOP = 79 -> base frequency 200 kHz (with N=1)

// /* 3) Configure TCCR0A:
//    - COM0A1:0 = 10 -> non-inverting PWM on OC0A (clear on compare, set at BOTTOM)
//    - WGM01 = 1, WGM00 = 1 -> lower bits of WGM = b11 (combined with WGM02 -> mode 7) */
// TCCR0A = (1 << COM0A1)              // non-inverting on OC0A (COM0A1=1, COM0A0=0)
//        | (1 << WGM01)               // WGM01 = 1
//        | (1 << WGM00);              // WGM00 = 1

// /* 4) Configure TCCR0B:
//    - WGM02 = 1 -> completes WGM = 0b111 (Fast PWM: TOP = OCR0A)
//    - CS02..0 = 0b001 -> prescaler = 1 (no prescale). N = 1 is required to reach 200 kHz. */
// TCCR0B = (1 << WGM02)               // WGM02 = 1 -> mode 7 (TOP = OCR0A)
//        | (1 << CS00);               // CS02..0 = 001 -> no prescaling (N = 1)§

//     OCR0B = 1;

// OCR0A = 64;
    // }

    /****************************************
     * Zbernica registrov.
     ****************************************/

    #if DISPLAY_ENABLED
        Serial.println(F("Konfigurácia zbernice registrov pre displej..."));

        CBI(PORTB,  SRCK_PORTB);    SBI(DDRB,   SRCK_PORTB);
        CBI(PORTD,  RCK_PORTD);     SBI(DDRD,   RCK_PORTD);
        CBI(PORTB,  SERIN_PORTB);   SBI(DDRB,   SERIN_PORTB);
        CBI(PORTD,  _G_PORTD);      SBI(DDRD,   _G_PORTD);
    #endif

    /****************************************
     * Hlavny Casovac (1kHz)
     ****************************************/

    Serial.println(F("Konfigurácia časovača..."));

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
        Serial.println(F("[Varovanie] RTC modul nebol nájdený!"));
    } else {
        // if (RTC.lostPower()) {
        //     Serial.println(F("Nastavovanie času pre RTC modul."));
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
    Serial.println("Konfigurácia pinov DCF77 prijímača...");

    CBI(DDRC, DCF_OUT);
    CBI(PORTC, DCF_OUT);

    CBI(DDRB, DCF_PON);
    CBI(PORTB, DCF_PON); // POZOR! 3V3 logika
    #endif

    /****************************************
     * Senzor Prudu
     ****************************************/

    #if INA_ENABLED
    Serial.println(F("Inicializácia senzora prúdu..."));

    Wire.begin();
    if (INA.begin()) {
        if (!INA.isCalibrated()) {
            Serial.println(F("Prúdový senzor nie je kalibrovaný!"));
            Serial.println("Kalibrácia...");
            INA.setMaxCurrentShunt(0.4, 8);
        }

        wait(1000);

        Serial.println("Rozsah napájacieho napätia INA219: " + INA.getBusVoltageRange());
    } else {
        Serial.println(F("Prúdový senzor nebol nájdený!"));
    }
    #endif

    /****************************************
     * IO Piny
     ****************************************/

    Serial.println(F("Inicializácia vstupno-výstupných pinov..."));

    CBI(DDRD,   LEFT_BUTTON);
    SBI(PORTD,  LEFT_BUTTON); // INPUT PULLUP
    CBI(DDRD,   RIGHT_BUTTON);
    SBI(PORTD,  RIGHT_BUTTON); // INPUT PULLUP

    SBI(PORTC,  LDR_PIN_PORTC); // pull-up rezistor
    CBI(DDRC,   LDR_PIN_PORTC);  // INPUT

    CBI(DDRD,   RESET_BUTTON);
    SBI(PORTD,  RESET_BUTTON);

    SBI(DDRB, LED_R); CBI(PORTB, LED_R);
    SBI(DDRB, LED_G); CBI(PORTB, LED_G);
    SBI(DDRB, LED_B); CBI(PORTB, LED_B);

    /****************************************
     * Bootovanie
     ****************************************/

    #if DISPLAY_ENABLED
        Serial.println(F("Zapínanie displeja..."));

        bootDisplay();

        wait(NUMBER_TRANS_DUR + 6000);

        Serial.println(F("Diagnostika dokončená. Pomalý prechod na uložený čas..."));

        setBrightness(configured_brightness);

        displayTime(getTimeInMinutes());
    #endif

    // Nacitajme ulozeny cas
    // minutes_count = ((getEEConfig(HOURS) * 60) + (getEEConfig(MINUTES) * 60));
    // configured_brightness = getEEConfig(BRIGHTNESS); // Ulozeny jas ktory sa pouzije pri prvom zobrazeni.
    // displayTime(minutes_count); // zobrazme ulozeny cas

    #if DCF77_ENABLED
    Serial.println(F("Spúšťanie DCF77 prijímač..."));
    SBI(DDRB, DCF_PON); // Zapneme modul
    DCF77_Clock::setup();
    DCF77_Clock::set_input_provider(sample_input_pin);
    #endif

    Serial.println(F("Spúšťanie hodín dokonečené!"));

    // POZNAMKA: Pri trimri s max hodnotou odporu 10K je max hodnota ADC ~225
    // Kasleme na trimmer, vyzadovalo by to zbytocnu komplexitu softveru za ziadnu cenu.
    // Serial.println("Nastavovanie jasu podľa trimmeru...");
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
}

bool last_lbutton_state = RELEASED;
bool last_rbutton_state = RELEASED;

volatile uint8_t prev_PIND = 0b00000000;

bool was_lbutton_longpressed = false;
bool was_rbutton_longpressed = false;

bool were_both_buttons_pressed = false;
bool were_both_buttons_long_pressed = false;

bool lbutton_debouncing = false;
bool rbutton_debouncing = false;

uint16_t lbutton_longpress_timer = 0;
uint16_t rbutton_longpress_timer = 0;

uint16_t timer_counter = 0; // Pocita do 60 000 - 1 minuta v ms

uint8_t lbutton_debounce_timer = 0;
uint8_t rbutton_debounce_timer = 0;

bool new_minute_flag = false;
bool new_second_flag = false;

// Prerusenie sa spusti kazdu ms (1KHz)
// TODO: Logaritmicke zvysovanie jasu namiesto linearneho.
ISR(TIMER2_COMPA_vect) {
    Internal::Generic_1_kHz_Generator::isr_handler();
    // process_one_sample();

    // if (edit_mode && blink_timer_counter < EDIT_MODE_BLINK_F) { // Ak sme v edit mode, blikaj desatinnou ciarkou.
    //     blink_timer_counter++;
    // }

    // if (lbutton_debouncing && lbutton_debounce_timer < 255) { lbutton_debounce_timer++; }
    // if (rbutton_debouncing && rbutton_debounce_timer < 255) { rbutton_debounce_timer++; }

    // if (last_lbutton_state == PRESSED) {
    //     lbutton_longpress_timer++;
    //     if (lbutton_longpress_timer > LONG_PRESS_DELAY) {
    //         was_lbutton_longpressed = true;
    //         //onLeftButtonLongPressed();
    //     } else {
    //         lbutton_longpress_timer++;
    //     }
    // }

    // if (last_rbutton_state == PRESSED) {
    //     if (rbutton_longpress_timer > LONG_PRESS_DELAY) {
    //         was_rbutton_longpressed = true;
    //         //onRightButtonLongPressed();
    //     } else {
    //         rbutton_longpress_timer++;
    //     }
    // }

    // // Ak su obe tlacitka dlho stlacene
    // if (was_rbutton_longpressed && was_lbutton_longpressed) {
    //     //onBothButtonsLongPressed();
    // }

    timer_counter++;
    if (timer_counter % 1000 == 0) {
        new_second_flag = true;
    }
    //if (timer_counter >= 60000) {
    if (timer_counter >= 5000) { // Pre testovacie ucely kazdu sekundu
        new_minute_flag = true;
        timer_counter = 0;
    }

    if (ms_ticks > 0) {
        ms_ticks--;
    }

    if (target_brightness != PWM_REGISTER) {
        brightness_counter++;
    } else {
        brightness_counter = 0;
    }

    // NOTE: Musi to byt tu lebo, to pouzivme v setupe.
    if (brightness_counter > NUMBER_TRANS_PER) {
        if (target_brightness > PWM_REGISTER) {
            PWM_REGISTER++;
        } else {
            PWM_REGISTER--;
        }
        brightness_counter = 0;
    }

    if (crossfading) {
        crossfade_flip_counter++;
        // Po kolkych krokoch mame prenut cisla z novych na stare alebo naopak.
        if (crossfade_flip_counter > old_digit_flipper) {
            putDigitsToInputRegs(DIGITS, DIGIT_COUNT);
            pushToOutputRegs();

            if (crossfade_flip_counter >= CROSSFADING_WRAP) {
                crossfade_flip_counter = 0;
            }
        } else {
            putDigitsToInputRegs(OLD_DIGITS, DIGIT_COUNT);
            pushToOutputRegs();
        }

        crossfade_step_counter++;
        // Urcuje po kolkych krokoch mame znizt pwm-ku pre stare cisla v prospech novych.
        if (crossfade_step_counter > NUMBER_TRANS_PER) {
            crossfade_step_counter = 0;

            if (old_digit_flipper > 0) {
                old_digit_flipper--;
            }

            if (old_digit_flipper == 0) {
                crossfading = false;

                crossfade_flip_counter = 0;
                crossfade_step_counter = 0;

                // Pripravime na dalsi prechod.
                old_digit_flipper = CROSSFADING_WRAP;
            }
        }
    }
}

//////////////////////////////
/// CONTROLS
//////////////////////////////

// Expecting button pin to be in the D register.
bool isPressedDebounced() {
    static uint16_t state = 0;
    state = (state << 1) | digitalRead(LEFT_BUTTON) | 0xfe00;
    return (state == 0xff00);
}

// Horizontalny posun
void onLeftButtonPressed() {
    Serial.println("onLeftButtonPressed");
    // Serial.println("> ON LEFT BUTTON PRESSED");
}

void onLeftButtonReleased() {
    Serial.println("onLeftButtonReleased");
    lbutton_longpress_timer = 0;
    // Serial.println("< ON LEFT BUTTON RELEASED");
    if (were_both_buttons_pressed || was_lbutton_longpressed) {
        was_lbutton_longpressed = false;
        return;
    } // Ignorujme ak sme drzali obe tlacidla

    if (edit_mode) {
        setSelectedDigit((selected_digit + 1) % DIGIT_COUNT);
    } if (!was_lbutton_longpressed) {
        configBrightness(configured_brightness - MAX_BRIGHTNESS * 0.2);
    }
}

void onLeftButtonLongPressed() {
    Serial.println("onLeftButtonLongPressed");
    // Serial.println(">>> ON LEFT BUTTON LONG PRESSED");
    lbutton_longpress_timer -= 5;
    if (edit_mode) {
        setSelectedDigit((selected_digit + 1) % DIGIT_COUNT);
        lbutton_longpress_timer -= 100;
    } else { //if (configured_brightness > 0) {
        //configBrightness(configured_brightness -1);
    }
}

// Vertykalny posun
void onRightButtonPressed() {
    Serial.println("onRightButtonPressed");
    // Serial.println("< ON RIGHT BUTTON PRESSED");
}

void onRightButtonReleased() {
    Serial.println("onRightButtonReleased");
    rbutton_longpress_timer = 0;

    // Serial.println("< ON RIGHT BUTTON RELEASED");
    if (were_both_buttons_pressed || was_rbutton_longpressed) {
        was_rbutton_longpressed = false;
        return;
    } // Ignorujme ak sme drzali obe tlacidla

    if (edit_mode) {
        byte selected_num_index = getSelectedNumSymbolIndex(selected_digit);
        selected_num_index = (selected_num_index + 1) % NUM_SYMBOL_COUNT;
        DIGITS[selected_digit] = NUM_SYMBOL_BYTES[selected_num_index];
        showDigits();
    } if (!was_rbutton_longpressed) {
        configBrightness(configured_brightness + MAX_BRIGHTNESS * 0.2);
    }
}

void onRightButtonLongPressed() {
    Serial.println("onRightButtonLongPressed");
    // Serial.println(">>> ON RIGHT BUTTON LONG PRESSED");
    rbutton_longpress_timer -= 5;
    if (edit_mode) {
        byte selected_num_index = getSelectedNumSymbolIndex(selected_digit);
        selected_num_index = (selected_num_index + 1) % NUM_SYMBOL_COUNT;
        DIGITS[selected_digit] = NUM_SYMBOL_BYTES[selected_num_index];
        showDigits();
        rbutton_longpress_timer -= 100;
    } else if (configured_brightness < MAX_BRIGHTNESS) {
        configBrightness(configured_brightness + 1);
    }
}

void onBothButtonsPressed() {
    Serial.println("onBothButtonsPressed");
}

void onBothButtonsReleased() {
    Serial.println("onBothButtonsReleased");
    stopDiagnostics();

    if (!were_both_buttons_long_pressed) { // Reaguje len na obycajne kratke stlacenie
        if (edit_mode) { // Prepnime rezim.
            exitEditMode();
        } else {
            enterEditMode();
        }
    }
}

void onBothButtonsLongPressed() {
    were_both_buttons_long_pressed = true;
    if (!edit_mode) { // spustime diagnostiku len mimo editovacieho rezimu
        // Diagnostika na vyziadanie, zobrazujeme po celu dobu co su obe tlacidla dlho stlacene.
        startDiagnostics();
    }
}

void handleInput() {
    if (isPressedDebounced() && !BIS(prev_PIND, LEFT_BUTTON)) {
        Serial.println("LEFT BUTTON PRESSED");
    }

    if (isPressedDebounced()) {
        Serial.println("LEFT BUTTON PRESSED NO PIND");
    }

    // if (isPressedDebounced(RIGHT_BUTTON) && !BIS(prev_PIND, RIGHT_BUTTON)) {
    //     Serial.println("RIGHT BUTTON PRESSED");
    // }

    // bool read_lbutton_state = BIS(PIND, LEFT_BUTTON);
    // if (read_lbutton_state != last_lbutton_state && !lbutton_debouncing) {
    //     // Stav tlacidla sa zmenil, spustime pocitadlo.
    //     lbutton_debounce_timer = 0;
    //     lbutton_debouncing = true;
    // } else if (lbutton_debouncing && lbutton_debounce_timer > 1) {
    //     lbutton_debouncing = false;
    //     if (read_lbutton_state != last_lbutton_state) {
    //     last_lbutton_state = read_lbutton_state;
    //     // Vypada ze to myslia vazne
    //     if (read_lbutton_state == PRESSED) {
    //         onLeftButtonPressed();
    //     } else {
    //         onLeftButtonReleased();
    //     }
    //     }
    // }

    // bool read_rbutton_state = BIS(PIND, RIGHT_BUTTON);
    // if (read_rbutton_state != last_rbutton_state && !rbutton_debouncing) {
    //     Serial.println("BOUNCED!!!");
    //     // Stav tlacidla sa zmenil, spustime pocitadlo.
    //     rbutton_debounce_timer = 0;
    //     rbutton_debouncing = true;
    // } else if (rbutton_debouncing && rbutton_debounce_timer > 1) {
    //     Serial.println("DEBOUNCED!!");
    //     rbutton_debouncing = false;
    //     if (read_rbutton_state != last_rbutton_state) {
    //         last_rbutton_state = read_rbutton_state;
    //         // Vypada ze to myslia vazne
    //         if (read_rbutton_state == PRESSED) {
    //             onRightButtonPressed();
    //         } else {
    //             onRightButtonReleased();
    //         }
    //     }
    // }

    // // if (was_rbutton_longpressed) {
    // //     onRightButtonLongPressed();
    // // }

    // // if (was_lbutton_longpressed) {
    // //     onLeftButtonLongPressed();
    // // }

    // // "last_state" je v tomto pripade len debouncnuty "current_state"
    // if (last_rbutton_state == PRESSED && last_lbutton_state == PRESSED) {
    //     onBothButtonsPressed(); // Obe tlacitka stlacene.
    //     were_both_buttons_pressed = true;
    // } else if (
    //     (were_both_buttons_pressed || were_both_buttons_long_pressed) && // obe boli stlacene
    //     (last_rbutton_state == RELEASED || last_lbutton_state == RELEASED) // a teraz sa aspon jedno z nich pustilo
    // ) {
    //     onBothButtonsReleased();
    //     were_both_buttons_pressed = false;
    //     were_both_buttons_long_pressed = false;
    // }

    prev_PIND = PIND;
}

uint16_t counter = 0;

void handleCommand(String command) {
    if (command == "?") {
        Serial.println(F("-------------------------"));
        Serial.println(F("ZOZNAM PRIKAZOV:"));
        Serial.println(F("  z_datum"));
        Serial.println(F("  z_cas(hm) - zobrazí čas vo formáte [HODINY]:[MINUTY]"));
        Serial.println(F("  z_teplotu"));
        Serial.println(F("  z_rok"));
        Serial.println(F("  z_cas(ms) - Zobrazí čas vo formate [MINUTY]:[SEKUNDY]"));
        Serial.println(F("-------------------------"));
    } else if (command == "z_datum") {
        DateTime now = RTC.now();
        int day = now.day();
        int month = now.month();
        Serial.print(day);
        Serial.print(".");
        Serial.print(month);
        Serial.println(".");

        uint8_t day_units = day % 10;
        uint8_t month_units = month % 10;
        uint8_t day_tens = day / 10;
        uint8_t month_tens = month / 10;

        setSymbolOnNumitron(DIGIT_HOR_TENS, day_tens);
        setSymbolOnNumitron(DIGIT_HOR_UNITS, day_units);
        setSymbolOnNumitron(DIGIT_MIN_TENS, month_tens);
        setSymbolOnNumitron(DIGIT_MIN_UNITS, month_units);
    } else if (command == "z_cas(hm)") {
        DateTime now = RTC.now();
        int hour = now.hour();
        int minute = now.minute();
        Serial.print(hour);
        Serial.print(":");
        Serial.println(minute);
        displayTime(getTimeInMinutes());
    } else if (command == "z_cas(ms)") {
        DateTime now = RTC.now();
        int minute = now.minute();
        int second = now.second();
        Serial.print(minute);
        Serial.print(":");
        Serial.println(second);
    } else if (command == "z_teplota") {
        int temperature = round(RTC.getTemperature());
        Serial.print("Teplota: ");
        Serial.println(temperature);

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
    } else if (command == "z_rok") {
        int year = RTC.now().year();
        Serial.print("Rok: ");
        Serial.println(year);

        uint8_t year_milliennia = (year / 1000) % 10;
        uint8_t year_centuries  = (year / 100)  % 10;
        uint8_t year_decades    = (year / 10)   % 10;
        uint8_t year_units      =  year         % 10;

        setSymbolOnNumitron(DIGIT_HOR_TENS, year_milliennia);
        setSymbolOnNumitron(DIGIT_HOR_UNITS, year_centuries);
        setSymbolOnNumitron(DIGIT_MIN_TENS, year_decades);
        setSymbolOnNumitron(DIGIT_MIN_UNITS, year_units);
    } else {
        Serial.println("[Chyba] Neznámy príkaz...");
    }
}

#define sprint(...)   Serial.print(__VA_ARGS__)
#define sprintln(...) Serial.println(__VA_ARGS__)

const uint16_t samples_per_second = 1000;
const uint8_t bins                = 100;
const uint8_t samples_per_bin     = samples_per_second / bins;

volatile uint8_t gbin[bins];
volatile boolean samples_pending = false;


void paddedPrint(BCD::bcd_t n) {
    sprint(n.digit.hi);
    sprint(n.digit.lo);
}

void handleDCF77ClockState() {
    static uint8_t last_state = Clock::useless;

    uint8_t state = DCF77_Clock::get_clock_state();
    // TODO:
    // if(state == Clock::dirty) {
    //     SBI(PORTB, LED_G); // Yellow.
    // }
    if (state != Clock::useless && state != Clock::dirty) { // Vypada to ze sme synchronizovani!
        Clock::time_t now;

        CBI(DDRB, DCF_PON); // Vypneme DCF modu

        if (last_state == Clock::useless || last_state == Clock::dirty) {
            DCF77_Clock::get_current_time(now);
            uint8_t hour = bcd_to_int(now.hour);
            uint8_t minute = bcd_to_int(now.minute);
            RTC.adjust(DateTime(
                bcd_to_int(now.year),
                bcd_to_int(now.month),
                bcd_to_int(now.day),
                hour, minute, 0
            ));
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

        SBI(PORTB, LED_G);
    }

    last_state = state;
}

// We'll store the last ADC result here
volatile uint16_t measured_brightness = 0;
// Flag to indicate when a new ADC value is ready
volatile bool adc_ready = false;
volatile bool new_measurement_flag = false;
volatile uint16_t samples = 0;

uint8_t count = 0;
void loop() {
    // Cursor blinking timer
    if (blink_timer_counter >= EDIT_MODE_BLINK_F) {
        blink_timer_counter = 0;

        toggleNumitronSegment(selected_digit, SEGMENT_DP);
    }

    // Minute timer
    if (new_minute_flag) {
        new_minute_flag = false;
        onNewMinute();

        Serial.println("ANALOG ANIMS");

        for (uint8_t i = 0; i < 255; i++) {
            analogWrite(LED_R, i);
            wait(100);
        }

        wait(500);

        for (uint16_t i = 0; i < 511; i++) {
            analogWrite(LED_R, i > 255 ? 255 - (i - 256) : i);
            wait(100);
        }

        for (uint16_t i = 0; i < 511; i++) {
            analogWrite(LED_G, i > 255 ? 255 - (i - 256) : i);
            wait(30);
        }

        wait(100);
    }

    if (new_second_flag) {
        new_second_flag = false;
        handleDCF77ClockState();

        #if INA_ENABLED
            if (INA.isConnected() != false) {
                Serial.println("----------- MERANIE -------------");
                Serial.print("Napájacie napätia [V]: \t");
                Serial.println(INA.getBusVoltage(), 2);
                Serial.print("Úbytok napätia na meracom rezistore [mV]:\t\t");
                Serial.println(INA.getShuntVoltage_mV(), 2);
                Serial.print("Prúdový odber displeja [mA]:\t\t");
                Serial.println(INA.getCurrent_mA(), 2);
                Serial.println("---------------------------------");
            }
        #endif


        // while (ADCSRA & (1 << ADSC)) {}
        // // Start next async ADC conversion
        // ADCSRA |= (1 << ADSC);
        // // enable ADC interrupt
        // ADCSRA |= (1 << ADIE);

        while (ADCSRA & (1 << ADSC)) {}
        measured_brightness = analogRead(LDR_PIN_PORTC);
        Serial.println("Measured brightness: " + String(measured_brightness));

        // Compute brightness
        int brightness = max(configured_brightness - map(measured_brightness, 0, 1023, 0, configured_brightness), MINIMUM_BRIGHTNESS);
        setBrightness(brightness * 1.5);
    }

    // if (adc_ready) {
    //     adc_ready = false;
    //     // new_measurement_flag = false;

    //     Serial.println("Measured brightness: " + String(measured_brightness));

    //     // Compute brightness
    //     int brightness = max(configured_brightness - map(measured_brightness, 0, 1023, 0, configured_brightness), MINIMUM_BRIGHTNESS);
    //     setBrightness(brightness * 1.5);
    // }

    // TODO: RESET EEPROM HERE.
    if (!BIS(PIND, RESET_BUTTON)) {
        MS_mode = true;
    }

    if (Serial.available()) {
        String command = Serial.readStringUntil('\n');
        command.trim();
        Serial.println("Prikaz: " + command);
        if (command.length() > 0) {
            handleCommand(command);
        }
    }

    // handleInput();

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
//     // Serial.print("ADMUX as bits: ");
//     // for (int i = 0; i < 16; ++i) {
//     //     Serial.print(((ADMUX >> i) & 1) ? '1' : '0');
//     // }
//     // Serial.println();
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
