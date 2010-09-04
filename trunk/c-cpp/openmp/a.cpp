/*
 * Compile:
 *      g++ a.cpp -fopenmp
 *
 * 速度明显提升一倍(双核)
 */
#include <iostream>

using namespace std;

static long long num_rects = 1000000000;

int main(int args, char** argv){

    double mid, height, width, sum = 0.0;
    int i;
    double area;

    width = 1.0/(double)num_rects;

#pragma omp parallel for private(mid, height) reduction(+:sum)
    for(i=0; i<num_rects; i++){
        mid = (i+0.5)*width;
        height = 4.0/(1.0+mid*mid);
        sum += height;
    }

    area = width * sum;
    cout << "The value of PI is " << area << endl;

    return 0;
}
