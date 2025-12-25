#ifndef INPUT_H
#define INPUT_H

#include "main.h"
#include "clock.h"

//////////////////////////////
/// Pomocne makra
//////////////////////////////

#define LONG_PRESS_CNT_TOP              750
// Kvoli rezistoru pred tlacitkom je to trochu spomalene, takze staci mensi debouncy delay.
#define DEBOUNCE_CNT_TOP                32
#define UNSTABLE_REG                    PIND

#define L_BTN                           PD3
#define R_BTN                           PD2

#define L_BTN_MASK                      (1 << L_BTN)
#define R_BTN_MASK                      (1 << R_BTN)
#define BTN_MASK                        (L_BTN_MASK | R_BTN_MASK)

#define BOTH_BUTTONS_ARE_RELEASED      ((STABLE_REG & BTN_MASK) == BTN_MASK) // Obe tlacitka su HIGH
#define BOTH_BUTTONS_ARE_PRESSED       ((~STABLE_REG & BTN_MASK) == BTN_MASK) // Obe su LOW
#define ANY_BUTTON_IS_PRESSED          (!BOTH_BUTTONS_ARE_RELEASED)
#define IS_LONG_PRESS_TICK             (long_press_cnt >= LONG_PRESS_CNT_TOP)
#define IS_DEBOUNCE_TICK               (debounce_cnt >= DEBOUNCE_CNT_TOP)
#define RIGHT_BUTTON_IS_RELEASED       ((STABLE_REG & R_BTN_MASK))
#define RIGHT_BUTTON_IS_PRESSED        (!RIGHT_BUTTON_IS_RELEASED)
#define RIGHT_BUTTON_WAS_PRESSED       ((PREV_STABLE_REG & R_BTN_MASK) == 0)
#define LEFT_BUTTON_IS_RELEASED        ((STABLE_REG & L_BTN_MASK))
#define LEFT_BUTTON_IS_PRESSED         (!LEFT_BUTTON_IS_RELEASED)
#define LEFT_BUTTON_WAS_PRESSED        ((PREV_STABLE_REG & L_BTN_MASK) == 0)
#define BUTTONS_STATE_CHANGED          ((UNSTABLE_REG & BTN_MASK) != (STABLE_REG & BTN_MASK))

#define STATE_BOTH_BUTTONS_PRESSED     0
#define STATE_BUTTON_LONG_PRESSED      1
#define STATE_BOTH_BTNS_LONG_PRESSED   2

//////////////////////////////
/// Deklaracie handlerov
//////////////////////////////

extern void onLeftButtonReleased();
extern void onLeftButtonLongPressed();
extern void onRightButtonReleased();
extern void onRightButtonLongPressed();
extern void onBothButtonsReleased();
extern void onBothButtonsLongReleased();
extern void onBothButtonsLongPressed();

//////////////////////////////
/// CONTROLS
//////////////////////////////

static uint8_t PREV_STABLE_REG  = BTN_MASK;
static uint8_t STABLE_REG       = BTN_MASK;
static uint8_t TEMP_REG         = BTN_MASK;
static uint8_t STATE_REG        = 0;

static uint8_t  debounce_cnt    = 0;
static uint16_t long_press_cnt  = 0;

static inline void longPressHandler() {
    if (BOTH_BUTTONS_ARE_PRESSED) {
        if (!BIS(STATE_REG, STATE_BOTH_BTNS_LONG_PRESSED)) {
            // Dlhe stlacenie oboch tlacidiel sa vykona len raz, bez opakovani.
            SBI(STATE_REG, STATE_BOTH_BTNS_LONG_PRESSED);

            onBothButtonsLongPressed();
        }
    } else if (BIS(STATE_REG, STATE_BOTH_BUTTONS_PRESSED)) {
        // Stale sme este obe tlacidla nepustili, takze tvarime sa, ze drzime obe.
    } else if (RIGHT_BUTTON_IS_PRESSED) {
        SBI(STATE_REG, STATE_BUTTON_LONG_PRESSED);
        onRightButtonLongPressed(); // Volame opakovane kazdu longpress iteraciu.
    } else if (LEFT_BUTTON_IS_PRESSED) {
        SBI(STATE_REG, STATE_BUTTON_LONG_PRESSED);
        onLeftButtonLongPressed(); // Volame opakovane kazdu longpress iteraciu.
    }
}

// Funkcia sa zavola kazdy raz ked sa zmeni stabilny (debouncnuty) stav tlacidiel.
static inline void onButtonStableStateChanged() {
    if (BIS(STATE_REG, STATE_BOTH_BUTTONS_PRESSED)) {
        if (BOTH_BUTTONS_ARE_RELEASED) {
            if (BIS(STATE_REG, STATE_BOTH_BTNS_LONG_PRESSED)) {
                onBothButtonsLongReleased();
            } else {
                onBothButtonsReleased();
            }
        }

        // pripad kedy sme pustili len jedno tlacidlo ignorujeme.
        // zaroven ignorujeme pripad kedy ich drzime stale.
    } else if (BOTH_BUTTONS_ARE_PRESSED) {
        SBI(STATE_REG, STATE_BOTH_BUTTONS_PRESSED);
    } else if (BIS(STATE_REG, STATE_BUTTON_LONG_PRESSED)) {
        // Drzali sme jedno z tlacidiel dlho, ale uz sme ho pustili.
        // V tomto pripade uz release nevolame aby sme neurobili este jednu akciu naviac.
    } else if (LEFT_BUTTON_IS_RELEASED && LEFT_BUTTON_WAS_PRESSED) {
        onLeftButtonReleased();
    } else if (RIGHT_BUTTON_IS_RELEASED && RIGHT_BUTTON_WAS_PRESSED)  {
        onRightButtonReleased();
    }

    if (BOTH_BUTTONS_ARE_RELEASED) {
        CBI(STATE_REG, STATE_BOTH_BUTTONS_PRESSED);
        CBI(STATE_REG, STATE_BUTTON_LONG_PRESSED);
        CBI(STATE_REG, STATE_BOTH_BTNS_LONG_PRESSED);
    }
}

