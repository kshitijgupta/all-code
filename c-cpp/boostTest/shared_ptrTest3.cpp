/*
 * 有时你会发现你要把shared_ptr用于某个特别的类型，
 * 它需要其它清除操作而不是简单的 delete. 
 * shared_ptr可以通过客户化删除器来支持这种需要。
 * 那些处理象 FILE*这样的操作系统句柄的资源通常要使用象fclose这样的操作来释放。
 * 要在shared_ptr里使用 FILE* ，我们要定义一个类来负责释放相应的资源。
 */
#include "boost/shared_ptr.hpp"
#include <iostream>
#include <fstream>

class FileCloser {
    public:
           void operator()(FILE* file) {
                   std::cout << "The FileCloser has been called with a FILE*, "
                             "which will now be closed.\n";
                       if (file!=0) 
                                 fclose(file);
                         }
};
/*
 * 这是一个函数对象，我们用它来确保在资源要释放时调用 fclose 。下面是使用FileCloser类的示例程序。
*/
int main() {
    std::cout << 
        "shared_ptr example with a custom deallocator.\n"; 
    {
        FILE* f=fopen("test.txt","r");
        if (f==0) {
            std::cout << "Unable to open file\n";
            throw "Unable to open file";
        }

        boost::shared_ptr<FILE> 
            my_shared_file(f, FileCloser());

        // 定位文件指针
        fseek(my_shared_file.get(),42,SEEK_SET);
    }
    std::cout << "By now, the FILE has been closed!\n";
}
