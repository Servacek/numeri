#ifndef NUMITRON_CLOCK_H
#define NUMITRON_CLOCK_H


#include <avr/pgmspace.h> // PROGMEM
#include <avr/eeprom.h> // eeprom_read_byte

// #include <EEPROM.h>
#include <util/atomic.h> // ATOMIC_BLOCK

#include <avr/sleep.h> // kvoli "sleep_enable", "sleep_cpu", "sleep_disable"...

#define DEBUG_MODE          1

#undef F_CPU
#define F_CPU 16000000UL    // Pouzivame 16 MHz crystal (nastavme to explicitne)

// IO - Piny

#define RESET_BUTTON        PD4
#define L_BTN               PD3
#define R_BTN               PD2

#define L_BTN_MASK          (1 << L_BTN)
#define R_BTN_MASK          (1 << R_BTN)
#define BTN_MASK            (L_BTN_MASK | R_BTN_MASK)

// R, G - Timer 1
// B - Timer 2
#define LED_R               PB1 // (9 - 8)
#define LED_G               PB2 // (10 - 8)
#define LED_B               PB3 // (11 - 8)
// Rozhodli sme sa nepouzit, implementacia bude cisto softverova.
// !! Treba sa uistit, ze trimmer je nastaveny na najvyssiu hodnotu.
#define LED_BRIGHTNESS_TRIM PC0

#define DCF_OUT             PC3 // A3
#define DCF_PON             PB5 // (13 - 8)

#define LDR_PIN_PORTC       PC1 // A1

// Tieto piny su uz pevne dane hardverom.
#define SERIN_PORTB         PB4 // (12 - 8)
#define SRCK_PORTB          PB0 // (8 - 8)
// !! Tento pin nikdy nemoze byt nastaveny na LOW.
#define _G_PORTD            PD5
#define RCK_PORTD           PD7

#define SEGMENT_DP          7
#define DIGIT_COUNT         4

// Potrebne kroky k tomuto nastaveniu:
// 1. Zakomentovat "framework = arduino" v platformio.ini
// 2. Vymazat "build" priecinok
#define ARDUINO_FRAMEWORK   1

// Serial moze robit bordel ak programujeme cez UART zbernicu.
#define SERIAL_ENABLED      1
#define RTC_ENABLED         0
#define INA_ENABLED         0
#define DISPLAY_ENABLED     1
#define DCF77_ENABLED       1
#define CRSF_ENABLED        1

// Rezimi (indexi bitov)
#define MODE_NORM           0
#define MODE_EDIT           1
#define MODE_CRSF           2
#define MODE_DIAG           3
#define MODE_BOOT           4

// Flagy (indexi bitov)
#define FLAG_NEW_SECOND     0
#define FLAG_NEW_MINUTE     1
#define FLAG_DCF_LEDONN     2
#define FLAG_DCF_LEDOFF     3
#define FLAG_CRSF_DEFFERED  4
#define FLAG_BOTH_BTNS_LONG 5
#define FLAG_LONG_BTN_PRS   6

#define MASK_BTN_FLAGS      ((1 << FLAG_BOTH_BTNS_LONG) | (1 << FLAG_LONG_BTN_PRS))
#define MASK_DCF_LED_FLAGS  ((1 << FLAG_DCF_LEDONN) | (1 << FLAG_DCF_LEDOFF))

// Zalezi na nastavenom napati, mi pouzivame zvycajne napatie okolo 2.5V
// takze by hodnota logickej 1 mala byt okolo 500.
#define DCF77_ADC_THRESHOLD 250
#define CLOCK_DRIFT_HZ      1800

#define SUPPLY_VOLTAGE      5
#define MAX_DISPLAY_VOLTAGE (2.5f) // pri trojke zacina krivka exponencialne rast.

// TODO: Po dokonceni vyvoja, nahradit tieto vypocty za predpocitane konstanty.

// Podla merani 150 ani 250 kHz, nefunguje s prijimacom.
// Pri 350 je to pouzitelne, 500, bez problemov.
#define PWM_FREQUENCY_KHZ   350 // MAX = 8000, MIN = ~65

