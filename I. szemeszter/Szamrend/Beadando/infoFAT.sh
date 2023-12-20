#!/bin/bash

#Blokkok "tarolasa" fajlba:
if [ ! -f FAT.dat ]; then
        chars="HFS"
        length=$(( RANDOM % 10 + 1 ))
        file_content=""
        for (( i=0; i<$length; i++ )); do
                char=${chars:$(( RANDOM % ${#chars} )):1}
                file_content+=$char
        done
        echo $file_content > FAT.dat
fi
#  Listazas:
if [ $1 == "-lista" ]; then
        cat FAT.dat
fi

#  Szabad blokkok szamanak megjelenitese:
if [ $1 == "-szabad" ]; then
        echo "Szabad blokkok szama: $(fgrep -o "S" FAT.dat | wc -l)"
fi

#  Leghosszabb szabad blokksorozat:
if [ $1 == "-max" ]; then
        echo "Leghosszabb szabad blokksorozat: $(grep -o "S\+" FAT.dat | awk '{print length, $0}' | sort -n -r | head -n 1 | awk '{print $1}')"
fi

#  Foglalas
if [ "$1" == "-foglal" ]; then
        size=$2
        count=0
        file_content=$(cat FAT.dat)
        while read -n 1 block; do
        if [ "$block" == "S" ]; then
                ((count++))
                if [ $count -eq $size ]; then
                        charS='S'
                        charF='F'
                        Fstring=$(printf "%0.s$charF" $(seq 1 $count))
                        Sstring=$(printf "%0.s$charS" $(seq 1 $count))
                        file_content=${file_content/$Sstring/$Fstring}
                        echo "$file_content" > FAT.dat
                        echo "blokksorozat lefoglalva"
                        exit 0
                fi
        else
                count=0
        fi
        done <<< "$file_content"
        echo "nincs elegendo szabad hely"
fi