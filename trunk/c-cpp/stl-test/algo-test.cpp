#include <iostream>
#include <algorithm>
#include <vector>
#include <functional>

using namespace std;

template<class T>
struct display
{
    void operator()(const T & t)const
    {
        cout << t << " ";
    }
};

struct even
{
    bool operator()(int x)const
    {
        return x%2?false:true;
    }
};

class even_by_two
{
    public:
        int operator()()const
        {
           return _x+=2;
        }
    private:
        static int _x;
};

int even_by_two::_x = 0;

int main(int args, char** argv)
{
    int ia[] = {0, 1, 2, 3, 4, 5, 6, 6, 6, 7, 8};
    vector<int> iv(ia, ia+sizeof(ia)/sizeof(int));

    //找到相邻相等的第一个元素
    cout << *adjacent_find(iv.begin(), iv.end()) << endl;
    cout << *adjacent_find(iv.begin(), iv.end(), equal_to<int>()) << endl;

    cout << count(iv.begin(), iv.end(), 6) << endl;
    cout << count_if(iv.begin(), iv.end(), bind2nd(less<int>(), 7)) << endl;

    cout << *find(iv.begin(), iv.end(), 4) << endl;
    cout << *find_if(iv.begin(), iv.end(), bind2nd(greater<int>(), 2)) << endl;

    vector<int> iv2(ia+6, ia+8);
    cout << *(find_end(iv.begin(), iv.end(), iv2.begin(), iv2.end())+3) << endl;
    cout << *(find_first_of(iv.begin(), iv.end(), iv2.begin(), iv2.end())+3) << endl;

    for_each(iv.begin(), iv.end(), display<int>());
    cout << endl;

    generate(iv2.begin(), iv2.end(), even_by_two());
    for_each(iv2.begin(), iv2.end(), display<int>());
    cout << endl;

    generate_n(iv.begin(), 3, even_by_two());
    for_each(iv.begin(), iv.end(), display<int>());
    cout << endl;

    remove(iv.begin(), iv.end(), 6);
    for_each(iv.begin(), iv.end(), display<int>());
    cout << endl;

    vector<int> iv3(12);
    remove_copy(iv.begin(), iv.end(), iv3.begin(), 6);
    for_each(iv3.begin(), iv3.end(), display<int>());
    cout << endl;

    remove_copy_if(iv.begin(), iv.end(), iv3.begin(), bind2nd(less<int>(), 7));
    for_each(iv3.begin(), iv3.end(), display<int>());
    cout << endl;

    replace(iv.begin(), iv.end(), 6, 3);
    for_each(iv.begin(), iv.end(), display<int>());
    cout << endl;

    replace_copy(iv.begin(), iv.end(), iv3.begin(), 3, 5);
    for_each(iv3.begin(), iv3.end(), display<int>());
    cout << endl;


    replace_if(iv.begin(), iv.end(), bind2nd(less<int>(), 5), 3);
    for_each(iv.begin(), iv.end(), display<int>());
    cout << endl;

    replace_copy_if(iv.begin(), iv.end(), iv3.begin(), bind2nd(less<int>(), 8), 9);
    for_each(iv3.begin(), iv3.end(), display<int>());
    cout << endl;

    reverse(iv.begin(), iv.end());
    for_each(iv.begin(), iv.end(), display<int>());
    cout << endl;

    reverse_copy(iv.begin(), iv.end(), iv3.begin());
    for_each(iv3.begin(), iv3.end(), display<int>());
    cout << endl;

    rotate(iv.begin(), iv.begin()+4, iv.end());
    for_each(iv.begin(), iv.end(), display<int>());
    cout << endl;

    rotate_copy(iv.begin(), iv.begin()+5, iv.end(), iv3.begin());
    for_each(iv3.begin(), iv3.end(), display<int>());
    cout << endl;

    int ia2[] = {8, 7};
    vector<int> iv4(ia2, ia2+2);
    cout << *search(iv.begin(), iv.end(), iv4.begin(), iv4.end()) << endl;

    return 0;
}