// f = 16MHz / TOP * PRESCALER, kde PRESCALER = 1 => f = 16Mhz / TOP
// z toho vyplyva: TOP = 16MHz / f

#define DISPLAY_PWM_REG     OCR0B
#define DISPLAY_PWM_TOP     MAX(MIN((16000 / PWM_FREQUENCY_KHZ), 255), 2)
#define START_DISPLAY_PWM() TCCR0A = (1 << WGM00) | (1 << WGM01) | (1 << COM0B1) | (1 << COM0B0); \
                            TCCR0B = (1 << WGM02) | (1 << CS00);
#define STOP_DISPLAY_PWM()  TCCR0A = 0; \
                            TCCR0B = 0;
#define IS_DISPLAY_PWM_ON() (TCCR0A && TCCR0B)

// Realne maximum je samozrejme DISPLAY_PWM_TOP ale to by znamelo celych 5V pre numitrony
// co je nad maximalnu hodnotu stanovenu v dokumentacii (4.5V).
// Takze mame hardverove maximum (DISPLAY_PWM_TOP) a softverove maximum (MAX_BRIGHTNESS).
#define MAX_BRIGHTNESS     (uint8_t)(DISPLAY_PWM_TOP * (MAX_DISPLAY_VOLTAGE / SUPPLY_VOLTAGE))
// #if DEBUG_MODE
//     #undef MAX_BRIGHTNESS
//     #define MAX_BRIGHTNESS  20
// #endif
// 127 -> ~2.5V
// DEFAULT_BRIGHTNESS = 0.625 -> 19% jas
// MAX -> 3.15V -> 22.5 mA
// Pri 19% jase odber -> ~4 mA na segment
// 19% -> 1,7 mA na segment => 100% -> 8,77 mA
#define DEFAULT_BRIGHTNESS  MAX((MAX_BRIGHTNESS / 6), 1)
#define MINIMUM_BRIGHTNESS  MAX((MAX_BRIGHTNESS / 10), 1)
#define BRIGHTNESS_STEP     MAX((DEFAULT_BRIGHTNESS / 5), 1)

// Minimalna doba trvania zmeny jasu z MIN na MAX.
#define NUMBER_TRANS_DUR    4096 // ms
// Treba sa uistit, ze tato hodnota nie je nad 255, inak by sme sa k nej nikdy nedostali.
// #define BRIGHTNESS_CNT_TOP  (NUMBER_TRANS_DUR / (MAX_BRIGHTNESS - MINIMUM_BRIGHTNESS))
#define BRIGHTNESS_CNT_TOP  MIN(NUMBER_TRANS_DUR / (MAX_BRIGHTNESS - MINIMUM_BRIGHTNESS), 255)
// Cim mensia hodnota, tym rychlejsie preklapanie.
#define CROSSFADING_PERIOD    20
#define NUMBER_TRANS_PER        (uint8_t)(NUMBER_TRANS_DUR / CROSSFADING_PERIOD)
#define NUMBER_TRANS_PER_EDIT    (NUMBER_TRANS_PER / 6)

// Kazda LED-ka ma svoj rezistor:
// R: 420 R, G: 620 R, B: 620 R
#define MAX_LED_BRIGHTNESS  255
#define DEFAULT_LED_BRIGHTNESS (MAX_LED_BRIGHTNESS / 4)
#define LED_R_REG           OCR1A
#define LED_G_REG           OCR1B

#define DIGIT_MIN_ONES      3
#define DIGIT_MIN_TENS      2
#define DIGIT_HOR_ONES      1
#define DIGIT_HOR_TENS      0

// KED DEBUGUJEME S NANO
// #define DIGIT_MIN_ONES      0
// #define DIGIT_MIN_TENS      1
// #define DIGIT_HOR_ONES      2
// #define DIGIT_HOR_TENS      3


// #define DIGIT_MASK          0b01111111 // mask non-digit segments

#define EDIT_MODE_BLINK_F   200 // ms

#define LONG_PRESS_DELAY    2000 // ms

#define COMMAND_BUFFER_SIZE 64

#define ON                  1
#define OFF                 0

#define PRESSED             0
#define RELEASED            1

