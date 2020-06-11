//
// File-system system calls.
// Mostly argument checking, since we don't trust
//  user code, and calls into file.c and fs.c.
//

#include "types.h"
#include "defs.h"
#include "param.h"
#include "stat.h"
#include "mmu.h"
#include "proc.h"
#include "fs.h"
#include "spinlock.h"
#include "sleeplock.h"
#include "file.h"
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
    return -1;
  if(pfd)
    *pfd = fd;
  if(pf)
    *pf = f;
  return 0;
}

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
}

int
sys_dup(void)
{
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}

int
sys_read(void)
{
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
  return fileread(f, p, n);
}

int
sys_write(void)
{
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
  return filewrite(f, p, n);
}

int
sys_close(void)
{
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
  myproc()->ofile[fd] = 0;
  fileclose(f);
  return 0;
}

int
sys_fstat(void)
{
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
    return -1;
  return filestat(f, st);
}

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
    return -1;

  begin_op();
  if((ip = namei(old)) == 0){
    end_op();
    return -1;
  }

  ilock(ip);
  if(ip->type == T_DIR){
    iunlockput(ip);
    end_op();
    return -1;
  }

  ip->nlink++;
  iupdate(ip);
  iunlock(ip);

  if((dp = nameiparent(new, name)) == 0)
    goto bad;
  ilock(dp);
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    iunlockput(dp);
    goto bad;
  }
  iunlockput(dp);
  iput(ip);

  end_op();

  return 0;

bad:
  ilock(ip);
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
}

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct inode *dp)
{
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("isdirempty: readi");
    if(de.inum != 0)
      return 0;
  }
  return 1;
}

//PAGEBREAK!
int
sys_unlink(void)
{
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
    return -1;

  begin_op();
  if((dp = nameiparent(path, name)) == 0){
    end_op();
    return -1;
  }

  ilock(dp);

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
    goto bad;
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
    iunlockput(ip);
    goto bad;
  }

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
    iupdate(dp);
  }
  iunlockput(dp);

  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);

  end_op();

  return 0;

bad:
  iunlockput(dp);
  end_op();
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    return 0;
  ilock(dp);

  if((ip = dirlookup(dp, name, 0)) != 0){
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
    panic("create: ialloc");

  ilock(ip);
  ip->major = major;
  ip->minor = minor;
  ip->nlink = 1;
  iupdate(ip);

  if(type == T_DIR){  // Create . and .. entries.
    dp->nlink++;  // for ".."
    iupdate(dp);
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
      panic("create dots");
  }

  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}

int
sys_open(void)
{
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
      end_op();
      return -1;
    }
    ilock(ip);
    if(ip->type == T_DIR && omode != O_RDONLY){
      iunlockput(ip);
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}

int
sys_mkdir(void)
{
  char *path;
  struct inode *ip;

  begin_op();
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    end_op();
    return -1;
  }
  iunlockput(ip);
  end_op();
  return 0;
}

int
sys_mknod(void)
{
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
    return -1;
  }
  iunlockput(ip);
  end_op();
  return 0;
}

int
sys_chdir(void)
{
  char *path;
  struct inode *ip;
  struct proc *curproc = myproc();
  
  begin_op();
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
    end_op();
    return -1;
  }
  ilock(ip);
  if(ip->type != T_DIR){
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
  iput(curproc->cwd);
  end_op();
  curproc->cwd = ip;
  return 0;
}

