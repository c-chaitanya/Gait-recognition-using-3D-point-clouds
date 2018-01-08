#!/bin/bash
for f in ESF/PCD/*
do
	# cat $f | tail -n +12   >> CSV/hist1.csv
	filename=$(basename "$f")
	filename="${filename%.*}"
	csv='.csv'
	pre='CSV/'
	name=$pre$filename$csv
	cat $f | tail -n +12   >> $name
	
done
