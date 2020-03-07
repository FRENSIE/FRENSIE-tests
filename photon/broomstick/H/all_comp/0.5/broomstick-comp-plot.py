#!/usr/bin/python
import sys, os
from optparse import *
sys.path.append(os.path.join(os.path.dirname(__file__), '../..'))
from broomstick_simulation_plot import plotAllBroomstickSimulations

if __name__ == "__main__":

    # Parse the command line arguments
    parser = OptionParser()
    parser.add_option("--wh_data_file", type="string", dest="wh_data_file",
                      help="the wh data file to load")
    parser.add_option("--ia_data_file", type="string", dest="ia_data_file",
                      help="the ia data file to load")
    parser.add_option("--hybrid_data_file", type="string", dest="hybrid_data_file",
                      help="the hybrid data file to load")
    parser.add_option("--consistent_data_file", type="string", dest="consistent_data_file",
                      help="the consistent data file to load")
    options,args = parser.parse_args()

    ylims = [0.0, 6.0]
    xlims = [0.16, 0.5]
    #xlims = [0.0995, 0.1]
    legend_pos = (0.5,0.76)

    # Plot the spectrum
    plotAllBroomstickSimulations( options.wh_data_file,
                                  "FRENSIE-WH",
                                  options.hybrid_data_file,
                                  "FRENSIE-Hybrid Dopp",
                                  options.ia_data_file,
                                  "FRENSIE-IA",
                                  options.consistent_data_file,
                                  "FRENSIE-Consistent Dopp",
                                  ylims,
                                  xlims,
                                  legend_pos )
