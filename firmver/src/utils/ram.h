#ifndef RAM_H
#define RAM_H

// IMPORTANT: Include from exactly one translation unit (main.cpp).
// _canary is a file-scope static with .noinit — multiple includes
// would create independent copies and break canary checking.

#include <stdint.h>
#include <avr/wdt.h>

#include "services/logging.h"

extern "C" {
    extern char __heap_start;
    extern void* __brkval;
}

#define RAM_CANARY_MAGIC     0xC5u  // Magic byte written at init, checked periodically
#define RAM_CANARY_SIZE      24u    // Bytes painted at the top of free RAM
#define RAM_SAFETY_THRESHOLD 64u    // Minimum acceptable free RAM before forced reset

// Placed in .noinit so the C runtime does NOT zero it on reset —
// preserving the pattern across WDT resets lets us detect stack corruption
// that happened just before a reset.
static uint8_t _canary[RAM_CANARY_SIZE] __attribute__((section(".noinit")));

namespace RAM {

inline int free() {
    int v;
    const uintptr_t heap = (uintptr_t)(__brkval == 0 ? (void*)&__heap_start : __brkval);
    const int f = (int)((uintptr_t)&v - heap);
    return f < 0 ? 0 : f;
}

inline void initCanary() {
    for (uint8_t i = 0; i < RAM_CANARY_SIZE; i++) {
        _canary[i] = RAM_CANARY_MAGIC;
    }
}

inline bool canaryIntact() {
    for (uint8_t i = 0; i < RAM_CANARY_SIZE; i++) {
        if (_canary[i] != RAM_CANARY_MAGIC) return false;
    }
    return true;
}

// Call once per second. Forces an immediate WDT reset on critical memory state.
inline void checkSafety() {
    const int  f         = free();
    const bool canary_ok = canaryIntact();

    if (!canary_ok || f < (int)RAM_SAFETY_THRESHOLD) {
        critical(F("RAM! Free=")); sprint(f);
        sprint(F(" Canary=")); sprintln(canary_ok ? F("OK") : F("CORRUPTED"));
        wdt_enable(WDTO_15MS);
        for (;;); // spin until watchdog fires
    }
}

} // namespace RAM

#endif // RAM_H
