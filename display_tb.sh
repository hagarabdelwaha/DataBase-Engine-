#!/bin/bash

#!/bin/bash
#delete_table




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

echo "--------------Data of $tb--------------" 
cd $db/
cat  $tb
cd ../

else
 echo "table not found "
 fi            #end of check for tb
else
echo "no database found"
fi

