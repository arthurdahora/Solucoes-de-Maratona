#include <stdio.h>
 
int main() {
 
   int norm;
   int dig1, dig2, dig3, dig4;
   int inv;
   int e;
   scanf("%d", &norm);
   e = norm/1000;
   if(e>=1)    
   {
        dig1 = norm/1000;
        dig2 = (norm/100)%10;
        dig3 = (norm/10)%10; 
        dig4 = norm%10;
   
        inv = (dig4*1000)+(dig3*100)+(dig2*10)+(dig1);
   
        printf("Invertido = %d\n", inv);
   }
   if(e<1)
   {
        dig1 = norm/100;
        dig2 = (norm/10)%10; 
        dig3 = norm%10;
        
        inv = (dig3*100)+(dig2*10)+(dig1);
        printf("Invertido = %d\n", inv);
   }
    return 0;
}