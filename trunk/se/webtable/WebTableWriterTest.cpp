#include "WebTableWriter.h"

using namespace luolei::hit::cir::se::hbase;

int main(){
    WebTableWriter wtw("58.155.50.240", 9090);
    std::string html = "<html><title>title</title><body>body</body></html>";
    wtw.write(1, wtw.HTML, "ir.hit.edu.cn:80/index.php", html, "title", "body"); 

    return 0;
}
