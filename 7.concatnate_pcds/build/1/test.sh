#!/bin/bash
declare -i var
var=2
j=2
for i in {2..90}; do
	j=$((j+1))
	cp $var.txt $j.txt
done
