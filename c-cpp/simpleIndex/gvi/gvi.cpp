
#include "gvi.h"

#include <iostream>
#include <string.h>


namespace luolei { namespace hit { namespace cir { namespace se { namespace gvi {

    static int MASKS[4] = {0xFF, 0xFFFF, 0xFFFFFF, 0xFFFFFFFF};

    void readGVInt(unsigned int* data, const unsigned char* buf){
        unsigned char tags = buf[0];

        const unsigned char* p = &buf[1];

        const char* offset = GVIENTRY[tags];

        for(int i=0; i<4; i++){
            data[i] = (*((int*)p) & MASKS[offset[i]]);
            p += (offset[i] + 1);
        }
    }

    int writeGVInt(unsigned char *buf, const unsigned int *data, int size){

        if(size > 4)
            throw MyException("size in writeGVInt should be never larger than 4");

        int tags = 0;
        int pos = 1;//从buf[1]开始，buf[0]留给tags

        int chars = 0;//总共在buf中写了多少个char

        for(int i=0; i<size; i++){
            int tmp = data[i];
            int bits= 0;
            while( (tmp & 0x100) > 0){
                buf[pos++] = (tmp & 0xFF);
                chars++;
                bits++;
                tmp >>= 8;
            }
            buf[pos++] = tmp;
            chars++;
            //bits++;bits就是应该比实际的少1，tags中11表示4
            tags += (bits << (6-(i<<1)));
        }
        if(size < 4){
            int tmp = 4- size;
            buf[pos++] = 0;
            chars++;
        }
        buf[0] = tags;
        chars++;
        return chars;
    }
}}}}}//namespace luolei::hit::cir::se::gvi

