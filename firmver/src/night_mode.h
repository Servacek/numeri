#ifndef NIGHT_MODE_H
#define NIGHT_MODE_H

namespace NightMode {

// Vypne displej, prepne rezimy na NIGHT.
void enter();

// Zapne displej na nakonfigurovany jas, prepne rezimy na NONE.
void exit();

// Vraci true ak je aktivny night mode.
bool isActive();

// Volame z milisekundoveho handlera hlavneho loopu.
// Spravuje preview casu po stlaceni tlacidla.
void onMillisecondTick();

} // namespace NightMode

#endif // NIGHT_MODE_H
