#!/bin/bash
#set -x

#update row in table

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

cd ../

if [[ $r = $k ]]
then

# n= `cut -d':' -f$pk $tb|grep  -w -n ^$k|cut -d':' -f1 `

echo "row number= $n"
echo "row datd :-   `head -$n $db/$tb`"

echo "do you really want to update this row ?"

select c in YES No
do
case $c in
YES)
. ./tb_update_row_info.sh $db $tb $k 
cd $db/
sed  -i ${n}d $tb
cd ../
echo "row updated sucessfully"
#cd ../
break
;;
No)
echo "row $n in table $tb not updated"
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

   
     
