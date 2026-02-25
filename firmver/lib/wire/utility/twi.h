#ifndef TWI_H
#define TWI_H

// ─── TWI/I2C master-only driver pre ATmega328P ───────────────────────────────
//
// Slave rezim je odstraneny — pouzivame len master TX a master RX.
// Odstranene bufre: twi_rxBuffer (32B), twi_txBuffer (32B) → usetri ~70B RAM.
//
// Poziadavky:
//   F_CPU  musi byt definovane pred includovanim tohto suboru
//   TWI_FREQ definuje I2C taktovu frekvenciu (default 100kHz)
//   TWI_BUFFER_LENGTH definuje max dlzku jednej transakcie (default 32)

#include <stdbool.h>
#include <stdint.h>

#ifndef TWI_FREQ
#define TWI_FREQ 100000UL
#endif

#ifndef TWI_BUFFER_LENGTH
#define TWI_BUFFER_LENGTH 32u
#endif

// Timeout v mikrosekundach (0 = vypnuty).
// Odporucana hodnota pre SMBus kompatibilitu: 25000us.
#ifndef TWI_TIMEOUT_US
#define TWI_TIMEOUT_US 0ul
#endif

// Navratove kody twi_writeTo
#define TWI_OK            0u
#define TWI_ERR_BUF_FULL  1u
#define TWI_ERR_ADDR_NACK 2u
#define TWI_ERR_DATA_NACK 3u
#define TWI_ERR_OTHER     4u
#define TWI_ERR_TIMEOUT   5u

#ifdef __cplusplus
extern "C" {
#endif

void twi_init(void);
void twi_disable(void);
void twi_setFrequency(uint32_t frequency);

// Citanie zo slave zariadenia.
// Vracia pocet precitanych bajtov (0 pri chybe alebo timeout).
uint8_t
twi_readFrom(uint8_t address, uint8_t* data, uint8_t length, uint8_t sendStop);

// Zapis do slave zariadenia.
// Vracia TWI_OK alebo jeden z TWI_ERR_* kodov.
uint8_t twi_writeTo(uint8_t  address,
                    uint8_t* data,
                    uint8_t  length,
                    uint8_t  wait,
                    uint8_t  sendStop);

// Timeout sprava.
void twi_setTimeoutInMicros(uint32_t timeout, bool reset_with_timeout);
bool twi_manageTimeoutFlag(bool clear_flag);

#ifdef __cplusplus
}
#endif

#endif // TWI_H
