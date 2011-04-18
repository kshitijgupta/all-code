#include <iostream>
#include <list>
#include <algorithm>

using namespace std;

void show(list<int>);
int main(int args, char** argv)
{
    list<int> lst;

    lst.push_back(1);
    lst.push_back(2);
    lst.push_back(3);
    lst.push_back(4);

    show(lst);
    
    list<int>::iterator iter = find(lst.begin(), lst.end(), 3);
    lst.insert(iter, 100);

    show(lst);
    
    iter = find(lst.begin(), lst.end(), 3);

    if (iter != lst.end())
        lst.erase(iter);
    
    show(lst);
    
    return 0;
}
void show(list<int> lst)
{
    list<int>::iterator beg = lst.begin();
    list<int>::iterator end = lst.end();

    for (list<int>::iterator iter=beg; iter!=end; iter++)
    {
        cout << *iter << " ";
    }
    cout << endl;
}
