#include <stdio.h>
 
int main() 
{
    double A, B;
    double media;
    scanf("%lf", &A);
    scanf("%lf", &B);
    media = ((A*3.5) + (B*7.5))/11;
    
    printf("MEDIA = %.5f\n", media);
    
    return 0;
}