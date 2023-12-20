#!/bin/bash
file="$1"
n="$2"

sorted=$(cat "$file" | sort);
echo "$sorted" | head -n "$n";
echo "$sorted" | tail -n "$n";
