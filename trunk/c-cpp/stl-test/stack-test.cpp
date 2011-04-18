#include <iostream>
#include <list>
#include <stack>
#include <algorithm>

using namespace std;

int main(int args, char** argv)
{
    stack<int, list<int> > istack;

    for (int i=0; i<5; i++)
        istack.push(i);

    while (!istack.empty())
    {
        cout << istack.top() << ' '; 
        istack.pop();
    }
    cout << endl;
    return 0;
}
