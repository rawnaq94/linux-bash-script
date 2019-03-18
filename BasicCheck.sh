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
$Answer=000

if [ $? -gt 0 ]; then
     echo "compilation  memory leaks  thread race"
     $compilation="FAIL"
     $memoryLeak="FAIL"
     $threadRace="FAIL"
     echo " fail           fail           fail  "
     $Answer=111
     exit 7
 else
    $Answer=000
    comp=0
 fi
 
   valgrind --leak-check=full --error-exitcode=1 ./$project ${variables}
            Memory=$?

   if [ Memory -eq 0 ]; then
     echo " Memory "
     echo " PASS "
     $Answer=101
    fi
    
    valgrind --tool=helgrind --error-exitcode=1 ./$project ${variables}
           Thread=&?
    if [ Thread -eq 0 ]; then
             echo " Thread "
             echo " PASS "
        $Answer=110   
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


