#!/bin/bash
 cp ~/Desktop/pcl/dataset/10.pca_dataset/* ~/Desktop/pcl/10.features/cvfh/build
for i in {1..90}; do
    ./cvfh $i.pcd
    mv feature.pcd ~/Desktop/pcl/dataset/features/cvfh/$i.pcd
done
for i in {1..90}; do
    rm $i.pcd
done