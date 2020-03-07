#!/usr/bin/python
import sys, os
from optparse import *
sys.path.append(os.path.join(os.path.dirname(__file__), '../..'))
from cont_soil_simulation_plot import plotExtractedContSoilSimulationData

if __name__ == "__main__":

    # Parse the command line arguments
    # Parse the command line arguments
    parser = OptionParser()
    parser.add_option("--forward_data_file", type="string", dest="forward_data_file",
                      help="the forward data file to load")
    parser.add_option("--adjoint_data_file", type="string", dest="adjoint_data_file",
                      help="the adjoint data file to load")
    options,args = parser.parse_args()
    
    top_ylims = [1e-4, 1e8]
    bottom_ylims = [0.0, 2.00]
    xlims = [0.0, 2.5]
    legend_pos = (0.65,0.75)
        
    # Plot the spectrum
    plotExtractedContSoilSimulationData( options.forward_data_file,
                                         "FRENSIE-Forward-IA",
                                         "FF",
                                         options.adjoint_data_file,
                                         "FRENSIE-Adjoint-IA",
                                         "FA",
                                         top_ylims,
                                         bottom_ylims,
                                         xlims,
                                         legend_pos = legend_pos )

    
