#!/bin/bash
#display row
echo "choose a way to display row "
select ch in display_with_pk display_with_rownum
do
case $ch in
display_with_pk)
. ./display_rowpk.sh
break
;;
display_with_rownum)
. ./display_row.sh
break
;;

esac
done


