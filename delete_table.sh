#!/bin/bash
#delete_table
echo "enter database name"
read db
if [ -f meta_$db ]
then
echo "enter table name"
read tb
                                       
 co=`cut -d' ' -f1  meta_$db|grep ^$tb` #check for tb in db
 if [ "$co" = "$tb" ]
 then
 echo "do you really want to delete $co ?"
select c in YES No
do
case $c in
YES)
sed -i "/^$tb/d" meta_$db
cd $db/
rm $tb
cd ../

echo "table deleted successfully"
break
;;
NO)
echo "table not deleted"
break
;;
esac
done                #delete table
else
 echo "table not found "
 fi            #end of check for tb
else
echo "no database found"
fi

