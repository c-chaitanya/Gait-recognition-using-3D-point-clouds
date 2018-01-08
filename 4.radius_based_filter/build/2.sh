#!/bin/bash
###############this is to perform same operation as above third time#############
declare -i var
for i in {1..15}; do
	for j in {1..6}; do
		var=0
		cp -r ~/Desktop/pcl/dataset/5.radius_based_filter/$i-$j/* /home/me/Desktop/pcl/4.radius_based_filter/build
        echo $i-$j
		for file in *pcd; do
    		./radius $var.pcd
    	    echo $var $i-$j
    		mv inliers.pcd ~/Desktop/pcl/dataset/5.radius_based_filter/$i-$j/$var.pcd
    		var=$((var+1))
		done

        for file in *pcd; do
        	rm $file
        done 
		j=$((j+1))
	done
	i=$((i+1))
done