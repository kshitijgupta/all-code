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

void echo(int connfd);
int open_listenfd(int port);
void rio_readinitb(rio_t * rp, int fd);
ssize_t rio_read(rio_t * rp, char* usrbuf, size_t n);
ssize_t rio_readlineb(rio_t * rp, void * usrbuf, size_t maxlen);
ssize_t rio_writen(int fd, void* usrbuf, size_t n);

int main(int argc, char** argv){

    int listenfd, connfd, port, clientlen;
    struct sockaddr_in clientaddr;
    struct hostent *hp;
    char* haddrp;

    if(argc != 2){
        fprintf(stderr, "usage: %s <port>\n", argv[0]);
        exit(0);
    }

    port = atoi(argv[1]);

    if((listenfd = open_listenfd(port)) < 0){
        fprintf(stderr, "open_listenfd error\n");
        exit(0);
    }

    while(1){
        clientlen = sizeof(clientaddr);
        if((connfd = accept(listenfd,(struct sockaddr*)&clientaddr, &clientlen)) < 0){
            fprintf(stderr, "accept error\n");
            exit(0);
        }
        if((hp = gethostbyaddr((const char*)&clientaddr.sin_addr.s_addr, sizeof(clientaddr.sin_addr.s_addr), AF_INET)) == NULL ){
            fprintf(stderr, "gethostbyaddr error\n");
            exit(0);
        }
        haddrp = inet_ntoa(clientaddr.sin_addr);
        printf("Server connected to %s (%s)\n", hp->h_name, haddrp);
        echo(connfd);
        close(connfd);
    }
    
    return 0;
}

int open_listenfd(int port){

    int listenfd, optval=1;
    struct sockaddr_in serveraddr;

    if((listenfd = socket(AF_INET, SOCK_STREAM, 0)) < 0){
        fprintf(stderr, "create listenfd error\n");
        return -1;
    }

    //Eliminates "Address already in use" error from bind
    if(setsockopt(listenfd, SOL_SOCKET, SO_REUSEADDR, (const void*)&optval, sizeof(int)) < 0){
        fprintf(stderr, "setsocket error\n");
        return -1;
    }

    bzero((char*)&serveraddr, sizeof(serveraddr));
    serveraddr.sin_family = AF_INET;
    serveraddr.sin_addr.s_addr = htonl(INADDR_ANY);
    serveraddr.sin_port = htons((unsigned short)port);

    if(bind(listenfd, (struct sockaddr*)&serveraddr, sizeof(serveraddr)) < 0){
        fprintf(stderr, "bind error\n");
        return -1;
    }

    if(listen(listenfd, 1024) < 0){
        fprintf(stderr, "listen error\n");
        return -1;
    }

    return listenfd;
}

void echo(int connfd){

    size_t n;
    char buf[MAXLINE];
    rio_t rio;

    rio_readinitb(&rio, connfd);
    if((n = rio_readlineb(&rio, buf, MAXLINE)) < 0){
        fprintf(stderr, "rio_readlineb error \n");
        exit(0);
    }
    
    while(n != 0){
        printf("server received %d bytes\n", n);
        if(rio_writen(connfd, buf, n) != n){
            fprintf(stderr, "rio_writen error\n");
            exit(0);
        }
        if((n = rio_readlineb(&rio, buf, MAXLINE)) < 0){
            fprintf(stderr, "rio_readlineb error \n");
            exit(0);
        }

    }

}

void rio_readinitb(rio_t * rp, int fd){
    rp->rio_fd = fd;
    rp->rio_cnt = 0;
    rp->rio_bufptr = rp->rio_buf;
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

