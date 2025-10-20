
#include "main.h"

static uint8_t getEEConfig(uint8_t address) {
    if (!BIS(LAZY_EE[address], 7)) { // Nastavenie este nie je nacitane
        // LAZY_EE[address] = EEPROM.read(address);
        SBI(LAZY_EE[address], 7);
    }

    return (LAZY_EE[address] & ~(1 << 7)); // Ignorujme najvacsi bit aby nezkresloval hodnotu
}

// Nastavi hodnotu na adrese v LAZY_EE a zapise do EEPROM.
static void setEEConfig(uint8_t address, uint8_t value) {
    if (getEEConfig(address) != value) { // Overme ci naozaj je treba hodnotu prenastavovat
        LAZY_EE[address] = value;
        SBI(LAZY_EE[address], 7);
        // EEPROM.write(address, LAZY_EE[address]);
    }
}

void saveEEConfig() {
    setEEConfig(BRIGHTNESS, configured_brightness);
}
