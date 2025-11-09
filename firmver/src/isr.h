#ifndef ISR_H
#define ISR_H

#include "main.h"

volatile uint16_t timer_counter = 0; // Pocita do 60 000 - 1 minuta v ms

// Prerusenie sa spusti kazdu ms (1KHz)
ISR(TIMER2_COMPA_vect) {
    // Obsluha DCF77 prijimaca.
    #if DCF77_ENABLED
    if (BIS(DDRB, DCF_PON)) { // Len ak je prijimac zapnuty.
        Internal::Generic_1_kHz_Generator::isr_handler();
    }
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
        if (++brightness_counter > BRIGHTNESS_CNT_TOP) {
            if (_target_brightness > DISPLAY_PWM_REG) {
                if (DISPLAY_PWM_REG < 255 && ++DISPLAY_PWM_REG == 1) {
                    sprintln("JAS BOL NA NULE ALE ZVYSUJE SA -> ZAPINAME PWM");
                    // Prechadzame z kompletne vypnuteho stavu do zapnuteho stavu.
                    TCCR0A = (1 << WGM00) | (1 << WGM01) | (1 << COM0B1) | (1 << COM0B0);
                    TCCR0B = (1 << WGM02) | (1 << CS00);
                }
            } else if (DISPLAY_PWM_REG && --DISPLAY_PWM_REG == 0) {
                sprintln("JAS JE NA NULE, VYPINAME PWM");
                SBI(PORTD, _G_PORTD);

                // Prechadzame zo zapnuteho stavu do kompletne vypnuteho stavu.
                TCCR0A = 0;
                TCCR0B = 0;
            }
            brightness_counter = 0;

            if (DISPLAY_PWM_REG > MAX_BRIGHTNESS) {
                DISPLAY_PWM_REG = MAX_BRIGHTNESS;
            }
        }
    } else {
        brightness_counter = 0;
    }

    // CROSSFADING
    if (BIS(MODE, MODE_CRSF)) { // Crossfading rezim je aktivny
        // Ak sme na hranici duty cyklu, preklame stavy, teda ideme zo stary na nove cisla.
        // Ak je ale duty cyklus 0, toto sa spusta stale.
        if (crsf_cycle_counter >= crsf_duty) {
            // Ak je digit_flipper na 0, spustame stale.
            putDigitsToInputRegs(DIGITS, DIGIT_COUNT);
            pushToOutputRegs();
        } else if (crsf_cycle_counter == 0) { // Po wrapnuti cyklu zresetujeme stavy.
            putDigitsToInputRegs(OLD_DIGITS, DIGIT_COUNT);
            pushToOutputRegs();
        }

        // Urcuje po kolkych krokoch mame znizit duty cyklus, ktory znizujeme az kym nie je 0.
        if (--crsf_duty_step_counter == 0) {
            crsf_duty_step_counter = (BIS(MODE, MODE_EDIT)
                ? NUMBER_TRANS_PER_EDIT // V rezimu uprav trva prechod kratsie.
                : NUMBER_TRANS_PER);

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

        if (++crsf_cycle_counter > CROSSFADING_PERIOD) {
            crsf_cycle_counter = 0; // Cely cyklus dokonceny, zaciname odznovu.
        }
    }

    // DEBOUNCOVANIE TLACITIEK a LONG PRESSING
    if (debounce_cnt < DEBOUNCE_CNT_TOP) { debounce_cnt++; }
    if (long_press_cnt < LONG_PRESS_CNT_TOP) { long_press_cnt++; }
}

#endif // ISR_H
