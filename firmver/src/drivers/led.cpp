#include "utils/reg.h"
#include "drivers/led.h"
#include "const.h"
#include "utils/math.h"
#include "services/logging.h"

namespace Led {
    // Registre
    volatile static uint8_t _LED_B_TOP_REG = 0;
    volatile static uint8_t _LED_B_CNT = 0;

    // Celkovy jas celej LED - maximalny jas pre jednotlive farby.
    uint8_t brightness = 255;

    ////////////////////////////////
    // Privatne funkcie
    ////////////////////////////////

    static void _setSoftPWMDuty(uint8_t duty) {
        ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
            _LED_B_TOP_REG = duty; // Nastavime novu prahovu hodnotu pre PWM.
            _LED_B_CNT     = 0;    // Resetujeme pocitadlo aby sa zmeny prejavily.
        }
    }

    // Jediny volny casovac je Timer1
    static void _setColorBrightness(uint8_t color, uint8_t val) {
        // sprint("_setColorBrightness "); sprint(color); sprint(", "); sprintln(val);
        // Ak sme v nejakom z extremov, kasli na PWM, a prejdi na digitalny rezim.
        const uint8_t digital = (val == 0 || val == 0xFF);

        switch (color) {
        case Color::RED: // pin PD9
            WBI(TCCR1A, COM1A1, !digital); // Vypne zapne PWM podla digital
            WBI(PORTB, color, val == 0xFF);
            LED_R_TOP_REG = val;
            break;
        case Color::GREEN: // pin PD10
            WBI(TCCR1A, COM1B1, !digital);
            WBI(PORTB, color, val == 0xFF);
            LED_G_TOP_REG = val;
            break;
        case Color::BLUE: // pin PD11 (na casovaci 2 ktory je zabrany, takze pouzivame softverovu PWM)
            _setSoftPWMDuty(val);
            break;
        default:
            break;
        }
    }

    ////////////////////////////////
    // Verejne funkcie
    ////////////////////////////////

    void setupRegisters() {
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
        _setColorBrightness(color, brightness);
    }

    // Budeme nastavovat len jednu uroven jasu pre vsetky farby.
    void setBrightness(uint8_t val) {
        if (brightness != 0) {
            _setColorBrightness(Color::RED, (LED_R_TOP_REG * val) / brightness);
            _setColorBrightness(Color::GREEN, (LED_G_TOP_REG * val) / brightness);
            _setColorBrightness(Color::BLUE, (_LED_B_TOP_REG * val) / brightness);
        }
        brightness = val;
    }

    void setRGB(uint8_t r, uint8_t g, uint8_t b) {
        _setColorBrightness(Color::RED,   MAP(r, 0, 0xFF, 0, brightness));
        _setColorBrightness(Color::GREEN, MAP(g, 0, 0xFF, 0, brightness));
        _setColorBrightness(Color::BLUE,  MAP(b, 0, 0xFF, 0, brightness));
    }

    ////////////////////

    void onMainLoopTick() {
        uint8_t reg, cnt;

        // Citame hodnoty atomicky pre konzistentnost.
        ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
            reg = _LED_B_TOP_REG;
            cnt = _LED_B_CNT;
        }

        WBI(PORTB, Color::BLUE, reg == 0xFF || (reg != 0 && cnt >= reg));
    }

    void onISRTick() {
        // Softverove PWM pre modru ledku na ktoru uz nezvysil ziaden casovac.
        _LED_B_CNT += LED_B_STEP;
    }
}
