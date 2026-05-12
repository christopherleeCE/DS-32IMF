#include "base.h"
#include "drysoup.h"

#define W 0x0FFF
#define R 0x000F
#define G 0x00F0
#define B 0x0F00
#define C 0x0880
#define P 0x0F0F

#define RED_START_LINE \
R,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \

#define CYAN_START_LINE \
C,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \

#define GREEN_START_LINE \
G,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \
B,W,P,W,P,W,P,W,    \

#define TWENTY_LINES \
RED_START_LINE      \
CYAN_START_LINE     \
GREEN_START_LINE    \
CYAN_START_LINE     \
GREEN_START_LINE    \
CYAN_START_LINE     \
GREEN_START_LINE    \
CYAN_START_LINE     \
GREEN_START_LINE    \
CYAN_START_LINE     \
GREEN_START_LINE    \
CYAN_START_LINE     \
GREEN_START_LINE    \
CYAN_START_LINE     \
GREEN_START_LINE    \
CYAN_START_LINE     \
GREEN_START_LINE    \
CYAN_START_LINE     \
GREEN_START_LINE    \
CYAN_START_LINE     \

#define HALF_FRAME \
TWENTY_LINES \
TWENTY_LINES \
TWENTY_LINES \

#define FULL_FRAME \
TWENTY_LINES \
TWENTY_LINES \
TWENTY_LINES \
TWENTY_LINES \
TWENTY_LINES \
TWENTY_LINES \

//ensures this stays in .rodata, runs much faster
const uint16_t frame[] = {FULL_FRAME};

int main(){

    uint16_t* frame_buffer_ptr = (uint16_t*)0x22A00;

    for(int ii = 0; ii < (sizeof(frame)/sizeof(frame[0])); ++ii){
        *(frame_buffer_ptr+ii) = frame[ii];
    }

    return tb_return((int)frame[0], (int)frame[0]);

}