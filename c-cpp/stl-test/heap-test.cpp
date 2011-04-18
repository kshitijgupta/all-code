#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

void show(vector<int> vec)
{
    for (int i= 0; i<vec.size(); i++)
        cout << vec[i] << " ";
    cout << endl;
}

int main(int args, char** argv)
{
    int ia[10] = {1, 5, 2, 0, 6, 3, 7, 4, 8, 9};
    vector<int> vec(ia, ia+10);

    show(vec);

    make_heap(vec.begin(), vec.end());

    show(vec);

    vec.push_back(100);

    push_heap(vec.begin(), vec.end());

    show(vec);

    pop_heap(vec.begin(), vec.end());

    vec.pop_back();

    show(vec);

    sort_heap(vec.begin(), vec.end());

    show(vec);

    return 0;
}
