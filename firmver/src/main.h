#ifndef NUMITRON_CLOCK_H
#define NUMITRON_CLOCK_H


#include <Arduino.h>
#include <EEPROM.h>
#include <util/atomic.h>

#define DEBUG_MODE          1

// IO - Piny

#define RESET_BUTTON        PD4
#define L_BTN               PD3
#define R_BTN               PD2

// R, G - Timer 1
// B - Timer 2
#define LED_R               PB1 // (9 - 8)
#define LED_G               PB2 // (10 - 8)
#define LED_B               PB3 // (11 - 8)
// Rozhodli sme sa nepouzit, implementacia bude cisto softverova.
//#define LED_BRIGHTNESS_TRIM PC0

#define DCF_OUT             PC3 // A3
#define DCF_PON             PB5 // (13 - 8)

#define LDR_PIN_PORTC       PC1 // A1

// Tieto piny su uz pevne dane hardverom.
#define SERIN_PORTB         PB4 // (12 - 8)
#define SRCK_PORTB          PB0 // (8 - 8)
#define _G_PORTD            PD5
#define RCK_PORTD           PD7

#define SEGMENT_DP          7
#define DIGIT_COUNT         4

#define SERIAL_ENABLED      1
#define RTC_ENABLED         1
#define INA_ENABLED         0
#define DISPLAY_ENABLED     1
#define DCF77_ENABLED       1

// Rezimi
#define MODE_NORM           0
#define MODE_EDIT           (1 << 0)
#define MODE_CRSF           (1 << 1)
#define MODE_DIAG           (1 << 2)

// Zalezi na nastavenom napati, mi pouzivame zvycajne napatie okolo 2.5V
// takze by hodnota logickej 1 mala byt okolo 500.
#define DCF77_ADC_THRESHOLD 400

// Realne maximum je samozrejme 255 ale to by znamelo celych 5V pre numitrony
// co je nad maximalnu hodnotu stanovenu v dokumentacii.
// Takze mame hardverove maximum a softverove maximum.
#define MAX_BRIGHTNESS      70 // 127 Vo phase-correct mode inak 160
// 127 -> ~2.5V
// DEFAULT_BRIGHTNESS = 0.625 -> 19% jas
// MAX -> 3.15V -> 22.5 mA
// Pri 19% jase odber -> ~4 mA na segment
// 19% -> 1,7 mA na segment => 100% -> 8,77 mA
//
#define DEFAULT_BRIGHTNESS  (MAX_BRIGHTNESS / 4)
#define MINIMUM_BRIGHTNESS  (MAX_BRIGHTNESS / 10)
#define DISPLAY_PWM_REG     OCR0B
#define DISPLAY_PWM_TOP     100

// Minimalna doba trvania zmeny jasu z MIN na MAX.
#define NUMBER_TRANS_DUR    4096 // ms
#define BRIGHTNESS_CNT_TOP  (NUMBER_TRANS_DUR / (MAX_BRIGHTNESS - MINIMUM_BRIGHTNESS))
// Cim mensia hodnota, tym rychlejsie preklapanie.
#define CROSSFADING_WRAP    32
#define NUMBER_TRANS_PER    (NUMBER_TRANS_DUR / CROSSFADING_WRAP)
#define NUMBER_TRANS_PER_EDIT    (NUMBER_TRANS_PER / 3)

#define MAX_LED_BRIGHTNESS  255
#define DEFAULT_LED_BRIGHTNESS (MAX_LED_BRIGHTNESS / 2)
#define LED_R_REG           OCR1A
#define LED_G_REG           OCR1B

#define DIGIT_MIN_UNITS     3
#define DIGIT_MIN_TENS      2
#define DIGIT_HOR_UNITS     1
#define DIGIT_HOR_TENS      0

#define DIGIT_MASK          0b01111111 // mask non-digit segments

#define EDIT_MODE_BLINK_F   200 // ms

#define LONG_PRESS_DELAY    2000 // ms

#define ON                  1
#define OFF                 0

#define PRESSED             0
#define RELEASED            1

#define NUM_SYMBOL_COUNT    10

#define SECOND_MILLIS       1000
#define MINUTE_MILLIS       (60 * SECOND_MILLIS)
#define MAX_MINUTES_COUNT   (24 * 60)

#define SERIAL_BANDWIDTH    115200

#define INA219_ADDR         0x40
#define DS3231_ADDR         0x68

#define CRITICAL_SECTION    ATOMIC_BLOCK(ATOMIC_RESTORESTATE)

#define LONG_PRESS_CNT_TOP  750
#define DEBOUNCE_CNT_TOP    64

#define L_BTN_BIT           (1 << 2)
#define R_BTN_BIT           (1 << 3)
#define BTN_MASK            (L_BTN_BIT | R_BTN_BIT)

#if SERIAL_ENABLED
    #define sprint(...)     Serial.print(__VA_ARGS__)
    #define sprintln(...)   Serial.println(__VA_ARGS__)
#else
    #define sprint(...)
    #define sprintln(...)
#endif

// trvanie = 1 / 16 000 000 = 6,25 * 10^-8 s = 62,5 ns
#define NOP __asm__ __volatile__ ("nop\n\t")

// Bit helpers
#define BIS(reg, bit)       (reg & (1 << bit))
#define SBI(reg, bit)       (reg |= (1 << bit))
#define CBI(reg, bit)       (reg &= ~(1 << bit))

