#include <iostream>
#include <set>
#include <algorithm>
#include <iterator>

using namespace std;

int main(int args, char** argv)
{
    set<int> iset;

    for (int i=0; i<10; i++)
        iset.insert(i);

    for (set<int>::iterator iter = iset.begin(); iter!=iset.end(); iter++)
        cout << *iter << ' ';
    cout << endl;

    for (set<int>::reverse_iterator iter = iset.rbegin(); iter!=iset.rend(); iter++)
        cout << *iter << ' ';
    cout << endl;

    //stl find 对于关联式容器是低效的，因为stl的find只是顺序查找
    set<int>::iterator iter = find(iset.begin(), iset.end(), 1);
    if (iter != iset.end())
    {
        cout << "找到，并删除" << *iter << endl;
        iset.erase(*iter);
    }

    //对于关联式容器，应使用关联容器内置的find函数
    iter = iset.find(1);
    if (iter != iset.end())
    {
        cout << "找到，并删除" << *iter << endl;
        iset.erase(*iter);
    }
    else
    {
        cout << "没找到" << endl;
    }

    /*
     * 以下代码用来测试：并集、交集、差集、对称差集
     * 注意这些操作只能用于set而不能用于hash_set，因为hash_set中的集合不是有序的
     */
    cout << "========================================" << endl;
    int ia1[] = {1, 3, 5, 7, 9};
    int ia2[] = {1, 2, 3, 4, 5};

    set<int> set1(ia1, ia1+5);
    set<int> set2(ia2, ia2+5);

    set<int>::iterator beg1 = set1.begin();
    set<int>::iterator beg2 = set2.begin();
    set<int>::iterator last1 = set1.end();
    set<int>::iterator last2 = set2.end();

    set_union(beg1, last1, beg2, last2, ostream_iterator<int>(cout, " "));
    cout << endl;
    set_intersection(beg1, last1, beg2, last2, ostream_iterator<int>(cout, " "));
    cout << endl;
    set_difference(beg1, last1, beg2, last2, ostream_iterator<int>(cout, " "));
    cout << endl;
    set_symmetric_difference(beg1, last1, beg2, last2, ostream_iterator<int>(cout, " "));
    cout << endl;

    return 0;
}
