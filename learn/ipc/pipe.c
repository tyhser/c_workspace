#include <unistd.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	int pipe_fd[2];

	if (pipe(pipe_fd) < 0)
	{
		printf("pipe create error\n");
		return -1;
	}
	else
		printf("pipe create sucess\n");
	
	printf("pipe_fd[0] = %d\n", pipe_fd[0]);
	printf("pipe_fd[1] = %d\n", pipe_fd[1]);
	close(pipe_fd[0]);
	close(pipe_fd[1]);
}
