#ifndef TIMERS_H
#define TIMERS_H

#include <stdint.h>

// Pre pridanie noveho timera staci zvysit N_TIMERS a pridat 2 nove Config::ID
// (TIMER_x_HOUR a TIMER_x_ACTION) do config_ids.h + entries[] v config.cpp.
#define N_TIMERS 4u

enum TimerAction : uint8_t {
    TIMER_ACTION_NONE       = 0u,
    TIMER_ACTION_SLEEP      = 1u,
    TIMER_ACTION_WAKE       = 2u,
    TIMER_ACTION_DCF_SYNC   = 3u,
    ///////
    TIMER_ACTION_COUNT      = 4u
};

namespace Timers {

// Inicializacia — nacita timer data z EEPROM, registruje UI config callbacky.
void setup();

// Vola sa ked hodiny odtiknu HH:00:00. Skontroluje vsetky timery a pre kazdy
// ktory matchuje current_hour spusti prislusnu akciu.
void onHourTick(uint8_t current_hour);

} // namespace Timers

#endif // TIMERS_H
