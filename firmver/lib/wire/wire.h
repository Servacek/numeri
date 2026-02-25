#ifndef __WIRE_H__
#define __WIRE_H__

#include <stdint.h>

extern "C" {
#include "utility/twi.h"
}

class TwoWire {
    uint8_t _addr = 0;
    uint8_t _tx[TWI_BUFFER_LENGTH];
    uint8_t _tx_len = 0;
    uint8_t _rx[TWI_BUFFER_LENGTH];
    uint8_t _rx_idx = 0;
    uint8_t _rx_len = 0;

  public:
    void begin() {
        twi_init();
    }
    void end() {
        twi_disable();
    }
    void setClock(uint32_t hz) {
        twi_setFrequency(hz);
    }

    void beginTransmission(uint8_t a) {
        _addr   = a;
        _tx_len = 0;
    }
    uint8_t write(uint8_t b) {
        if (_tx_len >= TWI_BUFFER_LENGTH)
            return 0;
        _tx[_tx_len++] = b;
        return 1;
    }
    uint8_t endTransmission(uint8_t stop = 1) {
        return twi_writeTo(_addr, _tx, _tx_len, 1, stop);
    }

    uint8_t requestFrom(uint8_t a, uint8_t len) {
        _rx_len = twi_readFrom(a, _rx, len, 1);
        _rx_idx = 0;
        return _rx_len;
    }
    int available() {
        return _rx_len - _rx_idx;
    }
    int read() {
        return (_rx_idx < _rx_len) ? _rx[_rx_idx++] : -1;
    }
};

extern TwoWire Wire;

#endif // __WIRE_H__
