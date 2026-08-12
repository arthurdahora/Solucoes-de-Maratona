#include <iostream>

using namespace std;
 
int main() 
{
    double N1, N2, N3, N4;
    double media;
    double Nexame, Mexame;
    
    cin >> N1 >> N2 >> N3 >> N4;
    
    N1 = N1*2;
    N2 = N2*3;
    N3 = N3*4;
    
    media = (N1+N2+N3+N4)/10;
    
    printf("Media: %.1f\n", media);
    
    if(media>=7.0)
    {
        printf("Aluno aprovado.\n");
    }
    
    if(media<5.0)
    {
        printf("Aluno reprovado.\n");
    }
    if(media>=5.0 && media <=6.9)
    {
        printf("Aluno em exame.\n");
        
        cin >> Nexame;
        
        printf("Nota do exame: %.1f\n", Nexame);
        
        Mexame = (media + Nexame)/2;
        
        if(media>=5.0)
        {
            printf("Aluno aprovado.\n");
        }
        else
        {
            printf("Aluno reprovado.\n");
        }
        printf("Media final: %.1f\n", Mexame);
    }
    
    return 0;
}