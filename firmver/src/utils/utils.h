#ifndef WAIT_H
#define WAIT_H

#include <stdint.h>

namespace Utils {
    extern volatile uint16_t _ms_ticks;

    void wait(uint16_t ms);

    void onISRTick();
}

#endif // WAIT_H
