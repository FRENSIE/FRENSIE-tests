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

  # Open the output file and read the lines
  mcnp_file = open( mcnp_file , "r" )
  mcnp_file_lines = mcnp_file.readlines()

# Lines of interest based on relation to first line with time bins
  mcnp_times_line1 = mcnp_file_start -1
  mcnp_results_line1 = mcnp_times_line1 + 1 
  mcnp_times_line2 = mcnp_times_line1 + 3
  mcnp_results_line2 = mcnp_times_line2 + 1

  # Take lines of interest and split them to get list of stringsd
  time_line1  = mcnp_file_lines[mcnp_times_line1 ]
  line1       = mcnp_file_lines[mcnp_results_line1 ]
  time_line2  = mcnp_file_lines[mcnp_times_line2 ]
  line2       = mcnp_file_lines[mcnp_results_line2 ]

  # Get time bins from time lines
  t_sp1 = time_line1.split()
  t_sp2 = time_line2.split()

  # Get data (means and re's) from tally lines
  d_sp1 = line1.split()
  d_sp2 = line2.split()

  # Get number of pairs of data (means and re's) to correctly initialize arrays
  len1 = len(d_sp1)                         # number or values in split line 1
  len2 = len(d_sp2)                         # number or values in split line 2
  num_pairs_1 = int(len1/2)                 # they alternate with score error, so there are half as many pairs as items in len1
  num_pairs_2 = int(len2/2)                 # they alternate with score error, so there are half as many pairs as items in len1

  # Initialize numpy arrays with all zero values
  # Length of arrays are number of pairs plus one from the last line
  # There is a total data value in the last line that is currently ignored (only 1 data point)
  # If that changes, num_results = num_pairs_1 + num_pairs_2
  num_results = num_pairs_1 + 1
  t_bins = np.zeros(num_results)
  scores = np.zeros(num_results)
  errors = np.zeros(num_results)

  # sort time bins, we know there are 5 values in the first row of data
  for t in range(0,5):
    t_bins[t] =  (float(t_sp1[t+1]))/(1e8) # time since source turned on 
                                                      # also change type to float and units to sec
  # if this changes, use a more general form, like loops below 
  t_bins[5] = float(t_sp2[1])/(1e8)      # change type to float and units to milliseconds

  # sort data from split lines into scores and errors
  # they come in the format score_1 , error_1 , score_2 , error_2 , ...
  count = 0
  for x in range(0, len1, 2):
    scores[count] = d_sp1[x]
    errors[count] = d_sp1[x+1]
    count = count +  1

  # only one data point in the second row of data
  # if this changes, use a more general loop
  scores[count] = d_sp2[0]
  errors[count] = d_sp2[1]

  # uncomment to print arrays for testing purposes
  #print('t bins: ')
  #print(t_bins)
  #print('scores: ')
  #print(scores)
  #print('errors: ')
  #print( errors)

  return t_bins , scores ,  errors