// Vychadzame z toho, ze vsetky tri tlacitka (LBTN, RBTN aj RSTBTN) su na porte D.
#define IS_PRESSED(btn)     (!BIS(PORTD, btn))

#define PROGMEM_READ(addr, index) ((uint8_t)pgm_read_byte_near(addr + index))

#define UNUSED_PIN(port, pin) do { \
    DDR##port  |=  (1 << pin); \
    PORT##port &= ~(1 << pin); \
} while (0)

#if RTC_ENABLED
#include <Wire.h>
#include <RTCLib.h>
#endif

#if INA_ENABLED
#include <INA219.h>
#endif

#if DCF77_ENABLED
#include <dcf77.h>
#endif

// const byte CROSSFADING_FLIP_VALUES[] PROGMEM = {
//   20, 18, 16, 14, 13, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1
// };

enum CONFIG {
  HOURS,
  MINUTES,
  BRIGHTNESS,
  GENERAL, // bit positions according to CONFIG_GENERAL
};

enum CONFIG_GENERAL {
  M12_24,        // 12/24h mode
  TRAILLING_ZERO, // show leading tens-hour zero
  NIGHT_MODE_ENABLED,
  NIGHT_MODE_TYPE,
};

// inline void SET(uint8_t pin, bool state) {
//     if (pin < 0) {
//         return;
//     }

//     if (pin <= 7) {
//         if (state) {
//             SBI(PORTD, pin);
//         } else {
//             CBI(PORTD, pin);
//         }
//     } else if (pin <= 13) {
//         if (state) {
//             SBI(PORTB, pin - 8);
//         } else {
//             CBI(PORTB, pin - 8);
//         }
//     } else if (pin <= A6) {
//         if (state) {
//             SBI(PORTC, pin - A0);
//         } else {
//             CBI(PORTC, pin - A0);
//         }
//     }
// }

#define LED_B_TOP_REG 255
#define LED_B_STEP    16 // 16 steps

volatile uint8_t LED_B_REG = 0;
volatile uint8_t LED_B_CNT = 0;

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
// Byte pre konvertovanie cisiel na tvar zapisany cez 7 segmentov.
const byte NUM_SYMBOL_BYTES[] PROGMEM = {
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

volatile uint8_t PREV_STABLE_REG  = BTN_MASK;
volatile uint8_t STABLE_REG       = BTN_MASK;
volatile uint8_t TEMP_REG         = BTN_MASK;
volatile uint8_t BOTH_FLAG        = 0;

volatile uint8_t debounce_cnt = DEBOUNCE_CNT_TOP;
volatile uint16_t long_press_cnt = LONG_PRESS_CNT_TOP;

volatile uint16_t ms_ticks = 0; // must be volatile because ISR updates it

inline void wait(uint16_t ms) {
    ms_ticks = ms;

    set_sleep_mode(SLEEP_MODE_IDLE);
    sleep_enable();

    while (ms_ticks > 0) {
        sleep_cpu(); // CPU sleeps until interrupt
    }

    sleep_disable();
}

#if RTC_ENABLED
RTC_DS3231 RTC;
#endif

#if INA_ENABLED
INA219 INA(INA219_ADDR);
#endif

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

// Sem ulozime bajty ktore zobrazujeme,
// lebo ked chceme upravit len jedno cislo ostatne cisla si musime pamatat.
byte DIGITS[] = {0, 0, 0, 0};
byte OLD_DIGITS[] = {0, 0, 0, 0};

// Register aktualneho režimu.
volatile uint8_t MODE = 0;
volatile uint8_t selected_digit = 0; // V zaklade mame vybratu prvu cifru.

volatile uint8_t configured_brightness = DEFAULT_BRIGHTNESS; // Pre aplikovaný jas pozri register PWM_REGISTER
volatile uint8_t led_brightness = DEFAULT_LED_BRIGHTNESS;
// POZOR: Tato hodnota by sa nikdy nemala nastavovat priamo!!
volatile uint8_t _target_brightness = 0;
volatile uint8_t minimum_brightness = MINIMUM_BRIGHTNESS;

volatile uint8_t digit_flipper = 20;

uint8_t crossfade_step_counter = 0;
volatile uint8_t crossfade_flip_counter = 0;

volatile uint8_t blink_timer_counter = 0;
volatile uint16_t brightness_counter = 0;

#if DEBUG_MODE
volatile bool MS_mode = false;
#endif

volatile uint16_t minutes_count = 0;

// ---- Function prototypes (public API used across translation units) ----

// EEPROM helpers
byte getEEConfig(uint8_t address);
void setEEConfig(uint8_t address, byte value);
void saveEEConfig();

// Editing / display helpers
void enterEditMode();
void exitEditMode();
uint8_t getSelectedNumSymbolIndex(uint8_t digit);

void configBrightness(uint8_t value);
void setBrightness(uint8_t value);

// Low-level segment/register control
void setNumitronSegment(uint8_t digit, uint8_t index, bool state);
void toggleNumitronSegment(uint8_t digit, uint8_t index);
void setSelectedDigit(uint8_t digit);
void putDigitsToInputRegs(byte* digits, uint8_t n);
void pushToOutputRegs();
void showDigits();

// Time / display logic
void displayTime(uint16_t time_in_minutes);
void onNewMinute();

// Diagnostics
void startDiagnostics();
void stopDiagnostics();

void handleInput();

// Standard Arduino entry points (implemented in sketch)
void setup();
void loop();

#endif // NUMITRON_CLOCK_H
