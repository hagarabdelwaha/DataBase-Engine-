#!/bin/bash

# insert into table 
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
                                  
 co=`cut -d' ' -f1  meta_$db|grep ^$tb` #check for tb in db
 if [ "$co" = "$tb" ]
 then
 echo "$co founded "
 . ./get_tb_info.sh $db $co  #co=tb
 else
 echo "table not found"
 fi            #end of check for tb


else
echo "no database found"
fi

