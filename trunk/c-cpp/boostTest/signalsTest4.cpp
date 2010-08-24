#include <iostream>
#include <string>
#include "boost/signals.hpp"

class some_slot_type {
    std::string s_;
    public:
    some_slot_type(const char* s) : s_(s) {}

    void operator()(const std::string& s) const {
        std::cout << s_ << ": " << s << '\n';
    }
};

int main() {
    boost::signal<void (const std::string&)> sig;

    some_slot_type sc1("sc1");
    some_slot_type sc2("sc2");

    boost::signals::connection c1=sig.connect(sc1);
    boost::signals::connection c2=sig.connect(sc2);

    // 比较
    std::cout << "c1==c2: " << (c1==c2) << '\n';
    std::cout << "c1<c2: " << (c1<c2) << '\n';

    // 检查连接
    if (c1.connected())
        std::cout << "c1 is connected to a signal\n";

    // 交换并断开
    sig("Hello there");
    c1.swap(c2);
    sig("We've swapped the connections");
    c1.disconnect();
    sig("Disconnected c1, which referred to sc2 after the swap");
}
