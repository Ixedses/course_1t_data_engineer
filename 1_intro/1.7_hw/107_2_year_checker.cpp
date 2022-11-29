#include <iostream>

int main() {
    
    int basic_year=2024;
    int user_year;

    std::cout<<"Enter the year \n";
    std::cin>>user_year;

    int diff = abs((basic_year - user_year)%4);

    if(diff==0)
    {
        std::cout<<"Year is leap year \n";
    }

    else
    {
        std::cout<<"Year is not leap year \n";
    }    

    return 0;
}