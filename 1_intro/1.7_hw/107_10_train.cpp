#include <iostream>
#include <string>
#include <array>
#include <algorithm>

using std::string;
using std::cout;
using std::endl;
using std::count;
using std::begin;
using std::end;

class Train
{
public:    
    int train_number;
    string destination;
    string departure;
};

int main(){

    Train number_1;
    number_1.train_number = 62861;
    number_1.destination = "Mordor";
    number_1.departure = "12:00";

    Train number_2;
    number_2.train_number = 62861;
    number_2.destination = "The Shire";
    number_2.departure = "10:00";

    Train number_3;
    number_3.train_number = 98475;
    number_3.destination = "The Shire";
    number_3.departure = "06:00";

    Train number_4;
    number_4.train_number = 21001;
    number_4.destination = "Edoras";
    number_4.departure = "17:00";

    Train number_5;
    number_5.train_number = 67931;
    number_5.destination = "Minas Tirith";
    number_5.departure = "18:00";

    Train train_arr[5] ={
        number_1, number_2, number_3,
        number_4, number_5
        };
    
   
    cout<<"What do you want, sorted list or train info?"<<endl;
    cout<<"If you want sorted list, printed 'sort' and press ENTER"<<endl;
    cout<<"If you want train info, printed 'info' and press ENTER"<<endl;

    string command_1;
    std::cin>>command_1;

    if (command_1 == "sort"){
        cout<<"What do you want, sorted list by train number or by destination?"<<endl;
        cout<<"If you want sorted list by train number, printed 'number' and press ENTER"<<endl;
        cout<<"If you want sorted list by train destination, printed 'destination' and press ENTER"<<endl;

        string command_2;
        std::cin>>command_2;
        if (command_2 == "number") 
        {

            cout<<"List of trains after sorting by train's number"<<endl;

            for (int i = 0; i < 4; i++) {
                for (int j = 0; j < 4 - i ; j++) {
                    if (train_arr[j].train_number > train_arr[j + 1].train_number) {
                        Train temp = train_arr[j];
                        train_arr[j] = train_arr[j + 1];
                        train_arr[j + 1] = temp;
                    }
                }
            }

            for (int i = 0; i<5; i++) {

                cout<<"Train number "<<train_arr[i].train_number<<" to "<<train_arr[i].destination<<" depart at "<<train_arr[i].departure<<endl;

            }
;
        }

        else if (command_2 == "destination") 
        {

            cout<<"List of trains after sorting by destination"<<endl;

            for (int i = 0; i < 4; i++) {
                for (int j = 0; j < 4 - i ; j++) 
                {
                    if (train_arr[j].destination > train_arr[j + 1].destination) 
                    {
                        Train temp = train_arr[j];
                        train_arr[j] = train_arr[j + 1];
                        train_arr[j + 1] = temp;
                    }

                    else if (train_arr[j].destination == train_arr[j + 1].destination) 
                    {

                        if (train_arr[j].departure > train_arr[j + 1].departure) {
                        Train temp = train_arr[j];
                        train_arr[j] = train_arr[j + 1];
                        train_arr[j + 1] = temp;
                    }

                    }
                }
            }

            for (int i = 0; i<5; i++) {

                cout<<"Train number "<<train_arr[i].train_number<<" to "<<train_arr[i].destination<<" depart at "<<train_arr[i].departure<<endl;
            }
        }

        else 
        {
            cout<<"I don't know what you want";
        }
    }

    else if (command_1 == "info")
    {
        cout<<"Print the number of train and press ENTER"<<endl;
        int number_of_train;
        std::cin>>number_of_train;

        int checker = 0;

        for (int i = 0; i<5; i++) {

            if (train_arr[i].train_number == number_of_train)
            {

                cout<<"Train number "<<train_arr[i].train_number<<" to "<<train_arr[i].destination<<" depart at "<<train_arr[i].departure<<endl;

                checker = 0;
                
            }

            else 
            {
                checker += 1;
            }
        }

        if (checker > 4) 
        {
            cout<<"There a no such train number in list";
        }



    }

    else {cout<<"I don't know what you want";}


   


}