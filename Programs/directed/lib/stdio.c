#ifndef X86_BUILD 

#include "drysoup.h"
#include <stddef.h>
#include <stdarg.h>


extern char _tram_top; //slightly past the bottom right of stdout (unused mem)
extern char _tram_bottom; //top right of stdout
extern uint8_t _stdout_row;
extern uint16_t _stdout_col;
extern size_t _tram_size;

char* tram_top = &_tram_top;
char* tram_bottom = &_tram_bottom;
uint8_t* stdout_row_ptr = &_stdout_row;
uint16_t* stdout_col_ptr = &_stdout_col;
size_t tram_size = (size_t)&_tram_size;

//returns len of str cpy'd to the stdout, excluding nullterm
size_t write_nl(char* str){

    scroll();

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

//returns len of str cpy'd to the stdout, excluding nullterm
size_t write(char* str){

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

void scroll(){
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
        write_nl("0");
        return;

    //largest array needed for 32bit bcd val
    }int bcd_arr[10];
    int bcd_len = uint2bcd(int_val, bcd_arr);

    char tmp_str[11];
    for(int i = 0; i < bcd_len; ++i){
        tmp_str[i] = bcd_arr[bcd_len-i-1] + 48;

    }tmp_str[bcd_len] = '\0';

    write_nl(tmp_str);
}

void do_nothing(char* str){
    return;
}

/*fixes todo
size == 0, snprintf(NULL, 0, ...)
terminate string FIXED
fallthrough, i dont see that warning, FIXED
hex loop wrong bounds, FIXED
intmin UB, FIXED
uneeded memset, FIXED
ret val, 
*/
int snprintf(char* restrict str, size_t size, const char* restrict fmt, ...){
    va_list args;
    va_start(args, fmt);
    int ret = vsnprintf(str, size, fmt, args);
    va_end(args);
    return ret;
}

int vsnprintf(char* restrict str, size_t size, const char* restrict fmt, va_list args){


    //full text buff, plus null buffer
    char tmp_str[32];
    char* str_ptr = str;
    char* upper_bound = str + (size ? size-1 : 0); //one char oustide of tbuff, should have null ptr

    int bcd_arr[10]; //largest arr for 32bit bcd
    int str_len, leading_zero_cnt, tmp;
    bool is_negative;
    int uppercase_en = 0;
    char* str_base;
    char* str_upper_bound;

    //not null terminated to avoid extra padding
    char hex_chars[32] = {
        '0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f',
        '0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'
    };

    int int_val;
    uint32_t uint_val;

    while(*fmt){ //str_ptr should always either be in the buffer, or at the last idx of buffer (null term)... i think :)
        if(*fmt == '%'){
            fmt++;
            switch(*(fmt++)){

                case 'd':
                case 'i':

                    //if intval = 0
                    if(!(int_val = va_arg(args, int))){

                        //conditonal write, uncondictional prt inc and break
                        if(str_ptr < upper_bound){ //check if this write is implicitly writing a nullterm
                            (str_ptr)[0] = '0';
                            
                        }str_ptr++;
                        break;

                    }//get neg status and abs int_val
                    if(int_val < 0){
                        is_negative = true;
                        int_val = -(uint32_t)int_val; //case to prevent -INT_MIN UB

                    }else{is_negative = false;}

                    //convert to bcd, get str_len (includes neg sign)
                    str_len = uint2bcd((uint32_t)int_val, bcd_arr) + is_negative;
                    str_upper_bound = str_ptr + str_len; //exclusive
                    str_base = str_ptr;

                    //cond write, uncond inc, TODO imp trunc mid %d
                    if(is_negative){

                        if(str_ptr < upper_bound){
                            (str_ptr)[0] = '-';

                        }str_ptr++;

                    }while(str_ptr < str_upper_bound){

                        if(str_ptr < upper_bound){

                            *str_ptr = bcd_arr[str_len - (str_ptr-str_base) - 1] + 48; //bcd indexing, = str_len - i - 1

                        }str_ptr++;
                    }
                    break; //break switch
                case 'u':

                    //if intval = 0
                    if(!(uint_val = va_arg(args, uint32_t))){

                        //conditonal write, uncondictional prt inc and break
                        if(str_ptr < upper_bound){ //check if this write is implicitly writing a nullterm
                            (str_ptr)[0] = '0';
                            
                        }str_ptr++;
                        break;

                    }str_len = uint2bcd(uint_val, bcd_arr);
                    str_upper_bound = str_ptr + str_len; //exclusive
                    str_base = str_ptr;

                    while(str_ptr < str_upper_bound){

                        if(str_ptr < upper_bound){

                            *str_ptr = bcd_arr[str_len - (str_ptr-str_base) - 1] + 48; //bcd indexing, = str_len - i - 1

                        }str_ptr++;
                    }

                    break; //break switch
                case 'b': //works fine (i think :), just not a part of gcc's std imp so not including it here for "compatability"

                    //if uintval = 0
                    if(!(uint_val = va_arg(args, uint32_t))){

                        //conditonal write, uncondictional prt inc and break
                        if(str_ptr < upper_bound){ //check if this write is implicitly writing a nullterm
                            (str_ptr)[0] = '0';
                            
                        }str_ptr++;
                        break;

                    }leading_zero_cnt = 0; 

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

                    }str_upper_bound = str_ptr + 32-leading_zero_cnt;
                    str_base = str_ptr;

                    while(str_ptr < str_upper_bound){

                        if(str_ptr < upper_bound){

                            *str_ptr = tmp_str[(str_ptr-str_base) + leading_zero_cnt];//tmp_str idx = i + offset

                        }str_ptr++;
                    }

                    break; //break switch
                case 'o':

                    //if uintval = 0
                    if(!(uint_val = va_arg(args, uint32_t))){

                        //conditonal write, uncondictional prt inc and break
                        if(str_ptr < upper_bound){ //check if this write is implicitly writing a nullterm
                            (str_ptr)[0] = '0';
                            
                        }str_ptr++;
                        break;

                    }leading_zero_cnt = 0; 

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


                    }str_upper_bound = str_ptr + 11-leading_zero_cnt;
                    str_base = str_ptr;

                    while(str_ptr < str_upper_bound){

                        if(str_ptr < upper_bound){

                            *str_ptr = tmp_str[(str_ptr-str_base) + leading_zero_cnt];//tmp_str idx = i + offset

                        }str_ptr++;
                    } 

                    break; //break switch
                case 'X':
                    uppercase_en = 16;
                case 'x':

                    //if uintval = 0
                    if(!(uint_val = va_arg(args, uint32_t))){

                        //conditonal write, uncondictional prt inc and break
                        if(str_ptr < upper_bound){ //check if this write is implicitly writing a nullterm
                            (str_ptr)[0] = '0';
                            
                        }str_ptr++;
                        break;

                    }leading_zero_cnt = 0;

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


                    }str_upper_bound = str_ptr + 8-leading_zero_cnt;
                    str_base = str_ptr;
                    
                    while(str_ptr < str_upper_bound){

                        if(str_ptr < upper_bound){

                            *str_ptr = tmp_str[(str_ptr-str_base) + leading_zero_cnt];//tmp_str idx = i + offset

                        }str_ptr++;
                    } 

                    uppercase_en = 0;

                    break; //break switch
                case '%':

                    //cond write, uncond inc
                    if(str_ptr < upper_bound){

                        (str_ptr)[0] = '%';

                    }str_ptr++;

                    break;
                default:

                    //cond write, uncond inc
                    if(str_ptr < upper_bound){

                        //runtime error indicator
                        (str_ptr)[0] = 0x9D;

                    }str_ptr++;
                    break; //break switch
            }
        }else{ //if not % identifier, here is where we write non identifiers
            //cond write, uncond inc
            if(str_ptr < upper_bound){
                *str_ptr = *fmt;

            }str_ptr++;
            fmt++;
        }        
    }

    if(size > 0){ //we've reached the end of fmt, terminate str
        *str_ptr = '\0';
    }
    //at this point we are either done with fmt, or reached the upperbound and null termed str[]
    //str_ptr should either be at null term idx (last, size-1) or the null term
    return (int)(str_ptr - str); //TODO imp actual return
}

