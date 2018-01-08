import freenect
import sys
import cv2
import numpy as np
import PIL

#function to get RGB image from kinect
def get_video():
    array,_ = freenect.sync_get_video()
    #array = cv2.cvtColor(array,cv2.COLOR_RGB2BGR)
    return array
 
#function to get depth image from kinect
def get_depth():
    array,_ = freenect.sync_get_depth()
    #array = array.astype(np.uint8)
    return array

if __name__ == "__main__":
    i = 1
    taken_photos = i
    while 1:
        rgb = get_video()
        depth = get_depth()
        arr = depth.astype(np.uint8)
        cv2.imshow('Depth image',arr) #display depth image
        cv2.imshow('RGB image',rgb) #display RGB image
        #im1= Image.fromarray(rgb)
        cv2.imwrite("rgb%d.jpg" % i, rgb)
        print ("RGB_image saved succussfully %s" %i)
        #im2= Image.fromarray(arr)
        cv2.imwrite("depth%d.jpg" % i, arr)
        print ("Depth_image saved succussfully %s" %i)
        i=i+1
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break
cv2.destroyAllWindows()
