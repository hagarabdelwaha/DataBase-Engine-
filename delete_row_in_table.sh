#!/bin/bash
#set -x
#delete row from table

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
 echo " enter pk of row "
 read k
 
 pk=` grep ^$tb meta_$db|cut -d' ' -f3 ` # pk
 cd $db/

  r=` cut -d':' -f$pk $tb|grep -w -n  ^$k|cut -d':' -f2 `

  n=` cut -d':' -f$pk $tb|grep  -w -n  ^$k|cut -d':' -f1 `

if [[ $r = $k ]]
then

# n= `cut -d':' -f$pk $tb|grep  -w -n ^$k|cut -d':' -f1 `

echo "row number= $n"
#sed -i "/$rn/d"
echo "do you really want to delete this row ?"
select c in YES No
do
case $c in
YES)
sed  -i ${n}d $tb
echo "row deleted sucessfully"
cd ../
break
;;
NO)
echo "row still in $tb"
break
;;
*)
echo "choose option from list"
;;
esac
done

else
echo " no row has this $k pk"
fi
 
else
 echo "table not found"
 fi            #end of check for tb
else
echo "no database found"
fi

   
