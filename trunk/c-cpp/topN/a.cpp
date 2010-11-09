/*
 *测试取数组的topN算法：
 *1）改进版的快速排序，每次只在一个字串内查找。平均时间O（n）
 *2）维护一个固定大小为N的小根堆
 *
 *测试目的：比较两种方法的速度。
 *
 *注意：在使用第二种方法时，未使用STL的heap，因为需求不同，这里
 *需要的是固定大小的堆。
 */

#include <iostream>
#include <climits>
#include <ctime>
#include <sys/timeb.h>
#include <stdlib.h>
#include "heap.h"

#define SWAP(x, y, z) {(z) = (x);(x) = (y);(y) = (z);}

#define MAX 500000

using namespace std;

int partition(int*A, int left, int right);

void quickSort(int* A, int l, int r, int n);

int main(int args, char** argv)
{

    struct timeb tp;

    int A[MAX] = {0};
    srand((int)time(0));
    for (int i=0; i<MAX; i++)
    {
        A[i] = rand();
    }
    cout << endl;

    ftime(&tp);
    cout << tp.time << "s" << tp.millitm << "ms" << endl;
    MinFixedHeap h(A, 5);
    for(int i=5; i<MAX; i++)
    {
        h.push_heap(A[i]);
    }
    ftime(&tp);
    cout << tp.time << "s" << tp.millitm << "ms" << endl;

    int* array = h.get_heap();
    for(int i=1; i<6; i++)
    {
        cout << array[i] << " ";
    }
    cout << endl;
    ftime(&tp);
    cout << tp.time << "s" << tp.millitm << "ms" << endl;

    quickSort(A, 0, MAX-1, 5);
    ftime(&tp);
    cout << tp.time << "s" << tp.millitm << "ms" << endl;

    for(int i=MAX-5; i<MAX; i++)
    {
        cout << A[i] << " ";
    }
    cout << endl;

    return 0;
}
int partition(int*A, int left, int right)
{
    int x = A[right];
    int i = left - 1;
    int tmp;
    for (int j=left; j<right; j++)
    {
        if(A[j]<=x)
        {
            i++;
            SWAP(A[i], A[j], tmp);
        }
    }
    i++;
    SWAP(A[i], A[right], tmp);
    return i;
}

void quickSort(int* A, int l, int r, int n)
{
    if ((r-l)>n && n>0)
    {
        int q = partition(A, l, r);

       if (r-q+1>n)
        {
            quickSort(A, q+1, r, n);
        }
        else
        {
            quickSort(A, l, q-1, n-(r-q+1));
        }
    }
}
