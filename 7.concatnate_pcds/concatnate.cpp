#include <iostream>
#include <pcl/io/pcd_io.h>
#include <pcl/point_types.h>
#include <pcl/common/point_operators.h>
#include <exception>
int main()
{
        FILE *fp;
        pcl::PointCloud<pcl::PointXYZ>::Ptr final(new pcl::PointCloud<pcl::PointXYZ>);
        pcl::PointCloud<pcl::PointXYZ> temp;
        fp = fopen("CloudListout.txt","r");
        char *p = new char[100];
        int i = 0;
        if(fp == NULL)
        {
                printf("Failed to OpenFIle");
                exit(0);
        }
        while(fscanf(fp,"%s",p)!=EOF)
        {
                try
                {
                pcl::io::loadPCDFile<pcl::PointXYZ> (p,temp);
                *final = *final + temp;
                }
                catch(std::exception e)
                {
                std::cout << "Exception" << e.what() ;
                }
        }
        pcl::io::savePCDFileASCII ("Result.pcd", *final);
}
