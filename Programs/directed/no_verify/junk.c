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

    char buff[27];
    int sret;
    int i = 0;

    sret = snprintf(NULL, 0, "val: %X,%x,%X,%x,%%%%###", 1,2,3,4);
    print_uint(sret);
    write_nl(buff);
    sret = snprintf(buff, sret+1, "val: %X,%x,%X,%x,%%%%###", 1,2,3,4);
    print_uint(sret);
    write_nl(buff);
    write_nl("done");
    
    return tb_return(0, 0);

}