/* REZIMY:
 * NONE:
 * - normalny rezim, zobrazujeme cas.
 * - kratky stlacenim oboch tlacidiel zobrazime teplotu/datum.
 * - pri manualnom jase stlacanim krajnych tlacidiel (nie naraz) nastavujeme jas.
 * - pri dlouhem stlacenim obou tlacidiel vstupujeme do nastavovacieho rezimu.
 * EDIT:
 * - nastavovaci rezim,
 * - kratkym stlacenim praveho z tlacidiel posuvame kurzor.
 * - kratkym stlacenim laveho z tlacidiel zvysujeme hodnotu pod kurzorom.
 * - V tomto rezime je jas permanentny, je nastaveny na predvolenu hodnotu a nejde menit.
 * - dlhym stlacenim oboch tlacidiel ukoncujeme nastavovaci rezim.
 * - LDR jasu nefunguje, neovplyvnuje jas.
 * - LED-ka svieti, ako obycajne okrem pripadu kedy nastavujeme jej jas,
 *   vtedy svieti stalou bielou farbou.
 * - Ak uzivatel nastavi napr. datum na neplatnu hodnotu (napr. 31.2.), tak displej pri pokuse
 *   o ulozenie zmien (kratkym alebo dlhym stlacenim oboch tlacidiel) zablika a zmeny nedovoly
 *   ulozit (uzivatel ostane na danej stranke kym hodnotu neupravy alebo kym nenastane timeout,
 *   kedy sa nastavovaci rezim ukonci bez ulozenia zmien na poslednej stranke nastaveni).
 * NIGHT:
 * - nocny rezim, displej je kompletne vypnuty, hodiny bezia.
 * - LED-ka nesvieti vobec, pretoze by bola moc rusova cez noc.
 * - stlacenim lubovolneho tlacidla sa na par sekund prebudime do normalneho rezimu,
 *   pricom jas bude na predvolenej hodnote.
 * - nastavovanie jasu nerobi nic (tlacidla len prebudzaju).
 * - kazdym dalsim stlacenim nejakeho tlacidla sa resetuje timeout.
 * - kratke stlacenie oboch tlacidiel stale zobrazi teplutu ako v normalnom rezime.
 * - dlhym stlacenim oboch tlacidiel sa dostaneme do nastavovacieho rezimu,
 *   pricom jas sa uz nemeni pretoze uz je na predvolenej hodnote. Prechodom do
 *   nastavovacieho rezimu sa nocny rezim vypne.
*/

#include "state.h"

namespace Edit {
    void enter();
    void exit();
}

namespace NightMode {
    void enter();
    void exit();
}

namespace NormalMode {
    void enter();
}

namespace Views {
    void enter();
    void exit();
}

namespace Clock { namespace State {

volatile Mode MODE = NONE;
volatile uint8_t FLAG = 0;

static void _exitState(Mode s) {
    switch (s) {
        case EDIT:  Edit::exit();      break;
        case NIGHT: NightMode::exit(); break;
        case VIEW:  Views::exit();     break;
        default: break;
    }
}

static void _enterState(Mode s) {
    switch (s) {
        case NONE:  NormalMode::enter(); break;
        case EDIT:  Edit::enter();       break;
        case NIGHT: NightMode::enter();  break;
        case VIEW:  Views::enter();      break;
    }
}

static void _doTransition(Mode next) {
    if (MODE == next) return;
    _exitState(MODE);
    MODE = next;
    _enterState(next);
}

bool dispatch(Event evt) {
    switch (MODE) {
        case NONE:
            switch (evt) {
                case EVT_ENTER_EDIT:  _doTransition(EDIT);  return true;
                case EVT_ENTER_NIGHT: _doTransition(NIGHT); return true;
                case EVT_ENTER_VIEW:  _doTransition(VIEW);  return true;
                default: return false;
            }
        case EDIT:
            switch (evt) {
                case EVT_EXIT_EDIT:    _doTransition(NONE); return true;
                case EVT_EDIT_TIMEOUT: _doTransition(NONE); return true;
                default: return false;
            }
        case NIGHT:
            switch (evt) {
                case EVT_EXIT_NIGHT:  _doTransition(NONE); return true;
                // Dlhe podrzanie oboch tlacidiel v nocnom rezime nas zoberie
                // priamo do nastavovacieho rezimu (nocny rezim sa tym vypne).
                case EVT_ENTER_EDIT:  _doTransition(EDIT); return true;
                default: return false;
            }
        case VIEW:
            switch (evt) {
                case EVT_EXIT_VIEW:   _doTransition(NONE); return true;
                case EVT_ENTER_EDIT:  _doTransition(EDIT); return true;
                case EVT_ENTER_NIGHT: _doTransition(NIGHT); return true;
                default: return false;
            }
    }
    return false;
}

} } // namespace Clock::State
