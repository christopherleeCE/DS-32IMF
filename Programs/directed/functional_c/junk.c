#include "base.h"
#include "drysoup.h"

int main(){

    int arr[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};

    return tb_return(arr[0], pack_ptr((uint32_t*)arr, sizeof(arr)/sizeof(arr[0]), false));

}