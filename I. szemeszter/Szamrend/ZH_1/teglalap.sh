#!/bin/bash

oldalA=$1
oldalB=$2

terulet=$(echo "$oldalA * $oldalB" | bc)
kerulet=$(echo "2 * ($oldalA + $oldalB)" | bc)

for (( i = 1; i <= $oldalB; i++ )); do
    for (( j = 1; j <= $oldalA; j++ )); do
            echo -n "* "
    done
    echo
done
echo "T: $terulet K:$kerulet"
