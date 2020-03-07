#!/usr/bin/python
import sys, os
from optparse import *
sys.path.append(os.path.join(os.path.dirname(__file__), '../..'))
from broomstick_simulation_plot import plotBroomstickSimulationSpectrum

if __name__ == "__main__":

    # Parse the command line arguments
    parser = OptionParser()
    parser.add_option("--rendezvous_file", type="string", dest="rendezvous_file",
                      help="the rendezvous file to load")
    parser.add_option("--estimator_id", type="int", dest="estimator_id",
                      help="the estimator id to use")
    parser.add_option("--entity_id", type="int", dest="entity_id",
                      help="the entity id to use")
    parser.add_option("--mcnp_file", type="string", dest="mcnp_file",
                      help="the mcnp output file to load")
    parser.add_option("--mcnp_file_start", type="int", dest="mcnp_file_start",
                      help="the mcnp output file start line")
    parser.add_option("--mcnp_file_end", type="int", dest="mcnp_file_end",
                      help="the mcnp output file end line")
    parser.add_option("--current", action="store_true", dest="is_a_current",
                      help="the data corresponds to a current")
    parser.add_option("--flux", action="store_false", dest="is_a_current",
                      help="the data corresponds to a flux")
    options,args = parser.parse_args()

    if options.is_a_current:
        top_ylims = [0.0, 20.0]
        bottom_ylims = [0.95, 1.05]
        legend_pos = (0.75,0.76)
    else:
        top_ylims = [0.0, 500000.0]
        bottom_ylims = [0.9, 1.1]
        legend_pos = (1.02,1.03)
        
    # Plot the spectrum
    plotBroomstickSimulationSpectrum( options.rendezvous_file,
                                      options.estimator_id,
                                      options.entity_id,
                                      options.mcnp_file,
                                      options.mcnp_file_start,
                                      options.mcnp_file_end,
                                      options.is_a_current,
                                      top_ylims = top_ylims,
                                      bottom_ylims = bottom_ylims,
                                      xlims = [0.10, 0.2],
                                      legend_pos = legend_pos )

    
