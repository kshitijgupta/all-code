/*
 *
 * 这个demo使用了重定向dup2，把标准输出定向到对一个文件的输出
 *
 * Author：罗磊
 *
 */
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <fcntl.h>
#include <sys/stat.h>

int main()
{
    int fd;

    if((fd = open("file.txt", O_WRONLY, 0)) < 0){
        printf("Can't open file.txt\n");
        return 0;
    }

    dup2(fd, STDOUT_FILENO);
    printf("\nThis is a stdout\n");

    return 0;

}
