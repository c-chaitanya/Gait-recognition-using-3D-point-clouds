#!/bin/bash
cp /home/me/Desktop/temp/pca-text/* /home/me/Desktop/temp/
for i in {1..90}; do
	sed ':a;N;$!ba;s/,/ /g' $i.txt > result.txt
	mv result.txt /home/me/Desktop/temp/pca-text/$i.txt
done

for i in {1..90}; do
	rm $i.txt
done