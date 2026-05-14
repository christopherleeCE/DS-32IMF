#include "base.h"
#include "drysoup.h"

int main(){

    uint16_t color = 0;
    uint16_t* frame_buffer_ptr = (uint16_t*)0x22A00;

    for(;;){
        for(int ii = 0; ii < 19200; ++ii){
            *(frame_buffer_ptr+ii) = color;

        }++color;
    }

    return tb_return((int)color, (int)color);
}