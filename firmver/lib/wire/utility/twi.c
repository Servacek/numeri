/*
 * twi.c — TWI/I2C master-only driver pre ATmega328P
 *
 * Odvodene z Arduino Wire/twi.c (c) 2006 Nicholas Zambetti, LGPL 2.1+
 * Upravene: odstraneny slave rezim, slave buffre, slave callbacky.
 * Usetri ~70B RAM (twi_rxBuffer + twi_txBuffer + indexy + pointre na callbacky).
 *
 * Podporovane operacie:
 *   Master Transmitter (MT) — zapis do slave
 *   Master Receiver    (MR) — citanie zo slave
 *   Repeated Start         — pre combined transakcie (napr. register write + read)
 */

#include <avr/interrupt.h>
#include <avr/io.h>
#include <compat/twi.h>
#include <inttypes.h>
#include <stdbool.h>
#include <stdlib.h>
#include <util/delay.h>

#include "twi.h"

// ─── Interne stavy TWI stavoveho automatu ─────────────────────────────────────
#define TWI_READY 0u // Bus je volny
#define TWI_MTX   1u // Master Transmitter — prebieha zapis
#define TWI_MRX   2u // Master Receiver    — prebieha citanie

// ─── Piny (ATmega328P: SDA=PC4, SCL=PC5) ────────────────────────────────────
#define TWI_SDA_DDR  DDRC
#define TWI_SDA_PORT PORTC
#define TWI_SDA_PIN  PC4
#define TWI_SCL_DDR  DDRC
#define TWI_SCL_PORT PORTC
#define TWI_SCL_PIN  PC5

// Cas cakania medzi pollovanim TWCR/TWSR v busy-wait sluckach
#define TWI_POLL_US 4u

// ─── Interni stav ─────────────────────────────────────────────────────────────
static volatile uint8_t _state;     // TWI_READY / TWI_MTX / TWI_MRX
static volatile uint8_t _slarw;     // SLA+R alebo SLA+W byte
static volatile uint8_t _send_stop; // 1 = poslat STOP po transakcii
static volatile uint8_t _rep_start; // 1 = sme uprostred Repeated Start
static volatile uint8_t _error;     // TW_* chybovy kod, 0xFF = bez chyby

static uint8_t _buf[TWI_BUFFER_LENGTH]; // Spolocny master buffer (TX aj RX)
static volatile uint8_t _buf_idx;       // Aktualny index do _buf
static volatile uint8_t _buf_len;       // Celkova dlzka aktualnej transakcie

static volatile uint32_t _timeout_us       = TWI_TIMEOUT_US;
static volatile bool     _timed_out        = false;
static volatile bool     _reset_on_timeout = false;

// ─── Pomocne funkcie ──────────────────────────────────────────────────────────

static inline void _enable_pullups(void) {
    TWI_SDA_DDR &= (uint8_t)~_BV(TWI_SDA_PIN);
    TWI_SCL_DDR &= (uint8_t)~_BV(TWI_SCL_PIN);
    TWI_SDA_PORT |= _BV(TWI_SDA_PIN);
    TWI_SCL_PORT |= _BV(TWI_SCL_PIN);
}

static inline void _disable_pullups(void) {
    TWI_SDA_DDR &= (uint8_t)~_BV(TWI_SDA_PIN);
    TWI_SCL_DDR &= (uint8_t)~_BV(TWI_SCL_PIN);
    TWI_SDA_PORT &= (uint8_t)~_BV(TWI_SDA_PIN);
    TWI_SCL_PORT &= (uint8_t)~_BV(TWI_SCL_PIN);
}

// Odosle ACK alebo NACK na bus
static inline void _reply(uint8_t ack) {
    if (ack) {
        TWCR = (uint8_t)(_BV(TWEN) | _BV(TWIE) | _BV(TWINT) | _BV(TWEA));
    } else {
        TWCR = (uint8_t)(_BV(TWEN) | _BV(TWIE) | _BV(TWINT));
    }
}

// Spracovanie timeoutu — nastavi flag, volitelne resetuje hardware
static void _twi_handle_timeout(void) {
    _timed_out = true;
    if (_reset_on_timeout) {
        const uint8_t saved_twbr = TWBR;
        const uint8_t saved_twar = TWAR;
        twi_disable();
        twi_init();
        TWBR = saved_twbr;
        TWAR = saved_twar;
    }
}


// Odosle STOP podmienku a pocka na jej dokoncenie
static void _stop(void) {
    TWCR = _BV(TWEN) | _BV(TWIE) | _BV(TWEA) | _BV(TWINT) | _BV(TWSTO);

    // TWINT sa po STOP nepozaduje — pollujeme TWSTO bit
    // Timeout: rovnaky mechanizmus ako v busy-wait sluckach
    const uint8_t us_per_loop = 8u;
    uint32_t      counter     = (_timeout_us > 0ul)
                                    ? (_timeout_us + us_per_loop - 1u) / us_per_loop
                                    : UINT32_MAX;

    while (TWCR & _BV(TWSTO)) {
        if (counter == 0ul) {
            _twi_handle_timeout();
            return;
        }
        _delay_us(us_per_loop);
        if (_timeout_us > 0ul)
            counter--;
    }

    _state = TWI_READY;
}

