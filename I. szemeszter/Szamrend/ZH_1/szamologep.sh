#!/bin/bash

if [ $# -eq 3 ]; then
	elsoszam=$1
	muvelet=$2
	masodikszam=$3

	case $muvelet in
		"+")
			echo "$elsoszam + $masodikszam" | bc
		;;
		"-")
			echo "$elsoszam - $masodikszam" | bc
		;;
		"*")
			echo "$elsoszam * $masodikszam" | bc
		;;
		"/")
			echo "scale=2; elsoszam / $masodikszam" | bc
		;;
	esac
else
	echo "Nem megfelelo szamu parameter"
fi

