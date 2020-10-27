// Mutual exclusion spin locks.

#include "types.h"
#include "stat.h"
#include "user.h"
#include "pstat.h"





int
main(int argc, char *argv[])
{
  int p;
  if (argc > 2){
    return -1;
  }
  //FILE *fp;
  struct pstat* infotable = (struct pstat*)malloc(sizeof(struct pstat));
  if (argc == 1){
    //fp = fopen("/pslog.txt", "w+");

    // fclose(fp);

    getpinfo(infotable);
    printf(1,"PID TICKETS TICKS\n");
    for(p = 0; p < NPROC; p++){
      if(infotable->inuse[p])
        printf(1,"%d %d %d\n", infotable->pid[p],infotable->tickets[p],infotable->ticks[p]);
    }
  }
  if(argc == 2 && strcmp(argv[1],"-r")==0){
    
    while(1){
      getpinfo(infotable);
      printf(1,"PID TICKETS TICKS\n");
      for(p = 0; p < NPROC; p++){
        if(infotable->inuse[p])
          printf(1,"%d %d %d\n", infotable->pid[p],infotable->tickets[p],infotable->ticks[p]); 
      }
      sleep(100);
    }

  }
  return 0;

}
