#include "base.h"
#include "drysoup.h"

__attribute__((section(".tram"), used))                    
char text_buffer[368];

int main(){
    
    for(int ii = 0; ii < 364; ++ii){
        if(ii < 256){
            text_buffer[ii] = (char)ii;
        }else{
            text_buffer[ii] = 0x9D;
        }
    }

    return 0;
}
