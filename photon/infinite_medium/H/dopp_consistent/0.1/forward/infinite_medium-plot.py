#!/usr/bin/python
import sys, os
from optparse import *
sys.path.append(os.path.join(os.path.dirname(__file__), '../../..'))
from infinite_medium_simulation_plot import plotExtractedInfiniteMediumSimulationData

if __name__ == "__main__":

    # Parse the command line arguments
    parser = OptionParser()
    parser.add_option("--dh_data_file", type="string", dest="dh_data_file",
                      help="the wh data file to load")
    parser.add_option("--dc_data_file", type="string", dest="dc_data_file",
                      help="the ia data file to load")
    options,args = parser.parse_args()

    if "s3" in options.dh_data_file:
        top_ylims = [0.0, 1.2]
        bottom_ylims = [0.95, 1.05]
        legend_pos = (0.58,0.95)
    elif "s6" in options.dh_data_file:
        top_ylims = [0.0, 0.5]
        bottom_ylims = [0.90, 1.10]
        legend_pos = (0.58,0.75)
    elif "s9" in options.dh_data_file:
        top_ylims = [0.0, 0.3]
        bottom_ylims = [0.95, 1.05]
        legend_pos = (0.95,0.75)
    elif "s12" in options.dh_data_file:
        top_ylims = [0.0, 0.25]
        bottom_ylims = [0.90, 1.10]
        legend_pos = (0.95,0.95)
    elif "s15" in options.dh_data_file:
        top_ylims = [0.0, 0.20]
        bottom_ylims = [0.90, 1.10]
        legend_pos = (0.95,0.95)
    elif "s1" in options.dh_data_file:
        top_ylims = [0.0, 5.0]
        bottom_ylims = [0.95, 1.05]
        legend_pos = (0.7,0.90)

    xlims = [0.0, 0.1]
            
    # Plot the spectrum
    plotExtractedInfiniteMediumSimulationData( options.dh_data_file,
                                               "FRENSIE-Dopp-Hybrid",
                                               "FF-Hybrid",
                                               options.dc_data_file,
                                               "FRENSIE-Dopp-Consistent",
                                               "FF-Cons.",
                                               top_ylims,
                                               bottom_ylims,
                                               xlims,
                                               legend_pos = legend_pos )

    
