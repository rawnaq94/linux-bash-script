#!/bin/bash

fileName=$1
project=$2

#A third and next variable if needed
variables=${@:3}

#Login to file
cd $fileName

# Throw the action
make &> /dev/null

#Tracking and testing
compilation="PASS" 
memoryLeak="PASS"
threadRace="PASS"
Answer="$Comp$MemoryLeake$ThreadRace"

if [ $? -gt 0 ]; then
     echo "compilation  memory leaks  thread race"
     $compilation="FAIL"
     $memoryLeak="FAIL"
     $threadRace="FAIL"
     echo " fail           fail           fail  "
     exit 7
 else 
     
   comp=0
   
   valgrind --leak-check=full --error-exitcode=1 ./$project
            Memory=$?

   if [ Memory -eq 0 ]; then
     echo " Memory "
     echo " PASS "
     
    fi
    
    valgrind --tool=helgrind --error-exitcode=1 ./$project
           Thread=&?
    if [ Thread -eq 0 ]; then
             echo " Thread "
             echo " PASS "
           
    fi
    
   
    if [ $Answer -eq "000" ]; then
        
          echo "compilation  memory leaks  thread race"
          echo "   pass          pass           pass  "
          exit 0
    fi
    
    
    if [ $Answer -eq "001" ]; then
          $threadRace="FAIL"
          echo "compilation  memory leaks  thread race"
          echo "   pass          pass           fail  "
          exit 1
    fi
    
    if [ $Answer -eq "010" ]; then
          $memoryLeak="FAIL"
          echo "compilation  memory leaks  thread race"
          echo "   pass          fail          pass   "
          exit 2
    fi
    
    if [ $Answer -eq "011" ]; then
           $memoryLeak="FAIL"
           $threadRace="FAIL"
          echo "compilation  memory leaks  thread race"
          echo "   pass          fail         fail    "
          exit 3
    fi
    fi

