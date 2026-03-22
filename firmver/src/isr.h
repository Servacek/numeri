#ifndef ISR_H
#define ISR_H

#include <stdint.h>

#include "const.h"

// Pouzivame to aj v hlavnom loope, takze musi byt "volatile"
extern volatile uint16_t timer_counter; // Pocita do 60 000 - 1 minuta v ms

void wait(uint16_t ms);

#endif // ISR_H
