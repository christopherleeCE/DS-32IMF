#include "base.h"
#include "drysoup.h"

int square(int x) {
    return x * x;
}

int accumulate(int n) {
    int sum = 0;
    for (int i = 0; i < n; i++)
        sum += square(i);
    return sum;
}

int arr[] = {1, 2, 3, 4, 5};

int main(){

    int x = 5;
    int y = 7;
    int z = x - 2*y + 10;

    return tb_return(accumulate(5), accumulate(5));

}