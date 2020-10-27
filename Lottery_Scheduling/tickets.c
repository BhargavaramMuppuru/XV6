// Mutual exclusion spin locks.

#include "types.h"
#include "user.h"
#include "stat.h"

int
main(int argc, char * argv[]){

  if(argc != 3){
    printf(1,"tickets expect to take 3 arguments, get %d instead\n",argc);
    exit();
  }

    int ticketsnum = atoi(argv[1]);
    settickets(ticketsnum);
    char* arg_exec[1];
    arg_exec[0] = argv[2];
    exec(argv[2],arg_exec);
    exit();
 
}
