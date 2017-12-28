#!/bin/bash
#set -x


#******************
db=$1
tb=$2

ppk=$3

cn=` grep ^$tb meta_$db|cut -d' ' -f2 `
pk=` grep ^$tb meta_$db|cut -d' ' -f3 ` # pk

typeset -i counter
typeset -i fnum
typeset -i tnum
typeset -i ccn

fnum=4
counter=1
tnum=$cn+4 #3+1
ccn=$cn+1
while [ $counter -lt  $ccn ]  #loop on columns
do
fname=` grep ^$tb meta_$db|cut -d' ' -f$fnum ` #column name
#check type of field
tname=` grep ^$tb meta_$db|cut -d' ' -f$tnum ` #column type

if [ $pk -eq $counter ]
then
#fpk=$fname
if [ "$tname" = "int" ]
then
 
cd $db/
echo -n $ppk":">>$tb
cd ../


#. ./ck_pint.sh $db $tb $fname $pk  

else [ "$tname" = "string" ]

cd $db/
echo -n $ppk":">>$tb
cd ../

fi

else
if [ "$tname" = "int" ]
then
. ./ck_int.sh $db $tb $fname 

else [ "$tname" = "string" ]
. ./ck_string.sh $db $tb $fname 
fi

fi
#cd $db/
#echo -n $fval":">>$tb
#cd ../

fnum=$fnum+1
counter=$counter+1
tnum=$tnum+1
done


#enter new line between each row
cd $db/
echo >>$tb
cd ../

