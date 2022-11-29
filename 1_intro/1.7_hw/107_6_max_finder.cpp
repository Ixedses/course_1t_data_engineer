#include <iostream>

int main()
{
    double max = 0.0;
    std::cout << "Enter numbers. To find biggest number press CTRL+Z and ENTER \n";
    // while(std::cin) 
    // {
    //     double t = 0.0;
    //     std::cin >> t;
    //     if(t > max) max = t;
    // }
    do
    {
        double t = 0.0;
        std::cin >> t;
        if(t > max) max = t;
    } while (std::cin);
    
 
    std::cout << "Max: " << max;
}