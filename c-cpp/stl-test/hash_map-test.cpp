#include <iostream>
#include <hash_map>
#include <string>
#include <algorithm>

using namespace std;
using namespace __gnu_cxx;

struct eqstr
{
    bool operator()(const string s1, const string s2)const
    {
        return s1 == s2;
    }
};

struct hash_str
{
    size_t operator()(const string s)const
    {
        return __stl_hash_string(s.c_str());
    }
};

int main(int args, char** argv)
{
    hash_map<string, int, hash_str, eqstr > simap;

    simap[string("luolei")] = 1;
    simap[string("luoleicn")] = 2;
    simap[string("lluo")] = 3;

    pair<string, int> entry(string("hello"), 4);
    simap.insert(entry);

    
    for (hash_map<string, int, hash_str, eqstr>::iterator iter=simap.begin(); iter!=simap.end(); iter++)
    {
        cout << "key : " << iter->first << " value : " << iter->second << endl;
    }

    //高效hash查找
    hash_map<string, int, hash_str, eqstr>::iterator iter = simap.find(string("luoleicn"));
    if (iter != simap.end())
    {
        cout << "find " << iter->first << " = " << iter->second;
    }
    cout << endl;

    simap[string("luoleicn")] = 100;
    cout << "now luoleicn = " << simap[string("luoleicn")] << endl;


    return 0;
}
