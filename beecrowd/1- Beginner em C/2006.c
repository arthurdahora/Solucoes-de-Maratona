#include <stdio.h>

int main() {
    int T,A,B,C,D,E,cont=0;
    scanf("%d", &T);
    scanf("%d", &A);
    scanf("%d", &B);
    scanf("%d", &C);
    scanf("%d", &D);
    scanf("%d", &E);
    if(A==T)
    cont++;
    if(B==T)
    cont++;
    if(C==T)
    cont++;
    if(D==T)
    cont++;
    if(E==T)
    cont++;
    printf("%d\n", cont);
        
    return 0;
}