#!/bin/bash

fileName=$1
project=$2

#A third and next variable if needed
variables=${@:3}

#Login to file
cd $fileName
# Throw the action
make &> /dev/null


if [ $? -gt 0 ]; then
     echo "compilation  memory leaks  thread race"
     echo " fail           fail           fail  "
     exit 7
 else
    comp=0

 
   valgrind --leak-check=full --error-exitcode=1 ./$project ${variables}  &> /dev/null
      if [ $? -gt 0 ]; then
          Memory=1
          else
          Memory=0
       fi

    
    valgrind --tool=helgrind --error-exitcode=1 ./$project ${variables}  &> /dev/null
    if [ $? -gt 0 ]; then
             Thread=1
             else
             Thread=0
      
    fi
  
  fi
  
  Answer="$Comp$MemoryLeake$ThreadRace"

   
    if [ $Answer -eq "000" ]; then
        
          echo "compilation  memory leaks  thread race"
          echo "   pass          pass           pass  "
          exit 0
    fi
    
    
    if [ $Answer -eq '001' ]; then
         
          echo "compilation  memory leaks  thread race"
          echo "   pass          pass           fail  "
          exit 1
    fi
    
    if [ $Answer -eq '010' ]; then
       
          echo "compilation  memory leaks  thread race"
          echo "   pass          fail          pass   "
          exit 2
    fi
    
    if [ $Answer -eq '011' ]; then
           
          echo "compilation  memory leaks  thread race"
          echo "   pass          fail         fail    "
          exit 3
    fi


