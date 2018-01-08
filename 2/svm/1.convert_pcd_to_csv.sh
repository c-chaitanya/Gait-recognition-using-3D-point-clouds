#!/bin/bash
cp ~/Desktop/pcl/dataset/11.features/* ~/Desktop/pcl/2/svm/PCD/
for f in PCD/*
do
	# cat $f | tail -n +12   >> CSV/hist1.csv
	filename=$(basename "$f")
	filename="${filename%.*}"
	csv='.txt'
	pre='CSV/'
	name=$pre$filename$csv
	cat $f | tail -n +12   >> $name
done
cd ~/Desktop/pcl/2/svm/CSV/
for i in *txt; do
	mv $i ~/Desktop/pcl/2/svm/txt/
done