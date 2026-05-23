#ifndef DRYSOUP_H
#define DRYSOUP_H

#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>

//note that in directed_master.ps1, there are possible conflicts with memcpy and memset when the x86 is ran,
//it seems that right now gcc uses the glib version and not ours, howver that alse may cause an issue as our
//2 code runs are actually running different c code, however if you think about it we are really just verifying
//that our lib is correct (that is complete and utter copium, the correct thing to do is to put the #include drysoup.h
//inside and #ifndef X86_BUILD, but that is less asthetic and i refuse to recomend that unless it really becomes an issue)

//libc
void* memcpy(void *dest, const void *src, size_t n);
void* memset(void *s, int c, size_t n);

//stdlib
void* malloc(size_t payload_size);
void* calloc(size_t count, size_t element_size);
void* realloc(void* ptr, size_t new_size);
void free(void* ptr);

//stdio
void newline();
size_t write(char* str);
size_t uint2bcd(uint32_t val, int ret_arr[]);
int putchar(int c);
void print_uint(unsigned int int_val);
int printf(const char *fmt, ...) __attribute__((format(printf, 1, 2)));

//misc
uint32_t pack_ptr(uintptr_t ptr, uint8_t len, bool is_string);
int rf2i(float);

#endif

