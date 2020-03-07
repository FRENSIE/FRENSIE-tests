#!/usr/bin/python
import sys, os
from optparse import *
sys.path.append(os.path.join(os.path.dirname(__file__), '../..'))
from broomstick_simulation_extract_estimator import extractEstimatorRelaxDataFromWHAndIAData

if __name__ == "__main__":

    # Parse the command line arguments
    parser = OptionParser()
    parser.add_option("--wh_data_file", type="string", dest="wh_data_file",
                      help="the wh data file to load")
    parser.add_option("--ia_data_file", type="string", dest="ia_data_file",
                      help="the ia data file to load")
    options,args = parser.parse_args()

    relax_bins = [181, 186, 210, 212, 214, 216, 221, 223, 225, 227, 229, 231, 233, 235, 237, 239]

    # Extract the estimator data
    extractEstimatorRelaxDataFromWHAndIAData( options.wh_data_file,
                                              options.ia_data_file,
                                              relax_bins )
