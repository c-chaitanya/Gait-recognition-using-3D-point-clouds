import sys
import pandas as pd
from sklearn.decomposition import PCA
import numpy as np

X  = pd.read_csv(sys.argv[1],header=None)
pca = PCA(n_components=3, svd_solver='full')
#pd.set_option('display.float_format', lambda x: '%.3f' % x)
Y = pca.fit_transform(X)
np.savetxt(sys.argv[2], Y, fmt='%f')
