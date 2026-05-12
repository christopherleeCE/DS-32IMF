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

const uint16_t frame[] = {FULL_FRAME};

int main(){

    int* x = malloc(sizeof(int));
    int* y = malloc(sizeof(int));
    int* z = malloc(sizeof(int));

    *x = 5;
    *y = 7;
    *z = *x - 2*(*y) + 10;

    return tb_return(*z, *z);

}