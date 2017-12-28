#!/bin/bash
dbnm=$1
table_name=$2

#cd $dbnm/
#if [ -f $table_name ]
#then
#echo "this table already exist"
#else
typeset -i numofcols
#echo "enter number of columns "
#cd ../
#read numofcols


while true                                        # [[ $numofcols -eq 0 ]] # [[ {$numofcols} =~ ^[0-9]+$ ]]  #check not null
do
echo " enter number of table columns"
read numofcols

if [[ $numofcols =~ ^[1-9][0-9]*$ ]]
then
echo "num of cols = $numofcols"
break
else
echo "you must enter num of cols "
fi

done

. ./select_columns.sh $numofcols $table_name $dbnm

cd $dbnm/
touch $table_name
echo "table created sucssesfully"
cd ../
#fi



