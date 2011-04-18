#include <iostream>
#include <deque>
#include <algorithm>

using namespace std;

int main(int args, char** argv)
{
    deque<int> ideq(20, 9);
    cout << ideq.size() << endl;

    //deque随机的读和写都是代价非常大的
    for (int i=0; i<ideq.size(); i++)
        ideq[i] = i;
    for (int i=0; i<ideq.size(); i++)
        cout << ideq[i] << ' ';
    cout << endl;

    ideq.push_front(100);
    ideq.push_back(999);

    for (int i=0; i<ideq.size(); i++)
        cout << ideq[i] << ' ';
    cout << endl;

    cout << "front : " << ideq.front() << endl;
    cout << "end : " << ideq.back() << endl;

    ideq.pop_front();
    ideq.pop_back();
    for (int i=0; i<ideq.size(); i++)
        cout << ideq[i] << ' ';
    cout << endl;

    return 0;
}
