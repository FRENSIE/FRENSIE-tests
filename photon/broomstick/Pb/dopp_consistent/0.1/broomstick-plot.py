#!/usr/bin/python
import sys, os
from optparse import *
sys.path.append(os.path.join(os.path.dirname(__file__), '../..'))
from broomstick_simulation_plot import plotBroomstickSimulationSpectrumWHvsIA

if __name__ == "__main__":

    # Parse the command line arguments
    parser = OptionParser()
    parser.add_option("--wh_data_file", type="string", dest="wh_data_file",
                      help="the wh data file to load")
    parser.add_option("--ia_data_file", type="string", dest="ia_data_file",
                      help="the ia data file to load")
    options,args = parser.parse_args()

    top_ylims = [0.0, 0.5]
    bottom_ylims = [0.50, 2.00]
    xlims = [0.00, 0.1]
    legend_pos = (0.50,0.99)
    #bottom_ylims = [0.75, 2.0]
    #xlims = [0.05, 0.1]
    #legend_pos = (0.4,1.02)
            
    # Plot the spectrum
    plotBroomstickSimulationSpectrumWHvsIA( options.wh_data_file,
                                            "FRENSIE-Hybrid",
                                            options.ia_data_file,
                                            "FRENSIE-Consistent",
                                            True,
                                            top_ylims,
                                            bottom_ylims,
                                            xlims,
                                            legend_pos = legend_pos,
                                            dopp_data = True )

    
