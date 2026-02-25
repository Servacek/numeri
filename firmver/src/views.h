#ifndef VIEWS_H
#define VIEWS_H

#include <stdint.h>

#include "libs/progmem.h"

#include "main.h"
#include "display.h"

#define TOTAL_VIEWS 2

void displayTemperature();
void displayDate();

typedef void (*VIEW_FUNC)();

inline uint8_t getNextViewIndex(uint8_t current_view_index) {
    for (uint8_t i = 0; i < TOTAL_VIEWS; i++) {
        uint8_t view_index = (i + current_view_index + 1) % TOTAL_VIEWS;
        // Overme ci tento view je povoleny v nastaveniach
        // TODO: if <TODO>
        return view_index;
    }

    return 0;
}

const VIEW_FUNC VIEWS[TOTAL_VIEWS] PROGMEM = {
    displayTemperature,
    displayDate,
};

uint8_t is_any_view_shown           = 0; // puiblic
static uint8_t _view_iter_period    = 120; // TODO: Make this configurable.
static uint8_t _view_iter_counter   = 0;
static uint8_t _current_view_index  = 0;

//////////////////////////////////
// Obstaravanie views
///////////////////////////////////

inline void secondlyViewHandler() {
    if (!BIS(MODE, MODE_EDIT)) {
        _view_iter_counter++;
        const uint8_t period = is_any_view_shown ? _view_iter_period / 2 : _view_iter_period;
        if (_view_iter_counter >= period) {
            _view_iter_counter = 0;
            if (is_any_view_shown) {
                sprintln(F("Zobrazujem spat cas..."));
                displayTimeFromCounters(t_counter_minutes, t_counter_hours);
                is_any_view_shown = 0;
            } else {
                sprint(F("Zobrazujem view:")); sprintln(_current_view_index);

                ((VIEW_FUNC)PROGMEM_READ_WORD(VIEWS, _current_view_index))();
                _current_view_index = getNextViewIndex(_current_view_index);
                is_any_view_shown = 1;
            }
        }
    } else {
        _view_iter_counter = 0;
    }
}

#endif // VIEWS_H
