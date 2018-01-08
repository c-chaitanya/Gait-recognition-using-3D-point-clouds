#include <pcl/io/pcd_io.h>
#include <pcl/features/normal_3d.h>
#include <pcl/features/pfh.h>
#include <pcl/keypoints/uniform_sampling.h>
#include <boost/thread/thread.hpp>
#include <pcl/visualization/pcl_visualizer.h>
#include <pcl/filters/random_sample.h>
#include <pcl/features/vfh.h>
#include <pcl/features/esf.h>
int
main(int argc, char** argv)
{
	// Object for storing the point cloud.
	pcl::PointCloud<pcl::PointXYZ>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZ>);
	// Object for storing the normals.
//	pcl::PointCloud<pcl::Normal>::Ptr normals(new pcl::PointCloud<pcl::Normal>);
	// Object for storing the ESF descriptors for each point.
	pcl::PointCloud<pcl::ESFSignature640>::Ptr descriptor(new pcl::PointCloud<pcl::ESFSignature640>);

	// Read a PCD file from disk.
	if (pcl::io::loadPCDFile<pcl::PointXYZ>(argv[1], *cloud) != 0)
	{
		return -1;
	}
 	
	cout<<"Cloud Points Size : "<<cloud->points.size () << "\n" ;

	//ESF Descriptor

	pcl::ESFEstimation<pcl::PointXYZ, pcl::ESFSignature640> esf;
	esf.setInputCloud(cloud);
 
	esf.compute(*descriptor);	
	
	// Save Descriptors in pcd	
	std::string str_pfh="ESF/"+s;
	//cout<<str_pfh;
	pcl::io::savePCDFileASCII(str_pfh, *descriptor);
	cout<<"Descriptor Points Size : "<<descriptor->points.size () << "\n";
	return 0;

}
