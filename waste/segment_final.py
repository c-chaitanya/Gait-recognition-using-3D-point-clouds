import pcl

for i in range(1,501):
    str1 = '~/Desktop/pcl/Segmentation/samples/' #input destination directory
    str2 = str(i).zfill(4)
    str3 = '.pcd'
    str4 = str1+str2+str3
    print str4
    cloud_filtered = pcl.load(str4)
    # cloud = cloud_filtered
# print(cloud.size)

# fil = cloud.make_passthrough_filter()
# fil.set_filter_field_name("y")
# fil.set_filter_limits(5, 20)
# cloud = fil.filter()

    print(cloud_filtered.size)

    seg = cloud_filtered.make_segmenter_normals(ksearch=50)
    seg.set_optimize_coefficients(True)
    seg.set_model_type(pcl.SACMODEL_NORMAL_PLANE)
    seg.set_normal_distance_weight(0.1)
    seg.set_method_type(pcl.SAC_RANSAC)
    seg.set_max_iterations(100)
    seg.set_distance_threshold(8)
    indices, model = seg.segment()

#print(model)

    cloud_plane = cloud_filtered.extract(indices, negative=True)
    str5 = '/home/abhi/MEGA/PCD/Segmentation/Segment_Initial/' #output destination directory
    str6 = '.pcd'
    str7 = str5+str2+str6
    # cloud.to_file("pcd_1.pcd")
    cloud_plane.to_file(str7)

    """cloud_cyl = cloud_filtered.extract(indices, negative=True)

    seg = cloud_cyl.make_segmenter_normals(ksearch=50)
    seg.set_optimize_coefficients(True)
    seg.set_model_type(pcl.SACMODEL_LINE)
    seg.set_normal_distance_weight(0.1)
    seg.set_method_type(pcl.SAC_RANSAC)
    seg.set_max_iterations(100)
    seg.set_distance_threshold(4)
    #seg.set_radius_limits(0, 0.5)
    indices, model = seg.segment()

#print(model)
    str8 = '/home/abhi/MEGA/PCD/Segmentation/Segment_Final/'
    str9 = str8+str2+str6
    cloud_cylinder = cloud_cyl.extract(indices, negative=True)
    #cloud_cylinder.to_file(str9)

    p = cloud_cylinder

    fil = p.make_statistical_outlier_filter()
    fil.set_mean_k(100)
    fil.set_std_dev_mul_thresh(1.0)

    pcl.save(fil.filter(), str9)

    #fil.set_negative(True)
    #pcl.save(fil.filter(), "outliers.pcd")"""
