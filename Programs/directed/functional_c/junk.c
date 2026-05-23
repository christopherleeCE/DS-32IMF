#include "base.h"
#include "drysoup.h"

#define WAIT_CYCLES 250000

//waits an arbitary amount of time
void wait(int n){
    for(int ii = 0; ii < n; ++ii);
}

void wait_fixed(){
    wait(WAIT_CYCLES);
}

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

int main(){

    printf("val: %d", 9876543210);
    return tb_return(0, 0);

}