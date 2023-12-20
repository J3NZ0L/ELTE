#!/bin/bash

# Listazas
if [ "$1" -eq "-lista" ]; then
  cat FAT.dat
fi

# Szabad blokkok szamanak megjelenitese
if [ "$1" -eq "-szabad" ]; then
  #szabad=$(grep -o "S" FAT.dat | wc -l)
  #echo "Szabad blokkok száma: $szabad"
  #echo "Szabad blokkok szama: $(fgrep -o "S" FAT.dat | wc -l)"
fi

# Leghosszabb szabad blokksorozat
if [ "$1" == "-max" ]; then
  max=$(grep -o "S\+" FAT.dat | awk '{print length, $0}' | sort -n -r | head -n 1 | awk '{print $1}')
  echo "A leghosszabb szabad blokksorozat hossza: $max"
fi

# Foglalás
if [ "$1" == "-foglal" ]; then
  meret=$2
  while read -r line; do
    if [[ $line == *S* ]]; then
      if [[ $(echo $line | grep -o "S" | wc -l) -ge $meret ]]; then
        echo $line | sed "s/S/F/$meret" | tee FAT.dat > /dev/null
        echo "Sikeres foglalás: $meret blokk"
        exit 0
      fi
    fi
  done < FAT.dat
  echo "Hiba: Nincs elegendő szabad blokk."
fi

if [ $1 == "-foglal" ]; then
    free_sequence=$(grep -o 'S*' "FAT.dat" | awk '{print length, $0}' | sort -nr | awk -v size="$2" '$1 >= size {print $0}' | head -n 1)
    
    if [ -n "$free_sequence" ]; then
        start_block=$(echo "$free_sequence" | awk '{$1=""; print $0}' | head -c 1)
        end_block=$((start_block + $2 - 1))
        
        sed -i "${start_block},${end_block}s/S/F/" "FAT.dat"
        
        echo "Blokkok foglalva: $start_block - $end_block"
        cat FAT.dat
    else
        echo "Nincs elegendő szabad hely a megadott méretű blokksorozathoz."
    fi
fi
