/*open.c*/
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>

int main(void)
{
	int fd;
/*调用open函数， 以可读写的方式打开，注意选项可以用|符号连接*/
	if ((fd = open("./hello.c", O_CREAT|O_TRUNC|O_WRONLY, 600)) < 0)
	{
		perror("open: ");
		exit(1);
	}

	else
	{
		printf("open file: hello.c %d\n", fd);
	}
	if (close(fd) < 0)
	{
		perror("close: ");
		exit(1);
	}
	else
		printf("close hello.c\n");
	exit(0);
}
