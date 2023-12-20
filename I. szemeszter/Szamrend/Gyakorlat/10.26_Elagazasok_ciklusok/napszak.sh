#!/bin/bash

ora=$(date +%H)

echo "$ora"

if [ $ora -gt 6 -a $ora -lt 10 ]; then
echo "DEleleott"
elif [ $ora -gt 10 -a $ora -lt 18 ]; then
echo "Delutan"
else
echo "Este"
fi
