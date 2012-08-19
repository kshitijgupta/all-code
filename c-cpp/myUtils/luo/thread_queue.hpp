#ifndef _THREAD_QUEUE_H
#define _THREAD_QUEUE_H
namespace luo
{
    typedef struct ThreadQueueMsg
    {
        void* obj;
        struct ThreadQueueMsg *next;
    }ThreadQueueMsg;

    class ThreadQueue
    {

        public :
            ThreadQueue(int max_size);
            ~ThreadQueue();
            void enqueue(void* obj);
            void* dequeue();

        private:
            ThreadQueueMsg *head, *tail;
            int _cur_size;
            const int _max_size;

            inline void atomic_add(int* pointer, int v)
            {
                while(1)
                {
                    int tmp = *pointer;
                    if (__sync_bool_compare_and_swap(pointer, tmp, tmp+v))
                    {
                        break;
                    }
                }
            }
    };

}


#endif//_THREAD_QUEUE_H
