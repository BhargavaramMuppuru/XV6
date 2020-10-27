#include "types.h"
#include "user.h"

int main(void)
{
	int ChildPid = fork();
	if(ChildPid<0)
		printf(1,"Fork Failed %d\n",ChildPid);
	else if(ChildPid>0)
	{
		printf(1,"I am a Parent. My pid is %d, Child id is %d\n",getpid(),ChildPid);
		wait();
	}
	else
	{
		 printf(1,"I am the Child. My pid is %d, parent id is %d\n",getpid(),getppid());
	}
		 exit();
}
