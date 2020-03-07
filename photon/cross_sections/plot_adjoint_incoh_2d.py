#!/usr/bin/python
import sys, os
import os.path as path
from optparse import *
import PyFrensie.Utility as Utility
import PyFrensie.Utility.Distribution as Distribution
import PyFrensie.Data as Data
import PyFrensie.Data.Native as Native
import PyFrensie.MonteCarlo as MonteCarlo
import PyFrensie.MonteCarlo.Photon as Photon

if __name__ == "__main__":

    # Parse the command line options
    parser = OptionParser()
    parser.add_option("--db_path", type="string", dest="db_path",
                      help="the database name (with extension)")
    parser.add_option("--atomic_number", type="int", dest="atomic_number",
                      help="the atomic number")
    parser.add_option("--model_type", type="string", dest="raw_model_type",
                      help="the model type")
    options,args = parser.parse_args()

    if options.db_path is None:
        print "The database path must be specified!"
        sys.exit(1)

    if options.atomic_number < 1 or options.atomic_number > 100:
        print "The atomic number must be between 1 and 100!"
        sys.exit(1)

    if options.raw_model_type != "wh" and options.raw_model_type != "impulse" and options.raw_model_type != "db_impulse":
        print "The model type is not valid!"
        sys.exit(1)

    # Load the data
    database = Data.ScatteringCenterPropertiesDatabase( options.db_path )
    atom_properties = database.getAtomProperties( Data.ZAID(options.atomic_number*1000) )

    #print "Loading adjoint data..."
    adjoint_native_data = Native.AdjointElectronPhotonRelaxationDataContainer( os.path.dirname(options.db_path) + "/" + atom_properties.getAdjointPhotoatomicDataProperties( Data.AdjointPhotoatomicDataProperties.Native_EPR_FILE, 0 ).filePath() )
    #print "Adjoint data loaded"

    # Get the adjoint energy grid
    adjoint_energy_grid = adjoint_native_data.getAdjointPhotonEnergyGrid()

    # Get the adjoint incoherent cross section
    if options.raw_model_type == "wh":
        max_energy_grids = adjoint_native_data.getAdjointWallerHartreeIncoherentMaxEnergyGrid()
        cross_section_values = adjoint_native_data.getAdjointWallerHartreeIncoherentCrossSection()
        adjoint_incoh_dist = Distribution.InterpolatedFullyTabularBasicBivariateDistribution_LinLinLin_UnitBase( adjoint_energy_grid, adjoint_native_data.getAdjointWallerHartreeIncoherentMaxEnergyGrid(), adjoint_native_data.getAdjointWallerHartreeIncoherentCrossSection() )
    elif options.raw_model_type == "impulse":
        max_energy_grids = adjoint_native_data.getAdjointImpulseApproxIncoherentMaxEnergyGrid()
        cross_section_values = adjoint_native_data.getAdjointImpulseApproxIncoherentCrossSection()
        adjoint_incoh_dist = Distribution.InterpolatedFullyTabularBasicBivariateDistribution_LinLinLin_UnitBase( adjoint_energy_grid, adjoint_native_data.getAdjointImpulseApproxIncoherentMaxEnergyGrid(), adjoint_native_data.getAdjointImpulseApproxIncoherentCrossSection() )
    elif options.raw_model_type == "db_impulse":
        max_energy_grids = adjoint_native_data.getAdjointDopplerBroadenedImpulseApproxIncoherentMaxEnergyGrid()
        cross_section_values = adjoint_native_data.getAdjointDopplerBroadenedImpulseApproxIncoherentCrossSection()
        adjoint_incoh_dist = Distribution.InterpolatedFullyTabularBasicBivariateDistribution_LinLinLin_UnitBase( adjoint_energy_grid, adjoint_native_data.getAdjointDopplerBroadenedImpulseApproxIncoherentMaxEnergyGrid(), adjoint_native_data.getAdjointDopplerBroadenedImpulseApproxIncoherentCrossSection() )
    else:
        print "The model type is not valid!"
        sys.exit(1)

    # Generate the plot data (for use with plot_adjoint_incoherent_2d_cs.p)
    for i in range(0,len(adjoint_energy_grid)):
        if adjoint_energy_grid[i] <= 10.0:
            for j in range(0,len(max_energy_grids[i])):
                if max_energy_grids[i][j] < 10.0:
                    print adjoint_energy_grid[i], max_energy_grids[i][j], cross_section_values[i][j]
                else:
                    print adjoint_energy_grid[i], 10.0, adjoint_incoh_dist.evaluate( adjoint_energy_grid[i], 10.0 )
                    break
            print ""
        else:
            break
            

   
