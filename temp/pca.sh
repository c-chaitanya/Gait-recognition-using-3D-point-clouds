#!/bin/bash
cp /home/me/Desktop/temp/CSV/* /home/me/Desktop/temp/
for i in {1..90}; do
	python pca.py $i.csv $i.txt
done

for i in {1..90}; do
	rm $i.csv
done

for i in {1..90}; do
	mv $i.txt /home/me/Desktop/temp/pca-text/
done