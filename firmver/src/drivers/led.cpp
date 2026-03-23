#include "reg.h"
#include "drivers/led.h"
#include "const.h"

namespace Led {
    // Registre
    volatile static uint8_t _LED_B_REG          = 0;
    volatile static uint8_t _LED_B_CNT = 0;

    static uint8_t _brightness = DEFAULT_LED_BRIGHTNESS;

    ////////////////////////////////
    // Privatne funkcie
    ////////////////////////////////

    static void _setSoftPWMDuty(uint8_t duty) {
        ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
            _LED_B_REG = duty; // Nastavime novu prahovu hodnotu pre PWM.
            _LED_B_CNT = 0; // Resetujeme pocitadlo aby sa zmeny prejavily.
        }
    }

    ////////////////////////////////
    // Verejne funkcie
    ////////////////////////////////

    void setupRegisters() {
        // Timer1: 8-bit Fast PWM (WGM10 + WGM12), prescaler 1 -> 62.5 kHz.
        // OC1A (PB1 = LED_R) and OC1B (PB2 = LED_G) are driven by this timer.
        // COM1A1/COM1B1 bits are managed dynamically inside Led::setColorBrightness.
        // Without this init, Led::setColorBrightness() with 0 < val < 255 silently has no
        // effect because the timer never counts and the PWM output never toggles.
        TCCR1A = (1 << WGM10);
        TCCR1B = (1 << WGM12) | (1 << CS10);
        OCR1A  = 0;
        OCR1B  = 0;

        SBI(DDRB, Color::RED);
        CBI(PORTB, Color::RED); // OUTPUT LOW (620R)
        SBI(DDRB, Color::GREEN);
        CBI(PORTB, Color::GREEN); // OUTPUT LOW (470R)
        SBI(DDRB, Color::BLUE);
        CBI(PORTB, Color::BLUE); // OUTPUT LOW (470R)
    }

    void setColor(uint8_t color) {
        setColorBrightness(color, _brightness);
    }

    // Jediny volny casovac je Timer1
    void setColorBrightness(uint8_t color, uint8_t val) {
        const uint8_t digital = val == 0 || val == 255;
        if (val == 0) {
            CBI(PORTB, color);
        } else if (val == 255) {
            SBI(PORTB, color);
        }

        switch(color)
        {
            case Color::RED: // pin PD9
                LED_R_REG = val;
                MBI(TCCR1A, COM1A1, !digital); // Vypne zapne PWM podla digital
                break;
            case Color::GREEN: // pin PD10
                LED_G_REG = val;
                MBI(TCCR1A, COM1B1, !digital);
                break;
            case Color::BLUE: // pin PD11 (na casovaci 2 ktory je zabrany, takze pouzivame softverovu PWM)
                _setSoftPWMDuty(digital ? 0 : val);
                break;
            default:
                break;
        }
    }

    void setBrightness(uint8_t val) {
        _brightness = val;

        setRGB(val, val, val);
    }

    void setRGB(uint8_t r, uint8_t g, uint8_t b) {
        setColorBrightness(Color::RED, r);
        setColorBrightness(Color::GREEN, g);
        setColorBrightness(Color::BLUE, b);
    }

    void onMainLoopTick() {
        uint8_t reg, cnt;

        // Citame hodnoty atomicky pre konzistentnost.
        ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
            reg = _LED_B_REG;
            cnt = _LED_B_CNT;
        }

        if (reg == 0 || cnt < reg) {
            CBI(PORTB, Color::BLUE);
        } else {
            SBI(PORTB, Color::BLUE);
        }
    }

    CALLED_FROM_ISR void onISRTick() {
        // Softverove PWM pre modru ledku na ktoru uz nezvysil ziaden casovac.
        _LED_B_CNT += LED_B_STEP;
    }
}
