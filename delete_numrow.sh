#!/bin/bash
#delete with row number
echo "enter database name"
read db
if [ -f meta_$db ]
then
echo "enter table name"
read tb
                                       
 co=`cut -d' ' -f1  meta_$db|grep ^$tb` #check for tb in db
 if [ "$co" = "$tb" ]
 then
 echo "$co founded "
  cd $db/
typeset -i numrows
typeset -i nr
 numrows=` wc -l $tb|cut -d' ' -f1`
   
 cd ../
echo $numrows
  echo "what is the num of row you want to display?"
  read nr
  if [[ $nr -gt $numrows ]]
   then
   echo "$tb table not have this row " 
  elif [[ $nr -eq $numrows ]]
  then
     cd $db/
     echo "`sed -n /${nr}/d $tb`"
     cd ../ 
     echo "row $nr deleted sucessfully"
 else
     cd $db/
     echo "`sed -n /${nr}/d $tb`"
     cd ../
      echo "row $nr deleted sucessfully"
 
fi
else
 echo "table not found"
 fi            #end of check for tb
else
echo "no database found"
fi


