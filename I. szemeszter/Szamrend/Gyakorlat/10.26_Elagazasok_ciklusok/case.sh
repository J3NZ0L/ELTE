#!/bin/bash

if [ $# -eq 0 -o $# -gt 1 ]; then
echo "Hibas szamu parameter!"
echo "Hasznalat: $0 [ -d | -w | -l ]"
exit 1
fi

case "$1" in
-d)
date
;;
-w)
who
;;
-l)
ls
;;
*)
echo "Hibas parameter!"
echo "Hasznalat: $0 [ -d | -w | -l ]"
exit 1
;;
esac
