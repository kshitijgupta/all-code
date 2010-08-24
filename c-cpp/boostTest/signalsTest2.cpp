#include <iostream>
#include "boost/signals.hpp"

class double_slot {
    public:
        void operator()(int& i) const {
            i*=2;
        }
};

class plus_slot {
    public:
        void operator()(int& i) const {
            i+=3;
        }
};

int main() {
    boost::signal<void (int&)> sig;
    sig.connect(0, double_slot());
    sig.connect(1, plus_slot());

    int result=12;
    sig(result);
    std::cout << "The result is: " << result << '\n';
}
