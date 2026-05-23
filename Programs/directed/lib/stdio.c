#include "drysoup.h"
#include <stddef.h>


#include <stdarg.h>


extern char _tram_top; //top right of stdout
extern char _tram_bottom; //slightly past the bottom right of stdout (unused mem)
extern size_t _tram_size;

char* tram_top = &_tram_top;
char* tram_bottom = &_tram_bottom;
size_t tram_size = (size_t)&_tram_size;

//returns len of str cpy'd to the stdout, excluding nullterm
size_t write_nl(char* str){

    int str_end_idx = 26;
    for(int i = 0; i < 26; ++i){
        //print_uint(i);
        if(str[i]){
            ((char*)(tram_bottom + 338))[i] = str[i];
        }else{
            str_end_idx = i;
            break;
        }

    }
    for(int j = str_end_idx; j < 26; ++j){
        //print_uint(j);
        ((char*)(tram_bottom + 338))[j] = ' '; //fill out remaining line with empyt spaces

    }return (size_t)str_end_idx;
}

void newline(){
    //copy lines to lines above
    for(int ii = 0; ii < 13; ++ii){
        memcpy((tram_bottom + 26*ii), (tram_bottom + 26*(ii+1)), 26);

    }//zero out last line (26*13)
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
        write_nl("0");
        return;

    //largest array needed for 32bit bcd val
    }int bcd_arr[10];
    int bcd_len = uint2bcd(int_val, bcd_arr);
    
    char tmp_str[11];
    for(int i = 0; i < bcd_len; ++i){
        tmp_str[i] = bcd_arr[bcd_len-i-1] + 48;

    }tmp_str[bcd_len] = '\0';

    newline();
    write_nl(tmp_str);
}

