#!/usr/bin/python
import sys, os
from optparse import *
sys.path.append(os.path.join(os.path.dirname(__file__), '../..'))
from broomstick_simulation_extract_estimator import extractEstimatorRelaxData

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
                      help="the mcnp file to load")
    parser.add_option("--mcnp_file_start", type="int", dest="mcnp_file_start",
                      help="the start of the mcnp file data")
    parser.add_option("--mcnp_file_end", type="int", dest="mcnp_file_end",
                      help="the end of the mcnp file data")
    options,args = parser.parse_args()

    relax_bins = [3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33]

    # Extract the estimator data
    extractEstimatorRelaxData( options.rendezvous_file,
                               options.estimator_id,
                               options.entity_id,
                               options.mcnp_file,
                               options.mcnp_file_start,
                               options.mcnp_file_end,
                               relax_bins )
