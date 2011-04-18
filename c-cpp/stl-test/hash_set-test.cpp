#include <iostream>
#include <hash_set>
#include <algorithm>

using namespace std;
using namespace __gnu_cxx;


struct eqint
{
    bool operator()(const int i1, const int i2)const
    {
        return i1 == i2;
    }
};

int main(int args, char** argv)
{
    hash_set<int, hash<int>, eqint> iset;

    for (int i=0; i<10; i++)
        iset.insert(10-i);

    for (hash_set<int, hash<int>, eqint>::iterator iter = iset.begin(); iter!=iset.end(); iter++)
        cout << *iter << ' ';
    cout << endl;

    //stl find 对于关联式容器是低效的，因为stl的find只是顺序查找
    hash_set<int, hash<int>, eqint>::iterator iter = find(iset.begin(), iset.end(), 1);
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

    return 0;
}
