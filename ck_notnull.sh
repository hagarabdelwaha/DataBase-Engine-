#!/bin/bash

#ck not null
while true
do
echo "enter database name"
read db
if [[ -z "$db" ]]
then
echo "you must enter database name"
else
break
fi
done


#ck not null
if [ -f meta_$db ]
then

while true
do
echo "enter table name"
read tb
if [[ -z "$tb" ]]
then
echo "you must enter table name"
else
break
fi
done

