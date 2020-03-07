#!/usr/bin/python
import sys, os
import math as m
import os.path as path
import matplotlib.pyplot as plt
from optparse import *
import PyFrensie.Utility as Utility
import PyFrensie.Utility.Distribution as Distribution
import PyFrensie.Data as Data
import PyFrensie.Data.Native as Native
import PyFrensie.Data.ACE as ACE
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

    print "Loading forward data..."
    native_data = Native.ElectronPhotonRelaxationDataContainer( os.path.dirname(options.db_path) + "/" + atom_properties.getPhotoatomicDataProperties( Data.PhotoatomicDataProperties.Native_EPR_FILE, 0 ).filePath() )
    print "Forward data loaded"

    print "Load forward ace data..."
    ace_file = ACE.ACEFileHandler( os.path.dirname(options.db_path) + "/" + atom_properties.getPhotoatomicDataProperties( Data.PhotoatomicDataProperties.ACE_EPR_FILE, 12 ).filePath(), atom_properties.getPhotoatomicDataProperties( Data.PhotoatomicDataProperties.ACE_EPR_FILE, 12 ).tableName(), atom_properties.getPhotoatomicDataProperties( Data.PhotoatomicDataProperties.ACE_EPR_FILE, 12 ).fileStartLine() )
    ace_data = ACE.XSSEPRDataExtractor( ace_file.getTableNXSArray(), ace_file.getTableJXSArray(), ace_file.getTableXSSArray() )
    print "Forward ace data loaded"

    # Get the ace forward energy grid and cross sections
    ace_forward_energy_grid = ace_data.extractPhotonEnergyGrid()
    ace_incoherent_cs = ace_data.extractIncoherentCrossSection()
    ace_coherent_cs = ace_data.extractCoherentCrossSection()
    ace_pe_cs = ace_data.extractPhotoelectricCrossSection()

    # Compute the ace total forward cross section
    ace_total_forward_cross_section = []
    for i in range(0,len(ace_forward_energy_grid)):
        ace_forward_energy_grid[i] =  m.exp( ace_forward_energy_grid[i] )
        total_forward_cs_value = m.exp( ace_incoherent_cs[i] ) + m.exp( ace_coherent_cs[i] )
        
        if ace_pe_cs[i] > 0.0:
            total_forward_cs_value += m.exp( ace_pe_cs[i] )

        ace_total_forward_cross_section.append( total_forward_cs_value )

        print ace_forward_energy_grid[i], total_forward_cs_value

    print "Loading adjoint data..."
    adjoint_native_data = Native.AdjointElectronPhotonRelaxationDataContainer( os.path.dirname(options.db_path) + "/" + atom_properties.getAdjointPhotoatomicDataProperties( Data.AdjointPhotoatomicDataProperties.Native_EPR_FILE, 0 ).filePath() )
    print "Adjoint data loaded"   

    # Get the forward energy grid
    forward_energy_grid = native_data.getPhotonEnergyGrid()

    # Get the incoherent cross section
    incoherent_cross_section = native_data.getWallerHartreeIncoherentCrossSection()
    
    # Get the coherent cross section
    coherent_cross_section = native_data.getWallerHartreeCoherentCrossSection()

    # Get the photoelectric effect cross section
    photoelectric_cross_section = native_data.getPhotoelectricCrossSection()
    photoelectric_cross_section_threshold_index = native_data.getPhotoelectricCrossSectionThresholdEnergyIndex()

    # Get the forward total cross section
    total_cross_section = native_data.getWallerHartreeTotalCrossSection()

    # Get the forward total cross section from the adjoint native data
    total_cross_section_from_adjoint = Distribution.TabularDistribution_LinLin( adjoint_native_data.getAdjointPhotonEnergyGrid(), adjoint_native_data.getWallerHartreeTotalCrossSection() )
    # Distribution.InterpolatedFullyTabularBasicBivariateDistribution_LinLinLin_UnitBase( adjoint_native_data.getAdjointPhotonEnergyGrid(), adjoint_native_data.getAdjointWallerHartreeTotalMaxEnergyGrid() , adjoint_native_data.getAdjointWallerHartreeTotalCrossSection() )

    # Cut the grids
    cut_forward_energy_grid = []
    cut_forward_photoelectric_energy_grid = []
    cut_incoherent_cross_section = []
    cut_coherent_cross_section = []
    cut_photoelectric_cross_section = []
    cut_total_cross_section = []
    reduced_total_cross_section_from_adjoint = []

    for i in range(0,len(forward_energy_grid)):
        if forward_energy_grid[i] <= options.max_energy:
            cut_forward_energy_grid.append( forward_energy_grid[i] )
            cut_incoherent_cross_section.append( incoherent_cross_section[i] )
            cut_coherent_cross_section.append( coherent_cross_section[i] )
            cut_total_cross_section.append( total_cross_section[i] )
            reduced_total_cross_section_from_adjoint.append( total_cross_section_from_adjoint.evaluate( forward_energy_grid[i] ) )
        if i >= photoelectric_cross_section_threshold_index:
            cut_forward_photoelectric_energy_grid.append( forward_energy_grid[i] )
            cut_photoelectric_cross_section.append( photoelectric_cross_section[i-photoelectric_cross_section_threshold_index] )

    exact_total_cross_section = [0.0]*len(cut_forward_energy_grid)
    adjoint_interp_over_forward_interp_ratios = [0.0]*len(cut_forward_energy_grid)

    for i in range(0,len(cut_forward_energy_grid)):
        exact_total_cross_section[i] = cut_incoherent_cross_section[i] + cut_coherent_cross_section[i]
        
        if i >= photoelectric_cross_section_threshold_index:
            exact_total_cross_section[i] += cut_photoelectric_cross_section[i-photoelectric_cross_section_threshold_index]

            #adjoint_interp_over_forward_interp_ratios[i] = reduced_total_cross_section_from_adjoint[i]/cut_total_cross_section[i]
        adjoint_interp_over_forward_interp_ratios[i] = reduced_total_cross_section_from_adjoint[i]/exact_total_cross_section[i]
        #print cut_forward_energy_grid[i], cut_incoherent_cross_section[i], cut_coherent_cross_section[i], cut_total_cross_section[i], reduced_total_cross_section_from_adjoint[i], exact_total_cross_section[i]

    # Plot the cross sections
    edge_thickness = 1.1
    fig, ax = plt.subplots(2, 1, sharex=True)
    plt.subplots_adjust( top=0.78, bottom=0.1, right=0.95, left=0.15, hspace=0.0 )

    # Set up the top subplot
    line1, = ax[0].plot( cut_forward_energy_grid, cut_incoherent_cross_section, label="Incoherent CS" )
    line1.set_color( "blue" )
    line1.set_linewidth( 1 )
    
    line2, = ax[0].plot( cut_forward_energy_grid, cut_coherent_cross_section, label="Coherent CS" )
    line2.set_color( "green" )
    line2.set_linewidth( 1 )

    line3, = ax[0].plot( cut_forward_photoelectric_energy_grid, cut_photoelectric_cross_section, label="Photoelectric CS" )
    line3.set_color( "purple" )
    line3.set_linewidth( 1 )

    line4, = ax[0].plot( cut_forward_energy_grid, cut_total_cross_section, label="Total CS" )
    line4.set_dashes([2, 1, 2, 1])
    line4.set_color( "black" )
    line4.set_linewidth( 1 )

    line5, = ax[0].plot( cut_forward_energy_grid, reduced_total_cross_section_from_adjoint, label="Total CS (adjoint table)" )
    line5.set_dashes([1, 1, 1, 1])
    line5.set_color( "red" )
    line5.set_linewidth( 1 )

    line6, = ax[0].plot( ace_forward_energy_grid, ace_total_forward_cross_section, label="Total CS (ace table)" )
    line6.set_dashes([1, 1, 1, 1])
    line6.set_color( "orange" )
    line6.set_linewidth( 1 )   

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

    line6, = ax[1].plot( cut_forward_energy_grid, adjoint_interp_over_forward_interp_ratios )
    ax[1].set_ylabel( "Forward CS (adjoint table)/\nForward CS" )
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
    
    plt.savefig("forward_cs_comp.eps")
    plt.show()
