#include "base.h"
#include "drysoup.h"

__attribute__((section(".tram"), used))                    
char text_buffer[368] = {
  /*"##########################"*/ 
    "                          "
    "                          "
    "                          "
    "                          "
    "                          "
    "          HI MOM          "
    "            :)            "
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


    return tb_return(
        text_buffer[0],
        text_buffer[0]
    );
}