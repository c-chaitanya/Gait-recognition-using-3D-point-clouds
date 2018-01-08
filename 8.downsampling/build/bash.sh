#!/bin/bash
declare -i var
var=1
cp /home/me/Desktop/pcl/dataset/8.concatnated_dataset/* ~/Desktop/pcl/8.downsampling/build

for i in {1..90}; do
    ./downsample $i.pcd
    mv Result.pcd /home/me/Desktop/pcl/dataset/9.8-downsampled/$var.pcd
    var=$((var+1))
done

var=0 
for i in {1..90}; do
    rm $i.pcd
done 
