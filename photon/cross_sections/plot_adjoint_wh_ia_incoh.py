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
    parser.add_option("--max_energy", type="float", dest="max_energy",
                      help="the max energy")
    parser.add_option("--cs_min", type="float", default=0.0, dest="cs_min",
                      help="the min cross section value for the plot")
    parser.add_option("--cs_max", type="float", default=1.0, dest="cs_max",
                      help="the max cross section value for the plot")
    parser.add_option("--ratio_min", type="float", default=0.999, dest="ratio_min",
                      help="the min ratio value for the plot")
    parser.add_option("--ratio_max", type="float", default=1.001, dest="ratio_max",
                      help="the max ratio value for the plot")
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

    # Load the native data
    print "Loading adjoint data..."
    native_data = Native.AdjointElectronPhotonRelaxationDataContainer( os.path.dirname(options.db_path) + "/" + atom_properties.getAdjointPhotoatomicDataProperties( Data.AdjointPhotoatomicDataProperties.Native_EPR_FILE, 0 ).filePath() )
    print "Adjoint data loaded"

    # Load the energy grid
    energy_grid = native_data.getAdjointPhotonEnergyGrid()

    # Get the adjoint wh incoherent cross section
    adjoint_wh_incoh_cs = Distribution.InterpolatedFullyTabularBasicBivariateDistribution_LinLinLin_UnitBase( energy_grid, native_data.getAdjointWallerHartreeIncoherentMaxEnergyGrid(), native_data.getAdjointWallerHartreeIncoherentCrossSection() )

    # Get the adjoint ia incoherent cross section
    adjoint_ia_incoh_cs = Distribution.InterpolatedFullyTabularBasicBivariateDistribution_LinLinLin_UnitBase( energy_grid, native_data.getAdjointImpulseApproxIncoherentMaxEnergyGrid(), native_data.getAdjointImpulseApproxIncoherentCrossSection() )

    # Reduce the cross sections to a 1D grid
    cut_energy_grid = []
    interp_adjoint_wh_incoh_cs = []
    interp_adjoint_ia_incoh_cs = []

    for i in range(0,len(energy_grid)):
        if energy_grid[i] < options.max_energy:
            cut_energy_grid.append( energy_grid[i] )
            interp_adjoint_wh_incoh_cs.append( adjoint_wh_incoh_cs.evaluate( energy_grid[i], options.max_energy ) )
            interp_adjoint_ia_incoh_cs.append( adjoint_ia_incoh_cs.evaluate( energy_grid[i], options.max_energy ) )

    cut_energy_grid.append( options.max_energy )
    interp_adjoint_wh_incoh_cs.append( 0.0 )
    interp_adjoint_ia_incoh_cs.append( 0.0 )

    # Calculate the cs ratios
    cs_ratios = []
    
    for i in range(0,len(cut_energy_grid)-1):
        cs_ratios.append( interp_adjoint_ia_incoh_cs[i]/interp_adjoint_wh_incoh_cs[i] )

    cs_ratios.append( 1.0 )

    # Plot the cross section data
    edge_thickness = 1.1
    fig, ax = plt.subplots(2, 1, sharex=True)
    plt.subplots_adjust( top=0.95, bottom=0.1, hspace=0.0 )

    # Set up the top subplot
    line1, = ax[0].plot( cut_energy_grid, interp_adjoint_ia_incoh_cs, label="IA" )
    line1.set_dashes([2, 1, 2, 1])
    line1.set_color( "red" )
    line1.set_linewidth( 1 )

    line2, = ax[0].plot( cut_energy_grid, interp_adjoint_wh_incoh_cs, label="WH" )
    line2.set_color( "black" )
    line2.set_linewidth( 1 )

    ax[0].set_ylabel( "Cross Section (b)" )
    ax[0].legend( frameon=False, bbox_to_anchor=[options.legend_xpos,options.legend_ypos])
    ax[0].grid( True, linestyle=':', linewidth=1 )
    ax[0].set_xlim( 0.001, options.max_energy )
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

    line3, = ax[1].plot( cut_energy_grid, cs_ratios )
    ax[1].set_ylabel( "IA/WH" )
    ax[1].set_xlabel( "Energy (MeV)" )
    ax[1].grid( True, linestyle=':', linewidth=1 )

    ax[1].set_xlim( 0.001, options.max_energy )
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
    
    plt.savefig("adjoint_incoh_ia_wh_cs_comp.eps")
    plt.show()
