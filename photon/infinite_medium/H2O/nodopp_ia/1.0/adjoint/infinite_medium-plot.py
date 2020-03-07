#!/usr/bin/python
import sys, os
from optparse import *
sys.path.append(os.path.join(os.path.dirname(__file__), '../../..'))
from infinite_medium_simulation_plot import plotExtractedInfiniteMediumSimulationData

if __name__ == "__main__":

    # Parse the command line arguments
    parser = OptionParser()
    parser.add_option("--forward_data_file", type="string", dest="forward_data_file",
                      help="the forward data file to load")
    parser.add_option("--adjoint_data_file", type="string", dest="adjoint_data_file",
                      help="the adjoint data file to load")
    options,args = parser.parse_args()

    if "s3" in options.forward_data_file:
        top_ylims = [0.0, 0.05]
        bottom_ylims = [0.80, 1.20]
        legend_pos = (0.99,1.05)
    elif "s6" in options.forward_data_file:
        top_ylims = [0.0, 0.20]
        bottom_ylims = [0.0, 1.50]
        legend_pos = (0.58,0.75)
    elif "s9" in options.forward_data_file:
        top_ylims = [0.0, 0.015]
        bottom_ylims = [0.90, 1.10]
        legend_pos = (0.95,0.95)
    elif "s12" in options.forward_data_file:
        top_ylims = [0.0, 0.20]
        bottom_ylims = [0.0, 1.50]
        legend_pos = (0.95,0.95)
    elif "s1" in options.forward_data_file:
        top_ylims = [0.0, 0.2]
        bottom_ylims = [0.0, 1.50]
        legend_pos = (1.0,0.90)
        
    xlims = [0.00, 1.0]
            
    # Plot the spectrum
    plotExtractedInfiniteMediumSimulationData( options.forward_data_file,
                                               "FRENSIE-Forward-IA",
                                               "FF-IA",
                                               options.adjoint_data_file,
                                               "FRENSIE-Adjoint-IA",
                                               "FA-IA",
                                               top_ylims,
                                               bottom_ylims,
                                               xlims,
                                               legend_pos = legend_pos )

    
