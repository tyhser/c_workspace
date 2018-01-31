#include <stdio.h>
#include <stdlib.h>

unsigned long int factorial(int n)
{
	if (n == 0)
		return 1;
	else
	{
		return (n * factorial(n - 1));		
	}
}
int main(int argc, char *argv[])
{
	int n = 0;

	printf("factorial(%d) = %ld\n", n, factorial(atof(argv[1])));
	return 0;
}
