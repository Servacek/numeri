/*
 * drivers/buttons.h
 *
 *  Ovladac pre vstavane tlacidla hodin
 */

#ifndef BUTTONS_H
#define BUTTONS_H

#include "utils/pins.h"

//////////////////////////////
/// Pomocne makra
//////////////////////////////

#define LONG_PRESS_CNT_TOP              500  // ms
#define LONG_PRESS_REP_CNT_TOP          300  // Rychlejsie nasledne opakovanie pri drzani zlacidla.
// Kvoli rezistoru pred tlacitkom je to trochu spomalene, takze staci mensi debouncy delay.
#define DEBOUNCE_CNT_TOP                8  // ms
#define UNSTABLE_REG                    PIND

#define L_BTN_MASK                      (1 << L_BTN)
#define R_BTN_MASK                      (1 << R_BTN)
#define BTN_MASK                        (L_BTN_MASK | R_BTN_MASK)

#define BOTH_BUTTONS_ARE_RELEASED      ((_STABLE_REG & BTN_MASK) == BTN_MASK) // Obe tlacitka su HIGH
#define BOTH_BUTTONS_ARE_PRESSED       ((_STABLE_REG & BTN_MASK) == 0) // Obe su LOW
#define ANY_BUTTON_IS_PRESSED          (!BOTH_BUTTONS_ARE_RELEASED)
#define WAS_ANY_BUTTON_PRESSED         (!((_PREV_STABLE_REG & BTN_MASK) == BTN_MASK))
#define IS_LONG_PRESS_TICK             (_long_press_cnt >= LONG_PRESS_CNT_TOP)
#define IS_DEBOUNCE_TICK               (_debounce_cnt >= DEBOUNCE_CNT_TOP)
#define RIGHT_BUTTON_IS_RELEASED       ((_STABLE_REG & R_BTN_MASK))
#define RIGHT_BUTTON_IS_PRESSED        (!RIGHT_BUTTON_IS_RELEASED)
#define RIGHT_BUTTON_WAS_PRESSED       ((_PREV_STABLE_REG & R_BTN_MASK) == 0)
#define LEFT_BUTTON_IS_RELEASED        ((_STABLE_REG & L_BTN_MASK))
#define LEFT_BUTTON_IS_PRESSED         (!LEFT_BUTTON_IS_RELEASED)
#define LEFT_BUTTON_WAS_PRESSED        ((_PREV_STABLE_REG & L_BTN_MASK) == 0)
#define BUTTONS_STATE_CHANGED          ((UNSTABLE_REG & BTN_MASK) != (_STABLE_REG & BTN_MASK))

#define STATE_BOTH_BUTTONS_PRESSED     0
#define STATE_BUTTON_LONG_PRESSED      1
#define STATE_BOTH_BTNS_LONG_PRESSED   2
#define STATE_BUTTON_DEBOUNCING        3

//////////////////////////////
/// Deklaracie handlerov
//////////////////////////////

extern void onAnyButtonPressed();

extern void onLeftButtonReleased();
extern void onLeftButtonLongPressed();
extern void onRightButtonReleased();
extern void onRightButtonLongPressed();
extern void onBothButtonsReleased();
extern void onBothButtonsLongPressed();

//////////////////////////////
/// CONTROLS
//////////////////////////////

namespace Buttons {

bool isAnyButtonPressed();

// Tato funkcia je volana kazdu milisekundu z hlavneho loopu.
void onMillisecondTick();

} // namespace Buttons

#endif // BUTTONS_H
