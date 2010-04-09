/*
 * 这段程序展示了循环展开的技术：
 *
 * 循环展开能够有效帮助程序
 *
 * 这里对于未知的N采用位操作进行展开
 */
#include <stdio.h>

#define N 101

int main(){

    int a[N];
    int i;
    int sum = 0;

    for(i=0; i<N; i++)
        a[i] = (i+1);
    for(i=0; i<(N&~3); i+=4){
        sum += a[i];
        sum += a[i+1];
        sum += a[i+2];
        sum += a[i+3];
    }
    for(i=(N&~3); i<N; i++)
        sum += a[i];

    printf("Sum = %d\n", sum);
    return 0;
}
