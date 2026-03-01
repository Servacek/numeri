
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
    // Ochrana: ak sa stav tlacidiel v skutocnosti nezmenil (napr. kvoli
    // subeznosti citania pinov), zbytocne nevolame ziadne callbacky.
    if ((STABLE_REG & BTN_MASK) == (PREV_STABLE_REG & BTN_MASK)) {
        return;
    }

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
    // Citame hardverovy register PIND presne raz za tik. Dve citania by
    // mohli vratit rozne hodnoty ak tlacidlo zaskoci medzi nimi, co by
    // sposobilo nekonzistentny stav (napr. vstup do debouncovania
    // s referencnou hodnotou, ktora uz neodpoveda detekovnaej zmene).
    const uint8_t raw_pins = PIND;

    if (BIS(STATE_REG, STATE_BUTTON_DEBOUNCING)) {
        if ((TEMP_REG & BTN_MASK) != (raw_pins & BTN_MASK)) {
            // Stav sa zmenil pocas debouncovania, zacnime znova.
            debounce_cnt = 0;
            long_press_cnt = 0; // Stav tlacidla sa meni, takze pocitame dlhe stlacenie znovu.
            TEMP_REG = raw_pins;
            return; // Pokracujeme az v dalsom cykle.
        } else if (debounce_cnt < DEBOUNCE_CNT_TOP) { // Stav je stale rovnaku, pocitame dalej
            debounce_cnt++;
        } else {
            // Debouncing uspesny, mame stabilny stav.
            PREV_STABLE_REG = STABLE_REG;
            STABLE_REG = TEMP_REG;

            _onButtonStableStateChanged();

            debounce_cnt = 0;
            long_press_cnt = 0;
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

        if ((raw_pins & BTN_MASK) != (STABLE_REG & BTN_MASK)) {
            // Nastala zmena tlacidiel, overme ci je stabilna.
            // Resetujeme aj dlhe stlacenie — ak sa stav meni, dlhe
            // stlacenie pocitame az od potvrdenej stabilnej zmeny.
            debounce_cnt = 0;
            long_press_cnt = 0;
            TEMP_REG = raw_pins;
            SBI(STATE_REG, STATE_BUTTON_DEBOUNCING);
        }
    }
}
