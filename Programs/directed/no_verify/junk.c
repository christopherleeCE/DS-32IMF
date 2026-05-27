#include "base.h"
#include "drysoup.h"

#define WAIT_CYCLES 250000

//waits an arbitary amount of time
void wait(int n){
    for(int ii = 0; ii < 250000; ++ii);
}

void wait_fixed(){
    wait(WAIT_CYCLES);
}

__attribute__((section(".tram"), used))                    
char text_buffer[368] = {
    /*"##########################"*/ 
      "                          "
      "                          "
      "                          "
      "                          "
      "                          "
      "                          "
      "                          "
      "                          "
      "                          "
      "                          "
      "                          "
      "                          "
      "                          "
      "                          "
    /*"##########################"*/ 
};

int main(){
    wait_fixed();
    wait_fixed();
    wait_fixed();
    wait_fixed();
    wait_fixed();
    wait_fixed();
    char buff[27];
    // snprintf(buff, 26, "<%d>", 12345);
    // write_nl(buff);
    draw_pixel(159, 0, 0x0FFF);
    draw_line(0, 0, 50, 100, 0x0F00);
    return tb_return(0, 0);

}