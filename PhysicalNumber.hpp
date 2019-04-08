#include <iostream>
#include "Unit.h"
#ifndef PHYSICALNUMBER_H
#define PHYSICALNUMBER_H
using namespace std;

namespace ariel {


   class PhysicalNumber
   {
            public:
            PhysicalNumber(double number, Unit value);    
            PhysicalNumber(const PhysicalNumber& _x);
            
            // onry operator
            
            PhysicalNumber operator+();
            PhysicalNumber operator-();
            
            // operator (+) && operator (-)
           
            const PhysicalNumber operator+(const PhysicalNumber&);
            const PhysicalNumber operator-(const PhysicalNumber&);
            PhysicalNumber& operator+=(const PhysicalNumber&);
            PhysicalNumber& operator-=(const PhysicalNumber&);
            
            // check equal by boolean operator
            
            bool operator== (const PhysicalNumber&);
            bool operator!= (const PhysicalNumber&);
            bool operator>= (const PhysicalNumber&);
            bool operator<= (const PhysicalNumber&);
            bool operator> (const PhysicalNumber&);
            bool operator< (const PhysicalNumber&);
            
            // promotion and subtraction operator
            
            PhysicalNumber operator++();
            PhysicalNumber operator++(int);
            PhysicalNumber operator--();
            PhysicalNumber operator++(int);
            
            // input && output
             
            friend istream& operator>> (istream& is, PhysicalNumber& c);
            friend ostream& operator<< (ostream& os, const PhysicalNumber& c);
            
            
            private:
            Unit value;
            double number;
     };
}
#endif 
