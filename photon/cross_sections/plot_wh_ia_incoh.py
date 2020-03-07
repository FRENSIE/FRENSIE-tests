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
    parser.add_option("--atomic_number", type="int", dest="atomic_number",
                      help="the atomic number")
    parser.add_option("--cs_min", type="float", default=0.0, dest="cs_min",
                      help="the min cross section value for the plot")
    parser.add_option("--cs_max", type="float", default=1.0, dest="cs_max",
                      help="the max cross section value for the plot")
    parser.add_option("--ratio_min", type="float", default=0.999, dest="ratio_min",
                      help="the min ratio value for the plot")
    parser.add_option("--ratio_max", type="float", default=1.001, dest="ratio_max",
                      help="the max ratio value for the plot")
    options,args = parser.parse_args()

    if options.db_path is None:
        print "The database path must be specified!"
        sys.exit(1)

    # Load the data
    database = Data.ScatteringCenterPropertiesDatabase( options.db_path )
    atom_properties = database.getAtomProperties( Data.ZAID(options.atomic_number*1000) )

    native_data = Native.ElectronPhotonRelaxationDataContainer( os.path.dirname(options.db_path) + "/" + atom_properties.getPhotoatomicDataProperties( Data.PhotoatomicDataProperties.Native_EPR_FILE, 0 ).filePath() )

    # Load the incoherent cross sections
    energy_grid = native_data.getPhotonEnergyGrid()

    wh_incoh_cs = native_data.getWallerHartreeIncoherentCrossSection()
    ia_incoh_cs = native_data.getImpulseApproxIncoherentCrossSection()

    # Start the grid at the impulse approx threshold index
    threshold_index = native_data.getImpulseApproxIncoherentCrossSectionThresholdEnergyIndex()
    energy_grid = energy_grid[threshold_index:len(energy_grid)]
    wh_incoh_cs = wh_incoh_cs[threshold_index:len(wh_incoh_cs)]
    print len(energy_grid), len(wh_incoh_cs), len(ia_incoh_cs)

    # Calculate the cross section ratios
    cs_ratios = [0.0]*len(energy_grid)

    for i in range(0,len(energy_grid)):
        cs_ratios[i] = ia_incoh_cs[i]/wh_incoh_cs[i]

    # Plot the cross sections and ratios
    fig, ax = plt.subplots( 2, 1, sharex=True )
    plt.subplots_adjust( top=0.95, bottom=0.1, hspace=0.0 )

    # Set up the top subplot
    edge_thickness = 1.1
    line1, = ax[0].plot( energy_grid, wh_incoh_cs, label="WH" )
    line1.set_color( "black" )
    line1.set_linewidth( 1 )

    line2, = ax[0].plot( energy_grid, ia_incoh_cs, label="IA" )
    line2.set_dashes([2, 1, 2, 1])
    line2.set_color( "red" )
    line2.set_linewidth( 1 )

    ax[0].set_ylabel( "Cross Section (b)" )
    ax[0].legend( frameon=False, loc="best" )
    ax[0].grid( True, linestyle=':', linewidth=1 )
    ax[0].set_xscale( "log" )
    ax[0].set_xlim( 0.001, 20.0 )
    ax[0].set_ylim( options.cs_min, options.cs_max )

    yticklabels = ax[0].yaxis.get_ticklabels()
    yticklabels[0].set_color('white')
    yticklabels[-1].set_color('white')

    ax[0].yaxis.set_ticks_position("both")
    ax[0].xaxis.set_ticks_position("both")
    ax[0].tick_params(direction="in", width=edge_thickness)
    ax[0].tick_params(which="minor", direction="in", width=edge_thickness)

    for axis in ['top','bottom','left','right']:
        ax[0].spines[axis].set_linewidth(edge_thickness)

    line3, = ax[1].plot( energy_grid, cs_ratios )
    line3.set_color( "black" )
    line3.set_linewidth( 1 )

    ax[1].set_ylabel( "Cross Section Ratio (IA/WH)" )
    ax[1].set_xlabel( "Energy (MeV)" )
    ax[1].grid( True, linestyle=':', linewidth=1 )
    ax[1].set_xscale( "log" )
    ax[1].set_xlim( 0.001, 20.0 )
    ax[1].set_ylim( options.ratio_min, options.ratio_max )
    
    yticklabels = ax[1].yaxis.get_ticklabels()
    yticklabels[0].set_color('white')
    yticklabels[-1].set_color('white')

    ax[1].yaxis.set_ticks_position("both")
    ax[1].xaxis.set_ticks_position("both")
    ax[1].tick_params(direction="in", width=edge_thickness)
    ax[1].tick_params(which="minor", direction="in", width=edge_thickness)

    for axis in ['top','bottom','left','right']:
        ax[1].spines[axis].set_linewidth(edge_thickness)

    plt.savefig( "incoh_cs_all_comp.eps" )
    plt.show()
