#!/bin/bash
declare -i var
var=1
cp /home/me/Desktop/pcl/7.concatnate_pcds/build/1/* ~/Desktop/pcl/7.concatnate_pcds/build/
 
for i in {1..90}; do
    mv $i.txt CloudListout.txt
    ./concatnate
    mv Result.pcd /home/me/Desktop/pcl/dataset/8.concatnated_dataset/$var.pcd
    var=$((var+1))
done

var=0 
for i in {1..90}; do
    rm $i.txt
done 
