#include <iostream>

using namespace std;

int main()
{
    int H1, M1, H2, M2;

    int temporeal1, temporeal2;

    int H, M;

    cin >> H1 >> M1 >> H2 >> M2;

    temporeal2 = H2*60 + M2;
    temporeal1 = H1*60 + M1;
    
    if (temporeal2 <= temporeal1)   
    {
    temporeal2 += 24 * 60;
    }

    H = (temporeal2 - temporeal1)/60;
    M = (temporeal2 - temporeal1)%60;

    printf("O JOGO DUROU %d HORA(S) E %d MINUTO(S)\n", H, M);


}