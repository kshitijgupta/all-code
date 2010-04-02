#include <stdlib.h>
#include <stdio.h>

int main(){

    char buf[2048] = {'\0'};
    char * p = getenv("QUERY_STRING");
    
    sprintf(buf, "<html> <title>hello</title><body>");
    sprintf(buf, "%sHello : QUERY_STRING is : %s",buf, p);
    sprintf(buf, "%s </body> </html> ", buf);
    
    printf("%s", buf);

    return 0;
}
