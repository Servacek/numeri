#ifndef ISR_H
#define ISR_H

#include <avr/interrupt.h>

#include "main.h"

// Pouzivame to aj v hlavnom loope, takze musi byt "volatile"
volatile uint16_t timer_counter = 0; // Pocita do 60 000 - 1 minuta v ms
static uint8_t brightness_counter      = 0; // Pouzivane len v ISR

uint8_t _fade_out_buffer[] = {0, 0, 0, 0};
uint8_t _fade_in_buffer[]  = {0, 0, 0, 0};

// Prerusenie sa spusti kazdu ms (1KHz)
ISR(TIMER2_COMPA_vect) {
    // Obsluha DCF77 prijimaca.
    #if DCF77_ENABLED
    // if (BIS(DDRB, DCF_PON)) { // Len ak je prijimac zapnuty.
        Internal::Generic_1_kHz_Generator::isr_handler();
    // }
    #endif

    // if (BIS(MODE, MODE_EDIT) && blink_timer_counter < EDIT_MODE_BLINK_F) { // Ak sme v edit mode, blikaj desatinnou ciarkou.
    //     blink_timer_counter++;
    // }

    LED_B_CNT += LED_B_STEP; // 0 - 255 (autmaticky sa vrapne na 0)

    // Hlavne pocitadlo hodin
    if (++timer_counter % SECOND_MILLIS == 0) {
        SBI(FLAG, FLAG_NEW_SECOND);
        if (timer_counter >= MINUTE_MILLIS) {
            SBI(FLAG, FLAG_NEW_MINUTE);
            timer_counter = 0;
        }
    }

    // Prikaz wait()
    if (ms_ticks) { ms_ticks--; }

    // NOTE: Musi to byt tu lebo, to pouzivme v setupe.
    // TODO: Ochrana pred pretecenim target_brightnessu.
    if (_target_brightness != DISPLAY_PWM_REG && _target_brightness <= MAX_BRIGHTNESS) {
        if ((++brightness_counter) == BRIGHTNESS_CNT_TOP) {
            sprintln("STEP ");
            sprint(brightness_counter);
            sprint(" ");
            sprint(DISPLAY_PWM_REG);
            if (_target_brightness > DISPLAY_PWM_REG) {
                // Zaciname od nuly pretoze aj nula ma nejaku hodnotu jasu pri zapnutej PWM.
                if (DISPLAY_PWM_REG == 0 && !IS_DISPLAY_PWM_ON()) {
                    // Prechadzame z kompletne vypnuteho stavu do zapnuteho stavu.
                    START_DISPLAY_PWM();
                // Predpoklada sa, ze DISPLAY_PWM_REG aj _target_brightness su uint8_t
                } else { DISPLAY_PWM_REG++; }
            } else if (DISPLAY_PWM_REG && --DISPLAY_PWM_REG == 0) {
                SBI(PORTD, _G_PORTD);

                // Prechadzame zo zapnuteho stavu do kompletne vypnuteho stavu.
                STOP_DISPLAY_PWM();
            }

            brightness_counter = 0;
        }
    } else {
        brightness_counter = 0;
    }

    // CROSSFADING
    #if CRSF_ENABLED
    if (BIS(MODE, MODE_CRSF)) { // Crossfading rezim je aktivny
        // Ak sme na hranici duty cyklu, preklame stavy, teda ideme zo stary na nove cisla.
        // Ak je ale duty cyklus 0, toto sa spusta stale.
        if (crsf_cycle_counter >= crsf_duty) {
            putDigitsToInputRegs(_fade_in_buffer, DIGIT_COUNT);
            pushToOutputRegs();
        }

        // Urcuje po kolkych krokoch mame znizit duty cyklus, ktory znizujeme az kym nie je 0.
        if (--crsf_duty_step_counter == 0) {
            crsf_duty_step_counter = (
                ((BIS(MODE, MODE_EDIT) || BIS(MODE, MODE_DIAG)) && !BIS(MODE, MODE_BOOT))
                    ? NUMBER_TRANS_PER_EDIT // V rezimu uprav trva prechod kratsie.
                    : NUMBER_TRANS_PER
            );

            if (crsf_duty > 1) {
                crsf_duty--; // Znizime dobu kedy su stare cisla zapnute.
            } else {
                // Duty cyklus by bol 0, takze stare cisla by uz,
                // neboli zapnute vobec, takze sme dokoncili prechod.
                CBI(MODE, MODE_CRSF);

                // Pripravime hodnoty na dalsi crossfading prechod v buducnosti.
                crsf_duty = CROSSFADING_PERIOD;
                crsf_cycle_counter = 0;
            }
        }

        if (++crsf_cycle_counter >= CROSSFADING_PERIOD) {
            crsf_cycle_counter = 0; // Cely cyklus dokonceny, zaciname odznovu.
            putDigitsToInputRegs(_fade_out_buffer, DIGIT_COUNT);
            pushToOutputRegs();
        }
    }
    #endif

    // DEBOUNCOVANIE TLACITIEK a LONG PRESSING
    if (debounce_cnt < DEBOUNCE_CNT_TOP) { debounce_cnt++; }
    if (long_press_cnt < LONG_PRESS_CNT_TOP) { long_press_cnt++; }
}

#endif // ISR_H
