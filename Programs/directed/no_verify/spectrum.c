#include "base.h"
#include "drysoup.h"

int main(){

    uint16_t color = 0;
    uint16_t* frame_buffer_ptr = (uint16_t*)0x22A00;

    for(int ii = 0; ii < 19200; ++ii){
        if((ii%(16*10)) < 16*8){
            *(frame_buffer_ptr+ii) = color;
            ++color;

        }else{
            *(frame_buffer_ptr+ii) = 0x0F0F;
        }
    }

    //*(frame_buffer_ptr+0) = 0xFFFF;
    //*(frame_buffer_ptr+19199) = 0x0000;

    return tb_return(0, 0);
}