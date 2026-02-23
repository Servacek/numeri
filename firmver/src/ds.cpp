#include "ds.h"

namespace Modules {
namespace __DS3231 {

// ─── Pomocne funkcie ──────────────────────────────────────────────────────────

// BCD -> dec (vstup uz maskovany volajucim)
static inline uint8_t bcdToDec(uint8_t bcd) {
    return ((bcd >> 4) * 10) + (bcd & 0x0F);
}

// dec -> BCD, povoleny rozsah 0-99
static inline uint8_t decToBcd(uint8_t dec) {
    return ((dec / 10) << 4) | (dec % 10);
}

// Precita len bajtov od start_reg do buf, jedna I2C transakcia.
// Pri chybe ponecha bus cisty.
static bool readRegisters(uint8_t start_reg, uint8_t* buf, uint8_t len) {
    Wire.beginTransmission(I2C_ADDR);
    Wire.write(start_reg);
    if (Wire.endTransmission() != 0)
        return false;

    if (Wire.requestFrom(I2C_ADDR, len) < len) {
        while (Wire.available())
            Wire.read(); // cistenie busu
        return false;
    }

    for (uint8_t i = 0; i < len; i++)
        buf[i] = Wire.read();
    return true;
}

// Zapise len bajtov z buf od start_reg, jedna I2C transakcia.
static bool writeRegisters(uint8_t start_reg, const uint8_t* buf, uint8_t len) {
    Wire.beginTransmission(I2C_ADDR);
    Wire.write(start_reg);
    for (uint8_t i = 0; i < len; i++)
        Wire.write(buf[i]);
    return Wire.endTransmission() == 0;
}

// Skontroluje rozsahy vsetkych poli DateTime pred citanim aj zapisom.
// Neoveruje spravnost dna voci mesiacu — to resi edit.cpp.
static bool isValid(const DateTime& dt) {
    if (dt.second > MAX_SECONDS)
        return false;
    if (dt.minute > MAX_MINUTES)
        return false;
    if (dt.hour > MAX_HOURS)
        return false;
    if (dt.day < MIN_DATE)
        return false;
    if (dt.day > MAX_DATE)
        return false;
    if (dt.month < MIN_MONTH)
        return false;
    if (dt.month > MAX_MONTH)
        return false;
    if (dt.year < 2000)
        return false;
    if (dt.year > 2099)
        return false;
    return true;
}

// ─── Verejna API ─────────────────────────────────────────────────────────────

bool isConnected() {
    Wire.beginTransmission(I2C_ADDR);
    return Wire.endTransmission() == 0;
}

bool oscillatorWasStopped() {
    // Pri chybe vracame true — ak nevieme precitat stav, cas nie je doveryhodny
    Wire.beginTransmission(I2C_ADDR);
    Wire.write(REG_STATUS);
    if (Wire.endTransmission() != 0)
        return true;
    if (Wire.requestFrom(I2C_ADDR, (uint8_t)1) < 1)
        return true;
    return (Wire.read() & STATUS_OSF) != 0;
}

bool begin() {
    // Control register 0x0E — zapiseme presnu hodnotu, ziadny read-modify-write:
    //
    //  Bit 7  EOSC   = 0  oscilator bezi aj na baterii (active-low)
    //  Bit 6  BBSQW  = 0  ziadna stvorova vlna na baterii
    //  Bit 5  CONV   = 0  ziadna forsovana konverzia teploty
    //  Bit 4  RS2    = 0  |
    //  Bit 3  RS1    = 0  | frekvencia SQW — nepouzivame, nastavime na minimum
    //  Bit 2  INTCN  = 1  INT/SQW pin riadi alarm, nie SQW — kedze alarmy su
    //                     vypnute, pin zostane neaktivny
    //  Bit 1  A2IE   = 0  alarm 2 vypnuty
    //  Bit 0  A1IE   = 0  alarm 1 vypnuty
    //
    //  Vysledok: 0b00000100 = 0x04
    Wire.beginTransmission(I2C_ADDR);
    Wire.write(REG_CONTROL);
    Wire.write(0x04);
    if (Wire.endTransmission() != 0)
        return false;

    // Vynutime 24h rezim — cip od ineho dodavatela alebo predtym pouzity
    // moze byt v 12h rezime, co by sposobilo neplatne hodiny.
    // Bit 6 registra hodin = 1 znamena 12h rezim.
    Wire.beginTransmission(I2C_ADDR);
    Wire.write(REG_HOURS);
    if (Wire.endTransmission() != 0)
        return false;
    if (Wire.requestFrom(I2C_ADDR, (uint8_t)1) < 1)
        return false;
    const uint8_t hours_reg = Wire.read();

    if (hours_reg & 0x40) {
        Wire.beginTransmission(I2C_ADDR);
        Wire.write(REG_HOURS);
        Wire.write(hours_reg & ~0x40);
        if (Wire.endTransmission() != 0)
            return false;
    }

    return true;
}

bool now(DateTime& dt) {
    // Precitame vsetkych 7 casovych registrov naraz (0x00-0x06)
    uint8_t buf[7];
    if (!readRegisters(REG_SECONDS, buf, 7))
        return false;

    // Dekodovanie BCD s maskovanim nevyuzitych bitov podla datasheetu:
    // 0x00 sekundy:  bity[6:0]
    // 0x01 minuty:   bity[6:0]
    // 0x02 hodiny:   bity[5:0] (v 24h rezime, bit6=0 po begin())
    // 0x03 den tyzdna: ignorujeme
    // 0x04 datum:    bity[5:0]
    // 0x05 mesiac:   bity[4:0], bit7=storocie (maskujeme)
    // 0x06 rok:      bity[7:0] BCD 00-99 (offset od 2000)
    DateTime tmp;
    tmp.second = bcdToDec(buf[0] & 0x7F);
    tmp.minute = bcdToDec(buf[1] & 0x7F);
    tmp.hour   = bcdToDec(buf[2] & 0x3F);
    // buf[3] = den tyzdna, preskakujeme
    tmp.day   = bcdToDec(buf[4] & 0x3F);
    tmp.month = bcdToDec(buf[5] & 0x1F); // maskujeme bit storocia
    tmp.year  = bcdToDec(buf[6]) + 2000;

    // Validacia pred vratenim — skorumpovany register (napr. prve spustenie
    // bez baterie) by inak vratil nezmysel ako hodina=165
    if (!isValid(tmp))
        return false;

    dt = tmp; // zapisujeme do vystupu len ak je vsetko platne
    return true;
}

bool adjust(const DateTime& dt) {
    // Validacia pred zapisom — nikdy nezapiseme neplatny cas do cipu
    if (!isValid(dt))
        return false;

    uint8_t buf[7] = {decToBcd(dt.second),
                      decToBcd(dt.minute),
                      decToBcd(dt.hour),
                      0x01, // den tyzdna: nepouzivame, 1 ako bezpecny default
                      decToBcd(dt.day),
                      decToBcd(dt.month), // bit storocia nechavame 0
                      decToBcd((uint8_t)(dt.year - 2000))};

    if (!writeRegisters(REG_SECONDS, buf, 7))
        return false;

    // Po uspesnom zapise vymaze OSF — cas je teraz doveryhodny.
    // Citame pred zapisom aby sme zachovali ostatne statusove bity (EN32kHz, BSY).
    Wire.beginTransmission(I2C_ADDR);
    Wire.write(REG_STATUS);
    if (Wire.endTransmission() != 0)
        return false;
    if (Wire.requestFrom(I2C_ADDR, (uint8_t)1) < 1)
        return false;
    const uint8_t status = Wire.read() & ~STATUS_OSF;
    Wire.beginTransmission(I2C_ADDR);
    Wire.write(REG_STATUS);
    Wire.write(status);
    return Wire.endTransmission() == 0;
}

bool getTemperature(int8_t& out) {
    uint8_t buf[2];
    if (!readRegisters(REG_TEMP_MSB, buf, 2))
        return false;

    // buf[0]: znamienkovy cely stupen (dvojkovy doplnok)
    // buf[1]: bity[7:6] = desatinna cast v krokoch 0.25°C
    //   00=0.00, 01=0.25, 10=0.50, 11=0.75
    // Zaokruhlujeme na cely stupen: +1 ak zlomok >= 0.5 (bit7 LSB nastaven)
    const int8_t integer  = (int8_t)buf[0];
    const bool   round_up = (buf[1] & 0x80) != 0;

    // Ochrana pred pretecenim pri INT8_MAX (127°C — v praxi nenastane,
    // ale kod je takto korektny za vsetkych okolnosti)
    out = (round_up && integer == INT8_MAX) ? INT8_MAX
                                            : integer + (round_up ? 1 : 0);
    return true;
}

} // namespace __DS3231
} // namespace Modules
