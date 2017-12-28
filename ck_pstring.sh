#!/ inn tb 

#set -x
db=$1
tb=$2
fname=$3
pk=$4
#fpk=` grep ^$tb meta_$db|cut -d' ' -f$4 `


#check string pk
while true 
do
        echo "enter $fname"
        read fval
        if [[ $fval =~ ^[a-zA-Z]+$ ]]; then
             
              cd $db/
               fpk=`cut -d':' -f$4 $tb|grep ^$fval`
               cd ../

            if [[  "$fval" = "$fpk"  ]]
            then
             echo "this field is primary key it must be uniq"
            else
                echo "$fname added successfully"
             break
           fi
        elif [[ $fval =~ [^a-zA-Z0-9[[:space:]]] ]]; then
                echo "column name must be string"
        elif [[ $fval =~ ^[0-9]+$ ]]; then
                echo "column name must be string"
        fi
done



#insert fval into tb


cd $db/
echo -n $fval":">>$tb
cd ../


