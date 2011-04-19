#include <iostream>
#include <iterator>

using namespace std;

int main(int args, char** argv)
{
    int ia[] = {1, 9, 5, 4, 8, 0, 2, 3, 7, 9};
    int size = sizeof(ia)/sizeof(int);

    for (int i=0; i<size; i++)
    {
        int index = i;
        int father = (index-1)/2;
        while (father >= 0)
        {
            if (ia[father] < ia[index])
            {
                swap(ia[index], ia[father]);
                index = father;
                father = (index-1)/2;
            }
            else 
            {
                break;
            }
        }
    }

    copy(ia, ia+size, ostream_iterator<int>(cout, " "));
    return 0;
}
