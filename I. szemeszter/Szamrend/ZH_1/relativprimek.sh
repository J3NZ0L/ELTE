#!/bin/bash

read -p "Kerem, adjon meg egy szamot: " szamA

read -p "Kerem, adjon meg egy masik szamot: " szamB

are_relatively_prime() {
  a=$1
  b=$2

  while [ $b -ne 0 ]; do
    temp=$b
    b=$((a % b))
    a=$temp
  done

  if [ $a -eq 1 ]; then
    echo 1
  else
    echo 0
  fi
}

if [ "$(are_relatively_prime $szamA $szamB)" -eq 1 ]; then
  echo "A ket szam relatív primek, mivel nincs kozos osztojuk."
else
  echo "A ket szam nem relatív primek, mivel van kozos osztojuk."
fi
