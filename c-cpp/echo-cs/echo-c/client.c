#include <stdio.h>
#include <unistd.h>
#include <sys/socket.h>
#include <string.h>
#include <stdlib.h>
#include <netdb.h>
#include <errno.h>

#define MAXLINE 1024
#define RIO_BUFSIZE 8192

typedef struct{
    int rio_fd;         //descriptor for this internal buf
    int rio_cnt;        //unread bytes in internal buf
    char* rio_bufptr;   //next unread byte in internal buf
    char rio_buf[RIO_BUFSIZE];  //internal buf
}rio_t;

int open_client(char* host, int port);
void rio_readinitb(rio_t *rp, int fd);
ssize_t rio_writen(int fd, void* usrbuf, size_t n);
ssize_t rio_read(rio_t * rp, char* usrbuf, size_t n);
ssize_t rio_readlineb(rio_t * rp, void * usrbuf, size_t maxlen);

int main(int argc, char ** argv){

    int clientfd, port;
    char* host, buf[MAXLINE];
    rio_t rio;

    if(argc != 3){
        fprintf(stderr, "usage : %s <host> <port>\n", argv[0]);
        exit(0);
    }

    host = argv[1];
    port = atoi(argv[2]);

    if((clientfd = open_client(host, port)) < 0){
        fprintf(stderr, "error : open_client\n");
        exit(0);
    }
    rio_readinitb(&rio, clientfd);

    while(fgets(buf, MAXLINE, stdin) != NULL){
        if(rio_writen(clientfd, buf, strlen(buf)) < 0){
            fprintf(stderr, "error : rio_writen\n");
            exit(0);
        }
        if(rio_readlineb(&rio, buf, MAXLINE) < 0){
            fprintf(stderr, "error : rio_readlineb\n");
            exit(0);
        }
        printf("%s\n", buf);
    }
    close(clientfd);

    return 0;
}

int open_client(char* hostname, int port){

    int clientfd;
    struct hostent* hp;
    struct sockaddr_in serveraddr;

    if((clientfd = socket(AF_INET, SOCK_STREAM, 0)) < 0)
        return -1;

    if((hp = gethostbyname(hostname)) == NULL)
        return -2;//check h_errno for cause of error

    bzero((char*)&serveraddr, sizeof(serveraddr));
    serveraddr.sin_family = AF_INET;
    bcopy((char*)hp->h_addr, (char*)&serveraddr.sin_addr.s_addr, hp->h_length);
    serveraddr.sin_port = htons(port);

    if(connect(clientfd, (struct sockaddr*)&serveraddr, sizeof(serveraddr)) < 0)
        return -1;
    return clientfd;
}

void rio_readinitb(rio_t * rp, int fd){
    rp->rio_fd = fd;
    rp->rio_cnt = 0;
    rp->rio_bufptr = rp->rio_buf;
}

ssize_t rio_writen(int fd, void* usrbuf, size_t n) {

    size_t nleft = n;
    ssize_t nwriten;
    char* bufp = (char*) usrbuf;

    while (nleft > 0) {
        if ((nwriten = write(fd, bufp, nleft)) <= 0) {
            if (errno== EINTR) // interrupted by sig handler return
                nwriten = 0; // and call write() again
            else 
                return -1; // errno set by write()
        }
        nleft -= nwriten;
        bufp += nwriten;

    }

    return n;
}

ssize_t rio_readlineb(rio_t * rp, void * usrbuf, size_t maxlen){

    int n, rc;
    char c, *bufp = usrbuf;

    for(n=1; n<maxlen; n++){
        if((rc = rio_read(rp, &c, 1)) == 1){
            *bufp++ = c;
            if(c == '\n')
                break;
        }else if(rc == 0){
            if(n == 1)
                return 0;
            else
                break;
        }else
            return -1;
    }
    *bufp = 0;
    return n;
}

ssize_t rio_read(rio_t * rp, char* usrbuf, size_t n){

    int cnt;

    while(rp->rio_cnt <= 0){
        rp->rio_cnt = read(rp->rio_fd, rp->rio_buf, sizeof(rp->rio_buf));

        if(rp->rio_cnt < 0){
            if(errno != EINTR) //interrupted by sig handler return
                return -1;
        }else if(rp->rio_cnt == 0)
            return 0;
        else
            rp->rio_bufptr = rp->rio_buf;
    }

    cnt = n;
    if(rp->rio_cnt < n)
        cnt = rp->rio_cnt;
    memcpy(usrbuf, rp->rio_bufptr, n);
    rp->rio_bufptr += cnt;
    rp->rio_cnt -= cnt;

    return cnt;
}
