#include <stdio.h>
#include <dirent.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <string>
#include <string.h>

#include "luo/utils.hpp"

using namespace std;

int main(int argc, char *argv[]) 
{
    vector<string> files;

    const string dir("/tmp/test");
    luo::list_dir("/tmp/test", files);
    //luo::list_dir(dir, files);
    cout << "list_dir " << endl;
    for (int i=0; i<files.size(); i++)
        cout << files[i] << ' ';
    cout << endl;
    
    luo::list_dir_r("/tmp/test", files);
    cout << "list_dir_r " << endl;
    for (int i=0; i<files.size(); i++)
        cout << files[i] << ' ';
    cout << endl;
    return 0;
}

