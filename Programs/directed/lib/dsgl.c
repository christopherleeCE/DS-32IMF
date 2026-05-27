#ifndef X86_BUILD

#include "drysoup.h"
#include <stddef.h>

extern uint16_t _vram_top;
extern uint16_t _vram_bottom;
// extern size_t _vram_size;

uint16_t* vram_top = &_vram_top;
uint16_t* vram_bottom = &_vram_bottom;
// size_t vram_size = &_vram_size;

int draw_pixel(uint8_t x, uint8_t y, uint16_t xrgb){
    if(x < 160 && y < 120){
        *(vram_bottom + (160*y + x)) = xrgb;
        return 0;

    }return -1;
}

int draw_line(uint8_t x0, uint8_t y0, uint8_t x1, uint8_t y1, uint16_t xrgb){
    int x_len = x1 - x0;
    float slope = (float)(y1-y0)/(float)(x_len);
    float inv_slope = 1.0/slope;
    float curr_y = (float)y0;
    int x_itr = (float)x1/(float)slope;
    float scaled_float = slope / (x_itr/x_len);

    if(x_len >= 0){
        for(float curr_x = x0; curr_x < y1; curr_x += inv_slope){
            for(int ii = 0; ii < 250000; ++ii);
            printf("<%d, %d>\n", (int)curr_x, (int)curr_y);
            *(vram_bottom + (int)(160.0*curr_y + curr_x)) = xrgb;
            curr_y += scaled_float;
        }
    }

    //doesnt work lol
    return 0;

}

#endif