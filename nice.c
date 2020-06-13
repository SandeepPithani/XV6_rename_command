#include "types.h"
#include "fcntl.h"
#include "user.h"
#include "stat.h"

int
main(int argc, char *argv[]){
    int priority, pid;
    if (argc < 3){
        printf(2, "Usage:nice old priority \n");
        exit();
    }
    pid = atoi(argv[1]);
    priority = atoi(argv[2]);
    if(priority < 0 || priority > 20) {
        printf(2, "Invalid priority (0-20)!\n");
        exit();
    }
    printf(1, "pid = %d, pr = %d\n", pid, priority);
    chpr(pid, priority);
    exit();
}
