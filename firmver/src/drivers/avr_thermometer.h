#ifndef AVRTHERMOMETER_H
#define AVRTHERMOMETER_H

#include <stdint.h>

namespace AVRThermometer {
    // Vracia teplotu v stupnoch Celzia.
    // Vyzaduje kalibraciu pre kazdy cip (pozri avr_thermometer.cpp).
    int8_t read();
}

#endif // AVRTHERMOMETER_H
