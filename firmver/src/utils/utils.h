#ifndef WAIT_H
#define WAIT_H

#include <stdint.h>
#include <avr/sleep.h>
#include <avr/wdt.h>
#include "const.h"

namespace Utils {
    extern volatile uint16_t _ms_ticks;

    void wait(uint16_t ms);

    // Uspi CPU (IDLE) kym podmienka neplati alebo nevyprsie timeout.
    // Vracia true ak podmienka nastala, false ak vyprsal timeout.
    // Po vyprsani timeoutu prestane resetovat watchdog — ak sa hlavna slucka
    // zasekne, WDT moze zasiahnout.
    template<typename Condition>
    inline bool waitUntil(Condition cond, uint16_t timeout_ms = 10000) {
        _ms_ticks = timeout_ms;
        set_sleep_mode(SLEEP_MODE_IDLE);
        sleep_enable();
        while (!cond() && _ms_ticks > 0) {
            #if WATCHDOG_ENABLED
                wdt_reset();
            #endif
            sleep_cpu();
        }
        sleep_disable();
        return cond();
    }

    void onISRTick();
}

#endif // WAIT_H
