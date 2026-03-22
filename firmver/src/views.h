#ifndef VIEWS_H
#define VIEWS_H

#include <stdint.h>

#include "libs/progmem.h"

#include "main.h"
#include "display.h"

#define TOTAL_VIEWS         2
// TODO: Toto by malo byt nastavenie
// Kolko sekund zobrazujeme view pred navratom na cas.
#define VIEW_SHOW_DURATION  10
#define NO_VIEW             -1
#define VIEW_INDEX          int8_t

// Externe deklaracie.
void displayTemperature();
void displayDate();

namespace Views {

typedef void (*VIEW_FUNC)();

const VIEW_FUNC VIEWS[TOTAL_VIEWS] PROGMEM = {
    displayTemperature,
    displayDate,
};

static uint8_t _view_iter_period    = 60;                   // TODO: Toto by sa malo dat konfigurovat
static uint8_t _view_iter_counter   = 0;

// Tu ukladame naposledy zobrazeny view, aby sme vedeli kde pokracovat.
static VIEW_INDEX _last_view_index     = NO_VIEW;
static bool       _is_any_view_shown   = false;

//////////////////////////////////
// Verejne funkcie views
///////////////////////////////////

inline bool isViewEnabled(VIEW_INDEX view_index) {
    // TODO: Implementovat povolovanie/vypinanie jednotlivych view cez nastavenia.
    return view_index < TOTAL_VIEWS && view_index >= 0 && true;
}

inline VIEW_INDEX getNextViewIndex(VIEW_INDEX current_view_index) {
    for (uint8_t i = current_view_index + 1; i < TOTAL_VIEWS; i++) {
        if (isViewEnabled(i)) {
            return i;
        }
    }
    return NO_VIEW; // Presli sme vsetky, ideme spat na cas.
}

inline VIEW_INDEX getNextViewIndexCycling(VIEW_INDEX current_view_index) {
    for (VIEW_INDEX i = 1; i < TOTAL_VIEWS; i++) {
        const VIEW_INDEX candidate = (current_view_index + i) % TOTAL_VIEWS;
        if (isViewEnabled(candidate)) {
            return candidate;
        }
    }
    return NO_VIEW; // Ziadne povolene views
}

inline bool isAnyViewShown() {
    return _is_any_view_shown;
}

inline void hideViews() {
    sprintln(F("Zobrazujem spat cas..."));

    _is_any_view_shown = false;
    _view_iter_counter = 0; // Resetujeme casovac.
    Display::displayTimeFromCounters(t_counter_minutes, t_counter_hours);
}

inline void showView(VIEW_INDEX view_index) {
    if (view_index == NO_VIEW) {
        hideViews();
        return;
    }

    if (!isViewEnabled(view_index)) {
        return; // Neplatny index
    }

    sprint(F("Zobrazujem view:"));
    sprintln(view_index);
    sprint(F("JAS: "));
    sprintln(_target_brightness);
    sprint(F(" "));
    sprintln(DISPLAY_PWM_REG);

    ((VIEW_FUNC)PROGMEM_READ_WORD(VIEWS, view_index))();
    _last_view_index    = view_index;
    _is_any_view_shown  = true;
    _view_iter_counter  = 0; // Resetujeme casovac.
}

inline void showNextViewOrHide() {
    const VIEW_INDEX next = getNextViewIndex(_is_any_view_shown ? _last_view_index : NO_VIEW);
    if (next == NO_VIEW) {
        hideViews();
    } else {
        showView(next);
    }
}

inline void showNextViewCycling() {
    showView(getNextViewIndexCycling(_last_view_index));
}

//////////////////////////////////
// Obstaravanie views
///////////////////////////////////

inline void secondlyViewHandler() {
    if (BIS(MODE, MODE_EDIT) || BIS(MODE, MODE_DIAG)) {
        // _view_iter_counter = 0; // Chceme to resetovat?
        return; // V editacnom alebo diagnostickom rezime nezobrazujeme ziadne views.
    }

    _view_iter_counter++;

    const uint8_t period = isAnyViewShown() ? VIEW_SHOW_DURATION : _view_iter_period;
    if (_view_iter_counter >= period) {
        _view_iter_counter = 0; // Pre istotu resetujeme aj tu.

        if (isAnyViewShown()) {
            hideViews();
        } else {
            showNextViewCycling();
        }
    }
}

} // namespace Views

#endif // VIEWS_H
