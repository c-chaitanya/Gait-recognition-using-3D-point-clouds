import freenect
import sys
import cv2
import numpy as np
from PIL import Image
 
def depth2xyzuv(depth, u=None, v=None):
  if u is None or v is None:
    u,v = np.mgrid[:480,:640]
  
  # Build a 3xN matrix of the d,u,v data
  C = np.vstack((u.flatten(), v.flatten(), depth.flatten(), 0*u.flatten()+1))

  # Project the duv matrix into xyz using xyz_matrix()
  X,Y,Z,W = np.dot(xyz_matrix(),C)
  X,Y,Z = X/W, Y/W, Z/W
  xyz = np.vstack((X,Y,Z)).transpose()
  xyz = xyz[Z<0,:]


  U,V,_,W = np.dot(np.dot(uv_matrix(), xyz_matrix()),C)
  U,V = U/W, V/W
  uv = np.vstack((U,V)).transpose()    
  uv = uv[Z<0,:]       

  # Return both the XYZ coordinates and the UV coordinates
  return xyz, uv
def uv_matrix():

  rot = np.array([[ 9.99846e-01,   -1.26353e-03,   1.74872e-02], 
                  [-1.4779096e-03, -9.999238e-01,  1.225138e-02],
                  [1.747042e-02,   -1.227534e-02,  -9.99772e-01]])
  trans = np.array([[1.9985e-02, -7.44237e-04,-1.0916736e-02]])
  m = np.hstack((rot, -trans.transpose()))
  m = np.vstack((m, np.array([[0,0,0,1]])))
  KK = np.array([[529.2, 0, 329, 0],
                 [0, 525.6, 267.5, 0],
                 [0, 0, 0, 1],
                 [0, 0, 1, 0]])
  m = np.dot(KK, (m))
  return m

def xyz_matrix():
  fx = 594.21
  fy = 591.04
  a = -0.0030711
  b = 3.3309495
  cx = 339.5
  cy = 242.7
  mat = np.array([[1/fx, 0, 0, -cx/fx],
                  [0, -1/fy, 0, cy/fy],
                  [0,   0, 0,    -1],
                  [0,   0, a,     b]])
  return mat
# save information in csv File
def save_3d_information(xyz,uv,img):
	#print(uv)
	# use globals in context
	global taken_photos
	# create pointcloud file
	pointcloud_file = open('pointcloud-'+str(taken_photos)+'.pcd','wb')
	index = 0
	for i in range(0, len(xyz)):
		if xyz[i][0]==0 or xyz[i][1]==0 or xyz[i][2]==0 :
			continue
		index += 1
	
	# PLY HEADER
	pointcloud_file.write("# .PCD v.7 - Point Cloud Data file format\n")
	pointcloud_file.write("VERSION .7\n")
	pointcloud_file.write("FIELDS x y z rgb\n")
	pointcloud_file.write("SIZE 4 4 4 4\n")
	pointcloud_file.write("TYPE F F F F\n")
	pointcloud_file.write("COUNT 1 1 1 1\n")
	pointcloud_file.write("WIDTH "+str(index)+"\n")
	pointcloud_file.write("HEIGHT 1\n")
	pointcloud_file.write("VIEWPOINT 0 0 0 1 0 0 0\n")
	pointcloud_file.write("POINTS "+str(index)+"\n")
	pointcloud_file.write("DATA ascii\n")
	#Assign colors from the rectified image
 	for i in range(0, len(xyz)):
		if xyz[i][0]==0 or xyz[i][1]==0 or xyz[i][2]==0 :
			continue
		#print uv[i][0]	
		x=(int)(uv[i][0])	
		y=(int)(uv[i][1])
		g = img[x][y]
		#print g
		rgb = ((int)(g[0])) << 16 | ((int)(g[1])) << 8 | ((int)(g[2]))
		#print rgb
		#cloud_color.points[i].rgb = *(float*)(&rgb);
  		pointcloud_file.write(str(float(xyz[i][0]))+" "+str(float(xyz[i][1]))+" "+str(float(xyz[i][2]))+" "+str(float(rgb))+"\n")
	pointcloud_file.close()

if __name__ == "__main__":
    arg1 = sys.argv[1]
    arg2 = sys.argv[2]
    taken_photos = 0
    rgb = cv2.imread(arg1)
    depth = cv2.imread(arg2,-1)
    #arr = depth.astype(np.uint8)
    #cv2.imshow('RGB image',rgb)
    #cv2.imshow('Depth image',arr)
    #save_3d_information(depth,frame)
    u,v = np.mgrid[:480,:640]
    xyz,uv = depth2xyzuv(depth,u,v)
    print (xyz)
    print (uv)
    save_3d_information(xyz,uv,rgb)
                        
cv2.destroyAllWindows()
