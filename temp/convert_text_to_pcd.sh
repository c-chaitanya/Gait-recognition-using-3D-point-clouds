#!/bin/bash
mv /home/me/Desktop/temp/pca-text/* /home/me/Desktop/temp/
for i in {1..90}; do
	sed -i '1i # .PCD v0.7 - Point Cloud Data file format' $i.txt
	sed -i '2i VERSION 0.7' $i.txt
	sed -i '3i FIELDS x y z' $i.txt
	sed -i '4i SIZE 4 4 4' $i.txt
	sed -i '5i TYPE F F F' $i.txt
	sed -i '6i COUNT 1 1 1' $i.txt
	sed -i '7i WIDTH 132184' $i.txt
	sed -i '8i HEIGHT 1' $i.txt
	sed -i '9i VIEWPOINT 0 0 0 1 0 0 0' $i.txt
	sed -i '10i POINTS 132184' $i.txt
	sed -i '11i DATA ascii'  $i.txt
	mv $i.txt /home/me/Desktop/temp/pca-text/
done
