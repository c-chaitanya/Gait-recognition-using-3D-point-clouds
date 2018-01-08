#!/bin/bash
 cp ~/Desktop/pcl/dataset/10.pca_dataset/* ~/Desktop/pcl/10.features/vfh/build
for i in {1..90}; do
    ./vfh $i.pcd
    mv feature.pcd ~/Desktop/pcl/dataset/features/vfh/$i.pcd
done
for i in {1..90}; do
    rm $i.pcd
done