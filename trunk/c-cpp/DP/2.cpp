/*
 * 算法导论15-2矩阵链乘法，动态规划
 */
#include <iostream>
#include <climits>

using namespace std;

int A[7][2] = {{0}, {30, 35}, {35, 15}, {15, 5}, {5, 10}, {10, 20}, {20, 25}};

int dp[7][7] = {{0}};
int k[7][7] = {{0}};

int main(int args, char** argv)
{
    for (int i=1; i<=6; i++)
    {
        dp[i][i] = 0;
    }

    for (int x=2; x<=6; x++)
    {
        for (int i=1, j=x; j<7; i++, j++)
        {
            int tmpDP = INT_MAX;
            for (int _k=i; _k<j; _k++)
            {
                int tmp = dp[i][_k] + dp[_k+1][j] + A[i][0]*A[_k][1]*A[j][1];
                if (tmp < tmpDP)
                {
                    tmpDP = tmp;
                    k[i][j] = _k;
                }
            }
            dp[i][j] = tmpDP;
        }
    }

    for (int j=1; j<7; j++)
    { 
        for (int i=1; i<j; i++)
        {
            cout << "(" << i << "," << j << ")=" <<  dp[i][j] << " ";
        }
        cout << endl;
    }
    
    cout << "k : " << endl;
    for (int j=1; j<7; j++)
    { 
        for (int i=1; i<j; i++)
        {
            cout << "(" << i << "," << j << ")=" <<  k[i][j] << " ";
        }
        cout << endl;
    }
    return 0;
}
