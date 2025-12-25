
#include "config.h"
#include "main.h"

uint8_t LAZY_EE[] = {
    // Cas sa oplati ukladat len v tedy ak by sa vybila
    // zalohovacia 3V bateria a bol by len chvilkovy vypadok napajania.
    // To by ale len o par minut skratilo opatovne zapnutie kym by sa hodiny,
    // aj tak neladili pomocou DCF77.
    // 0x00000000, // Ulozeny cas - hodiny 0 - 23
    // 0x00000000, // Ulozeny cas - minuty 0 - 59
    0b00000000, // Nastavenie jasu 0 - 127
    0b00000000, // Vseobecne 1 bitove nastavenia
    // GENERAL:0 -> 12/24
    // GENERAL:1 -> zaciatocna 0
    // GENERAL:2 -> nocny rezim ON/OFF
    // GENERAL:3 -> typ nocneho rezimu VYPNUTIE/ZTLMENIE

    // cas (hodiny, minuty) kedy sa mame prepnut do nocneho rezimu?
    //0b00000000,
    //0b00000000,
};

uint8_t cur_page_index = 0;

config_struct CONFIG_PAGES[CONFIG_PAGE_COUNT][CONFIG_PAGE_SIZE] = {
    { // NASTAVENIA CASU (cas neukladame)
        { .value = 0, .min = 0,  .max = 2, .loadfn = timeLoadFn, .savefn = timeSaveFn }, // mod jasu
        { .value = 0, .min = 0,  .max = 9, .loadfn = timeLoadFn, .savefn = timeSaveFn }, // hodinovy rezim
        { .value = 0, .min = 0,  .max = 5, .loadfn = timeLoadFn, .savefn = timeSaveFn }, // uvodna nula
        { .value = 0, .min = 0,  .max = 9, .loadfn = timeLoadFn, .savefn = timeSaveFn }, // dcf77
    },
    { // VSEOBECNE NASTAVENIA
        { .value = 3,                     .min = 0,  .max = 2 }, // mod jasu
        { .value = 2,                     .min = 0,  .max = 3 }, // hodinovy rezim
        { .value = 1,                     .min = 0,  .max = 1 }, // uvodna nula
        { .value = 4,                     .min = 0,  .max = 9 }, // dcf77
    },
    { // NOCNY REZIM
        { .value = 9,                     .min = 0,  .max = 9 }, // mod jasu
        { .value = 9,                     .min = 0,  .max = 9 }, // hodinovy rezim
        { .value = 9,                     .min = 0,  .max = 9 }, // uvodna nula
        { .value = 9,                     .min = 0,  .max = 9 }, // dcf77
    },
    { // DATUM DD:MM (datum tiez neukladame)
        { .value = 0,                     .min = 0,  .max = 3 },
        { .value = 1,                     .min = 0,  .max = 9 },
        { .value = 0,                     .min = 0,  .max = 1 },
        { .value = 1,                     .min = 0,  .max = 9 },
    }
};

static uint8_t getEEConfig(uint8_t address) {
    if (!BIS(LAZY_EE[address], 7)) { // Nastavenie este nie je nacitane
        sprint(F("Citam hodnotu na EEPROM adrese: "));
        sprint(address);
        LAZY_EE[address] = EEPROM.read(address);
        sprint(F(" Hodnota: "));
        sprintln(LAZY_EE[address]);
        SBI(LAZY_EE[address], 7);
    }

    return (LAZY_EE[address] & ~(1 << 7)); // Ignorujme najvacsi bit aby nezkresloval hodnotu
}

// Nastavi hodnotu na adrese v LAZY_EE a zapise do EEPROM.
static void setEEConfig(uint8_t address, uint8_t value) {
    sprint(F("Nastavujem hodnotu na EEPROM adrese: "));
    sprint(address);
    sprint(F(" z hodnoty: "));
    sprintln(getEEConfig(address));
    sprint(F(" na hodnotu: "));
    sprintln(value);

    if (getEEConfig(address) != value) { // Overme ci naozaj je treba hodnotu prenastavovat
        LAZY_EE[address] = value;
        SBI(LAZY_EE[address], 7);
        EEPROM.write(address, LAZY_EE[address]);
    }
}

void savePageConfig(uint8_t page_index) {
    for (uint8_t conf_index = 0; conf_index < CONFIG_PAGE_SIZE; conf_index++) {
        // Nacitame funkciu pred jej zobrazenim, aby sme sa uistili, ze mame najnovsiu hodnotu.
        if (CONFIG_PAGES[page_index][conf_index].savefn) {
            CONFIG_PAGES[page_index][conf_index].savefn(
                page_index, conf_index
            );
        } else {
            // Ak nie je explicitne zadana save funkcia pouzijeme predvolenu.
            genericEEPROMSaveFn(page_index, conf_index);
        }
    }
}

void saveConfigForAllPages() {
    for (uint8_t page_index = 0; page_index < CONFIG_PAGE_COUNT; page_index++) {
        savePageConfig(page_index);
    }
}

void loadPageConfig(uint8_t page_index) {
    sprintln("loadPageConfig");
    config_struct* page = CONFIG_PAGES[page_index];
    for (uint8_t conf_index = 0; conf_index < CONFIG_PAGE_SIZE; conf_index++) {
        // Nacitame nastavenia stranky pred jej zobrazenim, aby sme sa uistili, ze mame najnovsiu hodnotu.
        if (page[conf_index].loadfn != NULL) {
            page[conf_index].loadfn(page_index, conf_index);
        } else {
            // Ak nie je explicitne zadana load funkcia, pouzijeme predvolenu.
            genericEEPROMLoadFn(page_index, conf_index);
        }
    }
}

uint8_t getEEPROMIndex(uint8_t page_index, uint8_t conf_index) {
    return (uint8_t)(page_index * CONFIG_PAGE_SIZE + conf_index);
}

bool isConfigPageValueValid(uint8_t page_index, uint8_t conf_index, uint8_t value) {
    config_struct* config = &CONFIG_PAGES[page_index][conf_index];
    return value <= config->max && value >= config->min;
}

void genericEEPROMLoadFn(uint8_t page_index, uint8_t conf_index) {
    sprintln("genericEEPROMLoadFn");
    const uint8_t new_value = getEEConfig(getEEPROMIndex(page_index, conf_index));
    if (isConfigPageValueValid(page_index, conf_index, new_value)) {
        // Set only if the value is actually valid.
        sprint(F("Setting new config value")); sprint(new_value);
        CONFIG_PAGES[page_index][conf_index].value = new_value;
    }
}

void genericEEPROMSaveFn(uint8_t page_index, uint8_t conf_index) {
    sprintln("genericEEPROMSaveFn");
    setEEConfig(getEEPROMIndex(page_index, conf_index), CONFIG_PAGES[page_index][conf_index].value);
}
