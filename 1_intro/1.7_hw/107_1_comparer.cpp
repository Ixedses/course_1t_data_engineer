#include <iostream>

int main() {
    
    int x, y;

    std::cout<<"Enter the first integer number \n";
    std::cin>>x;

    std::cout<<"Enter the second integer number \n";
    std::cin>>y;

    if(x>y)
    {
        std::cout<<"The first number is greater than the second \n";
    }

    else if(x<y)
    {
        std::cout<<"The second number is greater than the first \n";
    }

    else
    {
        std::cout<<"The numbers are equal \n";
    }    

    return 0;
}