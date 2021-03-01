"""

Title:   MCNP_Analysis_Utility.py

Author:  Eli Moll

"""

# Module Imports

import math                               # Math Functions
import matplotlib                         # Plotting Supermodule
import matplotlib.pyplot as plt           # Plotting Utility
from matplotlib.colors import LogNorm     # Logarithmic colormaps
import numpy                              # Multidimensional arrays
from matplotlib import pylab              # Advanced geometry plotting
import scipy.ndimage as ndimage           # Guassian image post-processing
import DNDO_Dataset
from scipy.ndimage.filters import gaussian_filter

def clearFile( filename ):
    file = open(filename, 'w')
    file.close()

def printData( filename, dataset ):
    locations = ["NW","NE","Central","SW","SE"] 
    
    file = open(filename,'a')    
    
    file.write(dataset.pseudonym + "\n")
    file.write("Time (ms)" + "," + locations[0] + "," + locations[1] + "," + locations[2] + "," + locations[3] + "," + locations[3] + "\n" )
    
    file.write(str(dataset.tally_times[4][0]) + "," + str(dataset.tally_scores[4][0]) + "," +
           str(dataset.tally_scores[14][0]) + "," + str(dataset.tally_scores[24][0]) + "," + 
           str(dataset.tally_scores[44][0]) + "," + str(dataset.tally_scores[44][0]) + "\n" )
           
    file.write(str(dataset.tally_times[4][1]) + "," + str(dataset.tally_scores[4][1]) + "," +
           str(dataset.tally_scores[14][1]) + "," + str(dataset.tally_scores[24][1]) + "," + 
           str(dataset.tally_scores[44][1]) + "," + str(dataset.tally_scores[44][1]) + "\n" )
           
    file.write(str(dataset.tally_times[4][2]) + "," + str(dataset.tally_scores[4][2]) + "," +
           str(dataset.tally_scores[14][2]) + "," + str(dataset.tally_scores[24][2]) + "," + 
           str(dataset.tally_scores[44][2]) + "," + str(dataset.tally_scores[44][2]) + "\n" )
           
    file.write(str(dataset.tally_times[4][3]) + "," + str(dataset.tally_scores[4][3]) + "," +
           str(dataset.tally_scores[14][3]) + "," + str(dataset.tally_scores[24][3]) + "," + 
           str(dataset.tally_scores[44][3]) + "," + str(dataset.tally_scores[44][3]) + "\n" )
           
    file.write(str(dataset.tally_times[4][4]) + "," + str(dataset.tally_scores[4][4]) + "," +
           str(dataset.tally_scores[14][4]) + "," + str(dataset.tally_scores[24][4]) + "," + 
           str(dataset.tally_scores[44][4]) + "," + str(dataset.tally_scores[44][4]) + "\n" )
           
    file.write("\n")

output_file = "output_data.txt"

clearFile(output_file)

file_list = ["air_heu_25.io","air_heu_50.io","air_heu_75.io",
             "air_empty_25.io","air_empty_50.io","air_empty_75.io",
             "steel_heu_25.io","steel_heu_50.io","steel_heu_75.io",
             "steel_empty_25.io","steel_empty_50.io","steel_empty_75.io",
             "m20.io", "m30.io", "m40.io"]
             
description_list = ["Air_HEU_(25 25 25)","Air_HEU_(50 50 50)","Air_HEU_(75 75 75)",
                    "Air_Empty_(25 25 25)","Air_Empty_(50 50 50)","Air_Empty_(75 75 75)",
                    "Steel_HEU_(25 25 25)","Steel_HEU_(50 50 50)","Steel_HEU_(75 75 75)",
                    "Steel_Empty_(25 25 25)","Steel_Empty_(50 50 50)","Steel_Empty_(75 75 75)",
                    "20kg_HEU_Air_(50 50 50)", "30kg_HEU_Air_(50 50 50)", "40kg_HEU_Air_(50 50 50)"]

for i in range(0, len(file_list)):
    dataset = DNDO_Dataset.DNDO_Dataset(file_list[i], description_list[i])
    
    printData( output_file, dataset )