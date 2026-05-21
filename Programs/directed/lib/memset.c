//does as char's so that its byte by byte
//credit to gpt
#include "drysoup.h"
#include <stddef.h>

//manual definition of memset which is called and occasiaonlly by gcc
//int c only uses bottom byte
void *memset(void *s, int c, size_t n){

    for (size_t i = 0; i < n; i++) {
        ((unsigned char*)s)[i] = (unsigned char)c;
    }

    return s;
}