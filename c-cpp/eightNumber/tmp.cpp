#include <iostream>
#include <stdlib.h>
#include <time.h>

typedef void* (*func)(void*);

using namespace std;

void* f(void * arg)
{
    int a = (int)arg;

    cout << "In func : "<< a << endl;
    return (void*)a;
}

int main(int args, char** argv)
{
    int w = 100;
    func s = f;
    w = (int)s((void*)w);
    cout << w << endl;

    srandom((int)time(0));

    for (int i=0; i < 1000; i++)
    {
        double r = 1.0* rand()/RAND_MAX;
        cout << r << " ";
    }
    cout << endl;

    unsigned long sll = 123456789l;
    cout << sll << endl;
    return 0;
}
