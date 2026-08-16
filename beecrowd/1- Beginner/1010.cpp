#include <iostream>
 
using namespace std;

int main() 
{
 
    int p1, n1, p2, n2;
    float v1, v2;
    float valor;
    
    cin >> p1 >> n1 >> v1 >> p2 >> n2 >> v2;
    
    valor = (n1*v1) + (n2*v2);
    
    printf("VALOR A PAGAR: R$ %.2f\n", valor);
     
    return 0;
}