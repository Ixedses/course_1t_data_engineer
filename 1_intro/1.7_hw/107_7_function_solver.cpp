#include <iostream>

int main()
{

    double x = -4;
    while(x!=4.5) 
    {
        double y = 2 * x * x - 5 * x - 8;
        std::cout<<x<<" - "<<y<<std::endl;
        x = x + 0.5;

    }

}