int printf(const char *restrict fmt, ...){

    //364 + 1
    char buffer[365];
    char* buffer_ptr;
    char* malloc_base;
    char* printed_str_start;
    int num_written;
    bool malloc_used = 0;

    va_list args;
    va_start(args, fmt);

    va_list args_copy;
    va_copy(args_copy, args);

    int ret_size = vsnprintf(NULL, 0, fmt, args);

    if(ret_size <= 364){
        buffer_ptr = buffer;
        num_written = vsnprintf(buffer_ptr, ret_size+1, fmt, args_copy);

    }else{ //cut off start of string if write cnt to large for buffer
        malloc_used = 1;
        buffer_ptr = (malloc_base = malloc(ret_size+1)); //alloc full string plus nulterm
        num_written = vsnprintf(buffer_ptr, ret_size+1, fmt, args_copy);
        buffer_ptr = (printed_str_start += (num_written - 364));

    }va_end(args_copy);
    va_end(args);

    while(*buffer_ptr){

        if(*buffer_ptr == '\n' || *stdout_col_ptr > 25){
            if(*buffer_ptr == '\n') buffer_ptr++;

            if(*stdout_row_ptr >= 13){ //reached bottom of stdout, scroll screen
                scroll();
                *stdout_row_ptr = 13;
            }else{ //not at bottom, newline only
                (*stdout_row_ptr)++;
            }

            *stdout_col_ptr = 0;

        }else{
            if(*buffer_ptr == '\t'){
                for(int i = 0; i < 4; ++i){
                    if(*stdout_col_ptr >= 25){
                        break;
                    }else{
                    *(tram_bottom + 26*(*stdout_row_ptr) + (*stdout_col_ptr)++) = ' ';
                    }
                }buffer_ptr++;
                if(*buffer_ptr == '\0'){
                }
            }else{
                *(tram_bottom + 26*(*stdout_row_ptr) + (*stdout_col_ptr)++) = *buffer_ptr++;
                if(*buffer_ptr == '\0'){
                }

            }
        }
    }

    if(malloc_used){
        free(malloc_base);
        return (int)(buffer_ptr - printed_str_start);
    }else{
        return (int)(buffer_ptr - buffer);
    }
}

