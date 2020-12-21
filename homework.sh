#!/bin/bash

if [ -z $1 ];
then
	echo "$0 + 'Source File'"
	exit
fi
touch -a "head.tx"
if [ -e $1 -a -r $1 -a -w "head.tx" ];
then
echo " $1     ----------------------------->>"
"head.tx"
for head in `cat $1|grep "#include"`
do
if [ "$head" == "#include" ];
then
		continue
else
	head=${head#*<}
	head=${head%>*}
	head=${head#*\"}
	head=${head%\"*}
	find ~ -name "${head}">>"head.tx"
	fi
done
touch -a "head.tx"
else
	
	echo "Source File or OBJ error"
exit
fi
