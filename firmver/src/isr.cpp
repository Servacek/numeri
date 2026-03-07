#include <avr/interrupt.h>
#include <avr/sleep.h> // kvoli "sleep_enable", "sleep_cpu", "sleep_disable"...

#include "led.h"
#include "input.h"
#include "clock.h"
#include "isr.h"
#include "main.h"
#include "display.h"
#include "reg.h"

// Pouzivame to aj v hlavnom loope, takze musi byt "volatile"
volatile uint16_t timer_counter   = 0; // Pocita do 60 000 - 1 minuta v ms
static uint8_t _brightness_counter = 0; // Pouzivane len v ISR

#if CRSF_ENABLED
// Celkova dlzka jedneho celeho cyklu crossfadingu (stare zapnute + nove zapnute)
// Na zaciatku prechodu su stare cisla zapnute po celu dobu periody.
static uint8_t _crsf_duty = CROSSFADING_PERIOD;
// Po kolkych milisekundach mame posunut duty cyklus o jeden krok,
// kde duty cyklus je doba kedy svietia stare cisla, inak svitia nove.
static uint8_t crsf_duty_step_counter = NUMBER_TRANS_PER;
// Doba kedy svietia stare cisla.
static uint8_t crsf_cycle_counter  = 0;

uint8_t _fade_out_buffer[DIGIT_COUNT] = {0, 0, 0, 0};
uint8_t _fade_in_buffer[DIGIT_COUNT]  = {0, 0, 0, 0};

void resetCrossfadeState() {
    _crsf_duty = CROSSFADING_PERIOD;
    crsf_cycle_counter = 0;
    crsf_duty_step_counter = (
        ((BIS(MODE, MODE_EDIT) || BIS(MODE, MODE_DIAG)) && !BIS(MODE, MODE_BOOT))
            ? NUMBER_TRANS_PER_EDIT
            : NUMBER_TRANS_PER
    );
}

void redirectCrossfade() {
    // Musi byt volane z ATOMIC_BLOCK kym MODE_CRSF je nastaveny.
    // Plynule presmeruje prebehajuci prechod A→B na novy ciel C (aktualny obsah DIGITS).
    //
    // Klucom je inverzia _crsf_duty: ak sme napriklad 90% hotovi s A→B
    // (_crsf_duty == 2 z 20), po zamene bufferov chceme B zobrazovat 90%
    // casu a C iba 10% — cize _crsf_duty noveho B→C prechodu je 18 (= 20 - 2).
    // Tym sa vizualny pomer starych/novych cifiel zachova bez viditelneho skoku.
    COPY_DIGIT_BUFFER(_fade_in_buffer, _fade_out_buffer); // B → fade_out (stane sa novym "starym")
    COPY_DIGIT_BUFFER(DIGITS, _fade_in_buffer);           // C → fade_in  (novy ciel)
    _crsf_duty = CROSSFADING_PERIOD - _crsf_duty;
    crsf_cycle_counter = 0;
    crsf_duty_step_counter = (
        ((BIS(MODE, MODE_EDIT) || BIS(MODE, MODE_DIAG)) && !BIS(MODE, MODE_BOOT))
            ? NUMBER_TRANS_PER_EDIT
            : NUMBER_TRANS_PER
    );
    CBI(FLAG, FLAG_CRSF_DEFFERED);
    // MODE_CRSF zostava nastaveny — ISR pokracuje plynule bez prerusenia.
}

void abortCrossfade() {
    // 1. Atomicky zastavime ISR od dalsiho pisania do shift registrov.
    //    CBI(MODE_CRSF) musi byt atomicke — ISR cita MODE v kazdom tiku.
    ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
        CBI(MODE, MODE_CRSF);
        CBI(FLAG, FLAG_CRSF_DEFFERED);
        // Reset stavu pre dalsi crossfade.
        _crsf_duty = CROSSFADING_PERIOD;
        crsf_cycle_counter = 0;
        crsf_duty_step_counter = NUMBER_TRANS_PER;
    }
    // 2. Teraz ked ISR uz nebude prepisovat registre, zapiseme konecny stav —
    //    _fade_in_buffer obsahuje cifry na ktore prechod smeroval.
    //    Toto zabezpeci, ze display pokazuje konzistentny "novy" stav
    //    namiesto zamrznuteho polovicneho prechodu.
    putDigitsToInputRegs(_fade_in_buffer, DIGIT_COUNT);
    pushToOutputRegs();
}
#endif

