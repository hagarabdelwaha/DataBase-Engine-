#!/bin/bash

function sel_pk
{
typeset -i i=0
typeset -i n=0
typeset -i pk_num
for i in cols_name[$1]
do
echo " $i" 
echo "$cols_name[$i]"
done

read pk_num

while (($n<$1))
do
if [ $pk_num eq $n ]
then
p_key=$cols_name[$n]
else
n=$n+1
fi
done
}


sel_pk
echo "pk = $p_key "
