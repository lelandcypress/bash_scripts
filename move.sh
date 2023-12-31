#!/bin/bash

##storing directory paths in variables to improve readability
FILE1=~/Desktop/file1.txt
FILE2=~/Desktop/file2.txt
FILE3=~/Desktop/file3.txt
FILE4=~/Desktop/file4.txt
LogFile=~/Desktop/move.log
dt=$(date '+%d/%m/%Y %H:%M:%S')

##storing stage 2 (the swap back) in a function to improve readability of code
stage_two(){
    read -p "Do you wish to continue?" yn
    case $yn in 
        ['Yy']* ) 
            mv $FILE2 $FILE1 && mv $FILE4 $FILE3;;
        ['Nn']* ) 
            echo "Exiting"
            exit ;; 
        *) echo "Please select yes or no" 
    esac
    echo "Files swapped back" 
}
##Script inits here, starts by verifying files exist, then executes first series of moves. 
if [ -f "$FILE1" -a -f "$FILE3" ]; 
    then 
        mv $FILE1 $FILE2 && mv $FILE3 $FILE4;
        echo "Files Swapped";  
        stage_two;
    else
        echo "Files not found"
fi

echo "$dt" > $LogFile 