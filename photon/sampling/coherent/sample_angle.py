#!/usr/bin/python
import sys, os
import os.path as path
from optparse import *
sys.path.append(os.path.join(os.path.dirname(__file__), '..'))
from sample_coherent import sampleAngleAndPlot
import PyFrensie.Data as Data
import PyFrensie.Data.Native as Native

if __name__ == "__main__":

    # Parse the command line options
    parser = OptionParser()
    parser.add_option("--db_path", type="string", dest="db_path",
                      help="the database name (with extension)")
    parser.add_option("--atomic_number", type="int", dest="atomic_number",
                      help="the atomic number")
    parser.add_option("--model_type", type="string", dest="model_type",
                      help="the model type")
    parser.add_option("--num_samples", type="int", dest="num_samples",
                      help="the number of samples to generate")
    parser.add_option("--incoming_energy", type="float", dest="incoming_energy",
                      help="the incoming energy to sample at")
    parser.add_option("--legend_xpos", type="float", default=1.0, dest="legend_xpos",
                      help="the legend x position")
    parser.add_option("--legend_ypos", type="float", default=1.0, dest="legend_ypos",
                      help="the legend y position")
    options,args = parser.parse_args()

    if options.db_path is None:
        print "The database path must be specified!"
        sys.exit(1)

    # Load the data
    database = Data.ScatteringCenterPropertiesDatabase( options.db_path )
    atom_properties = database.getAtomProperties( Data.ZAID(options.atomic_number*1000) )

    native_data = Native.ElectronPhotonRelaxationDataContainer( os.path.dirname(options.db_path) + "/" + atom_properties.getPhotoatomicDataProperties( Data.PhotoatomicDataProperties.Native_EPR_FILE, 0 ).filePath() )

    print "****************"
    print "sampling started"
    print "****************"

    sampleAngleAndPlot( native_data,
                        options.model_type,
                        options.num_samples,
                        options.incoming_energy,
                        legend_pos = [options.legend_xpos,options.legend_ypos] )
