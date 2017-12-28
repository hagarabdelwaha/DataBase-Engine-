#!/bin/bash
###set -x
db=$1
tb=$2
fname=$3
pk=$4

#cd $db/
#fpk=` grep ^$tb|cut -d' ' -f$4 `
#cd ../

#check int pk
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

cd $db/
#typeset -i fpk
fpk=` cut -d':' -f$4  $tb|grep ^$fval`
#cd ../

#if [[  $fval = $fpk  ]]
if [[  `cut -d':' -f$4  $tb|grep ^$fval` = $fval ]]
then
echo "this field is primary key it must be uniq"
cd ../
else
echo "$fname added successfully"
cd ../
break
fi  
fi
done
    
#enter value in tb 
cd $db/
echo -n $fval":">>$tb
cd ../

