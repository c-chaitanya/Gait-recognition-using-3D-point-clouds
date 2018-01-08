#!bash/bin
 cp ~/Desktop/pcl/dataset/10.pca_dataset/* ~/Desktop/pcl/10.features/fpfh/build
for i in {1..90}; do
    ./fpfh $i.pcd
    mv feature.pcd ~/Desktop/pcl/dataset/features/fpfh/$i.pcd
done
for i in {1..90}; do
    rm $i.pcd
done