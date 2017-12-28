#!/bin/bash

clear
echo "----------Welcome in my DataBase Engine-------- "
echo "---  Note :- spaces not acceptable in this engine  ---"

select choice in create_DataBase create_Table insert_into_table delete_table delete_row_in_table update_row_in_table display_table_data display_row_in_table  delete_database Exit
 
do
case $choice in
create_DataBase)
clear
echo "-----------Create New Database------------"
. ./createdb.sh 
 
#break
;;
create_Table)
clear
echo "-----------Create New Table------------"

. ./check_dbname.sh $db_name 
#break
;;
insert_into_table)
clear
echo "-----------Insert Data in Table------------"

. ./insert_into_table.sh
#break
;;
delete_table)
clear
echo "-----------Delete Table------------"
. ./delete_table.sh
#break
;;
delete_row_in_table)
clear
echo "-----------Delete Row in Table------------"

. ./delete_row_in_table.sh
#break
;;
update_row_in_table)
clear
echo "-----------Update Row in Table------------"

. ./update_row_in_table.sh
#break
;;
display_table_data)
clear
echo "-----------Display Table Data------------"

. ./display_tb.sh
#break
;;
display_row_in_table)
clear
echo "-----------Display Row From Table------------"

. ./display_rowpk.sh 
#. ./display_row_op.sh
#. ./display_row.sh
#break
;;
delete_database)
clear
echo "-----------Delete  Database------------"

. ./delete_db.sh
#break
;;
Exit)
echo "Thanks For Using My DataBase Engine :) "
exit
;;
*)
echo "--------this option not valid please select option from db list--------"
;;
esac
done
