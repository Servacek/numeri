
#include <avr/pgmspace.h>
#include <EEPROM.h>

#include "config.h"


namespace Config {

static_assert(COUNT % CONFIG_PAGE_SIZE == 0,
    "COUNT musi byt nasobkom CONFIG_PAGE_SIZE - inak je posledna stranka neuplna!");

// Tieto cisla sa priamo namapuju na symboly ktore ich reprezentuju.
// PROGMEM: zostávajú vo flash pamäti, nie v SRAM (ušetrí 6 bajtov SRAM).
const uint8_t TIME_HOUR_FORMAT_OPTIONS[] PROGMEM = {2, 4};
const uint8_t VIEW_FREQ_OPTIONS[]        PROGMEM = {0, 1, 2, 3};

////////////////////////////////////////////////////////////////////////
// Pomocne makra pre casto sa vykustujuce konfiguracie.
////////////////////////////////////////////////////////////////////////

#define RANGE(value, min, max, persist) { value, min, max, nullptr, 0, persist }
#define YESNO(value, persist) { value, 0, 1, nullptr, 0, persist }
// Cislujeme od 0 po dlzka_pola-1
#define SYMBOLS(value, symbol_map, persist) { value, 0, sizeof(symbol_map) - 1, symbol_map, sizeof(symbol_map), persist }

////////////////////////////////////////////////////////////////////////
// Definicie jednotlivych konfiguracii
////////////////////////////////////////////////////////////////////////

//                             value  min  max  allowed            count                       persist
static Entry entries[COUNT] = {
    /* TIME_HOURS_TENS       */ {0, 0, MAX_HOURS_TENS, nullptr, 0, false},
    /* TIME_HOURS_ONES       */ {0, 0, 9, nullptr, 0, false},
    /* TIME_MINUTES_TENS     */ {0, 0, 5, nullptr, 0, false},
    /* TIME_MINUTES_ONES     */ {0, 0, 9, nullptr, 0, false},

    // Automaticky jas.
    /* TIME_BRIGHTNESS_MODE  */ YESNO(1, true),
    /* TIME BRIGHTNESS VALUE*/ {5, 0, 9, nullptr, 0, true},
    /* TIME_HOUR_FORMAT      */ SYMBOLS(0, TIME_HOUR_FORMAT_OPTIONS, true),
    /* TIME_LEADING_ZERO     */ YESNO(1, true),
    // /* TIME_DCF77            */ RANGE(0, 0, 1, true),

    /* NIGHT_MODE            */ {0, 0, 2, nullptr, 0, true},
    /* NIGHT_START_HOURS     */ {0, 0, 23, nullptr, 0, true},
    /* NIGHT_START_MINUTES   */ {0, 0, 59, nullptr, 0, true},
    /* NIGHT_END_HOURS       */ {0, 0, 23, nullptr, 0, true},

    /* IND_LED_BRIGHTNESS    */ {5, 0, 9, nullptr, 0, true},
    /* IND_VIEW_FREQUENCY    */
    {2, 0, 3, VIEW_FREQ_OPTIONS, sizeof(VIEW_FREQ_OPTIONS), true},
    /* IND_ACTIVE_VIEWS      */ {3, 1, 3, nullptr, 0, true},
    /* IND_RESERVED          */ {0, 0, 0, nullptr, 0, false},

    /* YEAR_D1               */ {2, 0, 9, nullptr, 0, false},
    /* YEAR_D2               */ {0, 0, 9, nullptr, 0, false},
    /* YEAR_D3               */ {2, 0, 9, nullptr, 0, false},
    /* YEAR_D4               */ {6, 0, 9, nullptr, 0, false},

    /* DATE_DAY_D1           */ {0, 0, 3, nullptr, 0, false},
    /* DATE_DAY_D2           */ {1, 0, 9, nullptr, 0, false},
    /* DATE_MONTH_D1         */ {0, 0, 1, nullptr, 0, false},
    /* DATE_MONTH_D2         */ {1, 0, 9, nullptr, 0, false},
};

static_assert(sizeof(entries) / sizeof(Entry) == COUNT, "Pocet definovanych konfiguracii sa musi rovnat COUNT!");

static void generic_save(ID id) {
    EEPROM.update(id, entries[id].value);
}

static void generic_load(ID id) {
    const uint8_t val = EEPROM.read(id);
    if (valid(id, val)) {
        entries[id].value = val;
    }
    // else: keep compiled-in default (uninitialized EEPROM or corrupt data)
}

bool valid(ID id, uint8_t val) {
    const Entry& e = entries[id];
    return val >= e.min && val <= e.max;
}

void setCallback(ID id, SetCallback cb) {
    entries[id].on_set = cb;
}

void setCallbackForPage(uint8_t page_index, SetCallback cb) {
    for (uint8_t conf_index = 0; conf_index < CONFIG_PAGE_SIZE; conf_index++) {
        setCallback(toID(page_index, conf_index), cb);
    }
}

bool set(ID id, uint8_t val) {
    if (!valid(id, val) || entries[id].value == val) {
        return false; // Hodnota je neplatna alebo rovnaka ako aktualna, nic nemenime.
    }

    Entry& e = entries[id];
    e.value = val;
    if (e.on_set) {
        e.on_set(page(id), indexInPage(id));
    }
    return true;
}

void increment(ID id) {
    const Entry&  e       = entries[id];
    set(id, (e.value >= e.max) ? e.min : e.value + 1);
}

ID toID(uint8_t page_index, uint8_t conf_index) {
    return (ID)(conf_index + CONFIG_PAGE_SIZE * page_index);
}

uint8_t getSymbolIndex(ID id) {
    const Entry& e = entries[id];
    if (e.symbol_map) {
        // symbol_map je PROGMEM pointer - musime citat cez pgm_read_byte_near.
        return pgm_read_byte_near(e.symbol_map + e.value);
    } else {
        // Inak pouzijeme samotnu hodnotu ako index symbolu.
        return e.value;
    }
}

uint8_t page(ID id) {
    return id / CONFIG_PAGE_SIZE;
}

uint8_t indexInPage(ID id) {
    return id % CONFIG_PAGE_SIZE;
}

uint8_t get(ID id) {
    return entries[id].value;
}

void setSaveCallback(ID id, SaveFn fn) {
    entries[id].savefn = fn;
}

void setSaveCallbackForPage(uint8_t page_index, SaveFn fn) {
    for (uint8_t conf_index = 0; conf_index < CONFIG_PAGE_SIZE; conf_index++) {
        setSaveCallback(toID(page_index, conf_index), fn);
    }
}

void setLoadCallback(ID id, LoadFn fn) {
    entries[id].loadfn = fn;
}

void setLoadCallbackForPage(uint8_t page_index, LoadFn fn) {
    for (uint8_t conf_index = 0; conf_index < CONFIG_PAGE_SIZE; conf_index++) {
        setLoadCallback(toID(page_index, conf_index), fn);
    }
}

void save(ID id) {
    const Entry& e = entries[id];
    if (e.savefn) {
        // Vlastna funkcia sa vzdy zavola (napr. synchronizacia s RTC)
        // bez ohladu na persist flag.
        e.savefn(page(id), indexInPage(id));
    } else if (e.persist) {
        generic_save(id);
    }
}

void saveForPage(uint8_t page_index) {
    for (uint8_t conf_index = 0; conf_index < CONFIG_PAGE_SIZE; conf_index++) {
        save(toID(page_index, conf_index));
    }
}

void saveAll() {
    for (uint8_t page_index = 0; page_index < CONFIG_PAGE_COUNT; page_index++) {
        saveForPage(page_index);
    }
}

void load(ID id) {
    const Entry& e = entries[id];
    if (e.loadfn) {
        // Vlastna funkcia sa vzdy zavola (napr. nacitanie z RTC)
        // bez ohladu na persist flag.
        e.loadfn(page(id), indexInPage(id));
    } else if (e.persist) {
        generic_load(id);
    }
}

void loadForPage(uint8_t page_index) {
    for (uint8_t conf_index = 0; conf_index < CONFIG_PAGE_SIZE; conf_index++) {
        load(toID(page_index, conf_index));
    }
}

void loadAll() {
    for (uint8_t page_index = 0; page_index < CONFIG_PAGE_COUNT; page_index++) {
        loadForPage(page_index);
    }
}

}
