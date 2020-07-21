#!/usr/bin/python
# Author: Lewis Gross
# Purpose: To parse MCNP outputs for the SNM detection project with DNDO and put them into arrays.
#          The returned arrays will be used in the snm_plot_simulation.py to populate the dictionary
#          needed to use the spectrum_tools_plot.py script.

# Module Imports
import math                               # Math Functions
import matplotlib                         # Plotting Supermodule
import matplotlib.pyplot as plt           # Plotting Utility
from matplotlib.colors import LogNorm     # Logarithmic colormaps
import numpy as np                         # Multidimensional arrays

def extractData( mcnp_file_start, mcnp_file):

# mcnp_file_start (int) is defined as the first line with the time bins for an estimator
# mcnp_file (string) is the name of the mcnp output file to be parsed
# note the readlines file starts at line1 and puts it into a list, which is zero indexed
# thus, line a is stored in mcnp_file_lines[a-1]
mcnp_file_start = 1369
mcnp_times_line1 = mcnp_file_start -1
mcnp_results_line1 = mcnp_times_line1 + 1 
mcnp_times_line2 = mcnp_times_line1 + 3
mcnp_results_line2 = mcnp_times_line2 + 1

# Extract the mcnp data from the output file
mcnp_file = open( "air_empty_50.io" , "r" )
#mcnp_file = open( mcnp_file, "r" )
mcnp_file_lines = mcnp_file.readlines()

# Take lines of interest and split them to get list of stringsd
time_line1  = mcnp_file_lines[mcnp_times_line1 ]
line1       = mcnp_file_lines[mcnp_results_line1 ]
time_line2  = mcnp_file_lines[mcnp_times_line2 ]
line2       = mcnp_file_lines[mcnp_results_line2 ]

# get time bins from time lines
t_sp1 = time_line1.split()
t_sp2 = time_line2.split()

# get data (means and re's) from tally lines
d_sp1 = line1.split()
d_sp2 = line2.split()

# get number of pairs of data (means and re's) to correctly initialize arrays
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
  t_bins[t] =  (float(t_sp1[t+1]) - float(1e7))/(1e5) # offset between t_bins and t_sp1 by 1 from "time:" string in t_sp1
                                                      # also change type to float and units to sec, subtracting 1e7 shakes so the bins start at end of irradiation (100ms)

# with only one data point in the second row of time bins
# if this changes, use a more general form, like loops below 
t_bins[5] = (float(t_sp2[1]) - float(1e7))/(1e5) # change type to float and units to milliseconds

count = 0       # index for current pair to match order in scores/errors arrays
for x in range(0, len1, 2):
  scores[count] = d_sp1[x]
  errors[count] = d_sp1[x+1]
  count = count +  1

# only one data point in the second row of data
# if this changes, use a more general loop
scores[count] = d_sp2[0]
errors[count] = d_sp2[1]

print('t bins: ')
print(t_bins)
print('scores: ')
print(scores)
print('errors: ')
print( errors)

return t_bins , scores ,  errors