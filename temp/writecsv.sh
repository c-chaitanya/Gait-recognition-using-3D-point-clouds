#!/bin/bash
for f in pcd/*
do
	# cat $f | tail -n +12   >> CSV/hist1.csv
	filename=$(basename "$f")
	filename="${filename%.*}"
	csv='.txt'
	pre='text/'
	name=$pre$filename$csv
	cat $f | tail -n +12   >> $name
	
done
