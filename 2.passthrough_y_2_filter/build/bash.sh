#!/bin/bash
declare -i var
declare -i i
declare -i j
i=1
j=1
for i in {1..15}; do
	for j in {1..6}; do
		var=0
		cd ~/Desktop/pcl/2.passthrough_y_2_filter/build
        cp -r ~/Desktop/pcl/dataset/2.passthrough_z_filtered_dataset/$i-$j/* ~/Desktop/pcl/2.passthrough_y_2_filter/build/
        echo $i-$j
        for file in *pcd; do
    		./passthrough_filter $var.pcd
    	    echo $var $i-$j
           	mv Result.pcd /home/me/Desktop/pcl/dataset/3.passthrough_y_filtered_dataset/$i-$j/$var.pcd
    	    var=$((var+1))
		 done   
    ###################################################removing files###############################
        echo removing files
        for file in *pcd; do
        	rm $file
        done
        ###############finished deleting files##################
		j=$((j+1))
	done
	i=$((i+1))
done
