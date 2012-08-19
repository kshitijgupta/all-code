#include "luo/thread_queue.hpp"

#include <iostream>
#include <pthread.h>
#include <unistd.h>

using namespace std;

luo::ThreadQueue queue(2);

void* task(void* param)
{
    int id  = *((int*)param);
    while (true)
    {
        void* obj = queue.dequeue();
        cout << "tid " << id << " obj " << *((int*)obj) << endl;
//        usleep(100000);
    }
}

#define NUM_THREAD 5
int main(int args, char** argv)
{
    pthread_t tid[NUM_THREAD];
    int* ids = new int[NUM_THREAD];
    for (int t=0; t<NUM_THREAD; t++)
    {
        ids[t] = t;
        pthread_create(&tid[t], NULL, task, (void*)(&ids[t]));
    }

    int* objs = new int[100];
    for (int i=0; i<100; i++)
    {
        objs[i] = i;
        queue.enqueue((void*)(&objs[i]));
    }
    /*
    for (int i=0; i<100; i++)
    {

        void* obj = queue.dequeue();
        cout << "dequeue " << *((int*)obj) << endl;
    }
    */

    while(true)
    {
        sleep(1);
    }

    delete [] ids;
    delete [] objs;
    return 0;
}
