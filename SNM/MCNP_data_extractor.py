#!/usr/bin/python
# Author: Lewis Gross
# Purpose:  To parse MCNP outputs for the SNM detection project with DNDO and put them into a python dictionary 
#           so they can be compared to FRENSIE outputs

# Module Imports
import math                               # Math Functions
import matplotlib                         # Plotting Supermodule
import matplotlib.pyplot as plt           # Plotting Utility
from matplotlib.colors import LogNorm     # Logarithmic colormaps
import numpy as np                         # Multidimensional arrays
from matplotlib import pylab              # Advanced geometry plotting 
#import scipy.ndimage as ndimage           # Guassian image post-processing                TODO LOOK INTO
import DNDO_Dataset                       # Class to store data from DNDO project output

# from air_heu_50.io around line 1366
#"1tally        4        nps = 18643691874
#           tally type 4    track length estimate of particle flux.      units   1/cm**2        
#           particle(s): neutrons 
#
#           volumes 
#                   cell:      10                                                                                   
#                         4.00000E+03
# 
# cell  10                                                                                                                              
#         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
#                 5.52223E-06 0.0001   1.22119E-11 0.0686   8.35070E-12 0.0772   8.82343E-12 0.0747   7.86101E-12 0.0808
# 
#         time:       2.0000E+07             total                                                                  
#                 7.49385E-12 0.0809   5.52227E-06 0.0001

# EARLY VERSION, REPLACE with commands to get these lines from file
time_line1 = "         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07"
line1 = "                 5.52223E-06 0.0001   1.22119E-11 0.0686   8.35070E-12 0.0772   8.82343E-12 0.0747   7.86101E-12 0.0808"
time_line2 = "         time:       2.0000E+07             total                                                                  "
line2 = "                 7.49385E-12 0.0809   5.52227E-06 0.0001"

# get data from tally lines
d_sp1 = line1.split()
d_sp2 = line2.split()
# get time bins from time lines
t_sp1 = time_line1.split()
t_sp2 = time_line2.split()

len1 = len(d_sp1)                         # number or values in split line 1
len2 = len(d_sp2)                         # number or values in split line 2
num_pairs_1 = int(len1/2)                 # they alternate with score error, so there are half as many pairs as items in len1
num_pairs_2 = int(len2/2)                 # they alternate with score error, so there are half as many pairs as items in len1

# initialize numpy arrays with all zero values
# length of items dictionary is number of pairs plus one from the last line
num_results = num_pairs_1 + 1
t_bins = np.zeros(num_results)
scores = np.zeros(num_results)
errors = np.zeros(num_results)

# sort time bins, we know there are 5 values in the first row of data
for t in range(0,5):
  t_bins[t] =  (float(t_sp1[t+1]) - float(1e7))/(1e5) # offset by one from "time:" being included in t_sp1, also change type to float and units to sec

# with only one data point in the second row of time bins
# if this changes, use a more general form, like loops below
t_bins[5] = (float(t_sp2[1]) - float(1e7))/(1e5) # change type to float and units to sec

count = 0       # index for current pair to match order in scores/errors arrays
for x in range(0, len1, 2):
  scores[count] = d_sp1[x]
  errors[count] = d_sp1[x+1]
  count = count +  1

# with only one data point in the second row of data
# if this changes, use a more general form, like loops below
scores[count] = d_sp2[0]
errors[count] = d_sp2[1]

print('t bins: ')
print(t_bins)
print('scores: ')
print(scores)
print('errors: ')
print( errors)

# if longer use something like this, but for this most of these, there is one data point left
#for y in range(0, len2, 2):
#  print(count)
#  scores[count] = d_sp2[y]
#  errors[count] = d_sp1[y+1]
#  count = count +  1