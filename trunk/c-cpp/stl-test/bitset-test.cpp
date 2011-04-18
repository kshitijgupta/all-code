#include <iostream>
#include <string>
#include <bitset>

using namespace std;

int main(int args, char** argv)
{

    bitset<5> bits;

    if (bits.none())
        cout << "now bitset is none" << endl;

    for (int i=0; i<bits.size(); i+=2)
        bits.set(i);

    for (int i=0; i<bits.size(); i++)
        cout << bits[i] << ' ';
    cout << endl;

    cout << "to string " << bits.to_string() << endl;
    cout << "to ulong " << bits.to_ulong() << endl;

    bits.reset();
    return 0;
}
