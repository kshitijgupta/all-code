#include <iostream>
#include <string>
#include "boost/lexical_cast.hpp"

int main() {
    using std::cout;
    using std::endl;

    //string to int
    std::string s="42";
    int i=boost::lexical_cast<int>(s);
    cout << i << endl;

    //float to string
    float f=3.14151;
    s=boost::lexical_cast<std::string>(f);
    cout << s << endl;

    //literal to double
    double d=boost::lexical_cast<double>("2.52");
    cout << d << endl;

    //失败的转换
    s="Not an int";
    try {
        i=boost::lexical_cast<int>(s);
    }
    catch(boost::bad_lexical_cast& e) {
        //   以上lexical_cast将会失败，我们将进入这里
        cout << e.what() << endl;
    }
}
