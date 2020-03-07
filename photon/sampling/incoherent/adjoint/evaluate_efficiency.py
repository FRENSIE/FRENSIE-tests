#!/usr/bin/python
import sys, os
import math as m
#import matplotlib.pyplot as plt
import os.path as path
from optparse import *
sys.path.append(os.path.join(os.path.dirname(__file__), '..'))
from sample_incoherent import sampleAngle
import PyFrensie.Utility as Utility
import PyFrensie.Data as Data
import PyFrensie.Data.Native as Native
import PyFrensie.MonteCarlo as MonteCarlo

def parse_comma_separated_args( option, opt, value, parser ):
    setattr(parser.values, option.dest, value.split(','))

if __name__ == "__main__":

    # Parse the command line options
    parser = OptionParser()
    parser.add_option("--db_path", type="string", dest="db_path",
                      help="the database name (with extension)")
    # parser.add_option("--atomic_numbers", type="string", action="callback", callback=parser_comma_separated_args, dest="atomic_numbers",
    #                   help="the atomic numbers to sample with")
    parser.add_option("--atomic_number", type="int", dest="atomic_number",
                      help="The atomic number")
    parser.add_option("--model_type", type="string", dest="raw_model_type",
                      help="the model type")
    parser.add_option("--samples_per_point", type="int", dest="samples_per_point",
                      help="The number of samples to generate per efficiency point")
    parser.add_option("--num_energies", type="int", dest="num_energies",
                      help="The number of energies to generated samples at")
    parser.add_option("--max_energy", type="float", dest="max_energy",
                      help="The max energy")
    options,args = parser.parse_args()

    if options.db_path is None:
        print "The database path must be specified!"
        sys.exit(1)

    # Load the database
    database = Data.ScatteringCenterPropertiesDatabase( options.db_path )

    # Load the required data
    atom_properties = database.getAtomProperties( Data.ZAID(options.atomic_number*1000) )

    native_data = Native.ElectronPhotonRelaxationDataContainer( os.path.dirname(options.db_path) + "/" + atom_properties.getPhotoatomicDataProperties( Data.PhotoatomicDataProperties.Native_EPR_FILE, 0 ).filePath() )

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

    # Generate the energy grid that will be used to evaluate the efficiencies
    energy_grid = Utility.doubleArrayFromString( "{1e-3, "+ str(options.num_energies-1)+ "l," + str(options.max_energy) + "}" )
    energy_grid[-1] = energy_grid[-1] - (energy_grid[-1] - energy_grid[-2])/2
    
    two_branch_eff_values = [0.0]*len(energy_grid)
    two_branch_sample_rate_values = [0.0]*len(energy_grid)

    three_branch_lin_eff_values = [0.0]*len(energy_grid)
    three_branch_lin_sample_rate_values = [0.0]*len(energy_grid)

    three_branch_inv_eff_values = [0.0]*len(energy_grid)
    three_branch_inv_sample_rate_values = [0.0]*len(energy_grid)

    for i in range(0,len(energy_grid)):
        print "generating efficiency data for energy ", energy_grid[i], "..."
        two_branch_eff_values[i],two_branch_sample_rate_values[i], = \
            sampleAngle( native_data,
                         model_type,
                         MonteCarlo.TWO_BRANCH_REJECTION_ADJOINT_KN_SAMPLING,
                         options.samples_per_point,
                         energy_grid[i],
                         options.max_energy )

        three_branch_lin_eff_values[i],three_branch_lin_sample_rate_values[i], = \
            sampleAngle( native_data,
                         model_type,
                         MonteCarlo.THREE_BRANCH_LIN_MIXED_ADJOINT_KN_SAMPLING,
                         options.samples_per_point,
                         energy_grid[i],
                         options.max_energy )

        three_branch_inv_eff_values[i],three_branch_inv_sample_rate_values[i], = \
            sampleAngle( native_data,
                         model_type,
                         MonteCarlo.THREE_BRANCH_INVERSE_MIXED_ADJOINT_KN_SAMPLING,
                         options.samples_per_point,
                         energy_grid[i],
                         options.max_energy )

    # Dump the data
    dump_file = open(str(options.atomic_number)+"-"+options.raw_model_type+"-"+str(options.max_energy)+".txt", "w")
    dump_file.write( "# energy, two eff, two rate, three-lin eff, three-lin rate, three-inv eff, three-inv rate\n" )

    for i in range(0,len(energy_grid)):
       dump_file.write( str(energy_grid[i]) +" "+ str(two_branch_eff_values[i]) +" "+ str(two_branch_sample_rate_values[i]) +" "+ str(three_branch_lin_eff_values[i]) +" "+ str(three_branch_lin_sample_rate_values[i]) +" "+ str(three_branch_inv_eff_values[i]) +" "+ str(three_branch_inv_sample_rate_values[i])+"\n" )

    
