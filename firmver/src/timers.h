#ifndef TIMERS_H
#define TIMERS_H

#include <stdint.h>

// ─── Pocet timerov ────────────────────────────────────────────────────────────
// Pre pridanie noveho timera staci zvysit N_TIMERS a pridat 2 nove Config::ID
// (TIMER_x_HOUR a TIMER_x_ACTION) do config.h + entries[] v config.cpp.
#define N_TIMERS 4u

// ─── Akcie timerov ───────────────────────────────────────────────────────────
enum TimerAction : uint8_t {
    TIMER_ACTION_NONE  = 0u, // Timer je vypnuty
    TIMER_ACTION_SLEEP = 1u, // Vypne displej, uspí CPU (PD2/PD3 INT prebudi)
    TIMER_ACTION_WAKE  = 2u, // Zapne displej, zrusi night mode
    TIMER_ACTION_BRIGHTNESS = 3u, // Nastavi jas na 50% maxima
    TIMER_ACTION_DCF_SYNC   = 4u, // Spusti DCF77 synchronizaciu

    ///////
    TIMER_ACTION_COUNT      = 5u // Pocet akcii (pre max hodnotu v config entry)
};

namespace Timers {

// Inicializacia — registruje config entries a EEPROM callbacky.
// Vola sa zo setupConfig().
void setup();

// Vola sa z onNewSecond() ked timer_counter == 0 (HH:00:00).
// Skontroluje vsetky timery ci niektorý matchuje aktualnu hodinu
// a vykona prislusnu akciu v poradi 0..N_TIMERS-1.
void onHourTick(uint8_t current_hour);

// Vracia true ak je system v night mode (SLEEP bol aktivovany timerom).
bool isNightMode();

// Vstup do night mode — vypne displej, zapne INT0/INT1, uvespi CPU.
// Po prebudeni tlacidlom zobrazi cas na NIGHT_PREVIEW_MS ms, potom sa znovu uspí.
// Vychádza iba cez exitNightMode() (zvycajne z WAKE timera).
void enterNightMode();

// Vystup z night mode — zapne displej, vypne INT0/INT1.
void exitNightMode();

void nightModeMillisecondLoop(); // Volame z hlavneho loop() ak je v night mode, spravuje zobrazovanie casu po prebudeni tlacidlom.

} // namespace Timers

#endif // TIMERS_H
