
#include <avr/pgmspace.h>

#include "libs/EEPROM.h"

EEPROMClass EEPROM;

#include "config.h"
#include "timers.h"
#include "const.h"
#include "utils/crc.h"


namespace Config {

static_assert(COUNT % CONFIG_PAGE_SIZE == 0,
    "COUNT musi byt nasobkom CONFIG_PAGE_SIZE - inak je posledna stranka neuplna!");

// PROGMEM: zostávajú vo flash pamäti, nie v SRAM (ušetrí 6 bajtov SRAM).
const uint8_t VIEW_FREQ_OPTIONS[] PROGMEM = {0, 1, 2, 3};

////////////////////////////////////////////////////////////////////////
// Definicie jednotlivych konfiguracii
////////////////////////////////////////////////////////////////////////
// ! Za ucelom usetrenia RAM su konfiguracne polia rozdelene na dve tabulky:
// entries[] - obsahuje modifikovatelne (aktualne) hodnoty nastaveni ulozene v RAM.
// entries_meta[] - obsahuje nemodifikovatelne metadata (min, max, persist) ulozene vo Flash.

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wmissing-field-initializers"

static PageLoadFn page_loadfn[CONFIG_PAGE_COUNT];
static PageSaveFn page_savefn[CONFIG_PAGE_COUNT];

static Entry entries[COUNT] = {
    // STRANKA 1 - NASTAVOVANIE CASU
    /* TIME_H10 */ {0},
    /* TIME_H1  */ {0},
    /* TIME_M10 */ {0},
    /* TIME_M1  */ {0},

    // STRANKA 2 - VSEOBECNE NASTAVENIA
    /* DISPLAY_BRIGHTNESS_MODE */ {1},
    /* LED_BRIGHTNESS_LEVEL    */ {5},
    /* CURRENT_SENSOR_ENABLED  */ {0}, // Predvolene vypnuty!
    /* DCF77_SYNC_ENABLED      */ {1},

    // STRANKA 3 - CASOVACE
    /* TIMER_INDEX    */ {0},
    /* TIMER_ACTION   */ {0},
    /* TIMER_H10      */ {0},
    /* TIMER_H1       */ {0},

    // STRANKA 4 - DATUM
    /* DATE_DAY_D10    */ {0},
    /* DATE_DAY_D1     */ {1},
    /* DATE_MONTH_D10  */ {0},
    /* DATE_MONTH_D1   */ {1},

    // STRANKA 5 - ROK
    /* YEAR_D1000      */ {2},
    /* YEAR_D100       */ {0},
    /* YEAR_D10        */ {2},
    /* YEAR_D1         */ {6},

    // Ulozene data timerov
    /* TIMER_0_HOUR    */ {0},
    /* TIMER_0_ACTION  */ {0},
    /* TIMER_1_HOUR    */ {0},
    /* TIMER_1_ACTION  */ {0},
    /* TIMER_2_HOUR    */ {0},
    /* TIMER_2_ACTION  */ {0},
    /* TIMER_3_HOUR    */ {0},
    /* TIMER_3_ACTION  */ {0},
};

static const EntryMeta entries_meta[COUNT] PROGMEM = {
    // STRANKA 1
    /* TIME_H10 */ {0, 2, false},
    /* TIME_H1  */ {0, 9, false},
    /* TIME_M10 */ {0, 5, false},
    /* TIME_M1  */ {0, 9, false},

    // STRANKA 2
    /* DISPLAY_BRIGHTNESS_MODE */ {0, 1, true},
    /* LED_BRIGHTNESS_LEVEL    */ {0, 8, true},
    /* CURRENT_SENSOR_ENABLED  */ {0, 1, true},
    /* DCF77_SYNC_ENABLED      */ {0, 1, true},

    // STRANKA 3 - Neukladame do EEPROM priamo, viz. tabulku casovacov nizsie.
    /* TIMER_INDEX    */ {0, N_TIMERS - 1, false}, // ID neukladame vobec.
    /* TIMER_ACTION   */ {0, TIMER_ACTION_COUNT - 1, false},
    /* TIMER_H10      */ {0, 2, false},
    /* TIMER_H1       */ {0, 9, false},

    // STRANKA 4
    /* DATE_DAY_D10    */ {0, 3, false},
    /* DATE_DAY_D1     */ {1, 9, false},
    /* DATE_MONTH_D10  */ {0, 1, false},
    /* DATE_MONTH_D1   */ {1, 9, false},

    // STRANKA 5
    /* YEAR_D1000      */ {0, 9, false},
    /* YEAR_D100       */ {0, 9, false},
    /* YEAR_D10        */ {0, 9, false},
    /* YEAR_D1         */ {0, 9, false},

    // Timery — hodina 0-23 ako jeden byte (setri 4 EEPROM byty oproti H10/H1 split)
    /* TIMER_0_HOUR    */ {0, 23, true},
    /* TIMER_0_ACTION  */ {0, TIMER_ACTION_COUNT - 1, true},
    /* TIMER_1_HOUR    */ {0, 23, true},
    /* TIMER_1_ACTION  */ {0, TIMER_ACTION_COUNT - 1, true},
    /* TIMER_2_HOUR    */ {0, 23, true},
    /* TIMER_2_ACTION  */ {0, TIMER_ACTION_COUNT - 1, true},
    /* TIMER_3_HOUR    */ {0, 23, true},
    /* TIMER_3_ACTION  */ {0, TIMER_ACTION_COUNT - 1, true},
};

#pragma GCC diagnostic pop

static_assert(sizeof(entries)      / sizeof(Entry)     == COUNT, "Pocet entries musi byt COUNT");
static_assert(sizeof(entries_meta) / sizeof(EntryMeta) == COUNT, "Pocet entries_meta musi byt COUNT");

// Citanie PROGMEM metadat. Inline => zoptimalizuje do priameho lpm.
static inline uint8_t meta_min(uint8_t id)     { return pgm_read_byte(&entries_meta[id].min); }
static inline uint8_t meta_max(uint8_t id)     { return pgm_read_byte(&entries_meta[id].max); }
static inline bool    meta_persist(uint8_t id) { return pgm_read_byte(&entries_meta[id].persist) != 0; }

// Pocet EEPROM kopii kazdeho persist zaznamu. Zvys pre viac redundancie.
// N_COPIES >= 3 je potrebne pre rozhodovanie pri CRC kolizii (poskodena hodnota
// nahodou presidie CRC kontrolu — sanca 1/256 — 3 kopie ju prehlasuju).
// EEPROM rozlozenie:
//   Hodnoty kopie c: id + c*COUNT              (adresy 0 .. N_COPIES*COUNT-1)
//   CRC    kopie c: id + N_COPIES*COUNT + c*COUNT  (nasledujuci blok)
// Celkovo: 2 * N_COPIES * COUNT bajtov
static constexpr uint8_t N_COPIES   = 3;
static constexpr uint8_t CRC_OFFSET = N_COPIES * COUNT;
static_assert(2 * N_COPIES * COUNT <= 256,
    "N_COPIES je prilis velke - EEPROM adresy pretekaju uint8_t!");

static uint8_t val_addr(uint8_t copy, uint8_t id)  { return copy * COUNT + id; }
static uint8_t crc_addr(uint8_t copy, uint8_t id)  { return CRC_OFFSET + copy * COUNT + id; }
static uint8_t entry_crc(uint8_t val)               { return crc8_step(0x00, val); }

// Nacita kopiu a overi jej CRC. Vracia true ak je CRC platne.
static bool copy_valid(uint8_t copy, uint8_t id, uint8_t& out) {
    out = EEPROM.read(val_addr(copy, id));
    return EEPROM.read(crc_addr(copy, id)) == entry_crc(out);
}

static void write_copy(uint8_t copy, uint8_t id, uint8_t val) {
    EEPROM.update(val_addr(copy, id), val);
    EEPROM.update(crc_addr(copy, id), entry_crc(val));
}

bool valid(ID id, uint8_t val) {
    return val >= meta_min(id) && val <= meta_max(id);
}

void setCallback(ID id, SetCallback cb) {
    entries[id].on_set = cb;
}

void setCallbackForPage(uint8_t page_index, SetCallback cb) {
    for (uint8_t conf_index = 0; conf_index < CONFIG_PAGE_SIZE; conf_index++) {
        setCallback(toID(page_index, conf_index), cb);
    }
}

/**
 * Nastavy hodnotu konfiguracie ak je nova hodnota platna a lisi sa od aktualnej.
 * @param id ID konfiguracie ktoru chceme nastavit.
 * @param val Nova hodnota ktoru chceme nastavit.
 * @return true ak sa hodnota zmenila, false ak je nova hodnota neplatna alebo rovnaka ako aktualna (v tom pripade sa nic nezmeni).
 */
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
    const uint8_t v   = entries[id].value;
    const uint8_t hi  = meta_max(id);
    set(id, (v >= hi) ? meta_min(id) : v + 1);
}

