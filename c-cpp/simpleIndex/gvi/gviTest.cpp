/*
 * Group Variable-length Integer
 *
 * 见WSDM09-keynote.pdf第63页
 *
 * Version 0.2
 *
 */
#include <iostream>
#include <string.h>
#include <string>

#include "gvi.h"

using std::cout;
using std::endl;
using namespace luolei::hit::cir::se::gvi;

int main(int args, char** argv){
    unsigned int int4[] = {1, 15, 511, 13107};
    unsigned char buf[100] = {0};

    int size = writeGVInt(buf, int4);

    cout << "写入到buf数组中" << size << "个字节" << endl;

    memset(int4, 0, sizeof(int)*4);

    readGVInt(int4, buf);

    for(int i=0; i<4; i++){
        cout << int4[i] << " ";
    }
    cout << endl;

    return 0;
}


