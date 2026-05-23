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

    char buff[26];

    newline();
    print_uint(17);
    snprintf(buff, sizeof(buff), "val: %d", 674208);
    wait_fixed();
    wait_fixed();
    wait_fixed();
    wait_fixed();
    wait_fixed();
    wait_fixed();
    newline();
    write_nl(buff);
    return tb_return(0, 0);

}