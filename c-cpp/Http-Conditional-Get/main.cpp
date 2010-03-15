#include <iostream>
#include <ctime>
#include <cstdlib>
#include <unistd.h>
#include <cstring>
#include <errno.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <ctype.h>
#include <netdb.h>
using namespace std;


static const char * wday[7] = { "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" };
static const char * month[12] = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul",
    "Aug", "Sept", "Oct", "Nov", "Dec" };

time_t timep;
struct tm *p;

void conditional_get_pkg(char* request, int size, char* host, char* file, int port)
{
    bzero(request, sizeof(char)*size);

    time(&timep);
    p = gmtime(&timep);
/*
    sprintf(request, "GET /%s HTTP/1.1\r\nHost: %s:%d\r\nIf-Modified-Since:Mon, 15 Mar 2010 03:04:00 GMT GMT\r\nConnection: Close\r\n\r\n", file, host, port);
*/

    sprintf(request, "GET /%s HTTP/1.1\r\nHost: %s:%d\r\nIf-Modified-Since:%s, %d %s %d %d:%d:%d GMT\r\nConnection: Close\r\n\r\n", file, host, port, wday[p->tm_wday], p->tm_mday, month[p->tm_mon], (1900 + p->tm_year), (p->tm_hour+8), p->tm_min, p->tm_sec);


}
int main()
{
    char request[2048] = {'\0'};

    char host[256] = "www.sina.com.cn";
    char file[1024] = {'\0'};
    int port = 80;
    int sockfd;
    struct sockaddr_in server_addr;
    struct hostent *hostent;

    conditional_get_pkg(request, 2048, host, file, port);

    cout << "following is the request pkg: " << endl << endl;

    cout << request << endl;

    if((hostent = gethostbyname(host)) == NULL)
    {
        printf("Error : gethostbyname, %s\n", strerror(errno));
        exit(1);
    }
    if((sockfd = socket(AF_INET, SOCK_STREAM, 0)) == -1)
    {
        printf("Error : socket, %s", strerror(errno));
        exit(1);
    }
    bzero(&server_addr, sizeof(server_addr));
    server_addr.sin_family = AF_INET;
    server_addr.sin_port   = htons(port);
    server_addr.sin_addr   = *((struct in_addr * )(hostent->h_addr));

    if(connect(sockfd, (struct sockaddr *)(&server_addr), sizeof(struct sockaddr)) == -1)
    {
        printf("error : connect error %s", strerror(errno));
        exit(1);
    }
    
    int send = 0, totalsend = 0;
    int nbytes = strlen(request);
    while(totalsend < nbytes)
    {
        send = write(sockfd, request + totalsend, nbytes - totalsend);
        if(send == -1)
        {
            printf("send error, %s\n", strerror(errno));
            exit(0);
        }
        totalsend += send;
        printf("%d, bytes sent ok\n", totalsend);
    }

    cout << "following is the response : " << endl;

    int i = 0;
    char buffer;
    while((nbytes = read(sockfd, &buffer, 1)) == 1)
    {
        if(i < 4)
        {
            if(buffer == '\r'||buffer == '\n')
                i++;
            else
                i = 0;
            printf("%c", buffer);
        }else{
            printf("%c", buffer);
        }

    }
    close(sockfd);

    return 0; 
}
