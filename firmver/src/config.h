#ifndef __CONFIG_H__
#define __CONFIG_H__

#include <stdint.h>

#include "config_ids.h"

#define CONFIG_PAGE_SIZE    DIGIT_COUNT
#define CONFIG_PAGE_COUNT   (Config::COUNT + CONFIG_PAGE_SIZE - 1) / CONFIG_PAGE_SIZE

namespace Config {

enum TIME_HOUR_FORMAT : uint8_t { HOUR_FORMAT_12H = 2, HOUR_FORMAT_24H = 4 };

// Volane pri uspesnej zmene hodnoty nastavenia
using SetCallback       = void (*)(uint8_t page_index, uint8_t conf_index);

using PageLoadFn        = void (*)(uint8_t page_index);
using PageSaveFn        = bool (*)(uint8_t page_index);

// RAM-rezidentny zaznam: hodnota + callbacky nastavovane za behu.
// Statickou metadatu (min/max/persist) drzime v EntryMeta vo flash (PROGMEM)
// — usetri 3B/zaznam (84B RAM celkom pri COUNT=28).
struct Entry {
    uint8_t         value;
    SetCallback     on_set;
};

// Drzane vo flash cez PROGMEM, citaju sa pgm_read_byte.
struct EntryMeta {
    uint8_t min;
    uint8_t max;
    bool    persist; // Ci ukladame toto nastavenie do EEPROM alebo nie.
};

uint8_t get(ID id);
bool    set(ID id, uint8_t val);
void    setCallback(ID id, SetCallback cb);
void    setCallbackForPage(uint8_t page_index, SetCallback cb);
void    setSaveCallbackForPage(uint8_t page_index, PageSaveFn fn);
void    setLoadCallbackForPage(uint8_t page_index, PageLoadFn fn);
ID      toID(uint8_t page_index, uint8_t conf_index);
bool    valid(ID id, uint8_t val);
void    increment(ID id);
// Vrati page_index zo zadaneho ID konfiguracie.
uint8_t page(ID id);
uint8_t indexInPage(ID id);

void    save(ID id);
// Vrati true ak sa stranku podarilo ulozit, inak false.c
bool    saveForPage(uint8_t page_index);
void    saveAll();

void    load(ID id);
void    loadForPage(uint8_t page_index);
void    loadAll();

}

#endif // __CONFIG_H__
