/*
 * pins.h
 *
 *  Piny pre konfiguraciu vstupov a vystupov.
 */

#ifndef PINS_H
#define PINS_H

#include <avr/io.h>
#include <stdint.h>

// IO - Piny

#define L_BTN           PD3
#define R_BTN           PD2

#define RESET_BUTTON    PD4

#define DCF_OUT         PC3 // A3
#define DCF_PON         PB5 // (13 - 8)

#define LDR_PIN_PORTC   PC1 // A1

#define SERIN_PORTB     PB4 // (12 - 8)
#define SRCK_PORTB      PB0 // (8 - 8)
// !! Tento pin nikdy nemoze byt nastaveny na LOW.
#define _G_PORTD        PD5
#define RCK_PORTD       PD7

////////////////////////////////////

// Nastavy zadany pin na definovanu logicku hodnotu.
// Nastavujeme mod INPUT s pull-up rezistorom (~50K) takze logicka hodnota je "slaba",
// ale toto je asi ten najlepsi kompromis medzi bezpecnostou a odolnostou proti ruseniu.
#define UNUSED_PIN(port, pin)                                                  \
    do {                                                                       \
        DDR##port &= ~(1 << pin);                                              \
        PORT##port |= (1 << pin);                                              \
    } while (0)

#define SAVE_ADC_MODE()                                                        \
    const uint8_t _saved_admux  = ADMUX;                                       \
    const uint8_t _saved_adcsra = ADCSRA;                                      \
    const uint8_t _saved_adcsrb = ADCSRB;

// ! KRITICKE PORADIE: ADCSRB musi byt obnovene PRED ADCSRA.
// Dovod: ak bol aktivny komparatorovy rezim (_saved_adcsrb ma ACME=1)
// a my najprv zapiseme ADCSRA s ADEN=1, nastane okno kde ACME=1 a ADEN=1
// existuju sucasne. Podla datasheetu ATmega328P §23.3: ked ACME=1 a ADEN=1,
// komparator pouziva AIN1 namiesto ADC multiplexora — vznika spurious ACO
// glitch ktory DCF77 ISR moze zachytit ako platny signal.
#define RESTORE_ADC_MODE()                                                     \
    ADCSRB = _saved_adcsrb;                                                    \
    ADCSRA = _saved_adcsra;                                                    \
    ADMUX  = _saved_admux;

////////////////////////////////////

static inline void COMPARATOR_ADC_MODE(uint8_t channel) {
    ADCSRA &= ~(1 << ADEN);                    // Vypneme ADC
    ADCSRB |= (1 << ACME);                     // Zapneme multiplexor
    ADMUX = (ADMUX & 0xF0) | (channel & 0x07); // Vyberieme kanal.
}

static inline void NORMAL_ADC_MODE() {
    ADCSRB &= ~(1 << ACME); // Vypneme multiplexor
    ADCSRA |= (1 << ADEN);  // Zapneme ADC
}

// Priame citanie ADC na ATmega328P.
// channel: cislo ADC kanalu (0-7), zodpoveda Arduino A0-A7.
// Predpoklada, ze ADC je uz v normalnom rezime (ADEN=1).
static inline uint16_t _ADC_READ(uint8_t channel) {
    // REFS0=1, REFS1=0 -> AVCC ako referencie (~5V).
    // Pouzivame vzdy AVCC pretoze AREF pin nie je na nasej DPS pouzity.
    ADMUX = (1 << REFS0) | (channel & 0x0F);

    // Zahodime prvu konverziu po prepnuti kanalu — S/H kondenzator potrebuje
    // cas na nabiti na novy vstup (podla datasheetu).
    ADCSRA |= (1 << ADSC);
    while (ADCSRA & (1 << ADSC));

    // Druha konverzia je presna.
    ADCSRA |= (1 << ADSC);
    while (ADCSRA & (1 << ADSC));

    return ADC; // 10-bitovy vysledok, 0-1023
}

static inline uint16_t ADC_READ_AND_RESTORE_MODE(const uint8_t channel)  {
    SAVE_ADC_MODE();
    NORMAL_ADC_MODE();
    const uint16_t value = _ADC_READ(channel);
    RESTORE_ADC_MODE();
    return value;
}

#endif // PINS_H