// Uvolni bus bez STOP podmienky (pri strate arbitracie)
static inline void _release_bus(void) {
    TWCR   = _BV(TWEN) | _BV(TWIE) | _BV(TWEA) | _BV(TWINT);
    _state = TWI_READY;
}

// Makro: caka v busy-loop kym podmienka plati, s timeoutom
// waited akumuluje cas v us, pri prekroceni vola handler a skoci na label
#define WAIT_WITH_TIMEOUT(condition, waited, on_timeout)                       \
    do {                                                                       \
        while (condition) {                                                    \
            if (_timeout_us > 0ul && (waited) >= _timeout_us) {                \
                _twi_handle_timeout();                                         \
                on_timeout;                                                    \
            }                                                                  \
            _delay_us(TWI_POLL_US);                                            \
            (waited) += TWI_POLL_US;                                           \
        }                                                                      \
    } while (0)

// ─── Verejna API ─────────────────────────────────────────────────────────────

void twi_init(void) {
    _state     = TWI_READY;
    _send_stop = 1u;
    _rep_start = 0u;

    _enable_pullups();

    // Prescaler = 1 (TWPS1:0 = 00)
    TWSR &= (uint8_t)~(_BV(TWPS0) | _BV(TWPS1));
    TWBR = (uint8_t)(((F_CPU / TWI_FREQ) - 16ul) / 2ul);

    // Enable TWI module with ACK enable and interrupt
    TWCR = (uint8_t)(_BV(TWEN) | _BV(TWIE) | _BV(TWEA));
}

void twi_disable(void) {
    TWCR &= (uint8_t)~(_BV(TWEN) | _BV(TWIE) | _BV(TWEA));
    _disable_pullups();
}

void twi_setFrequency(uint32_t frequency) {
    // MISRA: Input validation
    if (frequency == 0ul) {
        return; // Invalid frequency; no action
    }
    TWBR = (uint8_t)(((F_CPU / frequency) - 16ul) / 2ul);
}

uint8_t
twi_readFrom(uint8_t address, uint8_t* data, uint8_t length, uint8_t sendStop) {
    // MISRA: Explicit input validation
    if ((length == 0u) || (length > TWI_BUFFER_LENGTH) || (data == NULL)) {
        return 0u; // Invalid parameters
    }

    // Pockat kym je bus volny
    uint32_t waited = 0ul;
    WAIT_WITH_TIMEOUT(_state != TWI_READY, waited, return 0u);

    _state     = TWI_MRX;
    _send_stop = sendStop;
    _error     = 0xFFu;
    _buf_idx   = 0u;
    // masterBufferLength = length - 1: NACK sa posiela pri predposlednom prijatom bajte,
    // cim sa spusti NACK pred prijatim posledneho bajtu (pozri datasheet AVR TWI)
    _buf_len = length - 1u;
    _slarw   = (uint8_t)((address << 1u) | TW_READ);

    if (_rep_start) {
        // Repeated Start: START bol uz odoslany v ISR, cakame len na adresny bajt
        _rep_start = 0u;
        waited     = 0ul;
        // Cakame kym TWWC (Write Collision) nie je 0, potom zapiseme adresu
        do {
            TWDR = _slarw;
            if (_timeout_us > 0ul && waited >= _timeout_us) {
                _twi_handle_timeout();
                return 0u;
            }
            _delay_us(TWI_POLL_US);
            waited += TWI_POLL_US;
        } while (TWCR & _BV(TWWC));
        // Aktivuj prerusenia bez START
        TWCR = _BV(TWINT) | _BV(TWEA) | _BV(TWEN) | _BV(TWIE);
    } else {
        // Normalna transakcia — odosli START
        TWCR = _BV(TWEN) | _BV(TWIE) | _BV(TWEA) | _BV(TWINT) | _BV(TWSTA);
    }

    // Cakat na dokoncenie citania (ISR zmeni _state z TWI_MRX)
    waited = 0ul;
    WAIT_WITH_TIMEOUT(_state == TWI_MRX, waited, return 0u);

    // Skopirovat vysledok — moze byt kratsi ako pozadovany (NACK, timeout)
    const uint8_t received = (_buf_idx < length) ? _buf_idx : length;
    for (uint8_t i = 0u; i < received; i++)
        data[i] = _buf[i];
    return received;
}

