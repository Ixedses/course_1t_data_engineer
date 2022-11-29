#include <iostream>
#include <math.h>

int main() {
    
    float a, b, c;

    std::cout<<"Quadratic equation looks like a*x^2 + b*x + c = 0 \n";
    std::cout<<"To solve the equation, enter the coefficients a, b and c  \n";

    std::cout<<"Enter the coefficient a \n";
    std::cin>>a;
    std::cout<<"Enter the coefficient b \n";
    std::cin>>b;
    std::cout<<"Enter the coefficient c \n";
    std::cin>>c;

    if(a==0)
    {
        float x = - (c/b);
        std::cout<<"Your equation is not quadratic \n";
        std::cout<<"The solution of your equation is ";
        std::cout<<x;

    }

    else
    {
        float d = b*b - 4*a*c;
        if (d<0)
        {
            std::cout<<"Your equation has not any solutions \n";
        }
        else if (d==0)
        {
            float x = (-b)/(2*a);
            std::cout<<"The solution of your equation is ";
            std::cout<<x;
        }
        else
        {
            float x_1 = ((-b)+sqrt(d))/(2*a);
            float x_2 = ((-b)-sqrt(d))/(2*a);
            std::cout<<"Your equation has two solutions: \n";
            std::cout<<"The first solution of your equation is ";
            std::cout<<x_1;
            std::cout<<" \n";
            std::cout<<"The second solution of your equation is ";
            std::cout<<x_2;
        }
    }    

    return 0;
}