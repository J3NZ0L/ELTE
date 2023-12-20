#!/bin/bash

if [ $# -eq 1 ]; then
num=$1;
i=1;
while [ $i -lt $num ];
do
num=`expr $num \* $i`;
i=`expr $i + 1`;
done
echo $num
else
echo Hibas parameterezes
fi


