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

int square(int x) {
    return x * x;
}

int accumulate(int n) {
    int sum = 0;
    for (int i = 0; i < n; i++)
        sum += square(i);
    return sum;
}

__attribute__((section(".vram"), used))
uint16_t frame[] = {FULL_FRAME};

__attribute__((section(".tram"), used))
char text_buffer[368] = "TEXTBUFFER";

int bss_int;
char bss_str[16];
float bss_big_float_arr[200];

int data_int = 16;
char data_str[16] = "ram_exanple";
float data_big_float_arr[200] = {1.0};

const int rodata_int = 32;
const char rodata_str[16] = "rom_exanple";
const float rodata_big_float_arr[200] = {1.0};

int main(){

    int* x = malloc(sizeof(int));
    int* y = malloc(sizeof(int));
    int* z = malloc(sizeof(int));

    *x = 5;
    *y = 7;
    *z = *x - 2*(*y) + 10;

    free(x);
    free(y);
    free(z);

    return tb_return(text_buffer[0], pack_ptr((uint32_t*)text_buffer, sizeof(text_buffer), true));

}