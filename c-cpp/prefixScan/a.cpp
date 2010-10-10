#include <iostream>
#include <pthread.h>
#include <unistd.h>
#include <stdlib.h>

#define NUM_THREADS 4

int A[] = {3,5,2,5,7,9,-4,6,7,-3,1,7,6,8,-1,2};
int prefixSum[NUM_THREADS];

pthread_mutex_t step1Mutex;
pthread_cond_t  step1Cond;

pthread_mutex_t step2Mutex[NUM_THREADS];
pthread_cond_t  step2Cond[NUM_THREADS];

void* prefixScan(void*);
void serial();

int main(int args, char** argv){

    pthread_t threads[NUM_THREADS];
    //init mutex & condition
    pthread_mutex_init(&step1Mutex, NULL);
    pthread_mutex_lock(&step1Mutex);//必须在创建线程之前持有锁
    pthread_cond_init(&step1Cond, NULL);

    for(int i=0; i<NUM_THREADS; i++){
        pthread_mutex_init(&step2Mutex[i], NULL);
        pthread_cond_init(&step2Cond[i], NULL);
    }

    for(int i=0; i<NUM_THREADS; i++){
        int* parameter = new int;
        *parameter = i;
        int rc = pthread_create(&threads[i], NULL, prefixScan, parameter);
        if(rc){
            std::cout << "Pthread_create error" << std::endl;
            exit(-1);
        }
    }

    for(int i=0; i<NUM_THREADS; i++){
        pthread_cond_wait(&step1Cond, &step1Mutex);
    }
    pthread_mutex_unlock(&step1Mutex);

    int cur=0, next=0;
    for(int i=1; i<sizeof(A)/sizeof(int); i++){
        next = prefixSum[i];
        prefixSum[i] = prefixSum[i-1] + cur;
        cur = next;
    }
    prefixSum[0] = 0;
    //step1 done

    for(int i=0; i<NUM_THREADS; i++){
        pthread_mutex_lock(&step2Mutex[i]);
        pthread_cond_signal(&step2Cond[i]);
        pthread_mutex_unlock(&step2Mutex[i]);
    }

    for(int i=0; i<NUM_THREADS; i++)
        pthread_join(threads[i], NULL);

    for(int i=0; i<sizeof(A)/sizeof(int); i++)
        std::cout << A[i] << " ";
    std::cout << std::endl;

    serial();
    return 0;
}

void* prefixScan(void* parameter){

    int t = *((int*)parameter);
    delete (int*)parameter;

    pthread_mutex_lock(&step2Mutex[t]);//首先获得step2的锁

    int start, end;
    int size = sizeof(A)/sizeof(int);
    int chunk= size/NUM_THREADS;
    if(t == NUM_THREADS-1){
        start = t * chunk;
        end   = size;
    }else{
        start = t * chunk;
        end   = (t+1) * chunk;
    }

    for(int i=start+1; i<end; i++)
        A[i] += A[i-1];
    prefixSum[t] = A[end-1];

    pthread_mutex_lock(&step1Mutex);
    pthread_cond_signal(&step1Cond);
    pthread_mutex_unlock(&step1Mutex);

    pthread_cond_wait(&step2Cond[t], &step2Mutex[t]);
    pthread_mutex_unlock(&step2Mutex[t]);

    for(int i=start; i<end; i++)
        A[i] += prefixSum[t];
}

void serial(){
    int B[] = {3,5,2,5,7,9,-4,6,7,-3,1,7,6,8,-1,2};
    int s = sizeof(B)/sizeof(int);
    for(int i=1; i<s; i++){
        std::cout << B[i-1] << " ";
        B[i] += B[i-1];
    }
    std::cout << B[s-1] << std::endl;
}