#define SECOND_MILLIS       1000
#define MINUTE_MILLIS       60000
#define MAX_MINUTES_COUNT   59
#define MAX_HOURS_COUNT     24
#define MAX_HOURS_TENS      2

#define SERIAL_BANDWIDTH    115200

#define INA219_ADDR         0x40
#define DS3231_ADDR         0x68

#define CRITICAL_SECTION    ATOMIC_BLOCK(ATOMIC_RESTORESTATE)

#define LONG_PRESS_CNT_TOP  750
#define DEBOUNCE_CNT_TOP    64

// DCF77 kniznica si definuje svoje vlastne funkcie s rovnakym nazvom, ktore funguje uplne rovnako.
#if !DCF77_ENABLED
#if SERIAL_ENABLED
    #include <HardwareSerial.h>

    #define sprint(...)     Serial.print(__VA_ARGS__)
    #define sprintln(...)   Serial.println(__VA_ARGS__)
#else
    #define sprint(...)
    #define sprintln(...)
#endif
#endif

// Bit helpers
#define BIS(reg, bit)       (reg & (1 << bit))
#define SBI(reg, bit)       (reg |= (1 << bit))
#define CBI(reg, bit)       (reg &= ~(1 << bit))
// Move bit (value) to bit in register.
#define MBI(reg, bit, val)  (val ? SBI(reg, bit) : CBI(reg, bit))

#define MIN(a, b)           (((a) < (b)) ? (a) : (b))
#define MAX(a, b)           (((a) > (b)) ? (a) : (b))

// Vychadzame z toho, ze vsetky tri tlacitka (LBTN, RBTN aj RSTBTN) su na porte D.
#define IS_PRESSED(btn)     (!BIS(PORTD, btn))

#define PROGMEM_READ(addr, index) ((uint8_t)pgm_read_byte_near(addr + index))

// Nase hodiny maju len 4 cifry, takze toto je hardcodnute pre efektivitu.
#define COPY_DIGIT_BUFFER(src, dst) dst[0] = src[0]; dst[1] = src[1]; dst[2] = src[2]; dst[3] = src[3]
#define COMPARE_DIGIT_BUFFERS(a, b) (a[0] == b[0] && a[1] == b[1] && a[2] == b[2] && a[3] == b[3])

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

// const uint8_t CROSSFADING_FLIP_VALUES[] PROGMEM = {
//   20, 18, 16, 14, 13, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1
// };

#define LED_B_TOP_REG ((uint8_t)255)
#define LED_B_STEP    ((uint8_t)16) // 16 steps

volatile uint8_t LED_B_REG = 0;
volatile uint8_t LED_B_CNT = 0;

#define NUM_SYMBOL_COUNT    14

// Segmenty numitronu (v registry su cislovane naopak)
// S1 - je spolocny (+)
#define S2 (1 << 7) // desatinna ciarka
#define S3 (1 << 6)
#define S4 (1 << 5)
#define S5 (1 << 4)
#define S6 (1 << 3)
#define S7 (1 << 2)
#define S8 (1 << 1)
#define S9 (1 << 0)

/*
 *  /|5|\
 * |6| |3|
 *  +|7|+
 * |9| |4|
 *  \|8|/
 *      /2\
 */

// uint8_t pre konvertovanie cisiel na tvar zapisany cez 7 segmentov.
const uint8_t SEGMENT_SYMBOL[NUM_SYMBOL_COUNT] PROGMEM = {
    S3 | S4 | S5 | S6 | S8 | S9,            // 0
    S3 | S4,                                // 1
    S3 | S5 | S7 | S8 | S9,                 // 2
    S3 | S4 | S5 | S7 | S8,                 // 3
    S3 | S4 | S6 | S7,                      // 4
    S4 | S5 | S6 | S7 | S8,                 // 5
    S4 | S5 | S6 | S7 | S8 | S9,            // 6
    S3 | S4 | S5,                           // 7
    S3 | S4 | S5 | S6 | S7 | S8 | S9,       // 8
    S3 | S4 | S5 | S6 | S7 | S8,            // 9

    // Special symbols
    S3 | S5 | S6 | S7,                      // °
    S7,                                     // -
    S5 | S6 | S8 | S9,                      // C

    S2 | S3 | S4 | S5 | S6 | S7 | S8 | S9, // 8, - Vsetky symboli zapnute (pre diagnostiku)
};

