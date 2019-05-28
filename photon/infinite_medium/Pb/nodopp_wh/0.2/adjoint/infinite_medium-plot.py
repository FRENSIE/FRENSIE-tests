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
        top_ylims = [0.0, 1.5]
        bottom_ylims = [0.50, 1.50]
        legend_pos = (0.58,1.05)
    elif "s6" in options.forward_data_file:
        top_ylims = [0.0, 0.25]
        bottom_ylims = [0.50, 1.50]
        legend_pos = (0.95,0.95)
    elif "s9" in options.forward_data_file:
        top_ylims = [0.0, 0.25]
        bottom_ylims = [0.50, 1.50]
        legend_pos = (0.95,0.95)
    elif "s12" in options.forward_data_file:
        top_ylims = [0.0, 0.25]
        bottom_ylims = [0.50, 1.50]
        legend_pos = (0.95,0.95)
    elif "s15" in options.forward_data_file:
        top_ylims = [0.0, 0.20]
        bottom_ylims = [0.50, 1.50]
        legend_pos = (0.95,0.95)
    elif "s1" in options.forward_data_file:
        top_ylims = [0.0, 500.0]
        bottom_ylims = [0.50, 1.50]
        legend_pos = (0.98,1.03)
        
    xlims = [0.00, 0.2]
            
    # Plot the spectrum
    plotExtractedInfiniteMediumSimulationData( options.forward_data_file,
                                               "FRENSIE-Forward-WH",
                                               "FF-WH",
                                               options.adjoint_data_file,
                                               "FRENSIE-Adjoint-WH",
                                               "FA-WH",
                                               top_ylims,
                                               bottom_ylims,
                                               xlims,
                                               legend_pos = legend_pos )

    
