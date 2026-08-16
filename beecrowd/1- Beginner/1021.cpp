#include <iostream>

using namespace std;

int main() {
    float dinheiro;
    int notas[] = {10000, 5000, 2000, 1000, 500, 200, 100, 50, 25, 10, 5, 1};
    int quantidade[12];
    int centavos;

    cin >> dinheiro;       
    
    centavos = (int)(dinheiro*100+0.1);
    
    for (int i = 0; i < 12; i++)    
    {
        quantidade[i] = centavos/notas[i];
        centavos = centavos-(quantidade[i]*notas[i]);
    }
    
    printf("NOTAS:\n");
    printf("%d nota(s) de R$ 100.00\n", quantidade[0]);
    printf("%d nota(s) de R$ 50.00\n", quantidade[1]);
    printf("%d nota(s) de R$ 20.00\n", quantidade[2]);
    printf("%d nota(s) de R$ 10.00\n", quantidade[3]);
    printf("%d nota(s) de R$ 5.00\n", quantidade[4]);
    printf("%d nota(s) de R$ 2.00\n", quantidade[5]);

    printf("MOEDAS:\n");
    printf("%d moeda(s) de R$ 1.00\n", quantidade[6]);
    printf("%d moeda(s) de R$ 0.50\n", quantidade[7]);
    printf("%d moeda(s) de R$ 0.25\n", quantidade[8]);
    printf("%d moeda(s) de R$ 0.10\n", quantidade[9]);
    printf("%d moeda(s) de R$ 0.05\n", quantidade[10]);
    printf("%d moeda(s) de R$ 0.01\n", quantidade[11]);
    return 0;
}

