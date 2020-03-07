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

    native_data = Native.ElectronPhotonRelaxationDataContainer( os.path.dirname(options.db_path) + "/" + atom_properties.getPhotoatomicDataProperties( Data.PhotoatomicDataProperties.Native_EPR_FILE, 0 ).filePath() )

    # Get the occupation number data grid for the K subshell
    k_momentum_grid = native_data.getOccupationNumberMomentumGrid( Data.K_SUBSHELL )
    k_occupation_number = native_data.getOccupationNumber( Data.K_SUBSHELL )

    # Get the occupation number data grid for the N1 subshell
    n1_momentum_grid = native_data.getOccupationNumberMomentumGrid( Data.N1_SUBSHELL )
    n1_occupation_number = native_data.getOccupationNumber( Data.N1_SUBSHELL )

    # Get the occupation number data grid for the P3 subshell
    p3_momentum_grid = native_data.getOccupationNumberMomentumGrid( Data.P3_SUBSHELL )
    p3_occupation_number = native_data.getOccupationNumber( Data.P3_SUBSHELL )

    # Plot the occupation numbers
    edge_thickness = 1.1
    #plt.rc('text', usetex=True)
    fig, ax = plt.subplots( 1, 1, sharex=True )

    line1, = ax.plot( k_momentum_grid, k_occupation_number, label= "K Subshell" )
    line1.set_color( "black" )
    line1.set_linewidth( 1 )

    line2, = ax.plot( n1_momentum_grid, n1_occupation_number, label= "N1 Subshell" )
    line2.set_dashes([2, 1, 2, 1])
    line2.set_color( "red" )
    line2.set_linewidth( 1 )

    line3, = ax.plot( p3_momentum_grid, p3_occupation_number, label= "P3 Subshell" )
    line3.set_dashes([1, 1, 1, 1])
    line3.set_color( "blue" )
    line3.set_linewidth( 1 )

    ax.set_ylabel( r"Occupation Number" )
    #ax.set_ylim( 1e-6, 2e2 )
    #ax.set_yscale( "log" )
    ax.set_xlabel( r"$\frac{p_z}{m_ec}$" )
    ax.set_xlim( -1.0, 1.0 )
    ax.grid( True, linestyle=':', linewidth=1 )
    ax.legend( frameon=True )

    for axis in ['top','bottom','left','right']:
        ax.spines[axis].set_linewidth(edge_thickness)

    plt.savefig("pb_occupation_numbers.eps")
    plt.show()
