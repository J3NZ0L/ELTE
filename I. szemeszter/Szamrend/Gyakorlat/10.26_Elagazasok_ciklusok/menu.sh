#!/bin/bash
until
echo Valasszon programot!
echo
echo 1 Bejelentkezett rfelhasznalok
echo 2 5 szam pssueadasa
echo 3 Kilepes
echo 
read szam
[ $szam -eq 3 ]
do
case $szam in
1) who
;;
2) source while.sh
;;
3) exit
;;
*)
echo "Rossz opcio!"
;;
