#!/usr/bin/python
# Author: Lewis Gross
# Purpose:  To parse MCNP outputs for the SNM detection project with DNDO and put them into a python dictionary 
#           so they can be compared to FRENSIE outputs

# # Module Imports
# import math                               # Math Functions
# import matplotlib                         # Plotting Supermodule
# import matplotlib.pyplot as plt           # Plotting Utility
# from matplotlib.colors import LogNorm     # Logarithmic colormaps
# import numpy as np                         # Multidimensional arrays
# from matplotlib import pylab              # Advanced geometry plotting 
# import scipy.ndimage as ndimage           # Guassian image post-processing                TODO LOOK INTO
# import DNDO_Dataset                       # Class to store data from DNDO project output
import numpy  as np

# EARLY VERSION, REPLACE line1 WITH COMMAND TO GET LINE FROM PROMPTED MCNP FILE
line1 = "                 5.63756E-06 0.0001   1.40319E-11 0.0690   1.00246E-11 0.0805   9.03432E-12 0.0879   9.30177E-12 0.0850"
sp1 = line1.split()
#sp1 = [10.3,0.104,14.5,0.201,25.2,0.091,5.8,0.445]
print(sp1)
len1 = len(sp1)                         # number or values in split line
num_pairs = int(len1/2)                 # they alternate with score error, so there are half as many pairs as items in len1

#initialize numpy arrays with all zero values
scores = np.zeros(num_pairs)
errors = np.zeros(num_pairs)
count = 0       # index for current pair to match order in scores/errors arrays
for x in range(0, len1, 2):
  scores[count] = sp1[x]
  errors[count] = sp1[x+1]
  count = count +  1
print(scores)
print(errors)