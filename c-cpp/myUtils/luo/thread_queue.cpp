#include "thread_queue.hpp"

#include <cstdlib>
#include <string>
#include <unistd.h>

#include <iostream>
namespace luo
{
    ThreadQueue::ThreadQueue(int max_size):_max_size(max_size),_cur_size(0)
    {
        head = new ThreadQueueMsg();
        if (head == NULL)
            throw std::string("Cant malloc memory");

        head->obj = NULL;
        head->next = NULL;
        tail = head;
    }
    
    ThreadQueue::~ThreadQueue()
    {
        while (head != tail)
        {
            ThreadQueueMsg* tmpPtr = head;
            head = head->next;
            delete tmpPtr;
        }
        delete head;
        head = tail = NULL;
    }

    void ThreadQueue::enqueue(void* obj)
    {
        ThreadQueueMsg* pmsg = new ThreadQueueMsg();
        pmsg->obj = obj;
        pmsg->next = NULL;
        ThreadQueueMsg * tmp;
        int tmp_size;
        while (1)
        {
            tmp = tail;
//            std::cout <<  "cur size " << _cur_size << std::endl;
            if (_cur_size < _max_size && __sync_bool_compare_and_swap(&tail, tmp, pmsg))// CAS
            {
                atomic_add(&_cur_size, 1);
                tmp->next = pmsg;
                break;
            }
            else if (_cur_size == _max_size)
            {
                usleep(100000);//0.1sec
            }
        }
    }

    void* ThreadQueue::dequeue()
    {
        ThreadQueueMsg* tmp, *tmphead, *tmptail;
        void* ret;
        while (1)
        {
            tmphead = head;
            tmptail = tail;
            tmp = tmphead->next;
            int tmp_size;
            if (tmphead == head)
            {
//            std::cout <<  "dequeue cur size " << _cur_size << std::endl;
                if (tmphead == tmptail)
                {
                    usleep(100000);//0.1sec
                }

                tmp_size = _cur_size;
                if (tmp && __sync_bool_compare_and_swap(&head, tmphead, tmp))
                {
                    atomic_add(&_cur_size, -1);
                    ret = tmp->obj;
                    delete tmphead;
                    return ret;
                }
            }
        }
    }

}
