#include <stdio.h>
#include <unistd.h>
#include <sys/socket.h>
#include <string.h>
#include <stdlib.h>
#include <netdb.h>
#include <errno.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <fcntl.h>
#include <semaphore.h>
#include <arpa/inet.h>
#include <sys/wait.h>


#define MAXLINE 1024
#define MAXBUF  4082
#define RIO_BUFSIZE 8192

extern char ** environ; //defined by libc

typedef struct{
    int rio_fd;         //descriptor for this internal buf
    int rio_cnt;        //unread bytes in internal buf
    char* rio_bufptr;   //next unread byte in internal buf
    char rio_buf[RIO_BUFSIZE];  //internal buf
}rio_t;

void doit(int fd);
void read_requesthdrs(rio_t *rp);
int parse_uri(char* uri, char* filename, char* cgiargs);
void server_static(int fd, char*filename, int filesize);
void get_filetype(char* filename, char* filetype);
void server_dynamic(int fd, char* filename, char* cgiargs);
void clienterror(int fd, char* cause, char* errnum, char* shortmsg, char*longmsg);

int open_listenfd(int port);

void rio_readinitb(rio_t * rp, int fd);
ssize_t rio_read(rio_t * rp, char* usrbuf, size_t n);
ssize_t rio_readlineb(rio_t * rp, void * usrbuf, size_t maxlen);
ssize_t rio_writen(int fd, void* usrbuf, size_t n);


