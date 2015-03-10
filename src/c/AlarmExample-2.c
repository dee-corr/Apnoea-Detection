 #include <stdio.h>  
 #include <signal.h>  
 #include <unistd.h>
  
/* number of times the handle will run */  
 volatile int breakflag = 3;  
  
 /* the interrupt handler which is called when the SIGALRM signal is received,
    afer 5 seconds initially, and every 2 seconds after that */
void handle(int sig) {  
    printf("You woke me.\n"); 
    /* decrement the breakflag which will count the number of 
       breaks we have had, eventually when this gets to 0 we give up */
    --breakflag; 
  /* set an alarm for two seconds from now */
    alarm(2);  
 }  
  
 int main() {
    printf("We're going to wait a while\n");
    /* tell the system we would like to be notified of SIGALM and that when we receive that
       we want to call the handle function above */ 	
    signal(SIGALRM, handle);  

    /* tell the system to send us an alarm in 5 seconds */
    alarm(5);  
    
    /* while breakflag still > 0 , try again to go to sleep for 100 seconds */
    while(breakflag) { 
    	printf("Going to sleep for 100 seconds\n");
    	sleep(100); 
    }  
    /* we only get here when the while loop exits, i.e. when the breakflag gets to 0 */ 
    printf("Ah, I give up!\n");  
    return 0;  
 }  
