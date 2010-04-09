#include <stdio.h>
#include <sys/types.h>
#include <signal.h>
#include <unistd.h>
#include <stdlib.h>

typedef void handler_t(int);

void handler(int sig){

    static int beeps = 0;

    printf("BEEP\n");
    if(++beeps < 5)
        alarm(1);
    else{
        printf("BOOM!\n");
        exit(0);
    }
}

handler_t * Signal(int signum, handler_t * handler){
    
    struct sigaction action, old_action;

    action.sa_handler = handler;
    sigemptyset(&action.sa_mask);//block sigs of type being handled
    action.sa_flags = SA_RESTART;//restart syscalls if possibel
    if(sigaction(signum, &action, &old_action) < 0){
        printf("Error : signal\n");
        exit(1);
    }
    return (old_action.sa_handler);

}
int main(){
    
    Signal(SIGALRM, handler);
    alarm(1);

    while(1){
        ;
    }
    
    return 0;
}