// TODO: Naozaj?
// Modifikovane v ISR-ku, musi byt volatile aby kompilator vzdy cital z pamate.
static volatile uint16_t _ms_ticks = 0;
void wait(uint16_t ms) {
    _ms_ticks = ms;

    set_sleep_mode(SLEEP_MODE_IDLE);
    sleep_enable();

    while (_ms_ticks > 0) {
        sleep_cpu(); // CPU sleeps until interrupt
    }

    sleep_disable();
}

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
    if (_ms_ticks) { _ms_ticks--; }

    // NOTE: Musi to byt tu lebo, to pouzivme v setupe.
    // TODO: Ochrana pred pretecenim target_brightnessu.
    if (_target_brightness != DISPLAY_PWM_REG && _target_brightness <= MAX_BRIGHTNESS) {
        if ((++_brightness_counter) == BRIGHTNESS_CNT_TOP) {
            // sprintln("STEP ");
            // sprint(brightness_counter);
            // sprint(" ");
            // sprint(DISPLAY_PWM_REG);
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

            _brightness_counter = 0;
        }
    } else {
        _brightness_counter = 0;
    }

    // CROSSFADING
    // Softverove PWM medzi starymi a novymi ciframi. V ramci kazdeho
    // CROSSFADING_PERIOD-tikoveho cyklu (20 ms) svietia stare cifry po dobu
    // _crsf_duty tikov a nove cifry po zvysok. _crsf_duty klesa postupne
    // od CROSSFADING_PERIOD az po 0. Do posuvnych registrov zapisujeme LEN
    // na dvoch hranach prechodu (stare->nove a cyklus-wrap), cim minimalizujeme
    // narocne bit-bangovanie vo vnutri ISR-ka.
    #if CRSF_ENABLED
    if (BIS(MODE, MODE_CRSF)) {
        // Posun cyklickeho pocitadla (0 az CROSSFADING_PERIOD-1).
        if (++crsf_cycle_counter >= CROSSFADING_PERIOD) {
            crsf_cycle_counter = 0;
        }

        // Hrana 1: Zaciatok periody — zobrazime STARE cifry na _crsf_duty tikov.
        if (crsf_cycle_counter == 0 && _crsf_duty > 0) {
            putDigitsToInputRegs(_fade_out_buffer, DIGIT_COUNT);
            pushToOutputRegs();
        }
        // Hrana 2: Bod prechodu — prepneme na NOVE cifry na zvysok periody.
        if (crsf_cycle_counter == _crsf_duty && _crsf_duty < CROSSFADING_PERIOD) {
            putDigitsToInputRegs(_fade_in_buffer, DIGIT_COUNT);
            pushToOutputRegs();
        }

        // Postupne znizovanie duty cyklu v case — riadi rychlost prechodu.
        if (--crsf_duty_step_counter == 0) {
            crsf_duty_step_counter = (
                ((BIS(MODE, MODE_EDIT) || BIS(MODE, MODE_DIAG)) && !BIS(MODE, MODE_BOOT))
                    ? NUMBER_TRANS_PER_EDIT // V rezimu uprav trva prechod kratsie.
                    : NUMBER_TRANS_PER
            );

            if (_crsf_duty > 0) {
                _crsf_duty--;
                // Ak sme uz za hranou prechodu v aktualnom cykle,
                // okamzite zobrazime NOVE cifry aby sme nevynechali snimku.
                if (crsf_cycle_counter >= _crsf_duty && _crsf_duty < CROSSFADING_PERIOD) {
                    putDigitsToInputRegs(_fade_in_buffer, DIGIT_COUNT);
                    pushToOutputRegs();
                }
            } else {
                // Duty je 0 — prechod dokonceny.
                CBI(MODE, MODE_CRSF);

                // Posledny zapis NOVYCH cisiel do registrov pre istotu.
                putDigitsToInputRegs(_fade_in_buffer, DIGIT_COUNT);
                pushToOutputRegs();

                // Reset pre dalsi crossfading v buducnosti.
                _crsf_duty = CROSSFADING_PERIOD;
                crsf_cycle_counter = 0;
                crsf_duty_step_counter = NUMBER_TRANS_PER;
            }
        }
    }
    #endif

    SBI(FLAG, FLAG_NEW_MILLIS);
}
