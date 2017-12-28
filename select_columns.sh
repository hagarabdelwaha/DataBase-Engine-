#!/bin/

#set -x
dbn=$3
typeset -i ii=0
no_cols=$1
tbn=$2
#********************************

function colmns_type 
{
select ch in int string
do
case $ch in
int)
cols_type[$ii]=int
break
;;
string)
cols_type[$ii]=string
break
;;
*)
echo " please choose valid num"
;;
esac
done
    
}
 #***************


#********
function select_columns
{

while (($ii<$1 ))
do
let nl=$ii+1

while true
do
echo "enter name  of column $nl "
read cname
if [ -z "$cname" ]
then
echo "You must enter  column name "
elif [[ ${cname} =~ ^[0-9]+ ]]
then
echo "column name must start with character"
else
  if [[ $ii -gt 0   ]]
  then 
  
  typeset -i index
      index=$ii-1
  ckc=${cols_name[$index]} 
  if [[ "$cname" != "$ckc"  ]]
  then
   break 
  else
  echo "column must not have the same name of another column ,please enter different name"
  
  fi
  else
  break
  fi
fi
done
#//
cols_name[$ii]=$cname
echo "select data type of column $nl "
colmns_type 
ii=$ii+1
#continue
done

}


#**************************************
function sel_pk
{
typeset -i i=1
typeset -i pk_num
clear
echo "---------Table Columns---------"
for n in ${cols_name[@]}
do
echo "$i- $n"
i=$i+1 
done
echo "-----------------------------"

while true    # check not null
do
echo "enter num of primary key"
read pk_num

if [[ $pk_num =~ ^[1-9][0-9]*$ ]]
then
let cp=$no_cols+1
                 #ck pk is in range of colnums
if [[ $pk_num -gt $no_cols ]]
then
echo  "table dont have column with this num please enter valid num for pk"
elif [[ $pk_num -lt 0   ]]
then
echo  "table dont have column with this num please enter valid num for pk"
else
echo " ---pk=$pk_num--- "
break
fi

else
echo "you must enter num of primary key "
fi
done

p_key=$pk_num
}

#calling of functions

select_columns $1

sel_pk

echo -n $tbn" ">>meta_$dbn   #table name
echo -n $no_cols" ">>meta_$dbn #num of cols 
echo -n $p_key" " >>meta_$dbn #pk

line=${cols_name[@]} #name of columns
echo -n $line>> meta_$dbn

echo -n " ">>meta_$dbn

tline=${cols_type[@]} #type of columns
echo  $tline>> meta_$dbn


