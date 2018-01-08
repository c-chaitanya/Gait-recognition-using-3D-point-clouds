#!/bin/bash
cd ~/Desktop/pcl/3.statistical_filter/build/
declare -i var
declare -i i
declare -i j
i=1
j=1
for i in {1..15}; do
	for j in {1..6}; do
		var=0
		cp -r ~/Desktop/pcl/dataset/4.statistical_filtered_dataset/$i-$j/* ~/Desktop/pcl/3.statistical_filter/build
		for file in *pcd; do
    		./statistical_filter $var.pcd
    	    echo $var $i-$j
    		mv inliers.pcd ~/Desktop/pcl/dataset/4.statistical_filtered_dataset/$i-$j/$var.pcd
    		var=$((var+1))
		done

        for file in *pcd; do
        	rm $file 
        done 
		j=$((j+1))
	done
	i=$((i+1))
done