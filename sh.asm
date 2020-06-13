
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

#define MAX_PATH 512

int
main(void)
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	57                   	push   %edi
       e:	56                   	push   %esi
       f:	53                   	push   %ebx
      10:	51                   	push   %ecx
      11:	81 ec 08 08 00 00    	sub    $0x808,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      17:	eb 10                	jmp    29 <main+0x29>
      19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(fd >= 3){
      20:	83 f8 02             	cmp    $0x2,%eax
      23:	0f 8f 67 02 00 00    	jg     290 <main+0x290>
  while((fd = open("console", O_RDWR)) >= 0){
      29:	83 ec 08             	sub    $0x8,%esp
      2c:	6a 02                	push   $0x2
      2e:	68 39 15 00 00       	push   $0x1539
      33:	e8 da 0f 00 00       	call   1012 <open>
      38:	83 c4 10             	add    $0x10,%esp
      3b:	85 c0                	test   %eax,%eax
      3d:	79 e1                	jns    20 <main+0x20>
      3f:	eb 3a                	jmp    7b <main+0x7b>
      41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    else if(buf[0] == 'p' && buf[1] == 'w' && buf[2] == 'd'){
      48:	3c 70                	cmp    $0x70,%al
      4a:	0f 85 a0 00 00 00    	jne    f0 <main+0xf0>
      50:	80 3d 61 1b 00 00 77 	cmpb   $0x77,0x1b61
      57:	0f 84 fb 01 00 00    	je     258 <main+0x258>
      5d:	8d 76 00             	lea    0x0(%esi),%esi
int
fork1(void)
{
  int pid;

  pid = fork();
      60:	e8 65 0f 00 00       	call   fca <fork>
  if(pid == -1)
      65:	83 f8 ff             	cmp    $0xffffffff,%eax
      68:	0f 84 38 02 00 00    	je     2a6 <main+0x2a6>
    if(fork1() == 0)
      6e:	85 c0                	test   %eax,%eax
      70:	0f 84 3d 02 00 00    	je     2b3 <main+0x2b3>
    wait();
      76:	e8 5f 0f 00 00       	call   fda <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
      7b:	83 ec 08             	sub    $0x8,%esp
      7e:	6a 64                	push   $0x64
      80:	68 60 1b 00 00       	push   $0x1b60
      85:	e8 36 03 00 00       	call   3c0 <getcmd>
      8a:	83 c4 10             	add    $0x10,%esp
      8d:	85 c0                	test   %eax,%eax
      8f:	0f 88 0c 02 00 00    	js     2a1 <main+0x2a1>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      95:	0f b6 05 60 1b 00 00 	movzbl 0x1b60,%eax
      9c:	3c 63                	cmp    $0x63,%al
      9e:	75 a8                	jne    48 <main+0x48>
      a0:	80 3d 61 1b 00 00 64 	cmpb   $0x64,0x1b61
      a7:	75 b7                	jne    60 <main+0x60>
      a9:	80 3d 62 1b 00 00 20 	cmpb   $0x20,0x1b62
      b0:	75 ae                	jne    60 <main+0x60>
      buf[strlen(buf)-1] = 0;  // chop \n
      b2:	83 ec 0c             	sub    $0xc,%esp
      b5:	68 60 1b 00 00       	push   $0x1b60
      ba:	e8 41 0d 00 00       	call   e00 <strlen>
      if(chdir(buf+3) < 0)
      bf:	c7 04 24 63 1b 00 00 	movl   $0x1b63,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
      c6:	c6 80 5f 1b 00 00 00 	movb   $0x0,0x1b5f(%eax)
      if(chdir(buf+3) < 0)
      cd:	e8 70 0f 00 00       	call   1042 <chdir>
      d2:	83 c4 10             	add    $0x10,%esp
      d5:	85 c0                	test   %eax,%eax
      d7:	79 a2                	jns    7b <main+0x7b>
        printf(2, "cannot cd %s\n", buf+3);
      d9:	57                   	push   %edi
      da:	68 63 1b 00 00       	push   $0x1b63
      df:	68 41 15 00 00       	push   $0x1541
      e4:	6a 02                	push   $0x2
      e6:	e8 55 10 00 00       	call   1140 <printf>
      eb:	83 c4 10             	add    $0x10,%esp
      ee:	eb 8b                	jmp    7b <main+0x7b>
    else if(buf[0] == 'm' && buf[1] == 'v' && buf[2] == ' ') {//code for checking mv command
      f0:	3c 6d                	cmp    $0x6d,%al
      f2:	0f 85 68 ff ff ff    	jne    60 <main+0x60>
      f8:	80 3d 61 1b 00 00 76 	cmpb   $0x76,0x1b61
      ff:	0f 85 5b ff ff ff    	jne    60 <main+0x60>
     105:	80 3d 62 1b 00 00 20 	cmpb   $0x20,0x1b62
     10c:	0f 85 4e ff ff ff    	jne    60 <main+0x60>
        buf[strlen(buf)-1] = 0;
     112:	83 ec 0c             	sub    $0xc,%esp
        int i = 0, j = 0;
     115:	31 db                	xor    %ebx,%ebx
        buf[strlen(buf)-1] = 0;
     117:	68 60 1b 00 00       	push   $0x1b60
     11c:	e8 df 0c 00 00       	call   e00 <strlen>
        for(i = 3; i < strlen(buf); i++){//to take out first arguement
     121:	83 c4 10             	add    $0x10,%esp
        buf[strlen(buf)-1] = 0;
     124:	c6 80 5f 1b 00 00 00 	movb   $0x0,0x1b5f(%eax)
        for(i = 3; i < strlen(buf); i++){//to take out first arguement
     12b:	eb 19                	jmp    146 <main+0x146>
            if(buf[i] == ' '){
     12d:	0f b6 83 63 1b 00 00 	movzbl 0x1b63(%ebx),%eax
     134:	3c 20                	cmp    $0x20,%al
     136:	0f 84 c9 01 00 00    	je     305 <main+0x305>
            path1[j] = buf[i];
     13c:	88 84 1d e8 f7 ff ff 	mov    %al,-0x818(%ebp,%ebx,1)
            j++;
     143:	83 c3 01             	add    $0x1,%ebx
        for(i = 3; i < strlen(buf); i++){//to take out first arguement
     146:	83 ec 0c             	sub    $0xc,%esp
     149:	68 60 1b 00 00       	push   $0x1b60
     14e:	e8 ad 0c 00 00       	call   e00 <strlen>
     153:	8d 53 03             	lea    0x3(%ebx),%edx
     156:	83 c4 10             	add    $0x10,%esp
     159:	39 d0                	cmp    %edx,%eax
     15b:	77 d0                	ja     12d <main+0x12d>
     15d:	8d b5 e8 f9 ff ff    	lea    -0x618(%ebp),%esi
        i = strlen(path2);
     163:	83 ec 0c             	sub    $0xc,%esp
     166:	56                   	push   %esi
     167:	e8 94 0c 00 00       	call   e00 <strlen>
        if(strlen(path1) == 5 && path1[0] == '-' && path1[1] == '-' && path1[2] == 'v' && path1[3] == 'e' && path1[4] == 'r'){
     16c:	8d 85 e8 f7 ff ff    	lea    -0x818(%ebp),%eax
     172:	89 04 24             	mov    %eax,(%esp)
     175:	e8 86 0c 00 00       	call   e00 <strlen>
     17a:	83 c4 10             	add    $0x10,%esp
     17d:	83 f8 05             	cmp    $0x5,%eax
     180:	75 31                	jne    1b3 <main+0x1b3>
     182:	80 bd e8 f7 ff ff 2d 	cmpb   $0x2d,-0x818(%ebp)
     189:	75 28                	jne    1b3 <main+0x1b3>
     18b:	80 bd e9 f7 ff ff 2d 	cmpb   $0x2d,-0x817(%ebp)
     192:	75 1f                	jne    1b3 <main+0x1b3>
     194:	80 bd ea f7 ff ff 76 	cmpb   $0x76,-0x816(%ebp)
     19b:	75 16                	jne    1b3 <main+0x1b3>
     19d:	80 bd eb f7 ff ff 65 	cmpb   $0x65,-0x815(%ebp)
     1a4:	75 0d                	jne    1b3 <main+0x1b3>
     1a6:	80 bd ec f7 ff ff 72 	cmpb   $0x72,-0x814(%ebp)
     1ad:	0f 84 15 01 00 00    	je     2c8 <main+0x2c8>
     1b3:	31 db                	xor    %ebx,%ebx
     1b5:	eb 16                	jmp    1cd <main+0x1cd>
                if(path2[i] == ' '){
     1b7:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
     1bb:	3c 20                	cmp    $0x20,%al
     1bd:	0f 84 75 01 00 00    	je     338 <main+0x338>
                path3[j] = path2[i];
     1c3:	88 84 1d e8 fb ff ff 	mov    %al,-0x418(%ebp,%ebx,1)
                j++;
     1ca:	83 c3 01             	add    $0x1,%ebx
            for(i = 0; i < strlen(path2); i++){
     1cd:	83 ec 0c             	sub    $0xc,%esp
     1d0:	56                   	push   %esi
     1d1:	e8 2a 0c 00 00       	call   e00 <strlen>
     1d6:	83 c4 10             	add    $0x10,%esp
     1d9:	39 d8                	cmp    %ebx,%eax
     1db:	77 da                	ja     1b7 <main+0x1b7>
     1dd:	8d 9d e8 fd ff ff    	lea    -0x218(%ebp),%ebx
            mv(path1, path3, path4); //call to rename
     1e3:	50                   	push   %eax
     1e4:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
     1ea:	53                   	push   %ebx
     1eb:	50                   	push   %eax
     1ec:	8d 85 e8 f7 ff ff    	lea    -0x818(%ebp),%eax
     1f2:	50                   	push   %eax
     1f3:	e8 92 0e 00 00       	call   108a <mv>
     1f8:	83 c4 10             	add    $0x10,%esp
        strcpy(buf, "");
     1fb:	52                   	push   %edx
     1fc:	52                   	push   %edx
     1fd:	68 b1 14 00 00       	push   $0x14b1
     202:	68 60 1b 00 00       	push   $0x1b60
     207:	e8 74 0b 00 00       	call   d80 <strcpy>
        strcpy(path1, "");
     20c:	59                   	pop    %ecx
     20d:	8d 85 e8 f7 ff ff    	lea    -0x818(%ebp),%eax
     213:	5f                   	pop    %edi
     214:	68 b1 14 00 00       	push   $0x14b1
     219:	50                   	push   %eax
     21a:	e8 61 0b 00 00       	call   d80 <strcpy>
        strcpy(path2, "");
     21f:	58                   	pop    %eax
     220:	5a                   	pop    %edx
     221:	68 b1 14 00 00       	push   $0x14b1
     226:	56                   	push   %esi
     227:	e8 54 0b 00 00       	call   d80 <strcpy>
        strcpy(path3, "");
     22c:	59                   	pop    %ecx
     22d:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
     233:	5e                   	pop    %esi
     234:	68 b1 14 00 00       	push   $0x14b1
     239:	50                   	push   %eax
     23a:	e8 41 0b 00 00       	call   d80 <strcpy>
        strcpy(path4, "");//flushing out of saved strings.
     23f:	5f                   	pop    %edi
     240:	58                   	pop    %eax
     241:	68 b1 14 00 00       	push   $0x14b1
     246:	53                   	push   %ebx
     247:	e8 34 0b 00 00       	call   d80 <strcpy>
     24c:	83 c4 10             	add    $0x10,%esp
     24f:	e9 27 fe ff ff       	jmp    7b <main+0x7b>
     254:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    else if(buf[0] == 'p' && buf[1] == 'w' && buf[2] == 'd'){
     258:	80 3d 62 1b 00 00 64 	cmpb   $0x64,0x1b62
     25f:	0f 85 fb fd ff ff    	jne    60 <main+0x60>
        pwd(path, MAX_PATH);
     265:	8d 9d e8 fd ff ff    	lea    -0x218(%ebp),%ebx
     26b:	56                   	push   %esi
     26c:	56                   	push   %esi
     26d:	68 00 02 00 00       	push   $0x200
     272:	53                   	push   %ebx
     273:	e8 0a 0e 00 00       	call   1082 <pwd>
        printf(2, "%s\n", path);
     278:	83 c4 0c             	add    $0xc,%esp
     27b:	53                   	push   %ebx
     27c:	68 35 15 00 00       	push   $0x1535
     281:	6a 02                	push   $0x2
     283:	e8 b8 0e 00 00       	call   1140 <printf>
     288:	83 c4 10             	add    $0x10,%esp
     28b:	e9 eb fd ff ff       	jmp    7b <main+0x7b>
      close(fd);
     290:	83 ec 0c             	sub    $0xc,%esp
     293:	50                   	push   %eax
     294:	e8 61 0d 00 00       	call   ffa <close>
      break;
     299:	83 c4 10             	add    $0x10,%esp
     29c:	e9 da fd ff ff       	jmp    7b <main+0x7b>
  exit();
     2a1:	e8 2c 0d 00 00       	call   fd2 <exit>
    panic("fork");
     2a6:	83 ec 0c             	sub    $0xc,%esp
     2a9:	68 c2 14 00 00       	push   $0x14c2
     2ae:	e8 5d 01 00 00       	call   410 <panic>
      runcmd(parsecmd(buf));
     2b3:	83 ec 0c             	sub    $0xc,%esp
     2b6:	68 60 1b 00 00       	push   $0x1b60
     2bb:	e8 50 0a 00 00       	call   d10 <parsecmd>
     2c0:	89 04 24             	mov    %eax,(%esp)
     2c3:	e8 68 01 00 00       	call   430 <runcmd>
            for(i = 0; i < strlen(path2); i++){
     2c8:	31 ff                	xor    %edi,%edi
     2ca:	eb 16                	jmp    2e2 <main+0x2e2>
                if(path2[i] == ' '){
     2cc:	0f b6 04 3e          	movzbl (%esi,%edi,1),%eax
     2d0:	3c 20                	cmp    $0x20,%al
     2d2:	0f 84 a5 00 00 00    	je     37d <main+0x37d>
                path3[j] = path2[i];
     2d8:	88 84 3d e8 fb ff ff 	mov    %al,-0x418(%ebp,%edi,1)
                j++;
     2df:	83 c7 01             	add    $0x1,%edi
            for(i = 0; i < strlen(path2); i++){
     2e2:	83 ec 0c             	sub    $0xc,%esp
     2e5:	56                   	push   %esi
     2e6:	e8 15 0b 00 00       	call   e00 <strlen>
     2eb:	83 c4 10             	add    $0x10,%esp
     2ee:	39 f8                	cmp    %edi,%eax
     2f0:	77 da                	ja     2cc <main+0x2cc>
     2f2:	8d 9d e8 fd ff ff    	lea    -0x218(%ebp),%ebx
            path3[j] = 0;
     2f8:	c6 84 3d e8 fb ff ff 	movb   $0x0,-0x418(%ebp,%edi,1)
     2ff:	00 
     300:	e9 de fe ff ff       	jmp    1e3 <main+0x1e3>
                strcpy(path2, buf+4+strlen(path1));
     305:	8d 85 e8 f7 ff ff    	lea    -0x818(%ebp),%eax
     30b:	83 ec 0c             	sub    $0xc,%esp
                path1[j] = 0;
     30e:	c6 84 1d e8 f7 ff ff 	movb   $0x0,-0x818(%ebp,%ebx,1)
     315:	00 
                strcpy(path2, buf+4+strlen(path1));
     316:	8d b5 e8 f9 ff ff    	lea    -0x618(%ebp),%esi
     31c:	50                   	push   %eax
     31d:	e8 de 0a 00 00       	call   e00 <strlen>
     322:	59                   	pop    %ecx
     323:	5b                   	pop    %ebx
     324:	05 64 1b 00 00       	add    $0x1b64,%eax
     329:	50                   	push   %eax
     32a:	56                   	push   %esi
     32b:	e8 50 0a 00 00       	call   d80 <strcpy>
                break;
     330:	83 c4 10             	add    $0x10,%esp
     333:	e9 2b fe ff ff       	jmp    163 <main+0x163>
                    strcpy(path4, buf+4+strlen(path3)+1+strlen(path1));
     338:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
     33e:	83 ec 0c             	sub    $0xc,%esp
                    path3[j] = 0;
     341:	c6 84 1d e8 fb ff ff 	movb   $0x0,-0x418(%ebp,%ebx,1)
     348:	00 
                    strcpy(path4, buf+4+strlen(path3)+1+strlen(path1));
     349:	50                   	push   %eax
     34a:	e8 b1 0a 00 00       	call   e00 <strlen>
     34f:	89 c3                	mov    %eax,%ebx
     351:	8d 85 e8 f7 ff ff    	lea    -0x818(%ebp),%eax
     357:	89 04 24             	mov    %eax,(%esp)
     35a:	e8 a1 0a 00 00       	call   e00 <strlen>
     35f:	5a                   	pop    %edx
     360:	8d 84 03 65 1b 00 00 	lea    0x1b65(%ebx,%eax,1),%eax
     367:	8d 9d e8 fd ff ff    	lea    -0x218(%ebp),%ebx
     36d:	59                   	pop    %ecx
     36e:	50                   	push   %eax
     36f:	53                   	push   %ebx
     370:	e8 0b 0a 00 00       	call   d80 <strcpy>
                    break;
     375:	83 c4 10             	add    $0x10,%esp
     378:	e9 66 fe ff ff       	jmp    1e3 <main+0x1e3>
                    strcpy(path4, path3+1+strlen(path3));
     37d:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
     383:	83 ec 0c             	sub    $0xc,%esp
                    path3[j] = 0;
     386:	c6 84 3d e8 fb ff ff 	movb   $0x0,-0x418(%ebp,%edi,1)
     38d:	00 
                    strcpy(path4, path3+1+strlen(path3));
     38e:	50                   	push   %eax
     38f:	e8 6c 0a 00 00       	call   e00 <strlen>
     394:	5b                   	pop    %ebx
     395:	8d 84 05 e9 fb ff ff 	lea    -0x417(%ebp,%eax,1),%eax
     39c:	8d 9d e8 fd ff ff    	lea    -0x218(%ebp),%ebx
     3a2:	5a                   	pop    %edx
     3a3:	50                   	push   %eax
     3a4:	53                   	push   %ebx
     3a5:	e8 d6 09 00 00       	call   d80 <strcpy>
                    break;
     3aa:	83 c4 10             	add    $0x10,%esp
     3ad:	e9 46 ff ff ff       	jmp    2f8 <main+0x2f8>
     3b2:	66 90                	xchg   %ax,%ax
     3b4:	66 90                	xchg   %ax,%ax
     3b6:	66 90                	xchg   %ax,%ax
     3b8:	66 90                	xchg   %ax,%ax
     3ba:	66 90                	xchg   %ax,%ax
     3bc:	66 90                	xchg   %ax,%ax
     3be:	66 90                	xchg   %ax,%ax

000003c0 <getcmd>:
{
     3c0:	55                   	push   %ebp
     3c1:	89 e5                	mov    %esp,%ebp
     3c3:	56                   	push   %esi
     3c4:	53                   	push   %ebx
     3c5:	8b 75 0c             	mov    0xc(%ebp),%esi
     3c8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(2, "$ ");
     3cb:	83 ec 08             	sub    $0x8,%esp
     3ce:	68 98 14 00 00       	push   $0x1498
     3d3:	6a 02                	push   $0x2
     3d5:	e8 66 0d 00 00       	call   1140 <printf>
  memset(buf, 0, nbuf);
     3da:	83 c4 0c             	add    $0xc,%esp
     3dd:	56                   	push   %esi
     3de:	6a 00                	push   $0x0
     3e0:	53                   	push   %ebx
     3e1:	e8 4a 0a 00 00       	call   e30 <memset>
  gets(buf, nbuf);
     3e6:	58                   	pop    %eax
     3e7:	5a                   	pop    %edx
     3e8:	56                   	push   %esi
     3e9:	53                   	push   %ebx
     3ea:	e8 a1 0a 00 00       	call   e90 <gets>
  if(buf[0] == 0) // EOF
     3ef:	83 c4 10             	add    $0x10,%esp
     3f2:	31 c0                	xor    %eax,%eax
     3f4:	80 3b 00             	cmpb   $0x0,(%ebx)
     3f7:	0f 94 c0             	sete   %al
}
     3fa:	8d 65 f8             	lea    -0x8(%ebp),%esp
  if(buf[0] == 0) // EOF
     3fd:	f7 d8                	neg    %eax
}
     3ff:	5b                   	pop    %ebx
     400:	5e                   	pop    %esi
     401:	5d                   	pop    %ebp
     402:	c3                   	ret    
     403:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000410 <panic>:
{
     410:	55                   	push   %ebp
     411:	89 e5                	mov    %esp,%ebp
     413:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     416:	ff 75 08             	pushl  0x8(%ebp)
     419:	68 35 15 00 00       	push   $0x1535
     41e:	6a 02                	push   $0x2
     420:	e8 1b 0d 00 00       	call   1140 <printf>
  exit();
     425:	e8 a8 0b 00 00       	call   fd2 <exit>
     42a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000430 <runcmd>:
{
     430:	55                   	push   %ebp
     431:	89 e5                	mov    %esp,%ebp
     433:	53                   	push   %ebx
     434:	83 ec 14             	sub    $0x14,%esp
     437:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     43a:	85 db                	test   %ebx,%ebx
     43c:	74 3a                	je     478 <runcmd+0x48>
  switch(cmd->type){
     43e:	83 3b 05             	cmpl   $0x5,(%ebx)
     441:	0f 87 06 01 00 00    	ja     54d <runcmd+0x11d>
     447:	8b 03                	mov    (%ebx),%eax
     449:	ff 24 85 50 15 00 00 	jmp    *0x1550(,%eax,4)
    if(ecmd->argv[0] == 0)
     450:	8b 43 04             	mov    0x4(%ebx),%eax
     453:	85 c0                	test   %eax,%eax
     455:	74 21                	je     478 <runcmd+0x48>
    exec(ecmd->argv[0], ecmd->argv);
     457:	52                   	push   %edx
     458:	52                   	push   %edx
     459:	8d 53 04             	lea    0x4(%ebx),%edx
     45c:	52                   	push   %edx
     45d:	50                   	push   %eax
     45e:	e8 a7 0b 00 00       	call   100a <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     463:	83 c4 0c             	add    $0xc,%esp
     466:	ff 73 04             	pushl  0x4(%ebx)
     469:	68 a2 14 00 00       	push   $0x14a2
     46e:	6a 02                	push   $0x2
     470:	e8 cb 0c 00 00       	call   1140 <printf>
    break;
     475:	83 c4 10             	add    $0x10,%esp
    exit();
     478:	e8 55 0b 00 00       	call   fd2 <exit>
  pid = fork();
     47d:	e8 48 0b 00 00       	call   fca <fork>
  if(pid == -1)
     482:	83 f8 ff             	cmp    $0xffffffff,%eax
     485:	0f 84 cf 00 00 00    	je     55a <runcmd+0x12a>
    if(fork1() == 0)
     48b:	85 c0                	test   %eax,%eax
     48d:	75 e9                	jne    478 <runcmd+0x48>
      runcmd(bcmd->cmd);
     48f:	83 ec 0c             	sub    $0xc,%esp
     492:	ff 73 04             	pushl  0x4(%ebx)
     495:	e8 96 ff ff ff       	call   430 <runcmd>
    close(rcmd->fd);
     49a:	83 ec 0c             	sub    $0xc,%esp
     49d:	ff 73 14             	pushl  0x14(%ebx)
     4a0:	e8 55 0b 00 00       	call   ffa <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     4a5:	59                   	pop    %ecx
     4a6:	58                   	pop    %eax
     4a7:	ff 73 10             	pushl  0x10(%ebx)
     4aa:	ff 73 08             	pushl  0x8(%ebx)
     4ad:	e8 60 0b 00 00       	call   1012 <open>
     4b2:	83 c4 10             	add    $0x10,%esp
     4b5:	85 c0                	test   %eax,%eax
     4b7:	79 d6                	jns    48f <runcmd+0x5f>
      printf(2, "open %s failed\n", rcmd->file);
     4b9:	52                   	push   %edx
     4ba:	ff 73 08             	pushl  0x8(%ebx)
     4bd:	68 b2 14 00 00       	push   $0x14b2
     4c2:	6a 02                	push   $0x2
     4c4:	e8 77 0c 00 00       	call   1140 <printf>
      exit();
     4c9:	e8 04 0b 00 00       	call   fd2 <exit>
    if(pipe(p) < 0)
     4ce:	8d 45 f0             	lea    -0x10(%ebp),%eax
     4d1:	83 ec 0c             	sub    $0xc,%esp
     4d4:	50                   	push   %eax
     4d5:	e8 08 0b 00 00       	call   fe2 <pipe>
     4da:	83 c4 10             	add    $0x10,%esp
     4dd:	85 c0                	test   %eax,%eax
     4df:	0f 88 b0 00 00 00    	js     595 <runcmd+0x165>
  pid = fork();
     4e5:	e8 e0 0a 00 00       	call   fca <fork>
  if(pid == -1)
     4ea:	83 f8 ff             	cmp    $0xffffffff,%eax
     4ed:	74 6b                	je     55a <runcmd+0x12a>
    if(fork1() == 0){
     4ef:	85 c0                	test   %eax,%eax
     4f1:	0f 84 ab 00 00 00    	je     5a2 <runcmd+0x172>
  pid = fork();
     4f7:	e8 ce 0a 00 00       	call   fca <fork>
  if(pid == -1)
     4fc:	83 f8 ff             	cmp    $0xffffffff,%eax
     4ff:	74 59                	je     55a <runcmd+0x12a>
    if(fork1() == 0){
     501:	85 c0                	test   %eax,%eax
     503:	74 62                	je     567 <runcmd+0x137>
    close(p[0]);
     505:	83 ec 0c             	sub    $0xc,%esp
     508:	ff 75 f0             	pushl  -0x10(%ebp)
     50b:	e8 ea 0a 00 00       	call   ffa <close>
    close(p[1]);
     510:	58                   	pop    %eax
     511:	ff 75 f4             	pushl  -0xc(%ebp)
     514:	e8 e1 0a 00 00       	call   ffa <close>
    wait();
     519:	e8 bc 0a 00 00       	call   fda <wait>
    wait();
     51e:	e8 b7 0a 00 00       	call   fda <wait>
    break;
     523:	83 c4 10             	add    $0x10,%esp
     526:	e9 4d ff ff ff       	jmp    478 <runcmd+0x48>
  pid = fork();
     52b:	e8 9a 0a 00 00       	call   fca <fork>
  if(pid == -1)
     530:	83 f8 ff             	cmp    $0xffffffff,%eax
     533:	74 25                	je     55a <runcmd+0x12a>
    if(fork1() == 0)
     535:	85 c0                	test   %eax,%eax
     537:	0f 84 52 ff ff ff    	je     48f <runcmd+0x5f>
    wait();
     53d:	e8 98 0a 00 00       	call   fda <wait>
    runcmd(lcmd->right);
     542:	83 ec 0c             	sub    $0xc,%esp
     545:	ff 73 08             	pushl  0x8(%ebx)
     548:	e8 e3 fe ff ff       	call   430 <runcmd>
    panic("runcmd");
     54d:	83 ec 0c             	sub    $0xc,%esp
     550:	68 9b 14 00 00       	push   $0x149b
     555:	e8 b6 fe ff ff       	call   410 <panic>
    panic("fork");
     55a:	83 ec 0c             	sub    $0xc,%esp
     55d:	68 c2 14 00 00       	push   $0x14c2
     562:	e8 a9 fe ff ff       	call   410 <panic>
      close(0);
     567:	83 ec 0c             	sub    $0xc,%esp
     56a:	6a 00                	push   $0x0
     56c:	e8 89 0a 00 00       	call   ffa <close>
      dup(p[0]);
     571:	5a                   	pop    %edx
     572:	ff 75 f0             	pushl  -0x10(%ebp)
     575:	e8 d0 0a 00 00       	call   104a <dup>
      close(p[0]);
     57a:	59                   	pop    %ecx
     57b:	ff 75 f0             	pushl  -0x10(%ebp)
     57e:	e8 77 0a 00 00       	call   ffa <close>
      close(p[1]);
     583:	58                   	pop    %eax
     584:	ff 75 f4             	pushl  -0xc(%ebp)
     587:	e8 6e 0a 00 00       	call   ffa <close>
      runcmd(pcmd->right);
     58c:	58                   	pop    %eax
     58d:	ff 73 08             	pushl  0x8(%ebx)
     590:	e8 9b fe ff ff       	call   430 <runcmd>
      panic("pipe");
     595:	83 ec 0c             	sub    $0xc,%esp
     598:	68 c7 14 00 00       	push   $0x14c7
     59d:	e8 6e fe ff ff       	call   410 <panic>
      close(1);
     5a2:	83 ec 0c             	sub    $0xc,%esp
     5a5:	6a 01                	push   $0x1
     5a7:	e8 4e 0a 00 00       	call   ffa <close>
      dup(p[1]);
     5ac:	58                   	pop    %eax
     5ad:	ff 75 f4             	pushl  -0xc(%ebp)
     5b0:	e8 95 0a 00 00       	call   104a <dup>
      close(p[0]);
     5b5:	58                   	pop    %eax
     5b6:	ff 75 f0             	pushl  -0x10(%ebp)
     5b9:	e8 3c 0a 00 00       	call   ffa <close>
      close(p[1]);
     5be:	58                   	pop    %eax
     5bf:	ff 75 f4             	pushl  -0xc(%ebp)
     5c2:	e8 33 0a 00 00       	call   ffa <close>
      runcmd(pcmd->left);
     5c7:	58                   	pop    %eax
     5c8:	ff 73 04             	pushl  0x4(%ebx)
     5cb:	e8 60 fe ff ff       	call   430 <runcmd>

000005d0 <fork1>:
{
     5d0:	55                   	push   %ebp
     5d1:	89 e5                	mov    %esp,%ebp
     5d3:	83 ec 08             	sub    $0x8,%esp
  pid = fork();
     5d6:	e8 ef 09 00 00       	call   fca <fork>
  if(pid == -1)
     5db:	83 f8 ff             	cmp    $0xffffffff,%eax
     5de:	74 02                	je     5e2 <fork1+0x12>
  return pid;
}
     5e0:	c9                   	leave  
     5e1:	c3                   	ret    
    panic("fork");
     5e2:	83 ec 0c             	sub    $0xc,%esp
     5e5:	68 c2 14 00 00       	push   $0x14c2
     5ea:	e8 21 fe ff ff       	call   410 <panic>
     5ef:	90                   	nop

000005f0 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     5f0:	55                   	push   %ebp
     5f1:	89 e5                	mov    %esp,%ebp
     5f3:	53                   	push   %ebx
     5f4:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     5f7:	6a 54                	push   $0x54
     5f9:	e8 a2 0d 00 00       	call   13a0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     5fe:	83 c4 0c             	add    $0xc,%esp
  cmd = malloc(sizeof(*cmd));
     601:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     603:	6a 54                	push   $0x54
     605:	6a 00                	push   $0x0
     607:	50                   	push   %eax
     608:	e8 23 08 00 00       	call   e30 <memset>
  cmd->type = EXEC;
     60d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     613:	89 d8                	mov    %ebx,%eax
     615:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     618:	c9                   	leave  
     619:	c3                   	ret    
     61a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000620 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     620:	55                   	push   %ebp
     621:	89 e5                	mov    %esp,%ebp
     623:	53                   	push   %ebx
     624:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     627:	6a 18                	push   $0x18
     629:	e8 72 0d 00 00       	call   13a0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     62e:	83 c4 0c             	add    $0xc,%esp
  cmd = malloc(sizeof(*cmd));
     631:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     633:	6a 18                	push   $0x18
     635:	6a 00                	push   $0x0
     637:	50                   	push   %eax
     638:	e8 f3 07 00 00       	call   e30 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     63d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     640:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     646:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     649:	8b 45 0c             	mov    0xc(%ebp),%eax
     64c:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     64f:	8b 45 10             	mov    0x10(%ebp),%eax
     652:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     655:	8b 45 14             	mov    0x14(%ebp),%eax
     658:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     65b:	8b 45 18             	mov    0x18(%ebp),%eax
     65e:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     661:	89 d8                	mov    %ebx,%eax
     663:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     666:	c9                   	leave  
     667:	c3                   	ret    
     668:	90                   	nop
     669:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000670 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     670:	55                   	push   %ebp
     671:	89 e5                	mov    %esp,%ebp
     673:	53                   	push   %ebx
     674:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     677:	6a 0c                	push   $0xc
     679:	e8 22 0d 00 00       	call   13a0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     67e:	83 c4 0c             	add    $0xc,%esp
  cmd = malloc(sizeof(*cmd));
     681:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     683:	6a 0c                	push   $0xc
     685:	6a 00                	push   $0x0
     687:	50                   	push   %eax
     688:	e8 a3 07 00 00       	call   e30 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     68d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     690:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     696:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     699:	8b 45 0c             	mov    0xc(%ebp),%eax
     69c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     69f:	89 d8                	mov    %ebx,%eax
     6a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     6a4:	c9                   	leave  
     6a5:	c3                   	ret    
     6a6:	8d 76 00             	lea    0x0(%esi),%esi
     6a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006b0 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     6b0:	55                   	push   %ebp
     6b1:	89 e5                	mov    %esp,%ebp
     6b3:	53                   	push   %ebx
     6b4:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     6b7:	6a 0c                	push   $0xc
     6b9:	e8 e2 0c 00 00       	call   13a0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     6be:	83 c4 0c             	add    $0xc,%esp
  cmd = malloc(sizeof(*cmd));
     6c1:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     6c3:	6a 0c                	push   $0xc
     6c5:	6a 00                	push   $0x0
     6c7:	50                   	push   %eax
     6c8:	e8 63 07 00 00       	call   e30 <memset>
  cmd->type = LIST;
  cmd->left = left;
     6cd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     6d0:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     6d6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     6d9:	8b 45 0c             	mov    0xc(%ebp),%eax
     6dc:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     6df:	89 d8                	mov    %ebx,%eax
     6e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     6e4:	c9                   	leave  
     6e5:	c3                   	ret    
     6e6:	8d 76 00             	lea    0x0(%esi),%esi
     6e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006f0 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     6f0:	55                   	push   %ebp
     6f1:	89 e5                	mov    %esp,%ebp
     6f3:	53                   	push   %ebx
     6f4:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     6f7:	6a 08                	push   $0x8
     6f9:	e8 a2 0c 00 00       	call   13a0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     6fe:	83 c4 0c             	add    $0xc,%esp
  cmd = malloc(sizeof(*cmd));
     701:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     703:	6a 08                	push   $0x8
     705:	6a 00                	push   $0x0
     707:	50                   	push   %eax
     708:	e8 23 07 00 00       	call   e30 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     70d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     710:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     716:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     719:	89 d8                	mov    %ebx,%eax
     71b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     71e:	c9                   	leave  
     71f:	c3                   	ret    

00000720 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     720:	55                   	push   %ebp
     721:	89 e5                	mov    %esp,%ebp
     723:	57                   	push   %edi
     724:	56                   	push   %esi
     725:	53                   	push   %ebx
     726:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     729:	8b 45 08             	mov    0x8(%ebp),%eax
{
     72c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     72f:	8b 7d 10             	mov    0x10(%ebp),%edi
  s = *ps;
     732:	8b 30                	mov    (%eax),%esi
  while(s < es && strchr(whitespace, *s))
     734:	39 de                	cmp    %ebx,%esi
     736:	72 0f                	jb     747 <gettoken+0x27>
     738:	eb 25                	jmp    75f <gettoken+0x3f>
     73a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     740:	83 c6 01             	add    $0x1,%esi
  while(s < es && strchr(whitespace, *s))
     743:	39 f3                	cmp    %esi,%ebx
     745:	74 18                	je     75f <gettoken+0x3f>
     747:	0f be 06             	movsbl (%esi),%eax
     74a:	83 ec 08             	sub    $0x8,%esp
     74d:	50                   	push   %eax
     74e:	68 58 1b 00 00       	push   $0x1b58
     753:	e8 f8 06 00 00       	call   e50 <strchr>
     758:	83 c4 10             	add    $0x10,%esp
     75b:	85 c0                	test   %eax,%eax
     75d:	75 e1                	jne    740 <gettoken+0x20>
  if(q)
     75f:	85 ff                	test   %edi,%edi
     761:	74 02                	je     765 <gettoken+0x45>
    *q = s;
     763:	89 37                	mov    %esi,(%edi)
  ret = *s;
     765:	0f be 06             	movsbl (%esi),%eax
  switch(*s){
     768:	3c 29                	cmp    $0x29,%al
     76a:	7f 54                	jg     7c0 <gettoken+0xa0>
     76c:	3c 28                	cmp    $0x28,%al
     76e:	0f 8d c8 00 00 00    	jge    83c <gettoken+0x11c>
     774:	31 ff                	xor    %edi,%edi
     776:	84 c0                	test   %al,%al
     778:	0f 85 d2 00 00 00    	jne    850 <gettoken+0x130>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     77e:	8b 55 14             	mov    0x14(%ebp),%edx
     781:	85 d2                	test   %edx,%edx
     783:	74 05                	je     78a <gettoken+0x6a>
    *eq = s;
     785:	8b 45 14             	mov    0x14(%ebp),%eax
     788:	89 30                	mov    %esi,(%eax)

  while(s < es && strchr(whitespace, *s))
     78a:	39 de                	cmp    %ebx,%esi
     78c:	72 09                	jb     797 <gettoken+0x77>
     78e:	eb 1f                	jmp    7af <gettoken+0x8f>
    s++;
     790:	83 c6 01             	add    $0x1,%esi
  while(s < es && strchr(whitespace, *s))
     793:	39 f3                	cmp    %esi,%ebx
     795:	74 18                	je     7af <gettoken+0x8f>
     797:	0f be 06             	movsbl (%esi),%eax
     79a:	83 ec 08             	sub    $0x8,%esp
     79d:	50                   	push   %eax
     79e:	68 58 1b 00 00       	push   $0x1b58
     7a3:	e8 a8 06 00 00       	call   e50 <strchr>
     7a8:	83 c4 10             	add    $0x10,%esp
     7ab:	85 c0                	test   %eax,%eax
     7ad:	75 e1                	jne    790 <gettoken+0x70>
  *ps = s;
     7af:	8b 45 08             	mov    0x8(%ebp),%eax
     7b2:	89 30                	mov    %esi,(%eax)
  return ret;
}
     7b4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7b7:	89 f8                	mov    %edi,%eax
     7b9:	5b                   	pop    %ebx
     7ba:	5e                   	pop    %esi
     7bb:	5f                   	pop    %edi
     7bc:	5d                   	pop    %ebp
     7bd:	c3                   	ret    
     7be:	66 90                	xchg   %ax,%ax
  switch(*s){
     7c0:	3c 3e                	cmp    $0x3e,%al
     7c2:	75 1c                	jne    7e0 <gettoken+0xc0>
    if(*s == '>'){
     7c4:	80 7e 01 3e          	cmpb   $0x3e,0x1(%esi)
    s++;
     7c8:	8d 46 01             	lea    0x1(%esi),%eax
    if(*s == '>'){
     7cb:	0f 84 a4 00 00 00    	je     875 <gettoken+0x155>
    s++;
     7d1:	89 c6                	mov    %eax,%esi
     7d3:	bf 3e 00 00 00       	mov    $0x3e,%edi
     7d8:	eb a4                	jmp    77e <gettoken+0x5e>
     7da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  switch(*s){
     7e0:	7f 56                	jg     838 <gettoken+0x118>
     7e2:	8d 48 c5             	lea    -0x3b(%eax),%ecx
     7e5:	80 f9 01             	cmp    $0x1,%cl
     7e8:	76 52                	jbe    83c <gettoken+0x11c>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     7ea:	39 f3                	cmp    %esi,%ebx
     7ec:	77 24                	ja     812 <gettoken+0xf2>
     7ee:	eb 70                	jmp    860 <gettoken+0x140>
     7f0:	0f be 06             	movsbl (%esi),%eax
     7f3:	83 ec 08             	sub    $0x8,%esp
     7f6:	50                   	push   %eax
     7f7:	68 50 1b 00 00       	push   $0x1b50
     7fc:	e8 4f 06 00 00       	call   e50 <strchr>
     801:	83 c4 10             	add    $0x10,%esp
     804:	85 c0                	test   %eax,%eax
     806:	75 1f                	jne    827 <gettoken+0x107>
      s++;
     808:	83 c6 01             	add    $0x1,%esi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     80b:	39 f3                	cmp    %esi,%ebx
     80d:	74 51                	je     860 <gettoken+0x140>
     80f:	0f be 06             	movsbl (%esi),%eax
     812:	83 ec 08             	sub    $0x8,%esp
     815:	50                   	push   %eax
     816:	68 58 1b 00 00       	push   $0x1b58
     81b:	e8 30 06 00 00       	call   e50 <strchr>
     820:	83 c4 10             	add    $0x10,%esp
     823:	85 c0                	test   %eax,%eax
     825:	74 c9                	je     7f0 <gettoken+0xd0>
    ret = 'a';
     827:	bf 61 00 00 00       	mov    $0x61,%edi
     82c:	e9 4d ff ff ff       	jmp    77e <gettoken+0x5e>
     831:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     838:	3c 7c                	cmp    $0x7c,%al
     83a:	75 ae                	jne    7ea <gettoken+0xca>
  ret = *s;
     83c:	0f be f8             	movsbl %al,%edi
    s++;
     83f:	83 c6 01             	add    $0x1,%esi
    break;
     842:	e9 37 ff ff ff       	jmp    77e <gettoken+0x5e>
     847:	89 f6                	mov    %esi,%esi
     849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  switch(*s){
     850:	3c 26                	cmp    $0x26,%al
     852:	75 96                	jne    7ea <gettoken+0xca>
     854:	eb e6                	jmp    83c <gettoken+0x11c>
     856:	8d 76 00             	lea    0x0(%esi),%esi
     859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  if(eq)
     860:	8b 45 14             	mov    0x14(%ebp),%eax
     863:	bf 61 00 00 00       	mov    $0x61,%edi
     868:	85 c0                	test   %eax,%eax
     86a:	0f 85 15 ff ff ff    	jne    785 <gettoken+0x65>
     870:	e9 3a ff ff ff       	jmp    7af <gettoken+0x8f>
      s++;
     875:	83 c6 02             	add    $0x2,%esi
      ret = '+';
     878:	bf 2b 00 00 00       	mov    $0x2b,%edi
     87d:	e9 fc fe ff ff       	jmp    77e <gettoken+0x5e>
     882:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000890 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     890:	55                   	push   %ebp
     891:	89 e5                	mov    %esp,%ebp
     893:	57                   	push   %edi
     894:	56                   	push   %esi
     895:	53                   	push   %ebx
     896:	83 ec 0c             	sub    $0xc,%esp
     899:	8b 7d 08             	mov    0x8(%ebp),%edi
     89c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     89f:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     8a1:	39 f3                	cmp    %esi,%ebx
     8a3:	72 12                	jb     8b7 <peek+0x27>
     8a5:	eb 28                	jmp    8cf <peek+0x3f>
     8a7:	89 f6                	mov    %esi,%esi
     8a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    s++;
     8b0:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     8b3:	39 de                	cmp    %ebx,%esi
     8b5:	74 18                	je     8cf <peek+0x3f>
     8b7:	0f be 03             	movsbl (%ebx),%eax
     8ba:	83 ec 08             	sub    $0x8,%esp
     8bd:	50                   	push   %eax
     8be:	68 58 1b 00 00       	push   $0x1b58
     8c3:	e8 88 05 00 00       	call   e50 <strchr>
     8c8:	83 c4 10             	add    $0x10,%esp
     8cb:	85 c0                	test   %eax,%eax
     8cd:	75 e1                	jne    8b0 <peek+0x20>
  *ps = s;
     8cf:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     8d1:	0f be 13             	movsbl (%ebx),%edx
     8d4:	31 c0                	xor    %eax,%eax
     8d6:	84 d2                	test   %dl,%dl
     8d8:	74 17                	je     8f1 <peek+0x61>
     8da:	83 ec 08             	sub    $0x8,%esp
     8dd:	52                   	push   %edx
     8de:	ff 75 10             	pushl  0x10(%ebp)
     8e1:	e8 6a 05 00 00       	call   e50 <strchr>
     8e6:	83 c4 10             	add    $0x10,%esp
     8e9:	85 c0                	test   %eax,%eax
     8eb:	0f 95 c0             	setne  %al
     8ee:	0f b6 c0             	movzbl %al,%eax
}
     8f1:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8f4:	5b                   	pop    %ebx
     8f5:	5e                   	pop    %esi
     8f6:	5f                   	pop    %edi
     8f7:	5d                   	pop    %ebp
     8f8:	c3                   	ret    
     8f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000900 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     900:	55                   	push   %ebp
     901:	89 e5                	mov    %esp,%ebp
     903:	57                   	push   %edi
     904:	56                   	push   %esi
     905:	53                   	push   %ebx
     906:	83 ec 1c             	sub    $0x1c,%esp
     909:	8b 75 0c             	mov    0xc(%ebp),%esi
     90c:	8b 5d 10             	mov    0x10(%ebp),%ebx
     90f:	90                   	nop
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     910:	83 ec 04             	sub    $0x4,%esp
     913:	68 e9 14 00 00       	push   $0x14e9
     918:	53                   	push   %ebx
     919:	56                   	push   %esi
     91a:	e8 71 ff ff ff       	call   890 <peek>
     91f:	83 c4 10             	add    $0x10,%esp
     922:	85 c0                	test   %eax,%eax
     924:	74 6a                	je     990 <parseredirs+0x90>
    tok = gettoken(ps, es, 0, 0);
     926:	6a 00                	push   $0x0
     928:	6a 00                	push   $0x0
     92a:	53                   	push   %ebx
     92b:	56                   	push   %esi
     92c:	e8 ef fd ff ff       	call   720 <gettoken>
     931:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     933:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     936:	50                   	push   %eax
     937:	8d 45 e0             	lea    -0x20(%ebp),%eax
     93a:	50                   	push   %eax
     93b:	53                   	push   %ebx
     93c:	56                   	push   %esi
     93d:	e8 de fd ff ff       	call   720 <gettoken>
     942:	83 c4 20             	add    $0x20,%esp
     945:	83 f8 61             	cmp    $0x61,%eax
     948:	75 51                	jne    99b <parseredirs+0x9b>
      panic("missing file for redirection");
    switch(tok){
     94a:	83 ff 3c             	cmp    $0x3c,%edi
     94d:	74 31                	je     980 <parseredirs+0x80>
     94f:	83 ff 3e             	cmp    $0x3e,%edi
     952:	74 05                	je     959 <parseredirs+0x59>
     954:	83 ff 2b             	cmp    $0x2b,%edi
     957:	75 b7                	jne    910 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     959:	83 ec 0c             	sub    $0xc,%esp
     95c:	6a 01                	push   $0x1
     95e:	68 01 02 00 00       	push   $0x201
     963:	ff 75 e4             	pushl  -0x1c(%ebp)
     966:	ff 75 e0             	pushl  -0x20(%ebp)
     969:	ff 75 08             	pushl  0x8(%ebp)
     96c:	e8 af fc ff ff       	call   620 <redircmd>
      break;
     971:	83 c4 20             	add    $0x20,%esp
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     974:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     977:	eb 97                	jmp    910 <parseredirs+0x10>
     979:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     980:	83 ec 0c             	sub    $0xc,%esp
     983:	6a 00                	push   $0x0
     985:	6a 00                	push   $0x0
     987:	eb da                	jmp    963 <parseredirs+0x63>
     989:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }
  return cmd;
}
     990:	8b 45 08             	mov    0x8(%ebp),%eax
     993:	8d 65 f4             	lea    -0xc(%ebp),%esp
     996:	5b                   	pop    %ebx
     997:	5e                   	pop    %esi
     998:	5f                   	pop    %edi
     999:	5d                   	pop    %ebp
     99a:	c3                   	ret    
      panic("missing file for redirection");
     99b:	83 ec 0c             	sub    $0xc,%esp
     99e:	68 cc 14 00 00       	push   $0x14cc
     9a3:	e8 68 fa ff ff       	call   410 <panic>
     9a8:	90                   	nop
     9a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000009b0 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     9b0:	55                   	push   %ebp
     9b1:	89 e5                	mov    %esp,%ebp
     9b3:	57                   	push   %edi
     9b4:	56                   	push   %esi
     9b5:	53                   	push   %ebx
     9b6:	83 ec 30             	sub    $0x30,%esp
     9b9:	8b 75 08             	mov    0x8(%ebp),%esi
     9bc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     9bf:	68 ec 14 00 00       	push   $0x14ec
     9c4:	57                   	push   %edi
     9c5:	56                   	push   %esi
     9c6:	e8 c5 fe ff ff       	call   890 <peek>
     9cb:	83 c4 10             	add    $0x10,%esp
     9ce:	85 c0                	test   %eax,%eax
     9d0:	0f 85 92 00 00 00    	jne    a68 <parseexec+0xb8>
     9d6:	89 c3                	mov    %eax,%ebx
    return parseblock(ps, es);

  ret = execcmd();
     9d8:	e8 13 fc ff ff       	call   5f0 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     9dd:	83 ec 04             	sub    $0x4,%esp
  ret = execcmd();
     9e0:	89 45 d0             	mov    %eax,-0x30(%ebp)
  ret = parseredirs(ret, ps, es);
     9e3:	57                   	push   %edi
     9e4:	56                   	push   %esi
     9e5:	50                   	push   %eax
     9e6:	e8 15 ff ff ff       	call   900 <parseredirs>
     9eb:	83 c4 10             	add    $0x10,%esp
     9ee:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     9f1:	eb 18                	jmp    a0b <parseexec+0x5b>
     9f3:	90                   	nop
     9f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     9f8:	83 ec 04             	sub    $0x4,%esp
     9fb:	57                   	push   %edi
     9fc:	56                   	push   %esi
     9fd:	ff 75 d4             	pushl  -0x2c(%ebp)
     a00:	e8 fb fe ff ff       	call   900 <parseredirs>
     a05:	83 c4 10             	add    $0x10,%esp
     a08:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     a0b:	83 ec 04             	sub    $0x4,%esp
     a0e:	68 03 15 00 00       	push   $0x1503
     a13:	57                   	push   %edi
     a14:	56                   	push   %esi
     a15:	e8 76 fe ff ff       	call   890 <peek>
     a1a:	83 c4 10             	add    $0x10,%esp
     a1d:	85 c0                	test   %eax,%eax
     a1f:	75 67                	jne    a88 <parseexec+0xd8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     a21:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     a24:	50                   	push   %eax
     a25:	8d 45 e0             	lea    -0x20(%ebp),%eax
     a28:	50                   	push   %eax
     a29:	57                   	push   %edi
     a2a:	56                   	push   %esi
     a2b:	e8 f0 fc ff ff       	call   720 <gettoken>
     a30:	83 c4 10             	add    $0x10,%esp
     a33:	85 c0                	test   %eax,%eax
     a35:	74 51                	je     a88 <parseexec+0xd8>
    if(tok != 'a')
     a37:	83 f8 61             	cmp    $0x61,%eax
     a3a:	75 6b                	jne    aa7 <parseexec+0xf7>
    cmd->argv[argc] = q;
     a3c:	8b 45 e0             	mov    -0x20(%ebp),%eax
     a3f:	8b 55 d0             	mov    -0x30(%ebp),%edx
     a42:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
    cmd->eargv[argc] = eq;
     a46:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     a49:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
    argc++;
     a4d:	83 c3 01             	add    $0x1,%ebx
    if(argc >= MAXARGS)
     a50:	83 fb 0a             	cmp    $0xa,%ebx
     a53:	75 a3                	jne    9f8 <parseexec+0x48>
      panic("too many args");
     a55:	83 ec 0c             	sub    $0xc,%esp
     a58:	68 f5 14 00 00       	push   $0x14f5
     a5d:	e8 ae f9 ff ff       	call   410 <panic>
     a62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     a68:	83 ec 08             	sub    $0x8,%esp
     a6b:	57                   	push   %edi
     a6c:	56                   	push   %esi
     a6d:	e8 5e 01 00 00       	call   bd0 <parseblock>
     a72:	83 c4 10             	add    $0x10,%esp
     a75:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     a78:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     a7b:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a7e:	5b                   	pop    %ebx
     a7f:	5e                   	pop    %esi
     a80:	5f                   	pop    %edi
     a81:	5d                   	pop    %ebp
     a82:	c3                   	ret    
     a83:	90                   	nop
     a84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     a88:	8b 45 d0             	mov    -0x30(%ebp),%eax
     a8b:	8d 04 98             	lea    (%eax,%ebx,4),%eax
  cmd->argv[argc] = 0;
     a8e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
     a95:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
}
     a9c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     a9f:	8d 65 f4             	lea    -0xc(%ebp),%esp
     aa2:	5b                   	pop    %ebx
     aa3:	5e                   	pop    %esi
     aa4:	5f                   	pop    %edi
     aa5:	5d                   	pop    %ebp
     aa6:	c3                   	ret    
      panic("syntax");
     aa7:	83 ec 0c             	sub    $0xc,%esp
     aaa:	68 ee 14 00 00       	push   $0x14ee
     aaf:	e8 5c f9 ff ff       	call   410 <panic>
     ab4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     aba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000ac0 <parsepipe>:
{
     ac0:	55                   	push   %ebp
     ac1:	89 e5                	mov    %esp,%ebp
     ac3:	57                   	push   %edi
     ac4:	56                   	push   %esi
     ac5:	53                   	push   %ebx
     ac6:	83 ec 14             	sub    $0x14,%esp
     ac9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     acc:	8b 75 0c             	mov    0xc(%ebp),%esi
  cmd = parseexec(ps, es);
     acf:	56                   	push   %esi
     ad0:	53                   	push   %ebx
     ad1:	e8 da fe ff ff       	call   9b0 <parseexec>
  if(peek(ps, es, "|")){
     ad6:	83 c4 0c             	add    $0xc,%esp
  cmd = parseexec(ps, es);
     ad9:	89 c7                	mov    %eax,%edi
  if(peek(ps, es, "|")){
     adb:	68 08 15 00 00       	push   $0x1508
     ae0:	56                   	push   %esi
     ae1:	53                   	push   %ebx
     ae2:	e8 a9 fd ff ff       	call   890 <peek>
     ae7:	83 c4 10             	add    $0x10,%esp
     aea:	85 c0                	test   %eax,%eax
     aec:	75 12                	jne    b00 <parsepipe+0x40>
}
     aee:	8d 65 f4             	lea    -0xc(%ebp),%esp
     af1:	89 f8                	mov    %edi,%eax
     af3:	5b                   	pop    %ebx
     af4:	5e                   	pop    %esi
     af5:	5f                   	pop    %edi
     af6:	5d                   	pop    %ebp
     af7:	c3                   	ret    
     af8:	90                   	nop
     af9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    gettoken(ps, es, 0, 0);
     b00:	6a 00                	push   $0x0
     b02:	6a 00                	push   $0x0
     b04:	56                   	push   %esi
     b05:	53                   	push   %ebx
     b06:	e8 15 fc ff ff       	call   720 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     b0b:	58                   	pop    %eax
     b0c:	5a                   	pop    %edx
     b0d:	56                   	push   %esi
     b0e:	53                   	push   %ebx
     b0f:	e8 ac ff ff ff       	call   ac0 <parsepipe>
     b14:	89 7d 08             	mov    %edi,0x8(%ebp)
     b17:	89 45 0c             	mov    %eax,0xc(%ebp)
     b1a:	83 c4 10             	add    $0x10,%esp
}
     b1d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b20:	5b                   	pop    %ebx
     b21:	5e                   	pop    %esi
     b22:	5f                   	pop    %edi
     b23:	5d                   	pop    %ebp
    cmd = pipecmd(cmd, parsepipe(ps, es));
     b24:	e9 47 fb ff ff       	jmp    670 <pipecmd>
     b29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b30 <parseline>:
{
     b30:	55                   	push   %ebp
     b31:	89 e5                	mov    %esp,%ebp
     b33:	57                   	push   %edi
     b34:	56                   	push   %esi
     b35:	53                   	push   %ebx
     b36:	83 ec 14             	sub    $0x14,%esp
     b39:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b3c:	8b 75 0c             	mov    0xc(%ebp),%esi
  cmd = parsepipe(ps, es);
     b3f:	56                   	push   %esi
     b40:	53                   	push   %ebx
     b41:	e8 7a ff ff ff       	call   ac0 <parsepipe>
  while(peek(ps, es, "&")){
     b46:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
     b49:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     b4b:	eb 1b                	jmp    b68 <parseline+0x38>
     b4d:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     b50:	6a 00                	push   $0x0
     b52:	6a 00                	push   $0x0
     b54:	56                   	push   %esi
     b55:	53                   	push   %ebx
     b56:	e8 c5 fb ff ff       	call   720 <gettoken>
    cmd = backcmd(cmd);
     b5b:	89 3c 24             	mov    %edi,(%esp)
     b5e:	e8 8d fb ff ff       	call   6f0 <backcmd>
     b63:	83 c4 10             	add    $0x10,%esp
     b66:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     b68:	83 ec 04             	sub    $0x4,%esp
     b6b:	68 0a 15 00 00       	push   $0x150a
     b70:	56                   	push   %esi
     b71:	53                   	push   %ebx
     b72:	e8 19 fd ff ff       	call   890 <peek>
     b77:	83 c4 10             	add    $0x10,%esp
     b7a:	85 c0                	test   %eax,%eax
     b7c:	75 d2                	jne    b50 <parseline+0x20>
  if(peek(ps, es, ";")){
     b7e:	83 ec 04             	sub    $0x4,%esp
     b81:	68 06 15 00 00       	push   $0x1506
     b86:	56                   	push   %esi
     b87:	53                   	push   %ebx
     b88:	e8 03 fd ff ff       	call   890 <peek>
     b8d:	83 c4 10             	add    $0x10,%esp
     b90:	85 c0                	test   %eax,%eax
     b92:	75 0c                	jne    ba0 <parseline+0x70>
}
     b94:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b97:	89 f8                	mov    %edi,%eax
     b99:	5b                   	pop    %ebx
     b9a:	5e                   	pop    %esi
     b9b:	5f                   	pop    %edi
     b9c:	5d                   	pop    %ebp
     b9d:	c3                   	ret    
     b9e:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     ba0:	6a 00                	push   $0x0
     ba2:	6a 00                	push   $0x0
     ba4:	56                   	push   %esi
     ba5:	53                   	push   %ebx
     ba6:	e8 75 fb ff ff       	call   720 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     bab:	58                   	pop    %eax
     bac:	5a                   	pop    %edx
     bad:	56                   	push   %esi
     bae:	53                   	push   %ebx
     baf:	e8 7c ff ff ff       	call   b30 <parseline>
     bb4:	89 7d 08             	mov    %edi,0x8(%ebp)
     bb7:	89 45 0c             	mov    %eax,0xc(%ebp)
     bba:	83 c4 10             	add    $0x10,%esp
}
     bbd:	8d 65 f4             	lea    -0xc(%ebp),%esp
     bc0:	5b                   	pop    %ebx
     bc1:	5e                   	pop    %esi
     bc2:	5f                   	pop    %edi
     bc3:	5d                   	pop    %ebp
    cmd = listcmd(cmd, parseline(ps, es));
     bc4:	e9 e7 fa ff ff       	jmp    6b0 <listcmd>
     bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000bd0 <parseblock>:
{
     bd0:	55                   	push   %ebp
     bd1:	89 e5                	mov    %esp,%ebp
     bd3:	57                   	push   %edi
     bd4:	56                   	push   %esi
     bd5:	53                   	push   %ebx
     bd6:	83 ec 10             	sub    $0x10,%esp
     bd9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     bdc:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     bdf:	68 ec 14 00 00       	push   $0x14ec
     be4:	56                   	push   %esi
     be5:	53                   	push   %ebx
     be6:	e8 a5 fc ff ff       	call   890 <peek>
     beb:	83 c4 10             	add    $0x10,%esp
     bee:	85 c0                	test   %eax,%eax
     bf0:	74 4a                	je     c3c <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
     bf2:	6a 00                	push   $0x0
     bf4:	6a 00                	push   $0x0
     bf6:	56                   	push   %esi
     bf7:	53                   	push   %ebx
     bf8:	e8 23 fb ff ff       	call   720 <gettoken>
  cmd = parseline(ps, es);
     bfd:	58                   	pop    %eax
     bfe:	5a                   	pop    %edx
     bff:	56                   	push   %esi
     c00:	53                   	push   %ebx
     c01:	e8 2a ff ff ff       	call   b30 <parseline>
  if(!peek(ps, es, ")"))
     c06:	83 c4 0c             	add    $0xc,%esp
  cmd = parseline(ps, es);
     c09:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     c0b:	68 28 15 00 00       	push   $0x1528
     c10:	56                   	push   %esi
     c11:	53                   	push   %ebx
     c12:	e8 79 fc ff ff       	call   890 <peek>
     c17:	83 c4 10             	add    $0x10,%esp
     c1a:	85 c0                	test   %eax,%eax
     c1c:	74 2b                	je     c49 <parseblock+0x79>
  gettoken(ps, es, 0, 0);
     c1e:	6a 00                	push   $0x0
     c20:	6a 00                	push   $0x0
     c22:	56                   	push   %esi
     c23:	53                   	push   %ebx
     c24:	e8 f7 fa ff ff       	call   720 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     c29:	83 c4 0c             	add    $0xc,%esp
     c2c:	56                   	push   %esi
     c2d:	53                   	push   %ebx
     c2e:	57                   	push   %edi
     c2f:	e8 cc fc ff ff       	call   900 <parseredirs>
}
     c34:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c37:	5b                   	pop    %ebx
     c38:	5e                   	pop    %esi
     c39:	5f                   	pop    %edi
     c3a:	5d                   	pop    %ebp
     c3b:	c3                   	ret    
    panic("parseblock");
     c3c:	83 ec 0c             	sub    $0xc,%esp
     c3f:	68 0c 15 00 00       	push   $0x150c
     c44:	e8 c7 f7 ff ff       	call   410 <panic>
    panic("syntax - missing )");
     c49:	83 ec 0c             	sub    $0xc,%esp
     c4c:	68 17 15 00 00       	push   $0x1517
     c51:	e8 ba f7 ff ff       	call   410 <panic>
     c56:	8d 76 00             	lea    0x0(%esi),%esi
     c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c60 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     c60:	55                   	push   %ebp
     c61:	89 e5                	mov    %esp,%ebp
     c63:	53                   	push   %ebx
     c64:	83 ec 04             	sub    $0x4,%esp
     c67:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     c6a:	85 db                	test   %ebx,%ebx
     c6c:	74 20                	je     c8e <nulterminate+0x2e>
    return 0;

  switch(cmd->type){
     c6e:	83 3b 05             	cmpl   $0x5,(%ebx)
     c71:	77 1b                	ja     c8e <nulterminate+0x2e>
     c73:	8b 03                	mov    (%ebx),%eax
     c75:	ff 24 85 68 15 00 00 	jmp    *0x1568(,%eax,4)
     c7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
     c80:	83 ec 0c             	sub    $0xc,%esp
     c83:	ff 73 04             	pushl  0x4(%ebx)
     c86:	e8 d5 ff ff ff       	call   c60 <nulterminate>
    break;
     c8b:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     c8e:	89 d8                	mov    %ebx,%eax
     c90:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c93:	c9                   	leave  
     c94:	c3                   	ret    
     c95:	8d 76 00             	lea    0x0(%esi),%esi
    nulterminate(lcmd->left);
     c98:	83 ec 0c             	sub    $0xc,%esp
     c9b:	ff 73 04             	pushl  0x4(%ebx)
     c9e:	e8 bd ff ff ff       	call   c60 <nulterminate>
    nulterminate(lcmd->right);
     ca3:	58                   	pop    %eax
     ca4:	ff 73 08             	pushl  0x8(%ebx)
     ca7:	e8 b4 ff ff ff       	call   c60 <nulterminate>
}
     cac:	89 d8                	mov    %ebx,%eax
    break;
     cae:	83 c4 10             	add    $0x10,%esp
}
     cb1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     cb4:	c9                   	leave  
     cb5:	c3                   	ret    
     cb6:	8d 76 00             	lea    0x0(%esi),%esi
     cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    for(i=0; ecmd->argv[i]; i++)
     cc0:	8b 4b 04             	mov    0x4(%ebx),%ecx
     cc3:	8d 43 08             	lea    0x8(%ebx),%eax
     cc6:	85 c9                	test   %ecx,%ecx
     cc8:	74 c4                	je     c8e <nulterminate+0x2e>
     cca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     cd0:	8b 50 24             	mov    0x24(%eax),%edx
     cd3:	83 c0 04             	add    $0x4,%eax
     cd6:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     cd9:	8b 50 fc             	mov    -0x4(%eax),%edx
     cdc:	85 d2                	test   %edx,%edx
     cde:	75 f0                	jne    cd0 <nulterminate+0x70>
}
     ce0:	89 d8                	mov    %ebx,%eax
     ce2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     ce5:	c9                   	leave  
     ce6:	c3                   	ret    
     ce7:	89 f6                	mov    %esi,%esi
     ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    nulterminate(rcmd->cmd);
     cf0:	83 ec 0c             	sub    $0xc,%esp
     cf3:	ff 73 04             	pushl  0x4(%ebx)
     cf6:	e8 65 ff ff ff       	call   c60 <nulterminate>
    *rcmd->efile = 0;
     cfb:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     cfe:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
     d01:	c6 00 00             	movb   $0x0,(%eax)
}
     d04:	89 d8                	mov    %ebx,%eax
     d06:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d09:	c9                   	leave  
     d0a:	c3                   	ret    
     d0b:	90                   	nop
     d0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000d10 <parsecmd>:
{
     d10:	55                   	push   %ebp
     d11:	89 e5                	mov    %esp,%ebp
     d13:	56                   	push   %esi
     d14:	53                   	push   %ebx
  es = s + strlen(s);
     d15:	8b 5d 08             	mov    0x8(%ebp),%ebx
     d18:	83 ec 0c             	sub    $0xc,%esp
     d1b:	53                   	push   %ebx
     d1c:	e8 df 00 00 00       	call   e00 <strlen>
  cmd = parseline(&s, es);
     d21:	59                   	pop    %ecx
  es = s + strlen(s);
     d22:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     d24:	8d 45 08             	lea    0x8(%ebp),%eax
     d27:	5e                   	pop    %esi
     d28:	53                   	push   %ebx
     d29:	50                   	push   %eax
     d2a:	e8 01 fe ff ff       	call   b30 <parseline>
     d2f:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     d31:	8d 45 08             	lea    0x8(%ebp),%eax
     d34:	83 c4 0c             	add    $0xc,%esp
     d37:	68 b1 14 00 00       	push   $0x14b1
     d3c:	53                   	push   %ebx
     d3d:	50                   	push   %eax
     d3e:	e8 4d fb ff ff       	call   890 <peek>
  if(s != es){
     d43:	8b 45 08             	mov    0x8(%ebp),%eax
     d46:	83 c4 10             	add    $0x10,%esp
     d49:	39 d8                	cmp    %ebx,%eax
     d4b:	75 12                	jne    d5f <parsecmd+0x4f>
  nulterminate(cmd);
     d4d:	83 ec 0c             	sub    $0xc,%esp
     d50:	56                   	push   %esi
     d51:	e8 0a ff ff ff       	call   c60 <nulterminate>
}
     d56:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d59:	89 f0                	mov    %esi,%eax
     d5b:	5b                   	pop    %ebx
     d5c:	5e                   	pop    %esi
     d5d:	5d                   	pop    %ebp
     d5e:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
     d5f:	52                   	push   %edx
     d60:	50                   	push   %eax
     d61:	68 2a 15 00 00       	push   $0x152a
     d66:	6a 02                	push   $0x2
     d68:	e8 d3 03 00 00       	call   1140 <printf>
    panic("syntax");
     d6d:	c7 04 24 ee 14 00 00 	movl   $0x14ee,(%esp)
     d74:	e8 97 f6 ff ff       	call   410 <panic>
     d79:	66 90                	xchg   %ax,%ax
     d7b:	66 90                	xchg   %ax,%ax
     d7d:	66 90                	xchg   %ax,%ax
     d7f:	90                   	nop

00000d80 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     d80:	55                   	push   %ebp
     d81:	89 e5                	mov    %esp,%ebp
     d83:	53                   	push   %ebx
     d84:	8b 45 08             	mov    0x8(%ebp),%eax
     d87:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     d8a:	89 c2                	mov    %eax,%edx
     d8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d90:	83 c1 01             	add    $0x1,%ecx
     d93:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     d97:	83 c2 01             	add    $0x1,%edx
     d9a:	84 db                	test   %bl,%bl
     d9c:	88 5a ff             	mov    %bl,-0x1(%edx)
     d9f:	75 ef                	jne    d90 <strcpy+0x10>
    ;
  return os;
}
     da1:	5b                   	pop    %ebx
     da2:	5d                   	pop    %ebp
     da3:	c3                   	ret    
     da4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     daa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000db0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     db0:	55                   	push   %ebp
     db1:	89 e5                	mov    %esp,%ebp
     db3:	53                   	push   %ebx
     db4:	8b 55 08             	mov    0x8(%ebp),%edx
     db7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     dba:	0f b6 02             	movzbl (%edx),%eax
     dbd:	0f b6 19             	movzbl (%ecx),%ebx
     dc0:	84 c0                	test   %al,%al
     dc2:	75 1c                	jne    de0 <strcmp+0x30>
     dc4:	eb 2a                	jmp    df0 <strcmp+0x40>
     dc6:	8d 76 00             	lea    0x0(%esi),%esi
     dc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
     dd0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
     dd3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     dd6:	83 c1 01             	add    $0x1,%ecx
     dd9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
     ddc:	84 c0                	test   %al,%al
     dde:	74 10                	je     df0 <strcmp+0x40>
     de0:	38 d8                	cmp    %bl,%al
     de2:	74 ec                	je     dd0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
     de4:	29 d8                	sub    %ebx,%eax
}
     de6:	5b                   	pop    %ebx
     de7:	5d                   	pop    %ebp
     de8:	c3                   	ret    
     de9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     df0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
     df2:	29 d8                	sub    %ebx,%eax
}
     df4:	5b                   	pop    %ebx
     df5:	5d                   	pop    %ebp
     df6:	c3                   	ret    
     df7:	89 f6                	mov    %esi,%esi
     df9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000e00 <strlen>:

uint
strlen(const char *s)
{
     e00:	55                   	push   %ebp
     e01:	89 e5                	mov    %esp,%ebp
     e03:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     e06:	80 39 00             	cmpb   $0x0,(%ecx)
     e09:	74 15                	je     e20 <strlen+0x20>
     e0b:	31 d2                	xor    %edx,%edx
     e0d:	8d 76 00             	lea    0x0(%esi),%esi
     e10:	83 c2 01             	add    $0x1,%edx
     e13:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     e17:	89 d0                	mov    %edx,%eax
     e19:	75 f5                	jne    e10 <strlen+0x10>
    ;
  return n;
}
     e1b:	5d                   	pop    %ebp
     e1c:	c3                   	ret    
     e1d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
     e20:	31 c0                	xor    %eax,%eax
}
     e22:	5d                   	pop    %ebp
     e23:	c3                   	ret    
     e24:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     e2a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000e30 <memset>:

void*
memset(void *dst, int c, uint n)
{
     e30:	55                   	push   %ebp
     e31:	89 e5                	mov    %esp,%ebp
     e33:	57                   	push   %edi
     e34:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     e37:	8b 4d 10             	mov    0x10(%ebp),%ecx
     e3a:	8b 45 0c             	mov    0xc(%ebp),%eax
     e3d:	89 d7                	mov    %edx,%edi
     e3f:	fc                   	cld    
     e40:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     e42:	89 d0                	mov    %edx,%eax
     e44:	5f                   	pop    %edi
     e45:	5d                   	pop    %ebp
     e46:	c3                   	ret    
     e47:	89 f6                	mov    %esi,%esi
     e49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000e50 <strchr>:

char*
strchr(const char *s, char c)
{
     e50:	55                   	push   %ebp
     e51:	89 e5                	mov    %esp,%ebp
     e53:	53                   	push   %ebx
     e54:	8b 45 08             	mov    0x8(%ebp),%eax
     e57:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
     e5a:	0f b6 10             	movzbl (%eax),%edx
     e5d:	84 d2                	test   %dl,%dl
     e5f:	74 1d                	je     e7e <strchr+0x2e>
    if(*s == c)
     e61:	38 d3                	cmp    %dl,%bl
     e63:	89 d9                	mov    %ebx,%ecx
     e65:	75 0d                	jne    e74 <strchr+0x24>
     e67:	eb 17                	jmp    e80 <strchr+0x30>
     e69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e70:	38 ca                	cmp    %cl,%dl
     e72:	74 0c                	je     e80 <strchr+0x30>
  for(; *s; s++)
     e74:	83 c0 01             	add    $0x1,%eax
     e77:	0f b6 10             	movzbl (%eax),%edx
     e7a:	84 d2                	test   %dl,%dl
     e7c:	75 f2                	jne    e70 <strchr+0x20>
      return (char*)s;
  return 0;
     e7e:	31 c0                	xor    %eax,%eax
}
     e80:	5b                   	pop    %ebx
     e81:	5d                   	pop    %ebp
     e82:	c3                   	ret    
     e83:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     e89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000e90 <gets>:

char*
gets(char *buf, int max)
{
     e90:	55                   	push   %ebp
     e91:	89 e5                	mov    %esp,%ebp
     e93:	57                   	push   %edi
     e94:	56                   	push   %esi
     e95:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     e96:	31 f6                	xor    %esi,%esi
     e98:	89 f3                	mov    %esi,%ebx
{
     e9a:	83 ec 1c             	sub    $0x1c,%esp
     e9d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
     ea0:	eb 2f                	jmp    ed1 <gets+0x41>
     ea2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
     ea8:	8d 45 e7             	lea    -0x19(%ebp),%eax
     eab:	83 ec 04             	sub    $0x4,%esp
     eae:	6a 01                	push   $0x1
     eb0:	50                   	push   %eax
     eb1:	6a 00                	push   $0x0
     eb3:	e8 32 01 00 00       	call   fea <read>
    if(cc < 1)
     eb8:	83 c4 10             	add    $0x10,%esp
     ebb:	85 c0                	test   %eax,%eax
     ebd:	7e 1c                	jle    edb <gets+0x4b>
      break;
    buf[i++] = c;
     ebf:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     ec3:	83 c7 01             	add    $0x1,%edi
     ec6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
     ec9:	3c 0a                	cmp    $0xa,%al
     ecb:	74 23                	je     ef0 <gets+0x60>
     ecd:	3c 0d                	cmp    $0xd,%al
     ecf:	74 1f                	je     ef0 <gets+0x60>
  for(i=0; i+1 < max; ){
     ed1:	83 c3 01             	add    $0x1,%ebx
     ed4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     ed7:	89 fe                	mov    %edi,%esi
     ed9:	7c cd                	jl     ea8 <gets+0x18>
     edb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
     edd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
     ee0:	c6 03 00             	movb   $0x0,(%ebx)
}
     ee3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ee6:	5b                   	pop    %ebx
     ee7:	5e                   	pop    %esi
     ee8:	5f                   	pop    %edi
     ee9:	5d                   	pop    %ebp
     eea:	c3                   	ret    
     eeb:	90                   	nop
     eec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     ef0:	8b 75 08             	mov    0x8(%ebp),%esi
     ef3:	8b 45 08             	mov    0x8(%ebp),%eax
     ef6:	01 de                	add    %ebx,%esi
     ef8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
     efa:	c6 03 00             	movb   $0x0,(%ebx)
}
     efd:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f00:	5b                   	pop    %ebx
     f01:	5e                   	pop    %esi
     f02:	5f                   	pop    %edi
     f03:	5d                   	pop    %ebp
     f04:	c3                   	ret    
     f05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     f09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000f10 <stat>:

int
stat(const char *n, struct stat *st)
{
     f10:	55                   	push   %ebp
     f11:	89 e5                	mov    %esp,%ebp
     f13:	56                   	push   %esi
     f14:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     f15:	83 ec 08             	sub    $0x8,%esp
     f18:	6a 00                	push   $0x0
     f1a:	ff 75 08             	pushl  0x8(%ebp)
     f1d:	e8 f0 00 00 00       	call   1012 <open>
  if(fd < 0)
     f22:	83 c4 10             	add    $0x10,%esp
     f25:	85 c0                	test   %eax,%eax
     f27:	78 27                	js     f50 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     f29:	83 ec 08             	sub    $0x8,%esp
     f2c:	ff 75 0c             	pushl  0xc(%ebp)
     f2f:	89 c3                	mov    %eax,%ebx
     f31:	50                   	push   %eax
     f32:	e8 f3 00 00 00       	call   102a <fstat>
  close(fd);
     f37:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     f3a:	89 c6                	mov    %eax,%esi
  close(fd);
     f3c:	e8 b9 00 00 00       	call   ffa <close>
  return r;
     f41:	83 c4 10             	add    $0x10,%esp
}
     f44:	8d 65 f8             	lea    -0x8(%ebp),%esp
     f47:	89 f0                	mov    %esi,%eax
     f49:	5b                   	pop    %ebx
     f4a:	5e                   	pop    %esi
     f4b:	5d                   	pop    %ebp
     f4c:	c3                   	ret    
     f4d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     f50:	be ff ff ff ff       	mov    $0xffffffff,%esi
     f55:	eb ed                	jmp    f44 <stat+0x34>
     f57:	89 f6                	mov    %esi,%esi
     f59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000f60 <atoi>:

int
atoi(const char *s)
{
     f60:	55                   	push   %ebp
     f61:	89 e5                	mov    %esp,%ebp
     f63:	53                   	push   %ebx
     f64:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     f67:	0f be 11             	movsbl (%ecx),%edx
     f6a:	8d 42 d0             	lea    -0x30(%edx),%eax
     f6d:	3c 09                	cmp    $0x9,%al
  n = 0;
     f6f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
     f74:	77 1f                	ja     f95 <atoi+0x35>
     f76:	8d 76 00             	lea    0x0(%esi),%esi
     f79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     f80:	8d 04 80             	lea    (%eax,%eax,4),%eax
     f83:	83 c1 01             	add    $0x1,%ecx
     f86:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
     f8a:	0f be 11             	movsbl (%ecx),%edx
     f8d:	8d 5a d0             	lea    -0x30(%edx),%ebx
     f90:	80 fb 09             	cmp    $0x9,%bl
     f93:	76 eb                	jbe    f80 <atoi+0x20>
  return n;
}
     f95:	5b                   	pop    %ebx
     f96:	5d                   	pop    %ebp
     f97:	c3                   	ret    
     f98:	90                   	nop
     f99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000fa0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     fa0:	55                   	push   %ebp
     fa1:	89 e5                	mov    %esp,%ebp
     fa3:	56                   	push   %esi
     fa4:	53                   	push   %ebx
     fa5:	8b 5d 10             	mov    0x10(%ebp),%ebx
     fa8:	8b 45 08             	mov    0x8(%ebp),%eax
     fab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     fae:	85 db                	test   %ebx,%ebx
     fb0:	7e 14                	jle    fc6 <memmove+0x26>
     fb2:	31 d2                	xor    %edx,%edx
     fb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     fb8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     fbc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     fbf:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
     fc2:	39 d3                	cmp    %edx,%ebx
     fc4:	75 f2                	jne    fb8 <memmove+0x18>
  return vdst;
}
     fc6:	5b                   	pop    %ebx
     fc7:	5e                   	pop    %esi
     fc8:	5d                   	pop    %ebp
     fc9:	c3                   	ret    

00000fca <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     fca:	b8 01 00 00 00       	mov    $0x1,%eax
     fcf:	cd 40                	int    $0x40
     fd1:	c3                   	ret    

00000fd2 <exit>:
SYSCALL(exit)
     fd2:	b8 02 00 00 00       	mov    $0x2,%eax
     fd7:	cd 40                	int    $0x40
     fd9:	c3                   	ret    

00000fda <wait>:
SYSCALL(wait)
     fda:	b8 03 00 00 00       	mov    $0x3,%eax
     fdf:	cd 40                	int    $0x40
     fe1:	c3                   	ret    

00000fe2 <pipe>:
SYSCALL(pipe)
     fe2:	b8 04 00 00 00       	mov    $0x4,%eax
     fe7:	cd 40                	int    $0x40
     fe9:	c3                   	ret    

00000fea <read>:
SYSCALL(read)
     fea:	b8 05 00 00 00       	mov    $0x5,%eax
     fef:	cd 40                	int    $0x40
     ff1:	c3                   	ret    

00000ff2 <write>:
SYSCALL(write)
     ff2:	b8 10 00 00 00       	mov    $0x10,%eax
     ff7:	cd 40                	int    $0x40
     ff9:	c3                   	ret    

00000ffa <close>:
SYSCALL(close)
     ffa:	b8 15 00 00 00       	mov    $0x15,%eax
     fff:	cd 40                	int    $0x40
    1001:	c3                   	ret    

00001002 <kill>:
SYSCALL(kill)
    1002:	b8 06 00 00 00       	mov    $0x6,%eax
    1007:	cd 40                	int    $0x40
    1009:	c3                   	ret    

0000100a <exec>:
SYSCALL(exec)
    100a:	b8 07 00 00 00       	mov    $0x7,%eax
    100f:	cd 40                	int    $0x40
    1011:	c3                   	ret    

00001012 <open>:
SYSCALL(open)
    1012:	b8 0f 00 00 00       	mov    $0xf,%eax
    1017:	cd 40                	int    $0x40
    1019:	c3                   	ret    

0000101a <mknod>:
SYSCALL(mknod)
    101a:	b8 11 00 00 00       	mov    $0x11,%eax
    101f:	cd 40                	int    $0x40
    1021:	c3                   	ret    

00001022 <unlink>:
SYSCALL(unlink)
    1022:	b8 12 00 00 00       	mov    $0x12,%eax
    1027:	cd 40                	int    $0x40
    1029:	c3                   	ret    

0000102a <fstat>:
SYSCALL(fstat)
    102a:	b8 08 00 00 00       	mov    $0x8,%eax
    102f:	cd 40                	int    $0x40
    1031:	c3                   	ret    

00001032 <link>:
SYSCALL(link)
    1032:	b8 13 00 00 00       	mov    $0x13,%eax
    1037:	cd 40                	int    $0x40
    1039:	c3                   	ret    

0000103a <mkdir>:
SYSCALL(mkdir)
    103a:	b8 14 00 00 00       	mov    $0x14,%eax
    103f:	cd 40                	int    $0x40
    1041:	c3                   	ret    

00001042 <chdir>:
SYSCALL(chdir)
    1042:	b8 09 00 00 00       	mov    $0x9,%eax
    1047:	cd 40                	int    $0x40
    1049:	c3                   	ret    

0000104a <dup>:
SYSCALL(dup)
    104a:	b8 0a 00 00 00       	mov    $0xa,%eax
    104f:	cd 40                	int    $0x40
    1051:	c3                   	ret    

00001052 <getpid>:
SYSCALL(getpid)
    1052:	b8 0b 00 00 00       	mov    $0xb,%eax
    1057:	cd 40                	int    $0x40
    1059:	c3                   	ret    

0000105a <sbrk>:
SYSCALL(sbrk)
    105a:	b8 0c 00 00 00       	mov    $0xc,%eax
    105f:	cd 40                	int    $0x40
    1061:	c3                   	ret    

00001062 <sleep>:
SYSCALL(sleep)
    1062:	b8 0d 00 00 00       	mov    $0xd,%eax
    1067:	cd 40                	int    $0x40
    1069:	c3                   	ret    

0000106a <uptime>:
SYSCALL(uptime)
    106a:	b8 0e 00 00 00       	mov    $0xe,%eax
    106f:	cd 40                	int    $0x40
    1071:	c3                   	ret    

00001072 <cps>:
SYSCALL(cps)
    1072:	b8 16 00 00 00       	mov    $0x16,%eax
    1077:	cd 40                	int    $0x40
    1079:	c3                   	ret    

0000107a <chpr>:
SYSCALL(chpr)
    107a:	b8 17 00 00 00       	mov    $0x17,%eax
    107f:	cd 40                	int    $0x40
    1081:	c3                   	ret    

00001082 <pwd>:
SYSCALL(pwd)
    1082:	b8 18 00 00 00       	mov    $0x18,%eax
    1087:	cd 40                	int    $0x40
    1089:	c3                   	ret    

0000108a <mv>:
SYSCALL(mv)
    108a:	b8 19 00 00 00       	mov    $0x19,%eax
    108f:	cd 40                	int    $0x40
    1091:	c3                   	ret    
    1092:	66 90                	xchg   %ax,%ax
    1094:	66 90                	xchg   %ax,%ax
    1096:	66 90                	xchg   %ax,%ax
    1098:	66 90                	xchg   %ax,%ax
    109a:	66 90                	xchg   %ax,%ax
    109c:	66 90                	xchg   %ax,%ax
    109e:	66 90                	xchg   %ax,%ax

000010a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    10a0:	55                   	push   %ebp
    10a1:	89 e5                	mov    %esp,%ebp
    10a3:	57                   	push   %edi
    10a4:	56                   	push   %esi
    10a5:	53                   	push   %ebx
    10a6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    10a9:	85 d2                	test   %edx,%edx
{
    10ab:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    10ae:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    10b0:	79 76                	jns    1128 <printint+0x88>
    10b2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    10b6:	74 70                	je     1128 <printint+0x88>
    x = -xx;
    10b8:	f7 d8                	neg    %eax
    neg = 1;
    10ba:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    10c1:	31 f6                	xor    %esi,%esi
    10c3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    10c6:	eb 0a                	jmp    10d2 <printint+0x32>
    10c8:	90                   	nop
    10c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    10d0:	89 fe                	mov    %edi,%esi
    10d2:	31 d2                	xor    %edx,%edx
    10d4:	8d 7e 01             	lea    0x1(%esi),%edi
    10d7:	f7 f1                	div    %ecx
    10d9:	0f b6 92 88 15 00 00 	movzbl 0x1588(%edx),%edx
  }while((x /= base) != 0);
    10e0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    10e2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    10e5:	75 e9                	jne    10d0 <printint+0x30>
  if(neg)
    10e7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    10ea:	85 c0                	test   %eax,%eax
    10ec:	74 08                	je     10f6 <printint+0x56>
    buf[i++] = '-';
    10ee:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    10f3:	8d 7e 02             	lea    0x2(%esi),%edi
    10f6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    10fa:	8b 7d c0             	mov    -0x40(%ebp),%edi
    10fd:	8d 76 00             	lea    0x0(%esi),%esi
    1100:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    1103:	83 ec 04             	sub    $0x4,%esp
    1106:	83 ee 01             	sub    $0x1,%esi
    1109:	6a 01                	push   $0x1
    110b:	53                   	push   %ebx
    110c:	57                   	push   %edi
    110d:	88 45 d7             	mov    %al,-0x29(%ebp)
    1110:	e8 dd fe ff ff       	call   ff2 <write>

  while(--i >= 0)
    1115:	83 c4 10             	add    $0x10,%esp
    1118:	39 de                	cmp    %ebx,%esi
    111a:	75 e4                	jne    1100 <printint+0x60>
    putc(fd, buf[i]);
}
    111c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    111f:	5b                   	pop    %ebx
    1120:	5e                   	pop    %esi
    1121:	5f                   	pop    %edi
    1122:	5d                   	pop    %ebp
    1123:	c3                   	ret    
    1124:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1128:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    112f:	eb 90                	jmp    10c1 <printint+0x21>
    1131:	eb 0d                	jmp    1140 <printf>
    1133:	90                   	nop
    1134:	90                   	nop
    1135:	90                   	nop
    1136:	90                   	nop
    1137:	90                   	nop
    1138:	90                   	nop
    1139:	90                   	nop
    113a:	90                   	nop
    113b:	90                   	nop
    113c:	90                   	nop
    113d:	90                   	nop
    113e:	90                   	nop
    113f:	90                   	nop

00001140 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	57                   	push   %edi
    1144:	56                   	push   %esi
    1145:	53                   	push   %ebx
    1146:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1149:	8b 75 0c             	mov    0xc(%ebp),%esi
    114c:	0f b6 1e             	movzbl (%esi),%ebx
    114f:	84 db                	test   %bl,%bl
    1151:	0f 84 b3 00 00 00    	je     120a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
    1157:	8d 45 10             	lea    0x10(%ebp),%eax
    115a:	83 c6 01             	add    $0x1,%esi
  state = 0;
    115d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
    115f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1162:	eb 2f                	jmp    1193 <printf+0x53>
    1164:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1168:	83 f8 25             	cmp    $0x25,%eax
    116b:	0f 84 a7 00 00 00    	je     1218 <printf+0xd8>
  write(fd, &c, 1);
    1171:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1174:	83 ec 04             	sub    $0x4,%esp
    1177:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    117a:	6a 01                	push   $0x1
    117c:	50                   	push   %eax
    117d:	ff 75 08             	pushl  0x8(%ebp)
    1180:	e8 6d fe ff ff       	call   ff2 <write>
    1185:	83 c4 10             	add    $0x10,%esp
    1188:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    118b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    118f:	84 db                	test   %bl,%bl
    1191:	74 77                	je     120a <printf+0xca>
    if(state == 0){
    1193:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
    1195:	0f be cb             	movsbl %bl,%ecx
    1198:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    119b:	74 cb                	je     1168 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    119d:	83 ff 25             	cmp    $0x25,%edi
    11a0:	75 e6                	jne    1188 <printf+0x48>
      if(c == 'd'){
    11a2:	83 f8 64             	cmp    $0x64,%eax
    11a5:	0f 84 05 01 00 00    	je     12b0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    11ab:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    11b1:	83 f9 70             	cmp    $0x70,%ecx
    11b4:	74 72                	je     1228 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    11b6:	83 f8 73             	cmp    $0x73,%eax
    11b9:	0f 84 99 00 00 00    	je     1258 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    11bf:	83 f8 63             	cmp    $0x63,%eax
    11c2:	0f 84 08 01 00 00    	je     12d0 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    11c8:	83 f8 25             	cmp    $0x25,%eax
    11cb:	0f 84 ef 00 00 00    	je     12c0 <printf+0x180>
  write(fd, &c, 1);
    11d1:	8d 45 e7             	lea    -0x19(%ebp),%eax
    11d4:	83 ec 04             	sub    $0x4,%esp
    11d7:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    11db:	6a 01                	push   $0x1
    11dd:	50                   	push   %eax
    11de:	ff 75 08             	pushl  0x8(%ebp)
    11e1:	e8 0c fe ff ff       	call   ff2 <write>
    11e6:	83 c4 0c             	add    $0xc,%esp
    11e9:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    11ec:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    11ef:	6a 01                	push   $0x1
    11f1:	50                   	push   %eax
    11f2:	ff 75 08             	pushl  0x8(%ebp)
    11f5:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    11f8:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    11fa:	e8 f3 fd ff ff       	call   ff2 <write>
  for(i = 0; fmt[i]; i++){
    11ff:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    1203:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1206:	84 db                	test   %bl,%bl
    1208:	75 89                	jne    1193 <printf+0x53>
    }
  }
}
    120a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    120d:	5b                   	pop    %ebx
    120e:	5e                   	pop    %esi
    120f:	5f                   	pop    %edi
    1210:	5d                   	pop    %ebp
    1211:	c3                   	ret    
    1212:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
    1218:	bf 25 00 00 00       	mov    $0x25,%edi
    121d:	e9 66 ff ff ff       	jmp    1188 <printf+0x48>
    1222:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1228:	83 ec 0c             	sub    $0xc,%esp
    122b:	b9 10 00 00 00       	mov    $0x10,%ecx
    1230:	6a 00                	push   $0x0
    1232:	8b 7d d4             	mov    -0x2c(%ebp),%edi
    1235:	8b 45 08             	mov    0x8(%ebp),%eax
    1238:	8b 17                	mov    (%edi),%edx
    123a:	e8 61 fe ff ff       	call   10a0 <printint>
        ap++;
    123f:	89 f8                	mov    %edi,%eax
    1241:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1244:	31 ff                	xor    %edi,%edi
        ap++;
    1246:	83 c0 04             	add    $0x4,%eax
    1249:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    124c:	e9 37 ff ff ff       	jmp    1188 <printf+0x48>
    1251:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1258:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    125b:	8b 08                	mov    (%eax),%ecx
        ap++;
    125d:	83 c0 04             	add    $0x4,%eax
    1260:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
    1263:	85 c9                	test   %ecx,%ecx
    1265:	0f 84 8e 00 00 00    	je     12f9 <printf+0x1b9>
        while(*s != 0){
    126b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    126e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
    1270:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    1272:	84 c0                	test   %al,%al
    1274:	0f 84 0e ff ff ff    	je     1188 <printf+0x48>
    127a:	89 75 d0             	mov    %esi,-0x30(%ebp)
    127d:	89 de                	mov    %ebx,%esi
    127f:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1282:	8d 7d e3             	lea    -0x1d(%ebp),%edi
    1285:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1288:	83 ec 04             	sub    $0x4,%esp
          s++;
    128b:	83 c6 01             	add    $0x1,%esi
    128e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    1291:	6a 01                	push   $0x1
    1293:	57                   	push   %edi
    1294:	53                   	push   %ebx
    1295:	e8 58 fd ff ff       	call   ff2 <write>
        while(*s != 0){
    129a:	0f b6 06             	movzbl (%esi),%eax
    129d:	83 c4 10             	add    $0x10,%esp
    12a0:	84 c0                	test   %al,%al
    12a2:	75 e4                	jne    1288 <printf+0x148>
    12a4:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
    12a7:	31 ff                	xor    %edi,%edi
    12a9:	e9 da fe ff ff       	jmp    1188 <printf+0x48>
    12ae:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
    12b0:	83 ec 0c             	sub    $0xc,%esp
    12b3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    12b8:	6a 01                	push   $0x1
    12ba:	e9 73 ff ff ff       	jmp    1232 <printf+0xf2>
    12bf:	90                   	nop
  write(fd, &c, 1);
    12c0:	83 ec 04             	sub    $0x4,%esp
    12c3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    12c6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    12c9:	6a 01                	push   $0x1
    12cb:	e9 21 ff ff ff       	jmp    11f1 <printf+0xb1>
        putc(fd, *ap);
    12d0:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
    12d3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    12d6:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    12d8:	6a 01                	push   $0x1
        ap++;
    12da:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
    12dd:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    12e0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    12e3:	50                   	push   %eax
    12e4:	ff 75 08             	pushl  0x8(%ebp)
    12e7:	e8 06 fd ff ff       	call   ff2 <write>
        ap++;
    12ec:	89 7d d4             	mov    %edi,-0x2c(%ebp)
    12ef:	83 c4 10             	add    $0x10,%esp
      state = 0;
    12f2:	31 ff                	xor    %edi,%edi
    12f4:	e9 8f fe ff ff       	jmp    1188 <printf+0x48>
          s = "(null)";
    12f9:	bb 80 15 00 00       	mov    $0x1580,%ebx
        while(*s != 0){
    12fe:	b8 28 00 00 00       	mov    $0x28,%eax
    1303:	e9 72 ff ff ff       	jmp    127a <printf+0x13a>
    1308:	66 90                	xchg   %ax,%ax
    130a:	66 90                	xchg   %ax,%ax
    130c:	66 90                	xchg   %ax,%ax
    130e:	66 90                	xchg   %ax,%ax

00001310 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1310:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1311:	a1 c4 1b 00 00       	mov    0x1bc4,%eax
{
    1316:	89 e5                	mov    %esp,%ebp
    1318:	57                   	push   %edi
    1319:	56                   	push   %esi
    131a:	53                   	push   %ebx
    131b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    131e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1321:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1328:	39 c8                	cmp    %ecx,%eax
    132a:	8b 10                	mov    (%eax),%edx
    132c:	73 32                	jae    1360 <free+0x50>
    132e:	39 d1                	cmp    %edx,%ecx
    1330:	72 04                	jb     1336 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1332:	39 d0                	cmp    %edx,%eax
    1334:	72 32                	jb     1368 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1336:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1339:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    133c:	39 fa                	cmp    %edi,%edx
    133e:	74 30                	je     1370 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1340:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1343:	8b 50 04             	mov    0x4(%eax),%edx
    1346:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1349:	39 f1                	cmp    %esi,%ecx
    134b:	74 3a                	je     1387 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    134d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    134f:	a3 c4 1b 00 00       	mov    %eax,0x1bc4
}
    1354:	5b                   	pop    %ebx
    1355:	5e                   	pop    %esi
    1356:	5f                   	pop    %edi
    1357:	5d                   	pop    %ebp
    1358:	c3                   	ret    
    1359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1360:	39 d0                	cmp    %edx,%eax
    1362:	72 04                	jb     1368 <free+0x58>
    1364:	39 d1                	cmp    %edx,%ecx
    1366:	72 ce                	jb     1336 <free+0x26>
{
    1368:	89 d0                	mov    %edx,%eax
    136a:	eb bc                	jmp    1328 <free+0x18>
    136c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1370:	03 72 04             	add    0x4(%edx),%esi
    1373:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1376:	8b 10                	mov    (%eax),%edx
    1378:	8b 12                	mov    (%edx),%edx
    137a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    137d:	8b 50 04             	mov    0x4(%eax),%edx
    1380:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1383:	39 f1                	cmp    %esi,%ecx
    1385:	75 c6                	jne    134d <free+0x3d>
    p->s.size += bp->s.size;
    1387:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    138a:	a3 c4 1b 00 00       	mov    %eax,0x1bc4
    p->s.size += bp->s.size;
    138f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1392:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1395:	89 10                	mov    %edx,(%eax)
}
    1397:	5b                   	pop    %ebx
    1398:	5e                   	pop    %esi
    1399:	5f                   	pop    %edi
    139a:	5d                   	pop    %ebp
    139b:	c3                   	ret    
    139c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000013a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    13a0:	55                   	push   %ebp
    13a1:	89 e5                	mov    %esp,%ebp
    13a3:	57                   	push   %edi
    13a4:	56                   	push   %esi
    13a5:	53                   	push   %ebx
    13a6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    13a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    13ac:	8b 15 c4 1b 00 00    	mov    0x1bc4,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    13b2:	8d 78 07             	lea    0x7(%eax),%edi
    13b5:	c1 ef 03             	shr    $0x3,%edi
    13b8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    13bb:	85 d2                	test   %edx,%edx
    13bd:	0f 84 9d 00 00 00    	je     1460 <malloc+0xc0>
    13c3:	8b 02                	mov    (%edx),%eax
    13c5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    13c8:	39 cf                	cmp    %ecx,%edi
    13ca:	76 6c                	jbe    1438 <malloc+0x98>
    13cc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    13d2:	bb 00 10 00 00       	mov    $0x1000,%ebx
    13d7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    13da:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    13e1:	eb 0e                	jmp    13f1 <malloc+0x51>
    13e3:	90                   	nop
    13e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    13e8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    13ea:	8b 48 04             	mov    0x4(%eax),%ecx
    13ed:	39 f9                	cmp    %edi,%ecx
    13ef:	73 47                	jae    1438 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    13f1:	39 05 c4 1b 00 00    	cmp    %eax,0x1bc4
    13f7:	89 c2                	mov    %eax,%edx
    13f9:	75 ed                	jne    13e8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    13fb:	83 ec 0c             	sub    $0xc,%esp
    13fe:	56                   	push   %esi
    13ff:	e8 56 fc ff ff       	call   105a <sbrk>
  if(p == (char*)-1)
    1404:	83 c4 10             	add    $0x10,%esp
    1407:	83 f8 ff             	cmp    $0xffffffff,%eax
    140a:	74 1c                	je     1428 <malloc+0x88>
  hp->s.size = nu;
    140c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    140f:	83 ec 0c             	sub    $0xc,%esp
    1412:	83 c0 08             	add    $0x8,%eax
    1415:	50                   	push   %eax
    1416:	e8 f5 fe ff ff       	call   1310 <free>
  return freep;
    141b:	8b 15 c4 1b 00 00    	mov    0x1bc4,%edx
      if((p = morecore(nunits)) == 0)
    1421:	83 c4 10             	add    $0x10,%esp
    1424:	85 d2                	test   %edx,%edx
    1426:	75 c0                	jne    13e8 <malloc+0x48>
        return 0;
  }
}
    1428:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    142b:	31 c0                	xor    %eax,%eax
}
    142d:	5b                   	pop    %ebx
    142e:	5e                   	pop    %esi
    142f:	5f                   	pop    %edi
    1430:	5d                   	pop    %ebp
    1431:	c3                   	ret    
    1432:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1438:	39 cf                	cmp    %ecx,%edi
    143a:	74 54                	je     1490 <malloc+0xf0>
        p->s.size -= nunits;
    143c:	29 f9                	sub    %edi,%ecx
    143e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1441:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    1444:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    1447:	89 15 c4 1b 00 00    	mov    %edx,0x1bc4
}
    144d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1450:	83 c0 08             	add    $0x8,%eax
}
    1453:	5b                   	pop    %ebx
    1454:	5e                   	pop    %esi
    1455:	5f                   	pop    %edi
    1456:	5d                   	pop    %ebp
    1457:	c3                   	ret    
    1458:	90                   	nop
    1459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    1460:	c7 05 c4 1b 00 00 c8 	movl   $0x1bc8,0x1bc4
    1467:	1b 00 00 
    146a:	c7 05 c8 1b 00 00 c8 	movl   $0x1bc8,0x1bc8
    1471:	1b 00 00 
    base.s.size = 0;
    1474:	b8 c8 1b 00 00       	mov    $0x1bc8,%eax
    1479:	c7 05 cc 1b 00 00 00 	movl   $0x0,0x1bcc
    1480:	00 00 00 
    1483:	e9 44 ff ff ff       	jmp    13cc <malloc+0x2c>
    1488:	90                   	nop
    1489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    1490:	8b 08                	mov    (%eax),%ecx
    1492:	89 0a                	mov    %ecx,(%edx)
    1494:	eb b1                	jmp    1447 <malloc+0xa7>