int main(int argc, char** argv){

    int listenfd, connfd, port, clientlen;
    struct sockaddr_in clientaddr;

    if(argc != 2){
        fprintf(stderr, "usage : %s <port>\n", argv[0]);
        exit(1);
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
        doit(connfd);
        close(connfd);
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

void doit(int fd){
    int is_static;
    int n;
    struct stat sbuf;
    char buf[MAXLINE], method[MAXLINE], uri[MAXLINE], version[MAXLINE];
    char filename[MAXLINE], cgiargs[MAXLINE];
    rio_t rio;

    rio_readinitb(&rio, fd);

    if((n = rio_readlineb(&rio, buf, MAXLINE)) < 0){
        fprintf(stderr, "rio_readlineb error \n");
        exit(0);
    }
    
    sscanf(buf, "%s %s %s", method, uri, version);
    if(strcasecmp(method, "GET")){
        clienterror(fd, method, "501", "Not Implemented", "Tiny does not implement this method");
        return;
    }

    read_requesthdrs(&rio);

    is_static = parse_uri(uri, filename, cgiargs);
    if(stat(filename, &sbuf) < 0){
        clienterror(fd, filename, "404", "Not Found", "Tiny couldn't find this file");
        return;
    }

    if(is_static){
        if(!(S_ISREG(sbuf.st_mode)) || !(S_IRUSR & sbuf.st_mode)){
            clienterror(fd, filename, "403", "Forbidden", "Tiny couldn't read the file");
            return;
        }
        server_static(fd, filename, sbuf.st_size);
    }
    else{
        if(!(S_ISREG(sbuf.st_mode)) || !(S_IRUSR & sbuf.st_mode)){
            clienterror(fd, filename, "403", "Forbidden", "Tiny couldn't read the file");
            return;
        }
        server_dynamic(fd, filename, cgiargs);
    }
}

void clienterror(int fd, char* cause, char* errnum, char* shortmsg, char* longmsg){

    char buf[MAXLINE], body[MAXBUF];

    sprintf(body, "<html><title>Tiny Error</titile>");
    sprintf(body, "%s<body bgcolor=""ffffff"">\r\n", body);
    sprintf(body, "%s%s: %s\r\n", body, errnum, shortmsg);
    sprintf(body, "%s<p>%s: %s\r\n", body, longmsg, cause);
    sprintf(body, "%s<hr><em>The Tiny Web Server</em>\r\n", body);

    sprintf(buf, "HTTP/1.0 %s %s\r\n", errnum, shortmsg);
    if(rio_writen(fd, buf, strlen(buf)) != strlen(buf)){
        fprintf(stderr, "rio_writen error\n");
        exit(0);
    }   
    sprintf(buf, "Content-type: text/html\r\n");
     if(rio_writen(fd, buf, strlen(buf)) != strlen(buf)){
        fprintf(stderr, "rio_writen error\n");
        exit(0);
    }   
    sprintf(buf, "Content-length: %d\r\n\r\n", strlen(body));
     if(rio_writen(fd, buf, strlen(buf)) != strlen(buf)){
        fprintf(stderr, "rio_writen error\n");
        exit(0);
    }   
     if(rio_writen(fd, body, strlen(body)) != strlen(body)){
        fprintf(stderr, "rio_writen error\n");
        exit(0);
    }   
}

void read_requesthdrs(rio_t * rp){

    char buf[MAXLINE];

    if(rio_readlineb(rp, buf, MAXLINE) < 0){
        fprintf(stderr, "rio_readlineb error \n");
        exit(0);
    }
    while(strcmp(buf, "\r\n")){
        if(rio_readlineb(rp, buf, MAXLINE) < 0){
            fprintf(stderr, "rio_readlineb error \n");
            exit(0);
        }

    }
}

int parse_uri(char* uri, char*filename, char*cgiargs){

    char* ptr;

    if(!strstr(uri, "cgi-bin")){//Static content
        strcpy(cgiargs, "");
        strcpy(filename, ".");
        strcat(filename, uri);
        if(uri[strlen(uri)-1] == '/')
            strcat(filename, "home.html");
        return 1;
    }
    else{//Dynamic content 
       ptr = index(uri, '?');
       if(ptr){
           strcpy(cgiargs, ptr+1);
           *ptr = '\0';
       }
       else
           strcpy(cgiargs, "");
       strcpy(filename, ".");
       strcat(filename, uri);
       return 0;
    }
}

void server_static(int fd, char* filename, int filesize){

    int srcfd;
    char* srcp, filetype[MAXLINE], buf[MAXBUF];

    //Send response headers to client
    get_filetype(filename, filetype);
    sprintf(buf, "HTTP/1.0 200 OK\r\n");
    sprintf(buf, "%sServer: Tiny Web Server\r\n", buf);
    sprintf(buf, "%sContent-length: %d\r\n", buf, filesize);
    sprintf(buf, "%sContent-type %s\r\n\r\n", buf, filetype);
    int n = strlen(buf);
    if(rio_writen(fd, buf, n) != n){
        fprintf(stderr, "rio_writen error\n");
        exit(0);
    }

    //Send response body to client
    if((srcfd = open(filename, O_RDONLY, 0)) < 0){
        fprintf(stderr, "error : server_static->open\n");
        exit(0);
    }
    if((srcp = mmap(0, filesize, PROT_READ, MAP_PRIVATE, srcfd, 0)) == ((void*)-1)){
        fprintf(stderr, "error : server_static->mmap\n");
        exit(0);
    }
    if(close(srcfd) < 0){
        fprintf(stderr, "error : server_static->close\n");
        exit(0);
    }
    if(rio_writen(fd, srcp, filesize) != filesize){
        fprintf(stderr, "error : server_static->rio_writen error\n");
        exit(0);
    }
    if(munmap(srcp, filesize) < 0){
        fprintf(stderr, "error : munmap\n");
        exit(0);
    }
}

void get_filetype(char* filename, char* filetype){

    if(strstr(filename, ".html"))
        strcpy(filetype, "text/html");
    else if(strstr(filename, ".gif"))
        strcpy(filetype, "image/gif");
    else if(strstr(filename, ".jpg"))
        strcpy(filetype, "image/jpeg");
    else
        strcpy(filetype, "text/plain");
}

void server_dynamic(int fd, char *filename, char *cgiargs){
    
    char buf[MAXLINE], *emptylist[] = { NULL };
    int n;
    pid_t pid;

    sprintf(buf, "HTTP/1.0 200 OK\r\n");
    n = strlen(buf);
    if(rio_writen(fd, buf, n) != n){
        fprintf(stderr, "error : rio_writen error\n");
        exit(0);
    }
    sprintf(buf, "Server: Tiny Web Server\r\n\r\n");
    n = strlen(buf);
    if(rio_writen(fd, buf, n) != n){
        fprintf(stderr, "error : rio_writen error\n");
        exit(0);
    }

    if((pid = fork()) < 0){
        fprintf(stderr, "error : fork\n");
        exit(0);
    }
    else if(pid ==0){// child
        //Real server would set all CGI vars here
        setenv("QUERY_STRING", cgiargs, 1);
        if(dup2(fd, STDOUT_FILENO) < 0){
            fprintf(stderr, "error : dup2\n");
            exit(0);
        }
        if(execve(filename, emptylist, environ) < 0){
            fprintf(stderr, "error : execve");
            exit(0);
        }
    }
    //Parent waits for and reap child
    if(wait(NULL) < 0){
        fprintf(stderr, "error : wait");
        exit(0);
    }
}
