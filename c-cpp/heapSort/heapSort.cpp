#include <iostream>

using namespace std;
/*为了方便计算parent、leftSlot、rightSlot特将数组第0号元素放弃掉，从A[1]开始*/
int A[] = {0, 4, 1, 3, 2, 16, 9, 10, 14, 8, 7};

void print()
{
    int size = sizeof(A)/sizeof(int);
    for (int i=1; i<size; i++)
    {
        cout << A[i] << " ";
    }
    cout << endl;
}

inline int parentSlot(int i)
{
    return i>>1;
}

inline int leftSlot(int i)
{
    return i<<1;
}

inline int rightSlot(int i)
{
    return (i<<1)+1;
}

void maxHeap(int*A, int slot, int size)
{
    int left = leftSlot(slot);
    int right= rightSlot(slot);
    int largest = slot;

    if (left<size && A[left]>A[slot])
        largest = left;
    if (right<size && A[right]>A[largest])
        largest = right;

    if (largest != slot)
    {
        int tmp = A[slot];
        A[slot] = A[largest];
        A[largest] = tmp;

        return maxHeap(A, largest, size);
    }
    return;
}

void buildMaxHeap(int*A, int size)
{
    //0 is dropped
    for (int i=(size>>1); i>0; i--)
    {
        maxHeap(A, i, size);
    }
}

void heapSort(int* A, int size)
{
    buildMaxHeap(A, size);
    for (int i=size-1; i>=2; i--)
    {
        int tmp = A[i];
        A[i] = A[1];
        A[1] = tmp;
        maxHeap(A, 1, i);
    }
}

int main(int args, char** argv)
{
    heapSort(A, sizeof(A)/sizeof(int));
    print();
    return 0;
}
