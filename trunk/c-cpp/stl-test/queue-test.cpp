#include <iostream>
#include <queue>

using namespace std;

int main(int args, char** argv)
{
    queue<int> q;

    for(int i=0; i<5; i++)
        q.push(i);

    while (!q.empty())
    {
        cout << q.front() << ' ';
        q.pop();
    }
    cout << endl;
    return 0;
}
