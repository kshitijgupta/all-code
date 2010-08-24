#include <iostream>
#include <vector>
#include "boost/regex.hpp"

int main() {
    boost::regex reg("/");
    std::string s="Split/Values/Separated/By/Slashes,";
    std::vector<std::string> vec;
    boost::sregex_token_iterator it(s.begin(),s.end(),reg,-1);
    boost::sregex_token_iterator end;
    while (it!=end) 
        vec.push_back(*it++);

   for(std::vector<std::string>::iterator i = vec.begin(); i!=vec.end(); i++){
       std::cout << *i << '\n';
   }



}
