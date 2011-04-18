#include <iostream>
#include <map>
#include <string>
#include <algorithm>

using namespace std;

int main(int args, char** argv)
{
    map<string, int> simap;

    simap[string("luolei")] = 1;
    simap[string("luoleicn")] = 2;
    simap[string("lluo")] = 3;

    pair<string, int> entry(string("hello"), 4);
    simap.insert(entry);

    
    for (map<string, int>::iterator iter=simap.begin(); iter!=simap.end(); iter++)
    {
        cout << "key : " << iter->first << " value : " << iter->second << endl;
    }

    //高效树查找
    map<string, int>::iterator iter = simap.find(string("luoleicn"));
    if (iter != simap.end())
    {
        cout << "find " << iter->first << " = " << iter->second;
    }
    cout << endl;

    simap[string("luoleicn")] = 100;
    cout << "now luoleicn = " << simap[string("luoleicn")] << endl;


    return 0;
}
