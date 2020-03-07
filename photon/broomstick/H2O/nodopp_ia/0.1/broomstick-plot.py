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

    top_ylims = [0.0, 60.0]
    bottom_ylims = [0.98, 1.02]
    xlims = [0.07, 0.1]
    # bottom_ylims = [0.96, 1.04]
    # xlims = [0.0965, 0.1]
    legend_pos = (0.86,0.76)
            
    # Plot the spectrum
    plotBroomstickSimulationSpectrumWHvsIA( options.wh_data_file,
                                            "FRENSIE-WH",
                                            options.ia_data_file,
                                            "FRENSIE-IA",
                                            True,
                                            top_ylims,
                                            bottom_ylims,
                                            xlims,
                                            legend_pos = legend_pos )

    
