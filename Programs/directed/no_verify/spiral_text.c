#include "base.h"
#include "drysoup.h"

#define SNAKE_LEN 10
#define WAIT_CYCLES 25000

//waits an arbitary amount of time
void wait(int n){
    for(int ii = 0; ii < n; ++ii);
}

void wait_fixed(){
    wait(WAIT_CYCLES);
}

void progress_array(int* cord_x_history, int* cord_y_history){
    for(int ii = SNAKE_LEN-1; ii > 0; ii--){ //4, 3, 2, 1
        cord_x_history[ii] = cord_x_history[ii-1];
        cord_y_history[ii] = cord_y_history[ii-1];
    }
}

void init_frame(char* text_buffer, char init_val){
    for(int ii = 0; ii < 368; ++ii){
        text_buffer[ii] = init_val;
    }
}

void draw_snake(char* text_buffer, int* cord_x_history, int* cord_y_history){
    //only write if within bounds
    for(int ii = 0; ii < SNAKE_LEN; ii++){
        if((0 <= cord_x_history[ii] && cord_x_history[ii] <= 25) && (0 <= cord_y_history[ii] && cord_y_history[ii] <= 13)){
            text_buffer[cord_x_history[ii] + 26*cord_y_history[ii]] = '#';//(char)0x9D;
        }   
    }
}

void init_vals(
    int* cord_x,
    int* cord_y,
    int* lower_x,
    int* lower_y,
    int* upper_x,
    int* upper_y,
    int* cord_x_history,
    int* cord_y_history
){
    *cord_x = 0;
    *cord_y = 0;
    *lower_x = -1; //inclusive
    *lower_y = 0; //inclusive
    *upper_x = 25; //inclusive
    *upper_y = 13; //inclusive

    for (int i = 0; i < SNAKE_LEN; ++i) {
        cord_x_history[i] = 0;
        cord_y_history[i] = 0;
    }
}

__attribute__((section(".tram"), used))                    
char text_buffer[368] = {[0 ... 367] = ' '};

int main(){

    int cord_x;
    int cord_y;
    int lower_x;
    int lower_y;
    int upper_x;
    int upper_y;
    int cord_x_history[SNAKE_LEN];
    int cord_y_history[SNAKE_LEN];

    init_vals(
        &cord_x,
        &cord_y,
        &lower_x,
        &lower_y,
        &upper_x,
        &upper_y,
        cord_x_history,
        cord_y_history
    );

    for(;;){

        init_frame(text_buffer, ' ');

        draw_snake(text_buffer, cord_x_history, cord_y_history);

        if((cord_x == 7) && (cord_y == 7)){

            for(int ii = 0; ii < SNAKE_LEN; ++ii){
                progress_array(cord_x_history, cord_y_history);
                init_frame(text_buffer, ' ');
                draw_snake(text_buffer, cord_x_history, cord_y_history);
                wait_fixed();

            }init_vals(
                &cord_x,
                &cord_y,
                &lower_x,
                &lower_y,
                &upper_x,
                &upper_y,
                cord_x_history,
                cord_y_history
            );

        }else if((6 <= cord_x && cord_x <= 18) && (cord_y == 7)){
            cord_x--;

        }else if((cord_x <= lower_x) && (cord_y <= lower_y)){
            //top left turning right
            cord_x++;
            upper_y--;

        }else if((cord_x < upper_x) && (cord_y <= lower_y)){
            //top row, moving right
            cord_x++;

        }else if((cord_x >= upper_x) && (cord_y <= lower_y)){
            //top right, turning down
            cord_y++;
            lower_x++;

        }else if((cord_x >= upper_x) && (cord_y < upper_y)){
            //rightmost col, moving down
            cord_y++;

        }else if((cord_x >= upper_x) && (cord_y >= upper_y)){
            //bottom right, turning left
            cord_x--;
            lower_y++;

        }else if((cord_x > lower_x) && (cord_y >= upper_y)){
            //bottom row, moving left
            cord_x--;

        }else if((cord_x <= lower_x) && (cord_y >= upper_y)){
            //bottom left, turning up
            cord_y--;
            upper_x--;

        }else if((cord_x <= lower_x) && (cord_y > lower_y)){
            //leftmove col, moving up
            cord_y--;

        }else{
            //crash
            for(int ii = 0; ii < 368; ++ii){
                text_buffer[ii] = (char)0x9D;

            }return -1;
        }

        progress_array(cord_x_history, cord_y_history);

        cord_x_history[0] = cord_x;
        cord_y_history[0] = cord_y;

        wait_fixed();
    }

    return tb_return(0, 0);

}