int printf(const char* fmt, ...){

    //declare an init args list
    va_list args;
    va_start(args, fmt);

    //full text buff, plus null buffer
    char tmp_str[32];
    char buffer[365];
    char* buffer_ptr = buffer;
    char* upper_bound = buffer + 364; //one char oustide of tbuff, should have null ptr

    int bcd_arr[10]; //largest arr for 32bit bcd
    int str_len, leading_zero_cnt, tmp;
    bool is_negative;
    int uppercase_en = 0;

    //not null terminated to avoid extra padding
    char hex_chars[32] = {
        '0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f',
        '0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'
    };

    int int_val;
    uint32_t uint_val;

    int j = 10;
    while(*fmt){ //buffer_ptr should always either be in the buffer, or at the last idx of buffer (null term)

        print_uint((int)fmt);
        //printf("curr char: %c @ %p\n", *fmt, fmt);
        if(*fmt == '%'){
            //printf("found */,\n");

            fmt++;
            switch(*(fmt++)){

                case 'd':
                case 'i':

                    //catch zero, write to buffer and inc ptr
                    if(!(int_val = va_arg(args, int))){
                        if(buffer_ptr < upper_bound){ //check if this write is implicitly writing a nullterm
                            (buffer_ptr++)[0] = '0';
                            break;
                        }else{
                            printf("overflow in buffer");
                        }
                    }//get neg status and abs int_val
                    if(int_val < 0){
                        is_negative = true;
                        int_val = -int_val;

                    }else{is_negative = false;}

                    //convert to bcd, write neg sign
                    str_len = uint2bcd((uint32_t)int_val, bcd_arr) + is_negative;
                    if((buffer_ptr + (str_len-1)) >= upper_bound){
                        printf("overflow in buffer");

                    }if(is_negative) (buffer_ptr++)[0] = '-';

                    //write remainder of ascii chars
                    for(int i = 0; i < (str_len-is_negative); ++i){
                        buffer_ptr[i] = bcd_arr[str_len-is_negative-i-1] + 48; //indexing :)

                    }buffer_ptr += str_len-is_negative;

                    break;
                case 'u':

                    //catch zero, write to buffer and inc ptr
                    if(!(uint_val = va_arg(args, uint32_t))){
                        if(buffer_ptr < upper_bound){ //check if this write is implicitly writing a nullterm
                            (buffer_ptr++)[0] = '0';
                            break;
                        }else{
                            printf("overflow in buffer");
                        }
                    }str_len = uint2bcd(uint_val, bcd_arr);
                    
                    if((buffer_ptr + (str_len-1)) >= upper_bound){
                        printf("overflow in buffer");

                    //write ascii to buffer, inc ptr
                    }for(int i = 0; i < str_len; ++i){
                        buffer_ptr[i] = bcd_arr[str_len-i-1] + 48;

                    }buffer_ptr += str_len;

                    break;
                case 'b': //works fine (i think :), just not a part of gcc's std imp so not including it here for "compatability"

                    //catch zero, write to buffer and inc ptr
                    if(!(uint_val = va_arg(args, uint32_t))){
                        if(buffer_ptr < upper_bound){ //check if this write is implicitly writing a nullterm
                            (buffer_ptr++)[0] = '0';
                            break;
                        }else{
                            printf("overflow in buffer");
                        }
                    }memset(tmp_str, 0, sizeof(tmp_str));
                    leading_zero_cnt = 0;

                    //shift then write ascii to tmp_str
                    for(int i = 31; i >= 0; --i){

                        //keep track of num of leading zeros
                        tmp = (uint_val & 1);
                        if(tmp){
                            leading_zero_cnt = 0;
                        }else{
                            leading_zero_cnt++;      

                        }tmp_str[i] = tmp + 48;
                        uint_val >>= 1;

                    //catch buffer overflow before write
                    }if((buffer_ptr + (32-leading_zero_cnt) - 1) >= upper_bound){
                        printf("overflow in buffer");

                    //take full str, and cut off all leading zeros
                    }for(int i = leading_zero_cnt; i < 32; ++i){
                        buffer_ptr[i-leading_zero_cnt] = tmp_str[i];

                    //inc ptr according to how much was written
                    }buffer_ptr += (32-leading_zero_cnt);
                    
                    break;
                case 'o':

                    //catch zero, write to buffer and inc ptr
                    if(!(uint_val = va_arg(args, uint32_t))){
                        if(buffer_ptr < upper_bound){ //check if this write is implicitly writing a nullterm
                            (buffer_ptr++)[0] = '0';
                            break;
                        }else{
                            printf("overflow in buffer");
                        }
                    }memset(tmp_str, 0, sizeof(tmp_str));
                    leading_zero_cnt = 0;

                    //shift then write ascii to tmp_str
                    for(int i = 10; i >= 0; --i){

                        //keep track of num of leading zeros
                        tmp = (uint_val & 0x7);
                        if(tmp){
                            leading_zero_cnt = 0;
                        }else{
                            leading_zero_cnt++;      

                        }tmp_str[i] = (tmp) + 48;
                        uint_val >>= 3;

                    //catch buffer overflow before write
                    }if((buffer_ptr + (11-leading_zero_cnt) - 1)>= upper_bound){
                        printf("overflow in buffer");
                    
                    //take full str, and cut off all leading zeros
                    }for(int i = leading_zero_cnt; i < 11; ++i){
                        buffer_ptr[i-leading_zero_cnt] = tmp_str[i];

                    //inc ptr according to how much was written
                    }buffer_ptr += (11-leading_zero_cnt);

                    break;
                case 'X':
                    uppercase_en = 16;
                case 'x':

                    //catch zero, write to buffer and inc ptr
                    if(!(uint_val = va_arg(args, uint32_t))){
                        if(buffer_ptr < upper_bound){ //check if this write is implicitly writing a nullterm
                            (buffer_ptr++)[0] = '0';
                            break;
                        }else{
                            printf("overflow in buffer");
                        }
                    }memset(tmp_str, 0, sizeof(tmp_str));
                    leading_zero_cnt = 0;

                    //shift then write ascii to tmp_str
                    for(int i = 7; i >= 0; --i){

                        //keep track of num of leading zeros
                        tmp = hex_chars[(uint_val & 0xF) + uppercase_en];
                        if(tmp != '0'){
                            leading_zero_cnt = 0;
                        }else{
                            leading_zero_cnt++;      

                        }tmp_str[i] = tmp;
                        uint_val >>= 4;

                    //catch buffer overflow before write
                    }if((buffer_ptr + (8-leading_zero_cnt) - 1) >= upper_bound){
                        printf("overflow in buffer");

                    //take full str, and cut off all leading zeros
                    }for(int i = leading_zero_cnt; i < 11; ++i){
                        buffer_ptr[i-leading_zero_cnt] = tmp_str[i];

                    //inc ptr according to how much was written
                    }buffer_ptr += (8-leading_zero_cnt);
                    uppercase_en = 0;

                    break;
                case '%':

                    //max write is 1 chars, so 0(1) + 0<-OOB check
                    if(buffer_ptr >= upper_bound)
                        printf("overflow in buffer");

                    break;
                default:

                    printf("UNKOWN IDENTIFIER");
                    
        
            }
        }else{ //inc ptr if in bounds, close off str if not
            if(buffer_ptr < upper_bound){
                *(buffer_ptr++) = *fmt++;

            }else{
                *buffer = '\0';
                break;
            }
        }        
    }

    write_nl(buffer);
    print_uint(tram_top);
    print_uint(tram_bottom);
    //fill out frame buffer
    for(int i = 0; i < 364; ++i){
        tram_bottom[i] = buffer[i];
    }
}

int putchar(int c){
    char tmp_str[] = {(char)c, '\0'};
    newline();
    write_nl(tmp_str);
}

