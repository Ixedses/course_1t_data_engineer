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



class Student
{
public:    
    string name;
    string group;
    int perfomance[5];
    double SrBal()
    {
        double srBal = 0.0;
        for (int i = 0; i < 5; i++)
        {
            srBal += perfomance[i];
        }
        return srBal / 5;
    }

};


int main()
{
    Student number_1;
    number_1.name = "Potter, H. J.";
    number_1.group = "Gr";
    number_1.perfomance[0]  = 3;
    number_1.perfomance[1]  = 4;
    number_1.perfomance[2]  = 4;
    number_1.perfomance[3]  = 5;
    number_1.perfomance[4]  = 4;

    Student number_2;
    number_2.name = "Granger, H. J.";
    number_2.group = "Gr";
    number_2.perfomance[0]  = 5;
    number_2.perfomance[1]  = 5;
    number_2.perfomance[2]  = 5;
    number_2.perfomance[3]  = 4;
    number_2.perfomance[4]  = 5;

    Student number_3;
    number_3.name = "Weasley, R. B.";
    number_3.group = "Gr";
    number_3.perfomance[0]  = 3;
    number_3.perfomance[1]  = 3;
    number_3.perfomance[2]  = 5;
    number_3.perfomance[3]  = 5;
    number_3.perfomance[4]  = 3;

    Student number_4;
    number_4.name = "Lovegood, L.";
    number_4.group = "Rav";
    number_4.perfomance[0]  = 5;
    number_4.perfomance[1]  = 4;
    number_4.perfomance[2]  = 4;
    number_4.perfomance[3]  = 5;
    number_4.perfomance[4]  = 5;

    Student number_5;
    number_5.name = "Patil, P.";
    number_5.group = "Rav";
    number_5.perfomance[0]  = 4;
    number_5.perfomance[1]  = 4;
    number_5.perfomance[2]  = 3;
    number_5.perfomance[3]  = 5;
    number_5.perfomance[4]  = 4;

    Student number_6;
    number_6.name = "Chang, C.";
    number_6.group = "Rav";
    number_6.perfomance[0]  = 4;
    number_6.perfomance[1]  = 4;
    number_6.perfomance[2]  = 5;
    number_6.perfomance[3]  = 5;
    number_6.perfomance[4]  = 4;

    Student number_7;
    number_7.name = "Marcus, F.";
    number_7.group = "Sl";
    number_7.perfomance[0]  = 4;
    number_7.perfomance[1]  = 4;
    number_7.perfomance[2]  = 3;
    number_7.perfomance[3]  = 5;
    number_7.perfomance[4]  = 4;

    Student number_8;
    number_8.name = "Malfoy, D.";
    number_8.group = "Gr";
    number_8.perfomance[0]  = 5;
    number_8.perfomance[1]  = 4;
    number_8.perfomance[2]  = 4;
    number_8.perfomance[3]  = 5;
    number_8.perfomance[4]  = 3;

    Student number_9;
    number_9.name = "Diggory, S.";
    number_9.group = "Huf";
    number_9.perfomance[0]  = 4;
    number_9.perfomance[1]  = 4;
    number_9.perfomance[2]  = 4;
    number_9.perfomance[3]  = 4;
    number_9.perfomance[4]  = 5;

    Student number_10;
    number_10.name = "Macmillam, E.";
    number_10.group = "Huf";
    number_10.perfomance[0]  = 3;
    number_10.perfomance[1]  = 4;
    number_10.perfomance[2]  = 4;
    number_10.perfomance[3]  = 3;
    number_10.perfomance[4]  = 4; 

    Student stud_arr[10] ={
        number_1, number_2, number_3,
        number_4, number_5, number_6,
        number_7, number_8, number_9,
        number_10
        };
    
   
    cout<<"Array before sorting"<<endl;

    for (int i = 0; i<10; i++) {

        cout<<stud_arr[i].name<<" from group "<<stud_arr[i].group<<" has mean grade "<<stud_arr[i].SrBal()<<endl;

    }
    


    for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 9 - i ; j++) {
            if (stud_arr[j].SrBal() > stud_arr[j + 1].SrBal()) {
                Student temp = stud_arr[j];
                stud_arr[j] = stud_arr[j + 1];
                stud_arr[j + 1] = temp;
            }
        }
    }

    cout<<"Array after sorting"<<endl;

    for (int i = 0; i<10; i++) {

        cout<<stud_arr[i].name<<" from group "<<stud_arr[i].group<<" has mean grade "<<stud_arr[i].SrBal()<<endl;

    }

    cout<<"Array of students without 3"<<endl;    
    for (int i = 0; i<10; i++) {

        bool exists = count(begin(stud_arr[i].perfomance), end(stud_arr[i].perfomance), 3) == 0;

        if (exists) {
            cout<<stud_arr[i].name<<" from group "<<stud_arr[i].group<<endl;
        }

    }
    


}