ID toID(uint8_t page_index, uint8_t conf_index) {
    return (ID)(conf_index + CONFIG_PAGE_SIZE * page_index);
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

void setSaveCallbackForPage(uint8_t page_index, PageSaveFn fn) {
    page_savefn[page_index] = fn;
}

void setLoadCallbackForPage(uint8_t page_index, PageLoadFn fn) {
    page_loadfn[page_index] = fn;
}

void save(ID id) {
    if (!meta_persist(id)) {
        return; // Tento zaznam neukladame do EEPROM.
    }

    const uint8_t val = entries[id].value;
    for (uint8_t c = 0; c < N_COPIES; c++) {
        write_copy(c, id, val);
    }
}

bool saveForPage(uint8_t page_index) {
    if (page_savefn[page_index]) {
        // Vlastna funkcia sa vzdy zavola (napr. ulozenie do RTC)
        // bez ohladu na persist flag.
        return page_savefn[page_index](page_index);
    }

    // Ak nemame vlastnu funkciu pre ukladanie, pouzijeme genericku.
    for (uint8_t conf_index = 0; conf_index < CONFIG_PAGE_SIZE; conf_index++) {
        save(toID(page_index, conf_index));
    }

    return true;
}

void saveAll() {
    for (uint8_t page_index = 0; page_index < CONFIG_PAGE_COUNT; page_index++) {
        saveForPage(page_index);
    }
}

void load(ID id) {
    if (!meta_persist(id)) {
        return; // Tento zaznam neukladame do EEPROM, teda ho ani nenacitame.
    }

    uint8_t val[N_COPIES];
    bool    ok[N_COPIES];
    for (uint8_t c = 0; c < N_COPIES; c++)
        ok[c] = copy_valid(c, id, val[c]);

    // Majoritne hlasovanie medzi CRC-platnymi kopiami.
    // Chrani aj pred CRC koliziou: poskodena kopia s nahodne spravnym CRC
    // je prehlasovana ostatnymi zhodnymi kopiami (vyzaduje N_COPIES >= 3).
    uint8_t chosen   = 0;
    uint8_t best_cnt = 0;
    for (uint8_t a = 0; a < N_COPIES; a++) {
        if (!ok[a]) continue;
        uint8_t cnt = 0;
        for (uint8_t b = 0; b < N_COPIES; b++)
            if (ok[b] && val[b] == val[a]) cnt++;
        if (cnt > best_cnt) { best_cnt = cnt; chosen = val[a]; }
    }

    if (best_cnt == 0 || !valid(id, chosen)) return; // vsetky kopie poskodene — zachovaj default

    // Oprav vsetky kopie ktore sa lisia alebo maju nespravne CRC (self-healing)
    entries[id].value = chosen;
    for (uint8_t c = 0; c < N_COPIES; c++) {
        if (!ok[c] || val[c] != chosen) write_copy(c, id, chosen);
    }
}

void loadForPage(uint8_t page_index) {
    if (page_loadfn[page_index]) {
        // Vlastna funkcia sa vzdy zavola (napr. nacitanie z RTC)
        // bez ohladu na persist flag.
        page_loadfn[page_index](page_index);
        return;
    }

    for (uint8_t conf_index = 0; conf_index < CONFIG_PAGE_SIZE; conf_index++) {
        load(toID(page_index, conf_index));
    }
}

void loadAll() {
    // Kazdy zaznam sa overuje samostatne cez svoje kopie a CRC — globalny guard nie je potrebny.
    for (uint8_t page_index = 0; page_index < CONFIG_PAGE_COUNT; page_index++) {
        loadForPage(page_index);
    }
}

}
