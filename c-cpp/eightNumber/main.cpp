#include <iostream>
#include "eightNumber.h"

using namespace std;

int main(int args, char** argv)
{

    EightNumber en;

    EightNumberNode node = en.get_next_node();

    while (!en.is_success(node))
    {
        cout << "start to expand " << endl;
        en.expand(node);
        node = en.get_next_node();
    }

    cout << "done" << endl;
    return 0;
}
