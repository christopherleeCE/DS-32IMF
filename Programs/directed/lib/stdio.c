#include "drysoup.h"
#include <stddef.h>


extern char _tram_top; //top right of stdout
extern char _tram_bottom; //slightly past the bottom right of stdout (unused mem)
extern size_t _tram_size;

char* tram_top = &_tram_top;
char* tram_bottom = &_tram_bottom;
size_t tram_size = (size_t)&_tram_size;

//returns len of str cpy'd to the stdout, excluding nullterm
size_t write(char* str){

    int str_end_idx = 26;
    for(int i = 0; i < 26; ++i){
        if(str[i]){
            ((char*)(tram_bottom + 338))[i] = str[i];
        }else{
            str_end_idx = i;
            break;
        }

    }for(int j = str_end_idx; j < 26; ++j){
        ((char*)(tram_bottom + 338))[j] = ' '; //fill out remaining line with empyt spaces

    }return (size_t)str_end_idx;
}

void newline(){
    //copy lines to lines above
    for(int ii = 0; ii < 13; ++ii){
        memcpy((tram_bottom + 26*ii), (tram_bottom + 26*(ii+1)), 26);
    }

    //zero out last line (26*13)
    memset((tram_bottom + 338), (int)(' '), 26);
}

//ret_arr should be of at least size 10
size_t uint2bcd(uint32_t val, int ret_arr[]){
    
    size_t bcd_len = 0;
    for(int i = 0; i < 10; ++i){
        if(val){
            ++bcd_len;

        }ret_arr[i] = val%10;
        val /= 10;

    }return bcd_len;
}

void print_uint(unsigned int int_val){

    //int_val = 0 breaks something down the line...
    //i dont feel like figureing it out, this fixes it
    if(!int_val){
        newline();
        write("0");
        return;

    //largest array needed for 32bit bcd val
    }int bcd_arr[10];
    int bcd_len = uint2bcd(int_val, bcd_arr);
    
    char tmp_str[11];
    for(int i = 0; i < bcd_len; ++i){
        tmp_str[i] = bcd_arr[bcd_len-i-1] + 48;

    }tmp_str[bcd_len] = '\0';

    newline();
    write(tmp_str);
}
