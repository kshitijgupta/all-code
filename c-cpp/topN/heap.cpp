#include "heap.h"
#include <cstring>

//为了方便计算，m_array[0]被留空
MinFixedHeap::MinFixedHeap(int* array, int size)
{
    m_size = size;
    m_array = new int[size+1];

    for (int i=0; i<size; i++)
    {
        m_array[i+1] = array[i];
    }
    make_heap();
}

MinFixedHeap::~MinFixedHeap()
{
    delete(m_array);
}

void MinFixedHeap::make_heap()
{
    int parent = m_size/2;

    while (parent > 0)
    {
        adjust_heap(parent);
        parent--;
    }
}

void MinFixedHeap::adjust_heap(int parent)
{
    int left = parent*2;
    int right= parent*2+1;

    while (left<=m_size && right<=m_size)
    {
        if (m_array[parent] <= m_array[left] && m_array[parent] <= m_array[right])
        {
            return;
        }
        else if (m_array[left] < m_array[right])
        {
            int tmp = m_array[parent];
            m_array[parent] = m_array[left];
            m_array[left] = tmp;
            parent = left;
            left = parent*2;
            right= parent*2+1;
        }
        else
        {
            int tmp = m_array[parent];
            m_array[parent] = m_array[right];
            m_array[right] = tmp;
            parent = right;
            left = parent*2;
            right= parent*2+1;
        }
    }
    //最后一个父亲只有左孩子，没有有孩子
    if (left == m_size && m_array[parent] < m_array[left])
    {
        int tmp = m_array[parent];
        m_array[parent] = m_array[left];
        m_array[left] = tmp;
    }

}

void MinFixedHeap::push_heap(int n)
{
    if (n <= m_array[1])
    {
        return;
    }
    m_array[1] = n;
    adjust_heap(1);
}

int* MinFixedHeap::get_heap()
{
    return m_array;
}
