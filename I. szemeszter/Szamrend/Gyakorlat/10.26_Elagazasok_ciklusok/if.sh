#!/bin/bash

echo "Adj meg egy szamot! "
read szam;

if [ $szam -lt 10]; then
echo "kisebb mint 10"
elif[ $szam -eq 10]; then
echo "egyenlo 10"
else echo "A szam nagyobb mint 10"
fi