int
sys_mv(void){
    char *path1, *path2, *path3; //to take given arguments 
    struct inode *ip, *dp, *kp, *ep; //inodes for respective arguments
    struct proc *curproc= myproc(); //getting current process going ie. mv
    begin_op(); // acts like a lock , controls the system
    dp = curproc->cwd; //getting inode to current working directory
    if(argstr(0, &path1) < 0 || (ip=namei(path1)) == 0) { //checking for if path1 present and if its inode not present
        if(strncmp(path1, "--ver", DIRSIZ) == 0) {
            cprintf("   mv (GNU coreutils) 8.26\n");
            cprintf("   Packaged by SEV (8.26-2)\n");
            cprintf("   Copyright (C) 2020 SEV, Inc.\n");
            cprintf("   License GPLv3+: free for Public Use .\n");
            cprintf("   Written by Shivam Marathe\n");
        }
        end_op();//end of operation unlock the process.
        return -1;
    }
    ilock(ip);//locking inode of path1 for making potential changes
    if(argstr(1, &path2) < 0) {
        iunlock(ip);
        end_op();
        return -1;
    }
    if(argstr(2, &path3) > 0 && ((strncmp(path3, "-n", DIRSIZ) == 0) && (ep=namei(path2)) != 0)) {
        iunlock(ip);
        cprintf("%s alredy exists\n", path2); //checking for -n command
        end_op();
        safestrcpy(path1, "", DIRSIZ);
        safestrcpy(path2, "", DIRSIZ);
        safestrcpy(path3, "", DIRSIZ); //function to copy null terminated string
        return -1;
    }
    if((kp=namei(path2)) != 0 && (kp->type== T_FILE || kp->type==T_DIR)){
        struct inode *ap, *vp;
        struct dirent dz; //entry of file number and name in this structure of directory
        char name1[DIRSIZ];
        uint off1;
        
        if((vp = nameiparent(path2, name1)) == 0){
            end_op();
            iunlock(ip);
            return -1;
        }

        ilock(vp); //locking parent structure

        // Cannot unlink "." or "..".

        ap = dirlookup(vp, name1, &off1); //getting entry of inode in ap and its offset in off1
        ilock(ap);

        if(ap->nlink < 1)
            panic("unlink: nlink < 1"); 

        memset(&dz, 0, sizeof(dz)); //writing the null values in dirent structure
        if(writei(vp, (char*)&dz, off1, sizeof(dz)) != sizeof(dz)) //writing the structure to off1 offset
            panic("unlink: writei");
        if(ap->type == T_DIR){
            vp->nlink--; //decreasing the links to parent node
            iupdate(vp);
        }
        iunlockput(vp);

        ap->nlink--;//decreasing the links to self node
        iupdate(ap); //updating info
        iunlockput(ap); //send it back to storage
    }
    if(ip->type == T_FILE){
        struct inode *sp;
        char name[DIRSIZ];
        sp = nameiparent(path1, name);
        ilock(sp);
        int off;
        struct dirent de;
        for(off = 0; off < (sp->size); off += sizeof(de)){
            if(readi(sp, (char*)&de, off, sizeof(de)) != sizeof(de)) //finding one dirent structure each time
                panic("dirlink read");
            if(de.inum == ip->inum){ //comparing inum
                safestrcpy(de.name, path2, DIRSIZ); //copy the name into de
                break;
            }
        }
        if(writei(sp, (char*)&de, off, sizeof(de)) != sizeof(de)) {
            panic("unlink: writei"); //writing to offset changed name of path2
        }
        iunlock(ip);
        iunlock(sp);
        iput(curproc->cwd);
        end_op();
        curproc->cwd = dp;
        safestrcpy(path1, "", DIRSIZ);
        safestrcpy(path2, "", DIRSIZ);
        safestrcpy(path1, "", DIRSIZ);
        return 0;
    }
    else if(ip->type == T_DIR){
        int off;
        struct inode *parent;
        struct dirent de;
        parent = dirlookup(ip, "..", 0); //getting inode of parent directory
        ilock(parent);
        for(off = 0; off < (parent->size); off += sizeof(de)){
            if(readi(parent, (char*)&de, off, sizeof(de)) != sizeof(de))
                panic("dirlink read");
            if(de.inum == ip->inum){
                safestrcpy(de.name, path2, DIRSIZ);
                break;
            }
        }
        if(writei(parent, (char*)&de, off, sizeof(de)) != sizeof(de)) {
            panic("unlink: writei");
        }
        iunlock(ip);
        iunlock(parent);
        iput(curproc->cwd);
        end_op();
        curproc->cwd = dp;
        safestrcpy(path1, "", DIRSIZ);
        safestrcpy(path2, "", DIRSIZ);
        safestrcpy(path1, "", DIRSIZ);
        return 0;
    }
    safestrcpy(path1, "", DIRSIZ);
    safestrcpy(path2, "", DIRSIZ);
    safestrcpy(path3, "", DIRSIZ);
    return 0;
}


/*
int 
sys_pwd(void)
{
    struct proc *curproc = myproc();
    struct inode *ip;
    struct dirent de;
    struct inode *parent;
    int off;
    uint inum;
    
    begin_op();
    ip = curproc->cwd;
    ilock(ip);
    inum = ip->inum;
    if (ip->inum == namei("/")->inum){
        cprintf("/\n");
        iunlock(ip);
        end_op();
        return 1;
    } else if (ip->type == T_DIR) {
        parent = dirlookup(ip, "..", 0);
        ilock(parent);
        for(off = 0; off < (parent->size); off += sizeof(de)){
            if(readi(parent, (char*)&de, off, sizeof(de)) != sizeof(de))
                panic("dirlink read");
            if(de.inum == inum)
                break;
        }
        iunlock(parent);
    }
    cprintf("%s\n", de.name);
    iunlock(ip);
    end_op();
    return 1;
}*/


int
name_of_inode(struct inode *ip, struct inode *parent, char buf[DIRSIZ]) {
    uint off;
    struct dirent de;
    for (off = 0; off < parent->size; off += sizeof(de)) {
        if (readi(parent, (char*)&de, off, sizeof(de)) != sizeof(de))
            panic("couldn't read dir entry");
        if (de.inum == ip->inum) {
            safestrcpy(buf, de.name, DIRSIZ);
            return 0;
        }
    }
    return -1;
}

int
name_for_inode(char* buf, int n, struct inode *ip) {
    int path_offset;
    struct inode *parent;
    char node_name[DIRSIZ];
    if (ip->inum == namei("/")->inum) { //namei is inefficient but iget isn't exported for some reason
        buf[0] = '/';
        return 1;
    } else if (ip->type == T_DIR) {
        parent = dirlookup(ip, "..", 0);
        ilock(parent);
        if (name_of_inode(ip, parent, node_name)) {
            panic("could not find name of inode in parent!");
        }
        path_offset = name_for_inode(buf, n, parent);
        safestrcpy(buf + path_offset, node_name, n - path_offset);
        path_offset += strlen(node_name);
        if (path_offset == n - 1) {
            buf[path_offset] = '\0';
            return n;
        } else {
            buf[path_offset++] = '/';
        }
        iunlock(parent); //free
        return path_offset;
    } else if (ip->type == T_DEV || ip->type == T_FILE) {
        panic("process cwd is a device node / file, not a directory!");
    } else {
        panic("unknown inode type");
    }
}

int
sys_pwd(void)
{
    char *p;
    int n;
    struct proc *curproc = myproc();
    if(argint(1, &n) < 0 || argptr(0, &p, n) < 0)
        return -1;
    return name_for_inode(p, n, curproc->cwd);
}

int
sys_exec(void)
{
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
      return -1;
    if(uarg == 0){
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}

int
sys_pipe(void)
{
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
}
