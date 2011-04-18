#include <iostream>
#include <queue>

using namespace std;

int main(int args, char** argv)
{
    priority_queue<int> prique;

    for (int i=0; i<10; i++)
        prique.push(i);

    while (!prique.empty())
    {
        cout << prique.top() << ' ';
        prique.pop();
    }
    cout << endl;

    return 0;
}
