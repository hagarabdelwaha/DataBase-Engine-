#!/bin/bash
#delete row 
echo "choose a way to delete row "
select ch in delete_with_pk delete_with_rownum
do
case $ch in
delete_with_pk)
. ./delete_row_in_table.sh 
break
;;
delete_with_rownum)
. ./delete_numrow.sh
break
;;

esac
done

