#!/bin/bash
#!/bin/bash
 cp ~/Desktop/pcl/dataset/10.pca_dataset/* ~/Desktop/pcl/10.features/esf/build
for i in {1..90}; do
    ./esf $i.pcd
    mv feature.pcd ~/Desktop/pcl/dataset/features/esf/$i.pcd
done
for i in {1..90}; do
    rm $i.pcd
done