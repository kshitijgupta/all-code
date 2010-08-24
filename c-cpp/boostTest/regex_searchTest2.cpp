#include <iostream>
#include "boost/regex.hpp"

/*
 * 贪心
 */
int main() {
    boost::regex reg("(.*)(\\d{2})");
    boost::cmatch m;
    const char* text = "Note that I'm 31 years old, not 32.";
    if(boost::regex_search(text, m, reg)) {
        if (m[1].matched)
            std::cout << "(.*) matched: " << m[1].str() << '\n';
        if (m[2].matched)
            std::cout << "Found the age: " << m[2] << '\n';
    }

    boost::regex reg2("(.*?)(\\d{2})");
    boost::cmatch m2;
    if(boost::regex_search(text, m2, reg2)) {
        if (m2[1].matched)
            std::cout << "(.*) matched: " << m2[1].str() << '\n';
        if (m2[2].matched)
            std::cout << "Found the age: " << m2[2] << '\n';
    }
    return 0;
}
