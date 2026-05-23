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

#define WAIT_CYCLES 250000

//waits an arbitary amount of time
void wait(int n){
    for(int ii = 0; ii < n; ++ii);
}

void wait_fixed(){
    wait(WAIT_CYCLES);
}

__attribute__((section(".vram"), used))
uint16_t frame[] = {FULL_FRAME};

__attribute__((section(".tram"), used))                    
char text_buffer[368] = {
  /*"##########################"*/ 
    "                          "
    " @@@   @@@    @@@@@@@  @  "
    " @  @ @      @  __   @  @ "
    " @  @  @@   @  @@@@ @  @  "
    " @  @    @   @  ^^    @   "
    " @@@  @@@     @@@@@@@@    "
    "                          "
    " @@@  @@@  @@@ @   @ @@@@ "
    "    @    @  @  @@ @@ @    "
    " @@@    @   @  @ @ @ @@@@ "
    "    @  @    @  @   @ @    "
    " @@@  @@@@ @@@ @   @ @    "
    "                          "
    "                          "
  /*"##########################"*/ 
};

int junk[] = {1, 2, 3, 4, 5};

int main(){

    size_t ret_arr[5];
    char tmp[2];

    wait_fixed();
    wait_fixed();
    wait_fixed();
    wait_fixed();
    wait_fixed();
    wait_fixed();
    wait_fixed();
    wait_fixed();
    wait_fixed();
    wait_fixed();

    wait_fixed();
    newline();
    ret_arr[0] = write("hello");
    newline();
    tmp[0] = (char)ret_arr[0] + 48;
    tmp[1] =  '\0';
    write(tmp);

    wait_fixed();
    newline();
    ret_arr[1] = write("hi");
    newline();
    tmp[0] = (char)ret_arr[1] + 48;
    write(tmp);

    wait_fixed();
    newline();
    ret_arr[2] = write("penis");
    newline();
    tmp[0] = (char)ret_arr[2] + 48;
    write(tmp);

    wait_fixed();
    newline();
    ret_arr[3] = write("cockatoo");
    newline();
    tmp[0] = (char)ret_arr[3] + 48;
    write(tmp);

    wait_fixed();
    newline();
    ret_arr[4] = write("REDACTED");
    newline();
    tmp[0] = (char)ret_arr[4] + 48;
    write(tmp) + 48;

    wait_fixed();
    newline();
    write("bcd_test...");
    print_uint(-1);

    return tb_return(0, 0);

}