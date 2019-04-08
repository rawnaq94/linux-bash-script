// Partial realization --- Part 1

#include <iostream>
#include "PhysicalNumber.hpp"
#include <exception>
#include <math.h>
using namespace std;
using namespace ariel;

// copy constructor

PhysicalNumber::PhysicalNumber(double number, Unit value)
{
     this->number = number;
     this->value = value;
}


PhysicalNumber::PhysicalNumber(const PhysicalNumber& _x)
{
     this->number = _x.number;
     this->value = _x.value;
}

// onry operator
 
PhysicalNumber PhysicalNumber::operator+(){ return *this; }
PhysicalNumber PhysicalNumber::operator-(){ return *this; }


// operator (+) && operator (-)

const PhysicalNumber PhysicalNumber::operator+(const PhysicalNumber& pn)
{
      double num = number;
      return PhysicalNumber(num,value);
}


const PhysicalNumber PhysicalNumber::operator-(const PhysicalNumber& pn)
{
      double num = number;
      return PhysicalNumber(num,value);
}


PhysicalNumber& PhysicalNumber::operator+=(const PhysicalNumber& pn){ return *this; }
PhysicalNumber& PhysicalNumber::operator-=(const PhysicalNumber& pn){ return *this; }
 
 
 // check equal by boolean operator 
       
bool PhysicalNumber::operator== (const PhysicalNumber& pn){ return false; }
bool PhysicalNumber::operator!= (const PhysicalNumber& pn){ return false; }
bool PhysicalNumber::operator>= (const PhysicalNumber& pn){ return false; }
bool PhysicalNumber::operator<= (const PhysicalNumber& pn){ return false; }
bool PhysicalNumber::operator> (const PhysicalNumber& pn){ return false; }
bool PhysicalNumber::operator< (const PhysicalNumber& pn){ return false; }


// promotion and subtraction operator

PhysicalNumber PhysicalNumber::operator++(){ return *this; }
PhysicalNumber PhysicalNumber::operator--(){ return *this; }
PhysicalNumber PhysicalNumber::operator--(int){ return *this; }
PhysicalNumber PhysicalNumber::operator++(int)
{
     PhysicalNumber _x(*this);
     return *this;
}


 // input && output
 
istream &ariel::operator>> (istream& is, PhysicalNumber& c){ return is; }
ostream &ariel::operator<< (ostream& os, const PhysicalNumber& c){ return os; }
