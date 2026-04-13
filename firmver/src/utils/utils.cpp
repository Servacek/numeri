#include "utils/utils.h"

#include <avr/sleep.h>

namespace Utils {

volatile uint16_t _ms_ticks = 0;

void wait(uint16_t ms) {
    _ms_ticks = ms;
    set_sleep_mode(SLEEP_MODE_IDLE);
    sleep_enable();
    while (_ms_ticks > 0) {
        sleep_cpu();
    }
    sleep_disable();
}

void onISRTick() {
    if (_ms_ticks) {
        _ms_ticks--;
    }
}

} // namespace Utils
