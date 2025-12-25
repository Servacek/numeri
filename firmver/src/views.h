#ifndef VIEWS_H
#define VIEWS_H

#include <stdint.h>

#define TOTAL_VIEWS 2

void displayTemperature();
void displayDate();

typedef void (*VIEW_FUNC)();

uint8_t getNextViewIndex(uint8_t current_view_index) {
    for (uint8_t i = 0; i < TOTAL_VIEWS; i++) {
        uint8_t view_index = (i + current_view_index + 1) % TOTAL_VIEWS;
        // Overme ci tento view je povoleny v nastaveniach
        //if <TODO>
        return view_index;
    }

    return 0;
}

VIEW_FUNC VIEWS[TOTAL_VIEWS] = {
    displayTemperature,
    displayDate,
};

volatile uint8_t is_any_view_shown  = 0;
volatile uint8_t view_iter_period = 120;
volatile uint8_t view_iter_counter = 0;
volatile uint8_t current_view_index = 0;

#endif // VIEWS_H
