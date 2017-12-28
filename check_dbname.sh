#!/bin/bash



#db=$1
#function check_dbname
#{
#if [ -d $db ]
#then
#echo "database exist,start to enter table info "
#echo "enter table name "
#read tb_name
#. ./createtable.sh $db $tb_name
#else
#echo "DataBase name is wrong please enter valid dbname"
#fi

#}

while true
do
echo "Enter database name"
read dbname
if [ -z "${dbname}" ]

then
echo "You must enter name of database"
else

if [ -d "${dbname}" ]
then
echo "Database exist,start to enter table info "

while true
do
echo "Enter table name "
read tb_name
if [ -z "${tb_name}" ]   #must enter name of tb
then
echo "You must enter name of New  Table"
else
                     #ck if table exist 
cd $dbname/
if [ -f $tb_name ]
then
echo "this table already exist"
cd ../
else
cd ../
. ./createtable.sh $dbname $tb_name
break

fi

fi
done

break
#. ./createtable.sh $dbname $tb_name

else
echo "DataBase name is wrong please enter valid dbname"
fi
fi
done

#check_dbname

