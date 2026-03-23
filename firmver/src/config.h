#ifndef __CONFIG_H__
#define __CONFIG_H__

#include <stdint.h>

#include "config_ids.h"

#define CONFIG_PAGE_SIZE    DIGIT_COUNT
#define CONFIG_PAGE_COUNT   (Config::COUNT + CONFIG_PAGE_SIZE - 1) / CONFIG_PAGE_SIZE

namespace Config {

// Called after a value is successfully changed.
using SetCallback   = void (*)(uint8_t page_index, uint8_t conf_index);
// Custom save/load hooks — nullptr means use generic EEPROM read/write.
// Only set these on entries that need special behaviour (e.g. syncing the RTC).
using SaveFn        = void (*)(uint8_t page_index, uint8_t conf_index);
using LoadFn        = void (*)(uint8_t page_index, uint8_t conf_index);

struct Entry {
    uint8_t        value;
    uint8_t        min;
    uint8_t        max;
    // Pole indexov symbolov, ktore sa maju priradit jednotlivym hodnotam,
    // kedze samotne hodnoty nevidime, su to len indexi jednotlovych prvkov v tomto poli.
    // POZOR: Tento pointer musi ukazovat do flash pamati (PROGMEM)!
    const uint8_t* symbol_map;       // nullptr = use min/max (PROGMEM pointer)
    uint8_t        symbols_count;
    bool           persist;       // false = don't touch EEPROM (time, date, year)

    SetCallback on_set;
    SaveFn      savefn;   // nullptr = generic EEPROM write
    LoadFn      loadfn;   // nullptr = generic EEPROM read
};

uint8_t get(ID id);
bool    set(ID id, uint8_t val);
void    setCallback(ID id, SetCallback cb);
void    setCallbackForPage(uint8_t page_index, SetCallback cb);
void    setSaveCallback(ID id, SaveFn fn);
void    setSaveCallbackForPage(uint8_t page_index, SaveFn fn);
void    setLoadCallback(ID id, LoadFn fn);
void    setLoadCallbackForPage(uint8_t page_index, LoadFn fn);
ID      toID(uint8_t page_index, uint8_t conf_index);
bool    valid(ID id, uint8_t val);
void    increment(ID id);
// Vrati page_index zo zadaneho ID konfiguracie.
uint8_t page(ID id);
uint8_t indexInPage(ID id);

uint8_t getSymbolIndex(ID id);

void    save(ID id);
void    saveForPage(uint8_t page_index);
void    saveAll();

void    load(ID id);
void    loadForPage(uint8_t page_index);
void    loadAll();

}

#endif // __CONFIG_H__
