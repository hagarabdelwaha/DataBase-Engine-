#!/bin/bash
#delete db
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


if [ -f meta_$db ]
then
  rm meta_$db
  rm -r $db
else
echo "no database found"
fi


