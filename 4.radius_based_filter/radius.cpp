#include <pcl/io/pcd_io.h>
#include <pcl/filters/radius_outlier_removal.h>

int
main(int argc, char** argv)
{
	// Objects for storing the point clouds.
	pcl::PointCloud<pcl::PointXYZ>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZ>);
	pcl::PointCloud<pcl::PointXYZ>::Ptr filteredCloud(new pcl::PointCloud<pcl::PointXYZ>);

	// Read a PCD file from disk.
	if (pcl::io::loadPCDFile<pcl::PointXYZ>(argv[1], *cloud) != 0)
	{
		return -1;
	}

	// Filter object.
	pcl::RadiusOutlierRemoval<pcl::PointXYZ> filter;
	filter.setInputCloud(cloud);
	// Every point must have 10 neighbors within 15cm, or it will be removed.
	filter.setRadiusSearch(0.50);
	filter.setMinNeighborsInRadius(4000);

	filter.filter(*filteredCloud);

	pcl::PCDWriter writer;
    writer.write<pcl::PointXYZ> ("inliers.pcd", *filteredCloud, true);
    filter.setNegative (true);
    filter.filter (*filteredCloud);
    writer.write<pcl::PointXYZ> ("outliers.pcd", *filteredCloud, true);
}