#!/bin/bash
cp /home/me/Desktop/temp/text/* /home/me/Desktop/temp/
for i in {1..90}; do
	python convert_txt_to_csv.py $i.txt $i.csv
done

for i in {1..90}; do
	rm $i.txt
done

for i in {1..90}; do
	mv $i.csv /home/me/Desktop/temp/CSV
done