#ifndef _HEAP_H
#define _HEAP_H
/*
 * 不同于STL的heap，这个heap是固定大小的
 */
class MinFixedHeap
{
    private:
        int m_size;
        int* m_array;
        void make_heap();
        void adjust_heap(int);
        int inline min(int a, int b){return a>b?b:a;}
    public:
        MinFixedHeap(int* array, int size);
        ~MinFixedHeap();
        void push_heap(int);
        int* get_heap();
};
#endif//_HEAP_H
