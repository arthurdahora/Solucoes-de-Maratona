#include <iostream>
#include <string>

using namespace std;

int main() 
{
    string nome;
    double salario, vendas;
    
    cin >> nome >> salario >> vendas;
    
    salario = salario + (vendas*0.15);
    
    printf("TOTAL = R$ %.2f\n", salario);
    return 0;
}