/* 
 *遵循知识共享（CC By2.5）协议详见
 *http://creativecommons.org/licenses/by/2.5/cn/
 */
/**
 * @file insert-sort.cpp
 * @Synopsis  insert sort
 * @author 罗磊, luoleicn@gmail.com
 * @version 
 * @date 2011-04-18
 */
#include <iostream>
#include <algorithm>

using namespace std;

/* --------------------------------------------------------------------------*/
/**
 * @Synopsis  insert sort 
 *
 * @tparam T 泛型T，要求T的实现中，重载小于号
 * @Param T[] 待排序数组
 * @Param int 数组大小
 */
/* ----------------------------------------------------------------------------*/
template<class T> void insert_sort(T[] , int );

int main(int args, char** argv)
{
    int ia[] = {1, 9, 5, 4, 8, 0, 2, 3, 7, 9};
    int size = sizeof(ia)/sizeof(int);

    insert_sort(ia, size);
    for (int i=0; i<size; i++)
        cout << ia[i] << ' ';
    cout << endl;
    return 0;
}

template<class T>
void insert_sort(T s[], int size)
{
    for (int i=0; i<size; i++)
    {
        int index = i;
        for (int j=i-1; j>=0; j--)
        {
            if (s[index] < s[j])
            {
                swap(s[index], s[j]);
                index = j;
            }
            else
            {
                break;
            }
        }
    }
}
