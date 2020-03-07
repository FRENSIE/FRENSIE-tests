#!/usr/bin/python
import sys, os
import os.path as path
import matplotlib.pyplot as plt
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
    parser.add_option("--e_max", type="float", default=1.0, dest="e_max",
                      help="the max cross section value for the plot")
    options,args = parser.parse_args()

    if options.db_path is None:
        print "The database path must be specified!"
        sys.exit(1)

    # Load the data
    database = Data.ScatteringCenterPropertiesDatabase( options.db_path )
    atom_properties = database.getAtomProperties( Data.ZAID(82000) )

    native_data_82 = Native.AdjointElectronPhotonRelaxationDataContainer( os.path.dirname(options.db_path) + "/" + atom_properties.getAdjointPhotoatomicDataProperties( Data.AdjointPhotoatomicDataProperties.Native_EPR_FILE, 0 ).filePath() )

    atom_properties = database.getAtomProperties( Data.ZAID(13000) )
    native_data_13 = Native.AdjointElectronPhotonRelaxationDataContainer( os.path.dirname(options.db_path) + "/" + atom_properties.getAdjointPhotoatomicDataProperties( Data.AdjointPhotoatomicDataProperties.Native_EPR_FILE, 0 ).filePath() )

    atom_properties = database.getAtomProperties( Data.ZAID(6000) )
    native_data_6 = Native.AdjointElectronPhotonRelaxationDataContainer( os.path.dirname(options.db_path) + "/" + atom_properties.getAdjointPhotoatomicDataProperties( Data.AdjointPhotoatomicDataProperties.Native_EPR_FILE, 0 ).filePath() )

    # Compute the adjoint weight factor for Lead
    energy_grid_82 = native_data_82.getAdjointPhotonEnergyGrid()

    adjoint_incoh_cs_82 = Distribution.InterpolatedFullyTabularBasicBivariateDistribution_LinLinLin_UnitBase( energy_grid_82, native_data_82.getAdjointWallerHartreeIncoherentMaxEnergyGrid(), native_data_82.getAdjointWallerHartreeIncoherentCrossSection() )

    coherent_cs_82 = native_data_82.getAdjointWallerHartreeCoherentCrossSection()
    forward_cs_82 = native_data_82.getWallerHartreeTotalCrossSection()

    adjoint_weight_factor_82 = []
    cut_energy_grid = []
    for i in range(0,len(energy_grid_82)):
        if energy_grid_82[i] < options.e_max:
            cut_energy_grid.append( energy_grid_82[i] )
            adjoint_weight_factor_82.append( (coherent_cs_82[i] + adjoint_incoh_cs_82.evaluate( energy_grid_82[i], options.e_max ))/forward_cs_82[i] )

    energy_grid_82 = cut_energy_grid

    # Compute the adjoint weight factor for Aluminum
    energy_grid_13 = native_data_13.getAdjointPhotonEnergyGrid()

    adjoint_incoh_cs_13 = Distribution.InterpolatedFullyTabularBasicBivariateDistribution_LinLinLin_UnitBase( energy_grid_13, native_data_13.getAdjointWallerHartreeIncoherentMaxEnergyGrid(), native_data_13.getAdjointWallerHartreeIncoherentCrossSection() )

    coherent_cs_13 = native_data_13.getAdjointWallerHartreeCoherentCrossSection()
    forward_cs_13 = native_data_13.getWallerHartreeTotalCrossSection()

    adjoint_weight_factor_13 = []
    cut_energy_grid = []
    for i in range(0,len(energy_grid_13)):
        if energy_grid_13[i] < options.e_max:
            cut_energy_grid.append( energy_grid_13[i] )
            adjoint_weight_factor_13.append( (coherent_cs_13[i] + adjoint_incoh_cs_13.evaluate( energy_grid_13[i], options.e_max ))/forward_cs_13[i] )

    energy_grid_13 = cut_energy_grid

    # Compute the adjoint weight factor for Carbon
    energy_grid_6 = native_data_6.getAdjointPhotonEnergyGrid()

    adjoint_incoh_cs_6 = Distribution.InterpolatedFullyTabularBasicBivariateDistribution_LinLinLin_UnitBase( energy_grid_6, native_data_6.getAdjointWallerHartreeIncoherentMaxEnergyGrid(), native_data_6.getAdjointWallerHartreeIncoherentCrossSection() )

    coherent_cs_6 = native_data_6.getAdjointWallerHartreeCoherentCrossSection()
    forward_cs_6 = native_data_6.getWallerHartreeTotalCrossSection()

    adjoint_weight_factor_6 = []
    cut_energy_grid = []
    for i in range(0,len(energy_grid_6)):
        if energy_grid_6[i] < options.e_max:
            cut_energy_grid.append( energy_grid_6[i] )
            adjoint_weight_factor_6.append( (coherent_cs_6[i] + adjoint_incoh_cs_6.evaluate( energy_grid_6[i], options.e_max ))/forward_cs_6[i] )

    energy_grid_6 = cut_energy_grid

    # Plot the adjoint weight factors
    edge_thickness = 1.1
    #plt.rc('text', usetex=True)
    fig, ax = plt.subplots( 1, 1, sharex=True )

    line1, = ax.plot( energy_grid_82, adjoint_weight_factor_82, label= "Z=82" )
    line1.set_color( "black" )
    line1.set_linewidth( 1 )

    line2, = ax.plot( energy_grid_13, adjoint_weight_factor_13, label= "Z=13" )
    line2.set_dashes([2, 1, 2, 1])
    line2.set_color( "red" )
    line2.set_linewidth( 1 )

    line3, = ax.plot( energy_grid_6, adjoint_weight_factor_6, label= "Z=6" )
    line3.set_dashes([1, 1, 1, 1])
    line3.set_color( "blue" )
    line3.set_linewidth( 1 )

    ax.set_ylabel( "Adjoint Weight Factor" )
    #ax.set_ylim( 1e-6, 2e2 )
    #ax.set_yscale( "log" )
    ax.set_xlabel( "E (MeV)" )
    ax.set_xscale( "log" )
    ax.set_xlim( 1e-3, options.e_max )
    ax.grid( True, linestyle=':', linewidth=1 )
    ax.legend( frameon=True )

    for axis in ['top','bottom','left','right']:
        ax.spines[axis].set_linewidth(edge_thickness)

    plt.savefig("adjoint_weight_factors.eps")
    plt.show()
