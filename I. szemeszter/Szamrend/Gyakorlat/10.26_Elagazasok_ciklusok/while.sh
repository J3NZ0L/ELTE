#!/bin/bash

i=1;

while [ $i -le 5 ]
do
echo "Hajra Fradi!"
i=$((i+1));
done

echo "----------------------"

sum=0;
count=0;

echo "Kerem adjon meg 5 szamot: "

while [ $count -lt 5 ]; do
read number
sum=`expr $sum + $number`
count=`expr $count + 1`
done

echo "A szamok osszege: $sum"