int putchar(int c){
    char tmp_str[] = {(char)c, '\0'};
    write_nl(tmp_str);
}


/*
| Specifier | Meaning                               | Example         |
| --------- | ------------------------------------- | --------------- |
| `%d`      | signed decimal int                    | `-42`           |
| `%i`      | signed int                            | `-42`           |
| `%u`      | unsigned decimal int                  | `42`            |
| `%x`      | unsigned hex (lowercase)              | `2a`            |
| `%X`      | unsigned hex (uppercase)              | `2A`            |
| `%o`      | unsigned octal                        | `52`            |
| `%b`      | binary (non-standard, some libs only) | `101010`        |
| `%c`      | character                             | `A`             |
| `%s`      | string                                | `hello`         |
| `%p`      | pointer address                       | `0x1234abcd`    |
| `%f`      | float/double decimal                  | `3.141593`      |
| `%F`      | uppercase float                       | `3.141593`      |
| `%e`      | scientific notation                   | `3.14e+00`      |
| `%E`      | uppercase scientific                  | `3.14E+00`      |
| `%g`      | shortest of `%f` or `%e`              | `3.14`          |
| `%G`      | uppercase `%g`                        | `3.14`          |
| `%a`      | hex float                             | `0x1.91eb86p+1` |
| `%A`      | uppercase hex float                   | `0X1.91EB86P+1` |
| `%n`      | store chars written so far into int*  | —               |
| `%%`      | literal percent sign                  | `%`             |

| Modifier | Type                            |
| -------- | ------------------------------- |
| `hh`     | `signed char` / `unsigned char` |
| `h`      | `short`                         |
| `l`      | `long`                          |
| `ll`     | `long long`                     |
| `z`      | `size_t`                        |
| `t`      | `ptrdiff_t`                     |
| `j`      | `intmax_t`                      |
| `L`      | `long double`                   |

| Escape       | Meaning               |
| ------------ | --------------------- |
| `\\`         | backslash             |
| `\'`         | single quote          |
| `\"`         | double quote          |
| `\?`         | question mark         |
| `\a`         | bell/alert            |
| `\b`         | backspace             |
| `\f`         | form feed             |
| `\n`         | newline               |
| `\r`         | carriage return       |
| `\t`         | horizontal tab        |
| `\v`         | vertical tab          |
| `\0`         | null character        |
| `\ooo`       | octal byte value      |
| `\xhh`       | hex byte value        |
| `\uhhhh`     | Unicode escape (C99+) |
| `\Uhhhhhhhh` | long Unicode escape   |

*/

#endif