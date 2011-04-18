#include <vector>
#include <iostream>
#include <algorithm>

using namespace std;

void show(vector<int> vec);
int main(int args, char** argv)
{
    vector<int> vec;
    cout << "size : " << vec.size() << endl;
    cout << "capacity : " << vec.capacity() << endl;

    vec.push_back(1);
    cout << "size : " << vec.size() << endl;
    cout << "capacity : " << vec.capacity() << endl;

    vec.push_back(2);
    cout << "size : " << vec.size() << endl;
    cout << "capacity : " << vec.capacity() << endl;

    vec.push_back(3);
    cout << "size : " << vec.size() << endl;
    cout << "capacity : " << vec.capacity() << endl;

    show(vec);

    vector<int>::iterator beg = vec.begin();
    vector<int>::iterator end = vec.end();

    vector<int>::iterator iter = find(beg, end, 2);
    vec.erase(iter);


    iter = find(beg, end, 1);
    vec.insert(iter, 100);

    show(vec);
    
    cout << "size : " << vec.size() << endl;
    cout << "capacity : " << vec.capacity() << endl;

    vec.clear();

    cout << "size : " << vec.size() << endl;
    cout << "capacity : " << vec.capacity() << endl;

    vec.resize(5);
    cout << "size : " << vec.size() << endl;
    cout << "capacity : " << vec.capacity() << endl;
    return 0;
}

void show(vector<int> vec)
{
    vector<int>::iterator beg = vec.begin();
    vector<int>::iterator end = vec.end();

    for (vector<int>::iterator iter=beg; iter!=end; iter++)
        cout << *iter << " ";
    cout << endl;
}
