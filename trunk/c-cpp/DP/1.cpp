/*
 * 算法导论15-1装配线调度问题 如书中图15-2
 */
#include <iostream>

using namespace std;

int e[2] = {2, 4};
int a[2][6] = {{7, 9, 3, 4, 8, 4}, {8, 5, 6, 4, 5, 7}};
int x[2] = {3, 2};
int t[2][5] = {{2, 3, 1, 3, 4}, {2, 1, 2, 2, 1}};

int f[2][6] = {{0}};
int l[2][6] = {{0}};

int main(int args, char** argv)
{
    f[0][0] = e[0] + a[0][0];
    f[1][0] = e[1] + a[1][0];
    for (int i=1; i<6; i++)
    {
        int f11 = f[0][i-1] + a[0][i];
        int f12 = f[1][i-1] + a[0][i] + t[1][i-1];

        if (f11>f12)
        {
            f[0][i] = f12;
            l[0][i] = 2;
        }
        else
        {
            f[0][i] = f11;
            l[0][i] = 1;
        }

        int f21 = f[0][i-1] + a[1][i] + t[0][i-1];
        int f22 = f[1][i-1] + a[1][i];

        if (f21 > f22)
        {
            f[1][i] = f22;
            l[1][i] = 2;
        }
        else
        {
            f[1][i] = f21;
            l[1][i] = 1;
        }
    }
    int final1 = f[0][5] + x[0];
    int final2 = f[1][5] + x[1];
    int final;
    if (final1 > final2)
    {
        final = final2;
    }
    else
    {
        final = final1;
    }

    cout << "最小值" << final << endl;
    
    cout << "f : " << endl;
    for (int i=0; i<6; i++)
    {
        cout << f[0][i] << " ";
    }
    cout << endl;
    for (int i=0; i<6; i++)
    {
        cout << f[1][i] << " ";
    }
    cout << endl;

    cout << "l : " << endl;
    for (int i=0; i<6; i++)
    {
        cout << l[0][i] << " ";
    }
    cout << endl;


    for (int i=0; i<6; i++)
    {
        cout << l[1][i] << " ";
    }
    cout << endl;

    return 0;
}
