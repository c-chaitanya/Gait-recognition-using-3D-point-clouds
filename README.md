# Gait-recognition-using-3D-point-clouds

This code is for the linux version of PCL edited using sublime text.

Download my dataset from https://www.dropbox.com/s/h8yf34s0vhs2bmq/original_dataset.rar but it is advised that you create your own using the openni framework. Just make sure that you change the code accordingly if the kinect model is not 1004 model and make sure that there is no sunlight while gatering data.

Bash scripts were used to automate everything(read bash script to understand the flow of execution).

also compile all the cmake file by using commands cmake .. and make

General Understanding of project.
Dataset was collected using a kinect 1004 model with openni framework.
1)This point clouds collected were filtered using various filters a)passthrough_z_filter b)passthrough_y_filter c)statistical filter and d)radius based filter
2)NaN's were removed and the point clouds were alligned to their centroids.
3)point clouds of each gait sequence were concatnated.
4)downsamling was performed
5)Features were extracted
6)PCA
6)classification
