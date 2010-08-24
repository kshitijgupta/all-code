//g++ signalsTest.cpp -lboost_signals
#include <iostream>
#include "boost/signals.hpp"

void my_first_slot() {
    std::cout << "void my_first_slot()\n";
}

class my_second_slot {
    public:
        void operator()() const {
            std::cout <<
                "void my_second_slot::operator()() const\n";
        }
};

int main() {
    boost::signal<void ()> sig;

    sig.connect(&my_first_slot);//把普通函数插入插槽
    sig.connect(my_second_slot());//把函数对象插入插槽

    std::cout << "Emitting a signal...\n";
    //没有办法确定哪一个插槽会先被调用。如果插槽的调用顺序事关紧要，你就必须把它们放入不同的组
    sig();
}
