#!/bin/bash

#q parancs
#cuttal elso mezo
#-d a szokoz mimt elvalasztoojel
#who | cut -fl -d" " | sort -u

for  i in `who | cut -f1 -d " " | sort -u`
do
echo "$i bejelentkezett!"
done
