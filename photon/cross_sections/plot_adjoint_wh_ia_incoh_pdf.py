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
    parser.add_option("--subshell", type="int", default=1, dest="subshell",
                      help="the subshell to use")
    parser.add_option("--pdf_min", type="float", default=0.0, dest="pdf_min",
                      help="the min cross section value for the plot")
    parser.add_option("--pdf_max", type="float", default=1.0, dest="pdf_max",
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

    # Create the distribution for evaluating the wh incoherent PDF
    adjoint_wh_incoh_dist = Photon.IncoherentAdjointPhotonScatteringDistributionNativeFactory.createDistribution(
                                                             native_data,
                                                             MonteCarlo.WH_INCOHERENT_ADJOINT_MODEL,
                                                             MonteCarlo.THREE_BRANCH_LIN_MIXED_ADJOINT_KN_SAMPLING,
                                                             options.max_energy,
                                                             1 )
    

    # Create the distribution for evaluating the ia incoherent PDF
    adjoint_ia_incoh_dist = Photon.IncoherentAdjointPhotonScatteringDistributionNativeFactory.createDistribution(
                                                             native_data,
                                                             MonteCarlo.DB_IMPULSE_INCOHERENT_ADJOINT_MODEL,
                                                             MonteCarlo.THREE_BRANCH_LIN_MIXED_ADJOINT_KN_SAMPLING,
                                                             options.max_energy,
                                                             options.subshell )

    # Calculate the adjoint Compton edge
    adjoint_compton_edge = options.max_energy/(1+2*options.max_energy/0.51099891013)
    #adjoint_compton_edge = 0.1/(1+2*0.1/0.51099891013)
    #e_in = adjoint_compton_edge
    e_in = 0.09108732671362704

    # Evaluate the PDFs
    #mu_min = -1.0
    mu_min = 0.5+1.0e-14
    step_size = (1.0-mu_min)/1000

    energy_grid = []
    mu_grid = []
    adjoint_wh_pdf = []
    adjoint_ia_pdf = []
    pdf_ratios = []

    pdf_conversion = 0.51099891013/(options.max_energy**2)
    #pdf_conversion = 0.51099891013/(0.1*0.1)
    
    for i in range(0,1000):
        mu = mu_min + i*step_size

        mu_grid.append( mu )
        energy_grid.append( e_in/(1.0 - e_in/0.51099891013*(1-mu)) )
        
        # adjoint_wh_pdf.append( adjoint_wh_incoh_dist.evaluatePDF( e_in, options.max_energy, mu )*pdf_conversion )
        # adjoint_ia_pdf.append( adjoint_ia_incoh_dist.evaluatePDF( e_in, options.max_energy, mu )*pdf_conversion )
        adjoint_wh_pdf.append( adjoint_wh_incoh_dist.evaluatePDF( e_in, options.max_energy, mu ) )
        adjoint_ia_pdf.append( adjoint_ia_incoh_dist.evaluatePDF( e_in, options.max_energy, mu ) )
        pdf_ratios.append( adjoint_ia_pdf[-1]/adjoint_wh_pdf[-1] )
        
        print mu, pdf_ratios[-1]

    mu_grid.append( 1.0 )
    energy_grid.append( e_in )
    adjoint_wh_pdf.append( 0.0 )
    adjoint_ia_pdf.append( 0.0 )
    pdf_ratios.append( 1.0 )

    energy_grid.reverse()
    # adjoint_wh_pdf.reverse()
    # adjoint_ia_pdf.reverse()
    # pdf_ratios.reverse()                        

    # Plot the cross section data
    edge_thickness = 1.1
    fig, ax = plt.subplots(2, 1, sharex=True)
    plt.subplots_adjust( top=0.95, bottom=0.1, hspace=0.0 )

    # Set up the top subplot
    #line1, = ax[0].plot( energy_grid, adjoint_ia_pdf, label="IA" )
    line1, = ax[0].plot( mu_grid, adjoint_ia_pdf, label="IA" )
    line1.set_dashes([2, 1, 2, 1])
    line1.set_color( "red" )
    line1.set_linewidth( 1 )

    #line2, = ax[0].plot( energy_grid, adjoint_wh_pdf, label="WH" )
    line2, = ax[0].plot( mu_grid, adjoint_wh_pdf, label="WH" )
    line2.set_color( "black" )
    line2.set_linewidth( 1 )

    ax[0].set_ylabel( "PDF (1/MeV)" )
    ax[0].legend( frameon=False, bbox_to_anchor=[options.legend_xpos,options.legend_ypos])
    ax[0].grid( True, linestyle=':', linewidth=1 )
    ax[0].set_xlim( e_in, options.max_energy )
    #ax[0].set_xlim( e_in, 0.1 )
    #ax[0].set_ylim( options.pdf_min, options.pdf_max )

    yticklabels = ax[0].yaxis.get_ticklabels()
    yticklabels[0].set_color('white')
    yticklabels[-1].set_color('white')

    ax[0].yaxis.set_ticks_position("both")
    ax[0].xaxis.set_ticks_position("both")
    ax[0].tick_params(direction="in", width=edge_thickness)
    ax[0].tick_params(which="minor", direction="in", width=edge_thickness)

    for axis in ['top','bottom','left','right']:
        ax[0].spines[axis].set_linewidth(edge_thickness)

    #line3, = ax[1].plot( energy_grid, pdf_ratios )
    line3, = ax[1].plot( mu_grid, pdf_ratios )
    ax[1].set_ylabel( "IA/WH" )
    #ax[1].set_xlabel( "Energy (MeV)" )
    ax[1].set_xlabel( "Mu" )
    ax[1].grid( True, linestyle=':', linewidth=1 )

    #ax[1].set_xlim( e_in, options.max_energy )
    ax[1].set_xlim( -1.0, 1.0 )
    #ax[1].set_xlim( e_in, 0.1 )
    #ax[1].set_ylim( options.ratio_min, options.ratio_max )

    yticklabels = ax[1].yaxis.get_ticklabels()
    yticklabels[0].set_color('white')
    yticklabels[-1].set_color('white')

    ax[1].yaxis.set_ticks_position("both")
    ax[1].xaxis.set_ticks_position("both")
    ax[1].tick_params(direction="in", width=edge_thickness)
    ax[1].tick_params(which="minor", direction="in", width=edge_thickness)

    for axis in ['top','bottom','left','right']:
        ax[1].spines[axis].set_linewidth(edge_thickness)
    
    plt.savefig("adjoint_incoh_ia_wh_pdf_comp.eps")
    plt.show()
        

    
