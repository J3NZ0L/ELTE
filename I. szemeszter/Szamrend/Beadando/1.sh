#!/bin/bash

N=$1

if [ ! -z $N ] && [ $N -ge 1 ] && [ $N -le 7 ]; then
N=$1
else
	until [ $N -ge 1 ] && [ $N -le 7 ]; do
		read N
	done
	exit 1	
fi

szum=0

for i in `seq 1 $N`; do
T=$(cat $(ls | grep 0$i)/orak | tail -n 1)
szum=$(($szum+$T))
done

echo $(($szum/$N))

