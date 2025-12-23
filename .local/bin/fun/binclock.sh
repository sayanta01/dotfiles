#!/bin/bash

# symbols
onSymbol='o'
offSymbol='.'

# array of binary digits 0-9
binary=("0000" "0001" "0010" "0011" "0100" "0101" "0110" "0111" "1000" "1001")

# create grid
for i in {0..3}; do
	for j in {0..5}; do output="$output${binary[j]:i:1} "; done
	output="$output\n"
done

# change symbols
output="${output//0 /$offSymbol }"
output="${output//1 /$onSymbol }"
echo -e "$output"
date +%R
