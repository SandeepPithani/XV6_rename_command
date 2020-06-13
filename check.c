#include "types.h"
#include "fcntl.h"
#include "user.h"
#include "stat.h"
#include "param.h"
#include "fs.h"
#include "syscall.h"
#include "traps.h"
#include "memlayout.h"


int 
main(int argc, char *argv[])
{
    int fd, fd1;
    char c;
    mkdir("utkarsh");
    mkdir("mohanya");
    fd = open("/utkarsh/1.txt", O_CREATE|O_RDWR);
    fd1 = open("/utkarsh/2.txt", O_CREATE|O_RDWR);
    c = 'a';
    write(fd, &c, 1);
    write(fd1, &c, 1);
    c = 'a';
    write(fd, &c, 1);
    write(fd1, &c, 1);
    c = 'a';
    write(fd, &c, 1);
    write(fd1, &c, 1);
    c = 'a';
    write(fd, &c, 1);
    write(fd1, &c, 1);
    c = 'a';
    write(fd, &c, 1);
    write(fd1, &c, 1);
    c = '\n';
    write(fd, &c, 1);
    write(fd1, &c, 1);
    close(fd);
    close(fd1);
}
