/*
 * 读取文件夹，进行的判断，以及错误分析
 */
#include <iostream>
#include <errno.h>
#include <sys/types.h>
#include <dirent.h>
#include <unistd.h>


using namespace std;

int main(int args, char** argv){

    DIR* dir;

    dir = opendir("/tmp/asdf");

    if(dir == NULL){
        switch(errno){
            case EACCES:
                cout << "权限不足" << endl;
                break;
            case EMFILE:
                cout << "已到达进程可同时打开的文件上限" << endl;
                break;
            case ENFILE:
                cout << "已到达系统可同时打开的文件上限" << endl;
                break;
            case ENOTDIR:
                cout << "参数name不是真正目录" << endl;
                break;
            case ENOENT:
                cout << "参数name指定的目录不存在，或是name为一个空字符串" << endl;
                break;
            case ENOMEM:
                cout << "核心内存不足" << endl;
                break;
            default:
                cout << "unknown error : " << errno << endl;
                break;
        }
    }
    else
        cout << "读取目录成功" << endl;
    return 0;
}
