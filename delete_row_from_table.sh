#!/bin/bash
#delete by row_num or pk of row

echo "choose the way to delete specific row "

select ch in delete_with_pk delete_with_row_num
case $ch do
delete_with_pk)
. ./delete_row_in_table.sh
break
;;
delete_with_row_num)
. ./delete_numrow.sh
break
;;
esac
done

