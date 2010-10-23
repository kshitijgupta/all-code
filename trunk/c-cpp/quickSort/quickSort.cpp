#include <iostream>
#define SWAP(x, y, z) {(z) = (x);(x) = (y);(y) = (z);}

using namespace std;

int A[] = {0, 4, 1, 3, 2, 16, 9, 10, 14, 8, 7};

void print()
{
    int size = sizeof(A)/sizeof(int);
    for(int i=0; i<size; i++)
        cout << A[i] << " ";
    cout << endl;
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

void quickSort(int* A, int l, int r)
{
    if (l < r)
    {
        int q = partition(A, l, r);
        quickSort(A, l, q-1);
        quickSort(A, q+1, r);
    }
}

int main(int args, char** argv)
{
    quickSort(A, 0, sizeof(A)/sizeof(int)-1);
    print();
    return 0;
}
