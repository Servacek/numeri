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
#include <dcf77.h>


#include "main.h"

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

// Byte pre konvertovanie cisiel na tvar zapisany cez 7 segmentov.
const byte NUM_SYMBOL_BYTES[] = {
    //23456789
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

// TODO: ??? https://forum.arduino.cc/t/which-library-is-best-for-ds3231-rtc/980510
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
    // OCR0A = value < default_brightness ? value : default_brightness;
    uint8_t new_brightness = value < DEFAULT_BRIGHTNESS ? value : DEFAULT_BRIGHTNESS;
    if (new_brightness != target_brightness) {
        target_brightness = new_brightness;
        Serial.println("Nový jas: " + String((target_brightness * 100) / MAX_BRIGHTNESS) + "%");
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
    if (DS3231_Present()) {
        DateTime time_now = RTC.now();
        if (MS_mode) {
            minutes_count = time_now.second() + (time_now.minute() * 60);
        } else {
            minutes_count = time_now.minute() + (time_now.hour() * 60);
        }
    } else { // Pokial modul nebude k dispozici, tak to budeme pocitat manulane.
        minutes_count++;
        if (minutes_count >= MAX_MINUTES_COUNT) {
            minutes_count = 0; // Zresetujme na 00:00 ked dosiahneme 24:00 (24 * 60)
        }
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
    const uint8_t sampled_data = analogRead(DCF_OUT) > 200;

    if (sampled_data) {SBI(PORTB, LED_R); } else { CBI(PORTB, LED_R); }
    return sampled_data;
}

void setup() {
    // Serial pre debugovanie a logging
    Serial.begin(9600);
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

    Serial.println(F("Konfigurácia PWM kanálu pre jas..."));

    cli(); // zakazeme docasne interupty

    // Zresetujeme nastavia registrov casovaca 0
    TCCR0A = 0;
    TCCR0B = 0;

    // // COM1A1 pri rychlej PWM nastavi neinvertujuci rezim
    // TCCR1A = (1 << COM1A1) | (1 << WGM11);
    // // WGM11 | WGM12 | WMG13 -> rychla PWM kde ICR1 urcuje TOP
    // // CS10 -> bez delica
    // // Fpwm = (16MHz / 500) = 32kHz (nepocutelny rozsah)
    // TCCR1B = (1 << WGM13) | (1 << WGM12) | (1 << CS10);

    // Example: Fast PWM, non-inverting on OC0A, prescaler = 1 (safe, less impact on timing)
    TCCR0A = (1 << COM0A1) | (1 << COM0A0) | (1 << WGM01) | (1 << WGM00); // inverting, WGM0[1:0]=3 => fast PWM (TOP=0xFF)
    TCCR0B = (1 << CS00); // CS00 -> prescaler 1
    // PWM frequency = 16MHz / (1 * 256) = 62 500 Hz

    //ICR0 = 499;    // Nastavime hranicu pocitadla (koniec periody)
    setBrightness(0); // Nastavime hodnotu preklopenia cyklu (zatial sa bude preklapat okamzite)
    sei(); // opat povolime interupty

    /****************************************
     * Zbernica registrov.
     ****************************************/

    Serial.println(F("Konfigurácia zbernice registrov..."));

    // Vsetky piny zbernice maju byt nastavene ako vystupne a
    //
    CBI(PORTB,  SRCK_PORTB);    SBI(DDRB,   SRCK_PORTB);
    CBI(PORTD,  RCK_PORTD);           SBI(DDRD,   RCK_PORTD);
    CBI(PORTB,  SERIN_PORTB);   SBI(DDRB,   SERIN_PORTB);

    // TODO: Musime garantovat vypnuty pull-up rezistor?
    CBI(PORTD,  _G_PORTD);            SBI(DDRD, _G_PORTD);

    /****************************************
     * Hlavny Casovac (1kHz)
     ****************************************/

    Serial.println(F("Konfigurácia časovača..."));

    cli(); // docasne zakazeme interupty

    // Zresetujeme nastavia registrov casovaca 2
    TCCR2A = 0;
    TCCR2B = 0;

    // WGM21 -> CTC rezim, zresetuje citac po dosiahnuti limitu
    TCCR2A |= (1 << WGM21);    // WGM22:0 = 010

    // CS22 -> Delic 64
    TCCR2B |= (1 << CS22);

    // Fcas = 16MHz / (64 x 250) = 1kHz
    OCR2A = 249; // nastavime limit casovaca

    // Zapne interupt, ktory sa vykona pri dosiahnuti limitu (TIMER2_COMPA_vect)
    TIMSK2 |= (1 << OCIE2A);
    TCNT2    = 0; // Zaciname pocitat od nuly.

    sei(); // opat povolime interupty

    /****************************************
     * RTC modul
     ****************************************/

    if (!RTC.begin()) {
        Serial.println(F("[Varovanie] RTC modul nebol nájdený!"));
    } else {
        if (RTC.lostPower()) {
            Serial.println(F("Nastavovanie času pre RTC modul."));
            // RTC.adjust(DateTime(F(__DATE__), F(__TIME__)));
            RTC.adjust(DateTime(2025, 8, 22, 16, 33, 0));
        }

        // Uistime sa, ze tieto veci su vypnute aby zbytocne neodoberali prud.
        RTC.disable32K();
        RTC.writeSqwPinMode(DS3231_OFF);
    }

    /****************************************
     * DCF77 modul
     ****************************************/

    CBI(DDRC, DCF_OUT);
    CBI(PORTC, DCF_OUT);

    SBI(DDRB, DCF_PON);
    CBI(PORTB, DCF_PON);

    DCF77_Clock::setup();
    DCF77_Clock::set_input_provider(sample_input_pin);

    /****************************************
     * Senzor Prudu
     ****************************************/

    Serial.println(F("Inicializácia senzora prudu..."));

    Wire.begin();
    if (INA.begin()) {
        if (!INA.isCalibrated()) {
            Serial.println(F("Prúdový senzor nie je kalibrovaný!"));
            Serial.println("Kalibrácia...");
            INA.setMaxCurrentShunt(0.6, 0.33);
        }

        wait(1000);

        Serial.println("Rozsah napájacieho napätia INA219: " + INA.getBusVoltageRange());
    } else {
        Serial.println(F("Prúdový senzor nebol nájdený!"));
    }

    /****************************************
     * IO Piny
     ****************************************/

    Serial.println(F("Inicializácia vstupno-výstupných pinov..."));

    CBI(DDRD,   LEFT_BUTTON);
    SBI(PORTD,  LEFT_BUTTON); // INPUT PULLUP
    CBI(DDRD,   RIGHT_BUTTON);
    SBI(PORTD,  RIGHT_BUTTON); // INPUT PULLUP

    // attachInterrupt(digitalPinToInterrupt(LEFT_BUTTON), onLeftButtonPressed, FALLING);
    // attachInterrupt(digitalPinToInterrupt(LEFT_BUTTON), onLeftButtonReleased, RISING);
    // attachInterrupt(digitalPinToInterrupt(RIGHT_BUTTON), onRightButtonPressed, FALLING);
    // attachInterrupt(digitalPinToInterrupt(RIGHT_BUTTON), onRightButtonReleased, RISING);

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

    Serial.println(F("Zapínanie displeja..."));

    // Uistime sa, ze registre su ciste.
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
    showDigits();
    wait(NUMBER_TRANS_DUR + 1000);
    OLD_DIGITS[DIGIT_HOR_TENS] = 0b11111111;

    Serial.println(F("Rozsviecanie segmentov numitronu č. 2"));
    DIGITS[DIGIT_HOR_UNITS] = 0b11111111;
    showDigits();
    wait(NUMBER_TRANS_DUR + 1000);
    OLD_DIGITS[DIGIT_HOR_UNITS] = 0b11111111;

    Serial.println(F("Rozsviecanie segmentov numitronu č. 3"));
    DIGITS[DIGIT_MIN_TENS] = 0b11111111;
    showDigits();
    wait(NUMBER_TRANS_DUR + 1000);
    OLD_DIGITS[DIGIT_MIN_TENS] = 0b11111111;

    Serial.println(F("Rozsviecanie segmentov numitronu č. 4"));
    DIGITS[DIGIT_MIN_UNITS] = 0b11111111;
    showDigits();
    wait(NUMBER_TRANS_DUR + 1000);
    OLD_DIGITS[DIGIT_MIN_UNITS] = 0b11111111;

    Serial.println(F("Diagnostika dokončená. Pomalý prechod na uložený čas..."));

    setBrightness(configured_brightness);

    displayTime(getTimeInMinutes());

    // // Nacitajme ulozeny cas
    // minutes_count = ((getEEConfig(HOURS) * 60) + (getEEConfig(MINUTES) * 60));
    // configured_brightness = getEEConfig(BRIGHTNESS); // Ulozeny jas ktory sa pouzije pri prvom zobrazeni.
    //displayTime(); // zobrazme ulozeny cas

    /// TODO: DCF77 synchronizacia z casom z atomovych hodin vo Frankfurte.

    SBI(PORTB, LED_G);
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

// // ------------------------------------------------

// // ----- CONFIG -----
// #define CROSSFADING_STEPS 32   // number of distinct crossfade levels
// #define CROSSFADING_WRAP  32   // temporal subdivision (higher -> finer temporal dithering)
// #define DIGIT_STAGGER     1    // per-digit stagger in phase steps (tweak to taste)

// // A perceptual (warm) progression: slow at start/end, faster in middle.
// // Values are "new frames" out of CROSSFADING_WRAP (0..CROSSFADING_WRAP)
// const uint8_t CROSSFADING_FLIP_VALUES[CROSSFADING_STEPS] PROGMEM = {
//   0, 1, 1, 2, 2, 2, 3, 4,
//   5, 6, 8, 9,10,12,14,15,
//  16,18,20,22,23,24,26,27,
//  28,28,28,29,29,30,31,32,
// };

// // ----- STATE -----
// static uint8_t crossfade_step = 0;       // 0..CROSSFADING_STEPS-1 (progress index)
// static uint8_t crossfade_phase = 0;      // 0..CROSSFADING_WRAP-1 (temporal phase)
// static uint16_t crossfade_tick = 0;      // counts timer ticks between step advances
// // crossfading flag is assumed to exist already: crossfading = true/false

// // temp buffer used to build the frame we will push out
// uint8_t temp_digits[DIGIT_COUNT];

// void showCrossfadeFrame(void) {
//     // read duty level for current progress step (how many of WRAP slots show NEW)
//     uint8_t duty = pgm_read_byte(&CROSSFADING_FLIP_VALUES[crossfade_step]); // 0..WRAP

//     // for each digit choose whether to display NEW or OLD depending on
//     // (phase + per-digit-stagger) mod WRAP < duty
//     for (uint8_t i = 0; i < DIGIT_COUNT; i++) {
//         // stagger makes digits change at slightly different times — softer visual result
//         uint8_t phase = (crossfade_phase + (i * DIGIT_STAGGER)) & (CROSSFADING_WRAP - 1); // assume WRAP is power of two
//         if (phase < duty) {
//             temp_digits[i] = DIGITS[i];     // show new
//         } else {
//             temp_digits[i] = OLD_DIGITS[i]; // show old
//         }
//     }

//     // push the composed frame to hardware (your existing routines)
//     putDigitsToInputRegs(temp_digits, DIGIT_COUNT);
//     pushToOutputRegs();

//     // advance temporal phase; wraps 0..CROSSFADING_WRAP-1
//     crossfade_phase++;
//     if (crossfade_phase >= CROSSFADING_WRAP) crossfade_phase = 0;
// }

// void handleCrossfadeStepAdvance(void) {
//     // called when it's time to advance the crossfade progress (slower)
//     if (crossfade_step + 1 < CROSSFADING_STEPS) {
//         crossfade_step++;
//     } else {
//         // finished
//         crossfading = false;
//         crossfade_step = 0;
//         crossfade_phase = 0;
//         crossfade_tick = 0;
//         // ensure final state is the new digits
//         putDigitsToInputRegs(DIGITS, DIGIT_COUNT);
//         pushToOutputRegs();
//     }
// }

// Prerusenie sa spusti kazdu ms (1KHz)
// TODO: Logaritmicke zvysovanie jasu namiesto linearneho.
ISR(TIMER2_COMPA_vect) {
    Internal::Generic_1_kHz_Generator::isr_handler();

    if (edit_mode && blink_timer_counter < EDIT_MODE_BLINK_F) { // Ak sme v edit mode, blikaj desatinnou ciarkou.
        blink_timer_counter++;
    }

    // if (number_transition) { // Ak prechadzame z jednoho cisla na druhe, postupne zvysuj jas.
    //     //Serial.println("TRANS CYCLE");
    //     if (OCR0A >= configured_brightness) {
    //         stopNumberTransition(); // Dosiahli sme zvoleny jas, koniec prechodu.
    //     } else {
    //         brightness_counter++;
    //         if (brightness_counter >= NUMBER_TRANS_PER) {
    //             setBrightness(OCR0A + 1);
    //             brightness_counter = 0;
    //         }
    //     }
    // }

    if (lbutton_debouncing && lbutton_debounce_timer < 255) { lbutton_debounce_timer++; }
    if (rbutton_debouncing && rbutton_debounce_timer < 255) { rbutton_debounce_timer++; }

    if (last_lbutton_state == PRESSED) {
        lbutton_longpress_timer++;
        if (lbutton_longpress_timer > LONG_PRESS_DELAY) {
            was_lbutton_longpressed = true;
            //onLeftButtonLongPressed();
        } else {
            lbutton_longpress_timer++;
        }
    }

    if (last_rbutton_state == PRESSED) {
        if (rbutton_longpress_timer > LONG_PRESS_DELAY) {
            was_rbutton_longpressed = true;
            //onRightButtonLongPressed();
        } else {
            rbutton_longpress_timer++;
        }
    }

    // Ak su obe tlacitka dlho stlacene
    if (was_rbutton_longpressed && was_lbutton_longpressed) {
        //onBothButtonsLongPressed();
    }

    timer_counter++;
    if (timer_counter % 1000 == 0) {
        new_second_flag = true;
    }
    if (timer_counter >= 60000) {
    // if (timer_counter >= 5000) { // Pre testovacie ucely kazdu sekundu
        new_minute_flag = true;
        timer_counter = 0;
    }

    if (ms_ticks > 0) {
        ms_ticks--;
    }

    if (target_brightness != OCR0A) {
        brightness_counter++;
        if (brightness_counter > NUMBER_TRANS_PER) {
            if (target_brightness > OCR0A) {
                OCR0A++;
            } else {
                OCR0A--;
            }
            brightness_counter = 0;
        }
    } else {
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

    // if (crossfading) {
    //     showCrossfadeFrame();              // quick, executed at your normal refresh rate
    //     crossfade_tick++;
    //     if (crossfade_tick >= NUMBER_TRANS_PER) {
    //         crossfade_tick = 0;
    //         handleCrossfadeStepAdvance();// advance the visual progress (slower)
    //     }
    // }
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

void loop() {
    if (blink_timer_counter >= EDIT_MODE_BLINK_F) {
        toggleNumitronSegment(selected_digit, SEGMENT_DP);
        blink_timer_counter = 0;
    }

    if (new_minute_flag) {
        new_minute_flag = false;
        onNewMinute();
    }

    Clock::time_t now;
    if (new_second_flag) {
        new_second_flag = false;

        SBI(PORTB, LED_B);
        wait(200);
        CBI(PORTB, LED_B);

        DCF77_Clock::get_current_time(now);
        if (now.month.val > 0) { // Vypada to ze sme synchronizovani!
            SBI(PORTB, LED_G);
        }
    }

    // uint16_t measured_brightness = analogRead(A1);
    // // Serial.println("measured_brightness: " + String(measured_brightness));
    // setBrightness(max(configured_brightness - map(measured_brightness, 0, 1023, 0, configured_brightness), MINIMUM_BRIGHTNESS) * 1.5);

    // TODO: RESET EEPROM HERE.
    if (!BIS(PIND, RESET_BUTTON)) {
        MS_mode = true;
    }

    counter++;
    if (counter > 10000) {
        counter = 0;
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
    }

    handleInput();
}
