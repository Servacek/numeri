#ifndef ISR_H
#define ISR_H

// Sem patria len hlavickove subory potrebne pre DEKLARACIE v tomto subore.
// Vsetky ostatne includy patria do isr.cpp.
#include "main.h"

// Pouzivame to aj v hlavnom loope, takze musi byt "volatile"
extern volatile uint16_t timer_counter; // Pocita do 60 000 - 1 minuta v ms

#if CRSF_ENABLED
extern uint8_t _fade_out_buffer[DIGIT_COUNT];
extern uint8_t _fade_in_buffer[DIGIT_COUNT];
#endif

void wait(uint16_t ms);

#if CRSF_ENABLED
// Resetuje interny stav crossfadingu na pociatocne hodnoty.
// Volat len z ATOMIC_BLOCK ked MODE_CRSF este nie je nastaveny.
void resetCrossfadeState();

// Okamzite prerusí prebehajuci crossfade a zobrazi konecny stav (nove cifry).
// Pouzivat vzdy pred prechodom do rezimu ktory potrebuje okamzitu kontrolu
// nad shift registrami (edit, diagnostika...). Bezpecne volat z hlavneho loop-u.
void abortCrossfade();
#endif

#endif // ISR_H
