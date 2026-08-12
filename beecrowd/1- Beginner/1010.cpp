#include <iostream>
 
using namespace std;

int main() 
{
 
    int p1, n1, p2, n2;
    float v1, v2;
    int valor;
    
    cin >> p1 >> n1 >> v1 >> p2 >> n1 >> v1;
    
    valor = (n1*v1) + (n2*v2);
    
    printf("VALOR A PAGAR: %.2f", valor);
     
    return 0;
}