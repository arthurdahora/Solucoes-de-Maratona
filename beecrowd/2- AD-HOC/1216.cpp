#include <iostream>
#include <string>
 
using namespace std;

int main() 
{
    int dist, cont = 0;
    string nome;
    double media =0;
    
    while(true)
    {
        getline(cin, nome);
        if((cin >> dist).eof())
        {
            break;
        }
        media = media + dist;
        cont++;
        cin.ignore();
    }
    media = media/cont;
    printf("%.1f\n", media);
    return 0;
}
