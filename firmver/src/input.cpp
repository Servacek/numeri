
#include "input.h"
#include "main.h"


static uint8_t PREV_STABLE_REG  = BTN_MASK;
static uint8_t STABLE_REG       = BTN_MASK;
static uint8_t TEMP_REG         = BTN_MASK;
static uint8_t STATE_REG        = 0;

static uint8_t  debounce_cnt    = 0;
static uint16_t long_press_cnt  = 0;


// Funkcia sa zavola ak mame stabilne stlacene tlacidlo dlhsie ako LONG_PRESS_CNT_TOP.
static inline void _longPressHandler() {
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
static inline void _onButtonStableStateChanged() {
    // Nebolo stlacene nic, a nieco sme stlacili.
    if (!WAS_ANY_BUTTON_PRESSED && ANY_BUTTON_IS_PRESSED) {
        onAnyButtonPressed();
    }

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

// Tato funkcia je volana kazdu milisekundu z hlavneho loopu.
void millisecondInputHandler() {
    if (BIS(STATE_REG, STATE_BUTTON_DEBOUNCING)) {
        // sprint("TICK: "); sprintln(debounce_cnt);

        if ((TEMP_REG & BTN_MASK) != (UNSTABLE_REG & BTN_MASK)) {
            // sprintln(F("STATE CHANGED DURING DEBOUNCING"));
            // Stav sa zmenil pocas debouncovania, zacnime znova.
            debounce_cnt = 0;
            long_press_cnt = 0; // Stav tlacidiel sa zmenil, pocitame dlhe stalcenie odznovu.
            TEMP_REG = UNSTABLE_REG;
            return; // Pokracujeme az v dalsom cykle.
        } else if (debounce_cnt < DEBOUNCE_CNT_TOP) { // Stav je stale rovnaku, pocitame dalej
            // sprintln("NO CHANGE, COUNTING DEBOUNCE");
            debounce_cnt++;
        } else {
            // sprintln(F("DEBOUNCE COMPLETE, STABLE STATE CHANGED"));
            // Debouncing uspesny, mame stabilny stav.
            PREV_STABLE_REG = STABLE_REG;
            STABLE_REG = TEMP_REG; // vypada byt stabilna

            _onButtonStableStateChanged(); // len ak sa skutocne zmenil stav.

            debounce_cnt = 0;
            long_press_cnt = 0; // Stav tlacidiel sa zmenil, pocitame dlhe stalcenie odznovu.
            CBI(STATE_REG, STATE_BUTTON_DEBOUNCING);
        }
    } else {
        if (ANY_BUTTON_IS_PRESSED) {
            if (long_press_cnt < LONG_PRESS_CNT_TOP) {
                long_press_cnt++;
            } else {
                _longPressHandler();
                long_press_cnt = 0;
            }
        } else {
            long_press_cnt = 0;
        }

        if (BUTTONS_STATE_CHANGED) {
            // sprintln(F("BUTTON STATE CHANGED, START DEBOUNCING"));
            // Nastala zmena tlacidiel, overme ci je stabilna
            // ak je stabilna, musi nastat DEBOUNCE_CNT_TOP po sebe iducich rovnakych stavov.
            debounce_cnt = 0; // Zaciname od nuly.
            TEMP_REG = UNSTABLE_REG; // Uloz me si referencnu hodnotu.
            SBI(STATE_REG, STATE_BUTTON_DEBOUNCING);
        }
    }

    // Musime detekovat niekolko rovnakych po sebe iducich stavov.
    // Inak by sa mohlo stat, ze zrovno zachytime nejaky bounce v 0 ms a 32 ms,
    // a interpretujeme to ako stabilnu zmenu stavu.
    // if ((TEMP_REG & BTN_MASK) != (UNSTABLE_REG & BTN_MASK)) {
    //     debounce_cnt = 0;
    //     long_press_cnt = 0; // Stav tlacidiel sa zmenil, pocitame dlhe stalcenie odznovu.
    //     TEMP_REG = UNSTABLE_REG;
    // }

    // if (BUTTONS_STATE_CHANGED && IS_DEBOUNCE_TICK) { // 00 -> 01
    //     if ((TEMP_REG & BTN_MASK) == (UNSTABLE_REG & BTN_MASK)) {
    //         PREV_STABLE_REG = STABLE_REG;
    //         STABLE_REG = TEMP_REG; // vypada byt stabilna
    //         if ((PREV_STABLE_REG & BTN_MASK) != (TEMP_REG & BTN_MASK)) {
    //             onButtonStableStateChanged(); // len ak sa skutocne zmenil stav.
    //         }
    //     }

    //     debounce_cnt = 0;
    //     long_press_cnt = 0; // Stav tlacidiel sa zmenil, pocitame dlhe stalcenie odznovu.
    //     TEMP_REG = UNSTABLE_REG;
    // }

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
