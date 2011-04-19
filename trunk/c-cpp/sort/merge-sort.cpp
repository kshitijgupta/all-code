/* 
 *遵循知识共享（CC By2.5）协议详见
 *http://creativecommons.org/licenses/by/2.5/cn/
 */
/**
 * @file merge-sort.cpp
 * @Synopsis  
 * @author 罗磊, luoleicn@gmail.com
 * @version 
 * @date 2011-04-19
 */

#include <iostream>
#include <iterator>
#include <algorithm>

using namespace std;

/* --------------------------------------------------------------------------*/
/**
 * @Synopsis  merge_sort 
 *
 * @tparam T 要求模板类重载<和==
 * @Param T[]
 * @Param int
 * @Param int
 */
/* ----------------------------------------------------------------------------*/
template<class T> void merge_sort(T[], int, int);
/* --------------------------------------------------------------------------*/
/**
 * @Synopsis  merge 
 *
 * @tparam T 要求模板类重载<和==
 * @Param T[]
 * @Param int
 * @Param int
 * @Param int
 */
/* ----------------------------------------------------------------------------*/
template<class T> void merge(T[], int, int, int);

int main(int args, char** argv)
{
    int ia[] = {1, 9, 5, 4, 8, 0, 2, 3, 7, 9};
    int size = sizeof(ia)/sizeof(int);

    merge_sort(ia, 0, size-1);
    copy(ia, ia+size, ostream_iterator<int>(cout, " "));
    cout << endl;
    return 0;
}

template<class T> 
void merge_sort(T s[], int l, int r)
{
    int m = 0;
    if (l < r)
    {
        m = (l+r)/2;
        merge_sort(s, l, m);
        merge_sort(s, m+1, r);
        merge(s, l, m, r);
    }
}

template<class T>
void merge(T s[], int l, int m, int r)
{
    T* tmp = new T[r-l+1];
    int index = 0;
    int beg1 = l, end1 = m;
    int beg2 = m+1, end2 = r;
    int index1 = beg1, index2 = beg2;

    while ((index1 <= end1) && (index2 <= end2))
    {
        if (s[index1] < s[index2])
        {
            copy(&s[index1], &(s[index1+1]), &tmp[index]);
            index1++;
            index++;
        }
        else if (s[index1] == s[index2])
        {
            copy(&s[index1], &(s[index1+1]), &tmp[index]);
            index1++;
            index++;

            copy(&s[index2], &(s[index2+1]), &tmp[index]);
            index2++;
            index++;
        }
        else 
        {
            copy(&s[index2], &(s[index2+1]), &tmp[index]);
            index2++;
            index++;
        }
    }
    if (index1 <= end1)
    {
        copy(&s[index1], &s[end1+1], &tmp[index]);
    }
    else if (index2 <= end2) 
    {
        copy(&s[index2], &s[end2+1], &tmp[index]);
    }

    copy(tmp, tmp+r-l+1, &s[l]);
    delete [] tmp;
}
