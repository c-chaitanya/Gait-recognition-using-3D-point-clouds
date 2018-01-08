#!/bin/bash
cd /home/me/Desktop/pcl/6_alligning_pcd/build
declare -i var
declare -i i
declare -i j
i=1
j=1
for i in {1..15}; do
	for j in {1..6}; do
		var=0
		cp -r /home/me/Desktop/pcl/dataset/6.remove_nan_dataset/$i-$j/* /home/me/Desktop/pcl/6_alligning_pcd/build/
        echo $i-$j
		for file in *pcd; do
    		./allign $var.pcd
    	    echo $var $i-$j
    		mv Result.pcd ~/Desktop/pcl/dataset/7.alligned_dataset/$i-$j/$var.pcd
    		var=$((var+1))
		done

        for file in *pcd; do
        	rm $file
        done 
		j=$((j+1))
	done
	i=$((i+1))
done