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
    options,args = parser.parse_args()

    if options.db_path is None:
        print "The database path must be specified!"
        sys.exit(1)

    if options.atomic_number < 1 or options.atomic_number > 100:
        print "The atomic number must be between 1 and 100!"
        sys.exit(1)

    # Load the data
    database = Data.ScatteringCenterPropertiesDatabase( options.db_path )
    atom_properties = database.getAtomProperties( Data.ZAID(options.atomic_number*1000) )
        
    print "Loading adjoint data..."
    adjoint_native_data = Native.AdjointElectronPhotonRelaxationDataContainer( os.path.dirname(options.db_path) + "/" + atom_properties.getAdjointPhotoatomicDataProperties( Data.AdjointPhotoatomicDataProperties.Native_EPR_FILE, 0 ).filePath() )
    print "Adjoint data loaded"

    # Get the adjoint energy grid
    adjoint_energy_grid = adjoint_native_data.getAdjointPhotonEnergyGrid()
    
    # Get the adjoint incoherent cross sections
    adjoint_wh_incoh_cs = Distribution.InterpolatedFullyTabularBasicBivariateDistribution_LinLinLin_UnitBase( adjoint_energy_grid, adjoint_native_data.getAdjointWallerHartreeIncoherentMaxEnergyGrid(), adjoint_native_data.getAdjointWallerHartreeIncoherentCrossSection() )

    adjoint_ia_incoh_cs = Distribution.InterpolatedFullyTabularBasicBivariateDistribution_LinLinLin_UnitBase( adjoint_energy_grid, adjoint_native_data.getAdjointImpulseApproxIncoherentMaxEnergyGrid(), adjoint_native_data.getAdjointImpulseApproxIncoherentCrossSection() )

    adjoint_dopp_ia_incoh_cs = Distribution.InterpolatedFullyTabularBasicBivariateDistribution_LinLinLin_UnitBase( adjoint_energy_grid, adjoint_native_data.getAdjointDopplerBroadenedImpulseApproxIncoherentMaxEnergyGrid(), adjoint_native_data.getAdjointDopplerBroadenedImpulseApproxIncoherentCrossSection() )

    # Reduce the adjoint data to a 1D grid
    cut_adjoint_energy_grid = []
    cut_adjoint_wh_incoh_cs = []
    cut_adjoint_ia_incoh_cs = []
    cut_adjoint_dopp_ia_incoh_cs = []

    ia_wh_cs_ratios = []
    dopp_ia_wh_cs_ratios = []
    ia_dopp_ia_cs_ratios = []

    for i in range(0,len(adjoint_energy_grid)):
        if adjoint_energy_grid[i] < options.max_energy:
            cut_adjoint_energy_grid.append( adjoint_energy_grid[i] )
            cut_adjoint_wh_incoh_cs.append( adjoint_wh_incoh_cs.evaluate( adjoint_energy_grid[i], options.max_energy ) )
            cut_adjoint_ia_incoh_cs.append( adjoint_ia_incoh_cs.evaluate( adjoint_energy_grid[i], options.max_energy ) )
            cut_adjoint_dopp_ia_incoh_cs.append( adjoint_dopp_ia_incoh_cs.evaluate( adjoint_energy_grid[i], options.max_energy ) )

            ia_wh_cs_ratios.append( cut_adjoint_ia_incoh_cs[-1]/cut_adjoint_wh_incoh_cs[-1] )
            dopp_ia_wh_cs_ratios.append( cut_adjoint_dopp_ia_incoh_cs[-1]/cut_adjoint_wh_incoh_cs[-1] )
            ia_dopp_ia_cs_ratios.append( cut_adjoint_ia_incoh_cs[-1]/cut_adjoint_dopp_ia_incoh_cs[-1] )
            
    # Add the max energy point
    cut_adjoint_energy_grid.append( options.max_energy )
    cut_adjoint_wh_incoh_cs.append( 0.0 )
    cut_adjoint_ia_incoh_cs.append( 0.0 )
    cut_adjoint_dopp_ia_incoh_cs.append( 0.0 )

    ia_wh_cs_ratios.append( 1.0 )
    dopp_ia_wh_cs_ratios.append( 1.0 )
    ia_dopp_ia_cs_ratios.append( 1.0 )

    # Plot the cross sections and the ratios
    fig, ax = plt.subplots( 2, 1, sharex=True )
    plt.subplots_adjust( top=0.95, bottom=0.1, hspace=0.0 )

    # Set up the top subplot
    edge_thickness = 1.1
    line1, = ax[0].plot( cut_adjoint_energy_grid, cut_adjoint_wh_incoh_cs, label="WH" )
    line1.set_color( "black" )
    line1.set_linewidth( 1 )

    line2, = ax[0].plot( cut_adjoint_energy_grid, cut_adjoint_ia_incoh_cs, label="IA" )
    line2.set_dashes([2, 1, 2, 1])
    line2.set_color( "red" )
    line2.set_linewidth( 1 )

    line3, = ax[0].plot( cut_adjoint_energy_grid, cut_adjoint_ia_incoh_cs, label="Dopp. IA" )
    line3.set_dashes([1, 1, 1, 1])
    line3.set_color( "blue" )
    line3.set_linewidth( 1 )

    ax[0].set_ylabel( "Cross Section (b)" )
    ax[0].legend( frameon=False, loc="best" )
    ax[0].grid( True, linestyle=':', linewidth=1 )
    ax[0].set_xscale( "log" )
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

    line4, = ax[1].plot( cut_adjoint_energy_grid, ia_wh_cs_ratios, label="IA/WH" )
    line4.set_color( "black" )
    line4.set_linewidth( 1 )

    line5, = ax[1].plot( cut_adjoint_energy_grid, dopp_ia_wh_cs_ratios, label="Dopp. IA/WH" )
    line5.set_dashes([2, 1, 2, 1])
    line5.set_color( "black" )
    line5.set_linewidth( 1 )

    line6, = ax[1].plot( cut_adjoint_energy_grid, ia_dopp_ia_cs_ratios, label="IA/Dopp. IA" )
    line6.set_dashes([1, 1, 1, 1])
    line6.set_color( "black" )
    line6.set_linewidth( 1 )

    ax[1].set_ylabel( "Cross Section Ratio" )
    ax[1].set_xlabel( "Energy (MeV)" )
    ax[1].legend( frameon=False, loc="best" )
    ax[1].grid( True, linestyle=':', linewidth=1 )
    ax[1].set_xscale( "log" )
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

    plt.savefig( "adjoint_incoh_cs_all_comp.eps" )
    plt.show()
