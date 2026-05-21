
#include <stdio.h>

//waits an arbitary amount of time
void wait(int n){
    for(int ii = 0; ii < n; ++ii);
}


int main(){

    int cord_x = 0;
    int cord_y = 0;
    int lower_x = -1; //inclusive
    int lower_y = 0; //inclusive
    int upper_x = 25; //inclusive
    int upper_y = 13; //inclusive

    int cord_x_history[] = {0, 0, 0, 0, 0};
    int cord_y_history[] = {0, 0, 0, 0, 0};

    int junk;

    for(;;){

        scanf("%d", &junk);
        printf("[%d, %d]", cord_x, cord_y);

        // //clear frame
        // for(int ii = 0; ii < 368; ++ii){
        //     text_buffer[ii] = ' ';
        // }

        //only write if within bounds
        // for(int ii = 0; ii < 5; ii++){
        //     if((0 <= cord_x_history[ii] <= 25) & (0 <= cord_y_history[ii] <= 13)){
        //         text_buffer[cord_x_history[ii] + 26*cord_y_history[ii]] = (char)0x9D;
        //     }   
        // }


        if((6 <= cord_x <= 18) & (cord_y == 7)){
            cord_x--;

        }else if((cord_x <= lower_x) & (cord_y <= lower_y)){
            //top left turning right
            cord_x++;
            upper_y--;

        }else if((cord_x < upper_x) & (cord_y <= lower_y)){
            //top row, moving right
            cord_x++;

        }else if((cord_x >= upper_x) & (cord_y <= lower_y)){
            //top right, turning down
            cord_y++;
            lower_x++;

        }else if((cord_x >= upper_x) & (cord_y < upper_y)){
            //rightmost col, moving down
            cord_y++;

        }else if((cord_x >= upper_x) & (cord_y >= upper_y)){
            //bottom right, turning left
            cord_x--;
            lower_y++;

        }else if((cord_x > lower_x) & (cord_y >= upper_y)){
            //bottom row, moving left
            cord_x--;

        }else if((cord_x <= lower_x) & (cord_y >= upper_y)){
            //bottom left, turning up
            cord_y--;
            upper_x--;

        }else if((cord_x <= lower_x) & (cord_y > lower_y)){
            //leftmove col, moving up
            cord_y--;

        }else if((6 <= cord_x <= 18) & (cord_y == 7)){
            cord_x--;

        }else{
            //crash
            // for(int ii = 0; ii < 368; ++ii){
            //     text_buffer[ii] = (char)0x9D;

            return -1;
        }

        for(int ii = 4; ii > 0; ii--){ //4, 3, 2, 1
            cord_x_history[ii] = cord_x_history[ii-1];
            cord_y_history[ii] = cord_y_history[ii-1];
        }

        cord_x_history[0] = cord_x;
        cord_y_history[0] = cord_y;

    }

    return 0;

}