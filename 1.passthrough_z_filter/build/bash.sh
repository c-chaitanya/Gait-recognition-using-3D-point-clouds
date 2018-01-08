#!/bin/bash
cd ~/Desktop/pcl/1.passthrough_z_filter/build/
declare -i var
declare -i i
declare -i j
i=1
j=1
for i in {1..15}; do
	for j in {1..6}; do
		var=0
		cp -r /home/me/Desktop/pcl/dataset/1.original_dataset/$i-$j/* ~/Desktop/pcl/1/1.passthrough_z_filter/build/
        echo $i-$j
		for file in *pcd; do
    		./passthrough_filter $var.pcd
    	    echo $var $i-$j
    		mv Result.pcd ~/Desktop/pcl/dataset/2.passthrough_z_filtered_dataset/$i-$j/$var.pcd
    		var=$((var+1))
		done

        var=0 
        for file in *pcd; do
        	rm $var.pcd
        	var=$((var+1))
        done 
		j=$((j+1))
	done
	i=$((i+1))
done