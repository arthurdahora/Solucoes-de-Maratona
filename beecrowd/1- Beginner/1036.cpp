#include <iostream>
#include <cmath>
 
using namespace std;

int main() 
{
    double A, B, C;
    double delta, raizdelta, denominador;
    double R1, R2;
    
    cin >> A >> B >> C;
    
    delta = pow(B,2)+(-4*A*C);
    raizdelta = sqrt(delta);
    denominador = 2*A;
    if(delta<0 || denominador == 0)
    {
        printf("Impossivel calcular\n");
    }

    if(delta>=0 && denominador != 0)
    { 
        R1 = (-B+raizdelta)/denominador;
        R2 = (-B-raizdelta)/denominador;
    
        printf("R1 = %.5f\n", R1);
        printf("R2 = %.5f\n", R2);
    }
    
    return 0;
}