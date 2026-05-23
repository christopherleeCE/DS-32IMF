#include "base.h"
#include "drysoup.h"

//waits an arbitary amount of time
void wait(int n){
    for(int ii = 0; ii < n; ++ii);
}

__attribute__((section(".tram"), used))                    
char text_buffer[368] = {[0 ... 367] = ' '};

int main(){

    int cord_x[] = {5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 20, 20, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 5, 5};
    int cord_y[] = {5, 5, 5, 5, 5, 5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  6,  7,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8, 8, 8, 8, 8, 7, 6};

    int len_cord_list = sizeof(cord_x)/sizeof(cord_x[0]);

    int jj = 0;
    for(;;){

        //clear rect
        for(int ii = 0; ii < len_cord_list; ++ii){
            text_buffer[cord_x[ii] + 26*cord_y[ii]] = ' ';
        }

        text_buffer[cord_x[jj] + 26*cord_y[jj]] = (char)0x9D;

        if(++jj >= len_cord_list){
            jj = 0;
        }
    
        wait(500000/10); // ~1 second delay
    }

    return tb_return(0, 0);

}