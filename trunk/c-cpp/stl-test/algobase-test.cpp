#include <iostream>
#include <algorithm>
#include <vector>
#include <iterator>
#include <string>

using namespace std;

template <class T>
struct display
{
    void operator()(const T& t)const
    {
        cout << t << ' ';
    }
};
int main(int args, char** argv)
{
    int ia[9] = {0, 1, 2, 3, 4, 5, 6, 7, 8};
    vector<int> iv1(ia, ia+5);
    vector<int> iv2(ia, ia+9);

    vector<int>::iterator iter = mismatch(iv1.begin(), iv1.end(), iv2.begin()).first;
    if (iter != iv1.end())
        cout << *iter << endl;
    else
        cout << "meet end" << endl;

    iter = mismatch(iv1.begin(), iv1.end(), iv2.begin()).second;
    if (iter != iv2.end())
        cout << *iter << endl;
    else
        cout << "meet end" << endl;

    //在指定区间里的元素相等，返回true，序列2多出来的元素不予考虑
    cout << equal(iv1.begin(), iv1.end(), iv2.begin()) << endl;
    cout << equal(iv1.begin(), iv1.end(), iv2.begin()+3) << endl;
    cout << equal(iv1.begin(), iv1.end(), iv2.begin()+3, less<int>()) << endl;

    fill(iv1.begin(), iv1.end(), 9);
    for_each(iv1.begin(), iv1.end(), display<int>());
    cout << endl;

    fill_n(iv1.begin(), 3, 7);
    for_each(iv1.begin(), iv1.end(), display<int>());
    cout << endl;

    vector<int>::iterator iter1 = iv1.begin();
    vector<int>::iterator iter2 = iter1;
    advance(iter2, 3);
    iter_swap(iter1, iter2);
    for_each(iv1.begin(), iv1.end(), display<int>());
    cout << endl;

    swap(*iv1.begin(), *iv2.begin());
    for_each(iv1.begin(), iv1.end(), display<int>());
    cout << endl;
    for_each(iv2.begin(), iv2.end(), display<int>());
    cout << endl;

    string s1[] = {"Jamie", "JJHou", "Jason"};
    string s2[] = {"Jamie", "JJHou", "Jerry"};
    // less default 
    cout << lexicographical_compare(s1, s1+3, s2, s2+3) << endl;
    cout << lexicographical_compare(s1, s1+3, s2, s2+3, greater<string>()) << endl;

    return 0;
}
