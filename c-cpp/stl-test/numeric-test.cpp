#include <iostream>
#include <numeric>
#include <vector>
#include <functional>
#include <iterator>
#include <algorithm>

#include <boost/detail/algorithm.hpp>

using namespace std;


int main(int args, char** argv)
{
    int ia[] = {1, 2, 3, 4, 5};
    vector<int> iv(ia, ia+5);

    cout << accumulate(iv.begin(), iv.end(), 0) << endl;
    cout << accumulate(iv.begin(), iv.end(), 0, minus<int>()) << endl;

    cout << inner_product(iv.begin(), iv.end(), iv.begin(), 10) << endl;
    cout << inner_product(iv.begin(), iv.end(), iv.begin(), 10, minus<int>(), plus<int>()) << endl;

    ostream_iterator<int> oiter(cout, " ");
    
    partial_sum(iv.begin(), iv.end(), oiter);
    cout << endl;
    partial_sum(iv.begin(), iv.end(), oiter, minus<int>());
    cout << endl;

    vector<int> newiv(iv.size());
    partial_sum(iv.begin(), iv.end(), newiv.begin());
    for (vector<int>::iterator iter=newiv.begin(); iter!=newiv.end(); iter++)
        cout << *iter << ' ';
    cout << endl;

    adjacent_difference(iv.begin(), iv.end(), oiter);
    cout << endl;
    adjacent_difference(iv.begin(), iv.end(), oiter, plus<int>());
    cout << endl;

    int n=100;
    //这个函数不是stl标准，但是sgi实现了，但是没找到头文件，只好使用boost的版本了
    boost::iota(iv.begin(), iv.end(), n);
    for (int i=0; i<iv.size(); i++)
        cout << iv[i] << " ";
    cout << endl;
    return 0;
}
