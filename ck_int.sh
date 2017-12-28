#!/bin/bash
#set -x
db=$1
tb=$2
fname=$3

while true 
do
echo "enter $fname"
read fval
if [[ $fval =~ ^[a-zA-Z]+$ ]]
then
echo "column name must be number"
elif [[ $fval =~ [^a-zA-Z0-9[[:space:]]] ]]
then
echo "column name must be number"
elif [[ $fval =~ ^[0-9]+$ ]] 
then
break
fi
done

#enter value in tb
cd $db/
echo -n $fval":">>$tb
echo " $fname added sucessfully"
cd ../

