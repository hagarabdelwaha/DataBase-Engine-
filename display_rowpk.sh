#!/bin/bash
#set -x
#!/bin/bash
#set -x
#display row from table

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
echo "row number= $n"
echo "-----------------------------------------------"
#echo "row datd :-   `head -$n $tb`"
sed  -n ${n}p  $tb
echo "-----------------------------------------------"
cd ../
else
echo " no row has this $k pk"
fi

 
else
 echo "table not found"
 fi            #end of check for tb
else
echo "no database found"
fi

   
