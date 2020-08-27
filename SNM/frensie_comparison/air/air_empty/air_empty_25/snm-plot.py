#!/usr/bin/python
import sys, os
from optparse import *
sys.path.append(os.path.join(os.path.dirname(__file__), '..'))
from snm_plot_simulation import plotSNMSimulationSpectrum

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
    options,args = parser.parse_args()

    # adjust input for axes on each image
    top_ylims = [0.0, 1e-4]
    bottom_ylims = [0.95, 1.05]
    # legend position
    legend_pos = (0.95,0.95)
        
    # Plot the spectrum
    plotSNMSimulationSpectrum( options.rendezvous_file,
                                  options.estimator_id,
                                  options.entity_id,
                                  options.mcnp_file,
                                  options.mcnp_file_start,
                                  top_ylims = top_ylims,
                                  bottom_ylims = bottom_ylims,
                                  xlims = [0,0.2],
                                  legend_pos = legend_pos )