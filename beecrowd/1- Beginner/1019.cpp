#include <iostream>
 
using namespace std;

int main() 
{
    int N;
    int horas, minutos, segundos;
    
    cin >> N;
    
    horas = N/3600;
    minutos = (N%3600)/(60);
    segundos = (N%3600)%(60);
    
    printf("%d:%d:%d\n", horas, minutos, segundos);
    return 0;
}