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
    options,args = parser.parse_args()

    if options.db_path is None:
        print "The database path must be specified!"
        sys.exit(1)

    # Load the data
    database = Data.ScatteringCenterPropertiesDatabase( options.db_path )
    atom_properties = database.getAtomProperties( Data.ZAID(82000) )

    native_data_82 = Native.ElectronPhotonRelaxationDataContainer( os.path.dirname(options.db_path) + "/" + atom_properties.getPhotoatomicDataProperties( Data.PhotoatomicDataProperties.Native_EPR_FILE, 0 ).filePath() )

    atom_properties = database.getAtomProperties( Data.ZAID(13000) )
    native_data_13 = Native.ElectronPhotonRelaxationDataContainer( os.path.dirname(options.db_path) + "/" + atom_properties.getPhotoatomicDataProperties( Data.PhotoatomicDataProperties.Native_EPR_FILE, 0 ).filePath() )

    atom_properties = database.getAtomProperties( Data.ZAID(6000) )
    native_data_6 = Native.ElectronPhotonRelaxationDataContainer( os.path.dirname(options.db_path) + "/" + atom_properties.getPhotoatomicDataProperties( Data.PhotoatomicDataProperties.Native_EPR_FILE, 0 ).filePath() )

    # Get the Waller-Hartree scattering function for Z=82
    momentum_grid_82 = native_data_82.getWallerHartreeScatteringFunctionMomentumGrid()
    scattering_function_82 = native_data_82.getWallerHartreeScatteringFunction()

    # Get the Waller-Hartree scattering function for Z=13
    momentum_grid_13 = native_data_13.getWallerHartreeScatteringFunctionMomentumGrid()
    scattering_function_13 = native_data_13.getWallerHartreeScatteringFunction()

    # Get the Waller-Hartree scattering function for Z=6
    momentum_grid_6 = native_data_6.getWallerHartreeScatteringFunctionMomentumGrid()
    scattering_function_6 = native_data_6.getWallerHartreeScatteringFunction()

    # Plot the scattering function
    edge_thickness = 1.1
    #plt.rc('text', usetex=True)
    fig, ax = plt.subplots( 1, 1, sharex=True )

    line1, = ax.plot( momentum_grid_82, scattering_function_82, label= "Z=82" )
    line1.set_color( "black" )
    line1.set_linewidth( 1 )

    line2, = ax.plot( momentum_grid_13, scattering_function_13, label= "Z=13" )
    line2.set_dashes([2, 1, 2, 1])
    line2.set_color( "red" )
    line2.set_linewidth( 1 )

    line3, = ax.plot( momentum_grid_6, scattering_function_6, label= "Z=6" )
    line3.set_dashes([1, 1, 1, 1])
    line3.set_color( "blue" )
    line3.set_linewidth( 1 )

    ax.set_ylabel( r"$S_{WH}(\nu,Z)$" ) 
    #ax.set_ylim( 1e-6, 2e2 )
    #ax.set_yscale( "log" )
    ax.set_xlabel( r"$\nu(E^{'},\theta)$ (1/cm)" )
    ax.set_xscale( "log" )
    ax.set_xlim( 1e-4, 1e17 )
    ax.grid( True, linestyle=':', linewidth=1 )
    ax.legend( frameon=True )

    for axis in ['top','bottom','left','right']:
        ax.spines[axis].set_linewidth(edge_thickness)

    plt.savefig("wh_scattering_functions.eps")
    plt.show()
