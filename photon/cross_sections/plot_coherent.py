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
    parser.add_option("--ratio_min", type="float", default=1.001, dest="ratio_min",
                      help="the min ratio value for the plot")
    parser.add_option("--ratio_max", type="float", default=0.999, dest="ratio_max",
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

    # print "Loading forward data..."
    # native_data = Native.ElectronPhotonRelaxationDataContainer( os.path.dirname(options.db_path) + "/" + atom_properties.getPhotoatomicDataProperties( Data.PhotoatomicDataProperties.Native_EPR_FILE, 0 ).filePath() )
    # print "Forward data loaded"

    print "Loading adjoint data..."
    adjoint_native_data = Native.AdjointElectronPhotonRelaxationDataContainer( os.path.dirname(options.db_path) + "/" + atom_properties.getAdjointPhotoatomicDataProperties( Data.AdjointPhotoatomicDataProperties.Native_EPR_FILE, 0 ).filePath() )
    print "Adjoint data loaded"

    coherent_dist = Photon.CoherentScatteringDistributionNativeFactory.createEfficientCoherentDistribution( adjoint_native_data )

    # # Get the forward energy grid
    # forward_energy_grid = native_data.getPhotonEnergyGrid()

    # # Get the coherent cross section
    # coherent_cross_section = native_data.getWallerHartreeCoherentCrossSection()

    # # Create the forward coherent distribution
    # forward_coherent_dist = Distribution.TabularDistribution_LinLin( forward_energy_grid, coherent_cross_section )

    # Get the adjoint energy grid
    adjoint_energy_grid = adjoint_native_data.getAdjointPhotonEnergyGrid()

    # Get the adjoint coherent cross section
    adjoint_coherent_cross_section = adjoint_native_data.getAdjointWallerHartreeCoherentCrossSection()

    # Calculate the ratio of the adjoint coherent cross section and the
    # forward coherent cross section
    cut_adjoint_energy_grid = []
    cut_adjoint_coherent_cross_section = []
    exact_adjoint_coherent_cs = []
    interp_over_exact_ratios = []
    
    for i in range(0,len(adjoint_energy_grid)):
        if adjoint_energy_grid[i] <= options.max_energy:
            cut_adjoint_energy_grid.append( adjoint_energy_grid[i] )
            cut_adjoint_coherent_cross_section.append( adjoint_coherent_cross_section[i] )
            exact_cs = coherent_dist.evaluateIntegratedCrossSection( adjoint_energy_grid[i], 1e-4 )
            exact_adjoint_coherent_cs.append( exact_cs )
            interp_over_exact_ratios.append( adjoint_coherent_cross_section[i]/exact_cs )

    for i in range(0,len(cut_adjoint_energy_grid)):
        print cut_adjoint_energy_grid[i], cut_adjoint_coherent_cross_section[i], exact_adjoint_coherent_cs[i], interp_over_exact_ratios[i]

    # Plot the cross sections
    edge_thickness = 1.1
    fig, ax = plt.subplots(2, 1, sharex=True)
    plt.subplots_adjust( top=0.95, bottom=0.1, hspace=0.0 )

    # Set up the top subplot
    line1, = ax[0].plot( cut_adjoint_energy_grid, cut_adjoint_coherent_cross_section, label="Interp CS" )
    line1.set_dashes([2, 1, 2, 1])
    line1.set_color( "red" )
    line1.set_linewidth( 1 )

    line2, = ax[0].plot( cut_adjoint_energy_grid, exact_adjoint_coherent_cs, label="Exact CS" )
    line2.set_dashes([1, 1, 1, 1])
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

    line3, = ax[1].plot( cut_adjoint_energy_grid, interp_over_exact_ratios )
    ax[1].set_ylabel( "Interp CS/Exact CS" )
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
    
    plt.savefig("adjoint_coh_cs_comp.eps")
    plt.show()

    
        