uint8_t twi_writeTo(uint8_t  address,
                    uint8_t* data,
                    uint8_t  length,
                    uint8_t  wait,
                    uint8_t  sendStop) {
    if (length > TWI_BUFFER_LENGTH)
        return TWI_ERR_BUF_FULL;

    // Pockat kym je bus volny
    uint32_t waited = 0ul;
    WAIT_WITH_TIMEOUT(_state != TWI_READY, waited, return TWI_ERR_TIMEOUT);

    _state     = TWI_MTX;
    _send_stop = sendStop;
    _error     = 0xFFu;
    _buf_idx   = 0u;
    _buf_len   = length;
    _slarw     = (uint8_t)((address << 1) | TW_WRITE);

    for (uint8_t i = 0u; i < length; i++)
        _buf[i] = data[i];

    if (_rep_start) {
        _rep_start = 0u;
        waited     = 0ul;
        do {
            TWDR = _slarw;
            if (_timeout_us > 0ul && waited >= _timeout_us) {
                _twi_handle_timeout();
                return TWI_ERR_TIMEOUT;
            }
            _delay_us(TWI_POLL_US);
            waited += TWI_POLL_US;
        } while (TWCR & _BV(TWWC));
        TWCR = _BV(TWINT) | _BV(TWEA) | _BV(TWEN) | _BV(TWIE);
    } else {
        TWCR = _BV(TWINT) | _BV(TWEA) | _BV(TWEN) | _BV(TWIE) | _BV(TWSTA);
    }

    // Cakat na dokoncenie zapisu (volitelne — wait=0 pre fire-and-forget)
    if (wait) {
        waited = 0ul;
        WAIT_WITH_TIMEOUT(_state == TWI_MTX, waited, return TWI_ERR_TIMEOUT);
    }

    if (_error == 0xFFu)
        return TWI_OK;
    else if (_error == TW_MT_SLA_NACK)
        return TWI_ERR_ADDR_NACK;
    else if (_error == TW_MT_DATA_NACK)
        return TWI_ERR_DATA_NACK;
    else
        return TWI_ERR_OTHER;
}

void twi_setTimeoutInMicros(uint32_t timeout, bool reset_with_timeout) {
    _timed_out        = false;
    _timeout_us       = timeout;
    _reset_on_timeout = reset_with_timeout;
}

bool twi_manageTimeoutFlag(bool clear_flag) {
    const bool flag = _timed_out;
    if (clear_flag)
        _timed_out = false;
    return flag;
}

// ─── TWI ISR — len master stavy ──────────────────────────────────────────────
ISR(TWI_vect) {
    switch (TW_STATUS) {
    // ── Spolocne pre MT aj MR ─────────────────────────────────────────────────
    case TW_START:     // START odoslany
    case TW_REP_START: // Repeated START odoslany
        TWDR = _slarw;
        _reply(1);
        break;

    // ── Master Transmitter ────────────────────────────────────────────────────
    case TW_MT_SLA_ACK:  // Slave potvrdil adresu
    case TW_MT_DATA_ACK: // Slave potvrdil data
        if (_buf_idx < _buf_len) {
            TWDR = _buf[_buf_idx++];
            _reply(1);
        } else if (_send_stop) {
            _stop();
        } else {
            // Repeated Start — ISR odosle START, hlavna slucka caka na adresu
            _rep_start = 1u;
            TWCR       = _BV(TWINT) | _BV(TWSTA) | _BV(TWEN);
            _state     = TWI_READY;
        }
        break;

    case TW_MT_SLA_NACK: // Slave neodpovedal na adresu
        _error = TW_MT_SLA_NACK;
        _stop();
        break;

    case TW_MT_DATA_NACK: // Slave neodpovedal na data
        _error = TW_MT_DATA_NACK;
        _stop();
        break;

    case TW_MT_ARB_LOST: // Strata arbitracie na sbernici
        _error = TW_MT_ARB_LOST;
        _release_bus();
        break;

    // ── Master Receiver ───────────────────────────────────────────────────────
    case TW_MR_SLA_ACK: // Slave potvrdil adresu — priprav prijem
        _reply(_buf_idx < _buf_len ? 1 : 0);
        break;

    case TW_MR_DATA_ACK: // Bajt prijaty, ACK odoslany
        _buf[_buf_idx++] = TWDR;
        _reply(_buf_idx < _buf_len ? 1 : 0);
        break;

    case TW_MR_DATA_NACK: // Posledny bajt prijaty, NACK odoslany
        _buf[_buf_idx++] = TWDR;
        if (_send_stop) {
            _stop();
        } else {
            _rep_start = 1u;
            TWCR       = _BV(TWINT) | _BV(TWSTA) | _BV(TWEN);
            _state     = TWI_READY;
        }
        break;

    case TW_MR_SLA_NACK: // Slave neodpovedal na adresu pri citani
        _stop();
        break;

    // ── Chybove stavy ─────────────────────────────────────────────────────────
    case TW_NO_INFO: // Ziadna informacia — ignoruj
        break;

    case TW_BUS_ERROR: // Nelegalna START/STOP podmienka
        _error = TW_BUS_ERROR;
        _stop();
        break;
    }
}
