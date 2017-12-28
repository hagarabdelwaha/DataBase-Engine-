#!/bin/bash

echo " NOTE:-DataBase name mustnot have space"
while true
do

echo "enter database name"
read dbname
if [ -z "${dbname}" ]
then
echo "you must enter name of database"
else
if [ -d "$dbname" ]
then
echo "this DataBase already exist"
else
mkdir $dbname
touch meta_$dbname
echo "DataBase created sucssesfully"
break
fi

fi
done
