#!/bin/bash

read M
#echo $(($RANDOM%($max-$min+1)+$min))

echo `shuf -i 0-$M -n 1`

for i in `seq 1 $M`; do
r=`shuf -i 1-100 -n 1`
if [ $r -le 50 ]; then
	echo -n '*'
else
	echo -n ' '
fi
done
