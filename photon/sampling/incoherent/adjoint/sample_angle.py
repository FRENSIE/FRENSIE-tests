#!/usr/bin/python
import sys, os
import os.path as path
from optparse import *
sys.path.append(os.path.join(os.path.dirname(__file__), '..'))
from sample_incoherent import sampleAngleAndPlot
import PyFrensie.Data as Data
import PyFrensie.Data.Native as Native
import PyFrensie.MonteCarlo as MonteCarlo

if __name__ == "__main__":

    # Parse the command line options
    parser = OptionParser()
    parser.add_option("--db_path", type="string", dest="db_path",
                      help="the database name (with extension)")
    parser.add_option("--atomic_number", type="int", dest="atomic_number",
                      help="the atomic number")
    parser.add_option("--model_type", type="string", dest="raw_model_type",
                      help="the model type")
    parser.add_option("--sampling_type", type="string", dest="raw_sampling_type",
                      help="the sampling type")
    parser.add_option("--num_samples", type="int", dest="num_samples",
                      help="the number of samples to generate")
    parser.add_option("--incoming_energy", type="float", dest="incoming_energy",
                      help="the incoming energy to sample at")
    parser.add_option("--max_energy", type="float", dest="max_energy",
                      help="the max energy")
    parser.add_option("--legend_xpos", type="float", default=1.0, dest="legend_xpos",
                      help="the legend x position")
    parser.add_option("--legend_ypos", type="float", default=1.0, dest="legend_ypos",
                      help="the legend y position")
    options,args = parser.parse_args()

    if options.db_path is None:
        print "The database path must be specified!"
        sys.exit(1)

    if options.raw_model_type == "kn":
        model_type = MonteCarlo.KN_INCOHERENT_ADJOINT_MODEL
    elif options.raw_model_type == "wh":
        model_type = MonteCarlo.WH_INCOHERENT_ADJOINT_MODEL
    elif options.raw_model_type == "impulse":
        model_type = MonteCarlo.IMPULSE_INCOHERENT_ADJOINT_MODEL
    elif options.raw_model_type == "db_impulse":
        model_type = MonteCarlo.DB_IMPULSE_INCOHERENT_ADJOINT_MODEL
    else:
        print "The model type is not valid!"
        sys.exit(1)

    if options.raw_sampling_type == "two_branch":
        sampling_type = MonteCarlo.TWO_BRANCH_REJECTION_ADJOINT_KN_SAMPLING
    elif options.raw_sampling_type == "three_branch_lin":
        sampling_type = MonteCarlo.THREE_BRANCH_LIN_MIXED_ADJOINT_KN_SAMPLING
    elif options.raw_sampling_type == "three_branch_inv":
        sampling_type = MonteCarlo.THREE_BRANCH_INVERSE_MIXED_ADJOINT_KN_SAMPLING
    else:
        print "The sampling type is not valid!"
        sys.exit(1)

    # Load the data
    database = Data.ScatteringCenterPropertiesDatabase( options.db_path )
    atom_properties = database.getAtomProperties( Data.ZAID(options.atomic_number*1000) )

    #native_data = Native.AdjointElectronPhotonRelaxationDataContainer( os.path.dirname(options.db_path) + "/" + atom_properties.getAdjointPhotoatomicDataProperties( Data.AdjointPhotoatomicDataProperties.Native_EPR_FILE, 0 ).filePath() )
    native_data = Native.ElectronPhotonRelaxationDataContainer( os.path.dirname(options.db_path) + "/" + atom_properties.getPhotoatomicDataProperties( Data.PhotoatomicDataProperties.Native_EPR_FILE, 0 ).filePath() )

    print "****************"
    print "sampling started"
    print "****************"
    
    sampleAngleAndPlot( native_data,
                        model_type,
                        sampling_type,
                        options.num_samples,
                        options.incoming_energy,
                        options.max_energy,
                        legend_pos = [options.legend_xpos, options.legend_ypos] )
