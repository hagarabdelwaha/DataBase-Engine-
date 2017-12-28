#!/bin/bash
set -x
while true 
do
	echo "enter $fname"
	read fval
	if [[ $fval =~ ^[a-zA-Z]+$ ]]; then
		break
	elif [[ $fval =~ [^a-zA-Z0-9[[:space:]]] ]]; then
		echo "column name must be string"
	elif [[ $fval =~ ^[0-9]+$ ]]; then
		echo "column name must be string"
	fi
done

echo $fval
