#include "state.h"

namespace Edit {
    void enter();
    void exit();
}

namespace NightMode {
    void enter();
    void exit();
}

namespace Clock { namespace State {

volatile Mode MODE = NONE;
volatile uint8_t FLAG = 0;

static void exitState(Mode s) {
    switch (s) {
        case EDIT:  Edit::exit();      break;
        case NIGHT: NightMode::exit(); break;
        default: break;
    }
}

static void enterState(Mode s) {
    switch (s) {
        case EDIT:  Edit::enter();      break;
        case NIGHT: NightMode::enter(); break;
        default: break;
    }
}

static void doTransition(Mode next) {
    if (MODE == next) return;
    exitState(MODE);
    MODE = next;
    enterState(next);
}

bool dispatch(Event evt) {
    switch (MODE) {
        case NONE:
            switch (evt) {
                case EVT_ENTER_EDIT:  doTransition(EDIT);  return true;
                case EVT_SLEEP_TIMER: doTransition(NIGHT); return true;
                default: return false;
            }
        case EDIT:
            switch (evt) {
                case EVT_EXIT_EDIT:    doTransition(NONE); return true;
                case EVT_EDIT_TIMEOUT: doTransition(NONE); return true;
                default: return false;
            }
        case NIGHT:
            switch (evt) {
                case EVT_WAKE_TIMER: doTransition(NONE); return true;
                default: return false;
            }
    }
    return false;
}

} } // namespace Clock::State