static inline void handleInput() { // Tato funkcia je volana kazdu milisekundu z hlavneho loopu.
    if (ANY_BUTTON_IS_PRESSED) {
        if (long_press_cnt < LONG_PRESS_CNT_TOP) {
            long_press_cnt++;
        } else {
            longPressHandler();
            long_press_cnt = 0;
        }
    } else {
        long_press_cnt = 0;
    }

    if (debounce_cnt < DEBOUNCE_CNT_TOP) {
        debounce_cnt++;
    }

    if (BUTTONS_STATE_CHANGED && IS_DEBOUNCE_TICK) { // 00 -> 01
        if ((TEMP_REG & BTN_MASK) == (UNSTABLE_REG & BTN_MASK)) {
            PREV_STABLE_REG = STABLE_REG;
            STABLE_REG = TEMP_REG; // vypada byt stabilna
            if ((PREV_STABLE_REG & BTN_MASK) != (TEMP_REG & BTN_MASK)) {
                onButtonStableStateChanged(); // len ak sa skutocne zmenil stav.
            }
        }

        debounce_cnt = 0;
        long_press_cnt = 0; // Stav tlacidiel sa zmenil, pocitame dlhe stalcenie odznovu.
        TEMP_REG = UNSTABLE_REG;
    }

    // if (debounce_cnt >= DEBOUNCE_CNT_TOP && (
    //     BUTTONS_STATE_CHANGED ||
    //     (long_press_cnt >= LONG_PRESS_CNT_TOP)
    // )) {
    //     // Nastala zmena tlacidiel, overme ci je stabilna
    //     if ((TEMP_REG & BTN_MASK) != (PIND & BTN_MASK)) {
    //         debounce_cnt = 0;
    //         TEMP_REG = PIND;
    //         long_press_cnt = 0;
    //     } else {
    //         PREV_STABLE_REG = STABLE_REG;
    //         STABLE_REG = TEMP_REG; // vypada byt stabilna

    //         if (!IS_LONG_PRESS_TICK) {
    //             CBI(FLAG, FLAG_BTN_LONG_PRS);
    //         }

    //         if (BOTH_BUTTONS_ARE_PRESSED) {
    //             SBI(FLAG, FLAG_BOTH_BTNS_PRS);

    //             // Dlhe stlacenie oboch tlacidiel sa vykona len raz, bez opakovani.
    //             if (IS_LONG_PRESS_TICK && !BIS(FLAG, FLAG_BTN_LONG_PRS)) {
    //                 SBI(FLAG, FLAG_BTN_LONG_PRS);

    //                 onBothButtonsLongPressed();
    //             } // Inak proste len pohltime tento cyklus.
    //         } else if (BIS(FLAG, FLAG_BOTH_BTNS_PRS)) {
    //             if (BOTH_BUTTONS_ARE_RELEASED) {
    //                 onBothButtonsReleased();
    //             }

    //             // Pripad kedy boli stlacene obe tlacidla a my sme jedno z nich pustili ignorujeme.
    //         } else if (LEFT_BUTTON_IS_PRESSED && IS_LONG_PRESS_TICK) {
    //             SBI(FLAG, FLAG_BTN_LONG_PRS);
    //             onLeftButtonLongPressed();
    //             // while (true) {
    //             //     // ! DEBUGGING WATCHDOG
    //             // }
    //         } else if (RIGHT_BUTTON_IS_PRESSED && IS_LONG_PRESS_TICK) {
    //             SBI(FLAG, FLAG_BTN_LONG_PRS);
    //             onRightButtonLongPressed();
    //         } else if (BIS(FLAG, FLAG_BTN_LONG_PRS)) {
    //             // Drzali sme jedno z tlacidiel dlho, ale uz sme ho pustili.
    //             // V tomto pripade uz release nevolame aby sme neurobili este jednu akciu naviac.
    //         } else if (LEFT_BUTTON_IS_RELEASED && LEFT_BUTTON_WAS_PRESSED) {
    //             onLeftButtonReleased();
    //         } else if (RIGHT_BUTTON_IS_RELEASED && RIGHT_BUTTON_WAS_PRESSED)  {
    //             onRightButtonReleased();
    //         }

    //         if (BOTH_BUTTONS_ARE_RELEASED) {
    //             CBI(FLAG, FLAG_BOTH_BTNS_PRS);
    //             CBI(FLAG, FLAG_BTN_LONG_PRS);
    //         }

    //         if (IS_LONG_PRESS_TICK) {
    //             long_press_cnt = 0; // Resetujeme counter aby pocital pre dalsi tick.
    //         }
    //     }
    // }
}

#endif // INPUT_H
