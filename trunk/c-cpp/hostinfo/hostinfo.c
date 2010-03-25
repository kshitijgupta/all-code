#include <stdio.h>
#include <unistd.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <errno.h>
#include <string.h>

int main(int argc, char ** argv){

    char **pp;
    struct in_addr addr;
    struct hostent * hostp;

    if(argc != 2){
        fprintf(stderr, "usage : %s <domain or dotted-decimal>\n", argv[0]);
        exit(0);
    }

    if(inet_aton(argv[1], &addr) != 0){//输入的是ip地址
        if((hostp = gethostbyaddr((const char*)&addr, sizeof(addr), AF_INET)) == NULL){
                fprintf(stderr, "gethostbyaddr erro : %s\n", strerror(h_errno));
                exit(1);
        }
    }
    else{ //输入是域名
        if((hostp = gethostbyname(argv[1])) == NULL){
            fprintf(stderr, "gethostbyname error : %s\n", strerror(h_errno));
            exit(1);
        }
    }

    printf("official hostname : %s\n", hostp->h_name);

    for(pp=hostp->h_aliases; *pp!=NULL; pp++)
        printf("alias : %s \n", *pp);

    for(pp=hostp->h_addr_list; *pp!=NULL; pp++){
        addr.s_addr = *((unsigned int *)*pp);
        printf("address : %s\n", inet_ntoa(addr));
    }

    return 0;

}
