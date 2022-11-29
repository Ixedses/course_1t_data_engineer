#include <iostream>

int main() {
    
    int user_number;

    std::cout<<"Enter your number \n";
    std::cin>>user_number;

    int res = (user_number)%2;

    if(res==0)
    {
        std::cout<<"Your number is even \n";
    }

    else
    {
        std::cout<<"Your number is odd \n";
    }    

    return 0;
}