#define GET_SEGMENT_SYMBOL(symbol) ((uint8_t)pgm_read_byte_near(SEGMENT_SYMBOL + (symbol)))

#define DEGREE_SYMBOL 10
#define MINUS_SYMBOL  11
#define C_SYMBOL      12
#define ALL_ON_SYMBOL 13

uint8_t PREV_STABLE_REG  = BTN_MASK;
uint8_t STABLE_REG       = BTN_MASK;
uint8_t TEMP_REG         = BTN_MASK;

volatile uint8_t debounce_cnt       = DEBOUNCE_CNT_TOP;
volatile uint16_t long_press_cnt    = LONG_PRESS_CNT_TOP;

volatile uint16_t ms_ticks = 0; // must be volatile because ISR updates it

static void wait(uint16_t ms) {
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
uint8_t DIGITS[] = {0, 0, 0, 0};
// uint8_t OLD_DIGITS[] = {0, 0, 0, 0};
// volatile uint8_t OLD[][4] = {
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},

//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},{0, 0, 0, 0},
//     {0, 0, 0, 0},{0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},{0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},

//     {0, 0, 0, 0},    {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},    {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},    {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},    {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},    {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},    {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},    {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},    {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},    {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},    {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},
//     {0, 0, 0, 0},

// };

// Register aktualneho režimu.
volatile uint8_t MODE = 0;
volatile uint8_t FLAG = 0;

uint8_t selected_digit = DIGIT_HOR_TENS; // Zaciname nastavovat cas od hodin.

volatile uint8_t configured_brightness = DEFAULT_BRIGHTNESS; // Pre aplikovaný jas pozri register PWM_REGISTER
volatile uint8_t led_brightness = DEFAULT_LED_BRIGHTNESS;
// POZOR: Tato hodnota by sa nikdy nemala nastavovat priamo!!
volatile uint8_t _target_brightness = 0;
volatile uint8_t minimum_brightness = MINIMUM_BRIGHTNESS;

// --------------------------------------
// K tymto sice pristupujeme aj v preruseni aj mimo neho ale
// nikdy nie z oboch miest naraz.

// Celkova dlzka jedneho celeho cyklu crossfadingu (stare zapnute + nove zapnute)
// Na zaciatku prechodu su stare cisla zapnute po celu dobu periody.
uint8_t crsf_duty = CROSSFADING_PERIOD;
// Po kolkych milisekundach mame posunut duty cyklus o jeden krok,
// kde duty cyklus je doba kedy svietia stare cisla, inak svitia nove.
uint8_t crsf_duty_step_counter = NUMBER_TRANS_PER;
// Doba kedy svietia stare cisla.
uint8_t crsf_cycle_counter  = 0;
// --------------------------------------

// Jediny volny casovac je Timer1
void SET_LED_COLOR(uint8_t led, uint8_t val) {
    const uint8_t digital = val == 0 || val == 255;
	if (val == 0) {
		CBI(PORTB, led);
    } else if (val == 255) {
		SBI(PORTB, led);
	}

    switch(led)
    {
        case LED_R: // pin PD9
            MBI(TCCR1A, COM1A1, !digital); OCR1A = val;
            break;
        case LED_G: // pin PD10
            MBI(TCCR1A, COM1B1, !digital); OCR1B = val;
            break;
        case LED_B: // pin PD11 (na casovaci 2 ktory je zabrany, takze pouzivame softverovu PWM)
            LED_B_REG = digital ? 0 : val;
            break;
        default:
            break;
    }
}

void SET_ALL_CLR_BRIGHT(uint8_t val) {
    SET_LED_COLOR(LED_R, val);
    SET_LED_COLOR(LED_G, val);
    SET_LED_COLOR(LED_B, val);
}

// TODO: Maybe not even needed at all?
// volatile uint8_t blink_timer_counter = 0;

#if DEBUG_MODE
uint8_t MS_mode = 0;
#endif

uint8_t t_counter_hours     = 0;
uint8_t t_counter_minutes   = 0;

#endif // NUMITRON_CLOCK_H
