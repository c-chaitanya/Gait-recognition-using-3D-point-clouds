#!/bin/bash
cp /home/me/Desktop/temp/dataset/* /home/me/Desktop/temp/
for i in {1..90}; do
	tr -d '\n' < $i.txt > result.txt
	mv result.txt /home/me/Desktop/temp/dataset/$i.txt
done

for i in {1..90}; do
	rm $i.txt
done
