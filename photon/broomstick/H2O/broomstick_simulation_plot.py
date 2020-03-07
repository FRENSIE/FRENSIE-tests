import numpy
import math as m
import matplotlib.pyplot as plt
import os
import sys
import PyFrensie.Geometry.DagMC as DagMC
import PyFrensie.Utility as Utility
import PyFrensie.MonteCarlo as MonteCarlo
import PyFrensie.MonteCarlo.Collision as Collision
import PyFrensie.MonteCarlo.Event as Event
import PyFrensie.MonteCarlo.Manager as Manager
from spectrum_plot_tools import plotSpectralDataWithErrors

def loadDataFromDataFile( data_file_name ):

    # Load the file
    data_file = file( data_file_name, 'r' )

    # Extract the data from the file
    data = {"e_bins": [], "mean": [], "re": []}

    first_line = True
    e_max = 0.0
    
    for line in data_file:
        if first_line:
            first_line = False
        else:
            raw_line_data = line.split()
            
            data["e_bins"].append( float(raw_line_data[0]) )
            e_max = float(raw_line_data[1])

            data["mean"].append( float(raw_line_data[2]) )
            data["re"].append( float(raw_line_data[3]) )

    # Add the max energy
    data["e_bins"].append( e_max )

    return data

def plotAllBroomstickSimulations( wh_data_file_name,
                                  wh_data_name,
                                  hybrid_dopp_data_file_name,
                                  hybrid_dopp_data_name,
                                  ia_data_file_name,
                                  ia_data_name,
                                  consistent_dopp_data_file_name,
                                  consistent_dopp_data_name,
                                  ylims = None,
                                  xlims = None,
                                  legend_pos = None ):

    # Extract the data from the data files
    full_wh_data = loadDataFromDataFile( wh_data_file_name )
    energy_grid = full_wh_data["e_bins"]
    wh_data = full_wh_data["mean"]
    hybrid_data = loadDataFromDataFile( hybrid_dopp_data_file_name )["mean"]
    ia_data = loadDataFromDataFile( ia_data_file_name )["mean"]
    consistent_data = loadDataFromDataFile( consistent_dopp_data_file_name )["mean"]

    # Compute the energy bin midpoints and bin norm constants
    energy_mid_pts = []
    bin_norm_consts = []
    
    for i in range(0, len(energy_grid)-1):
        e_bin_lower = energy_grid[i]
        e_bin_upper = energy_grid[i+1]

        energy_mid_pt = (e_bin_lower+e_bin_upper)/2
            
        energy_mid_pts.append( energy_mid_pt )

        bin_norm_const = e_bin_upper-e_bin_lower

        bin_norm_consts.append( bin_norm_const )

    # Convert the data to data/energy
    for i in range(0, len(energy_grid)-1):
        wh_data[i] /= bin_norm_consts[i]
        hybrid_data[i] /= bin_norm_consts[i]
        ia_data[i] /= bin_norm_consts[i]
        consistent_data[i] /= bin_norm_consts[i]

    # Initialize the plot
    fig, ax = plt.subplots(1, 1, sharex=True)
    plt.subplots_adjust( top=0.95, bottom=0.1, hspace=0.0 )

    line1, = ax.plot( energy_mid_pts, wh_data, label=wh_data_name )
    line1.set_color("black")
    line1.set_linewidth( 1 )

    line2, = ax.plot( energy_mid_pts, hybrid_data, label=hybrid_dopp_data_name )
    line2.set_color("black")
    line2.set_dashes([2, 1, 2, 1])
    line2.set_linewidth( 1 )

    line3, = ax.plot( energy_mid_pts, ia_data, label=ia_data_name )
    line3.set_color("red")
    line3.set_linewidth( 1 )

    line4, = ax.plot( energy_mid_pts, consistent_data, label=consistent_dopp_data_name )
    line4.set_color("red")
    line4.set_dashes([2, 1, 2, 1])
    line4.set_linewidth( 1 )

    ax.set_ylabel( "Current Spectrum" )
    ax.set_xlabel( "Energy (MeV)" )

    if not legend_pos is None:
        ax.legend(frameon=False, bbox_to_anchor=legend_pos)
    else:
        ax.legend(frameon=False)

    ax.grid( True, linestyle=':', linewidth=1 )

    if not xlims is None:
        ax.set_xlim( xlims[0], xlims[-1] )
    else:
        ax.set_xlim( energy_grid[0], energy_grid[-1] )

    if not ylims is None:
        ax.set_ylim( ylims[0], ylims[1] )

    ax.yaxis.set_ticks_position("both")
    ax.xaxis.set_ticks_position("both")
    ax.tick_params(direction="in", width=1.1)
    ax.tick_params(which="minor", direction="in", width=1.1)

    for axis in ['top','bottom','left','right']:
        ax.spines[axis].set_linewidth(1.1)

    fig.savefig("spectrum_comp.eps")
    fig.savefig("spectrum_comp.png")

    plt.show()

def plotBroomstickSimulationSpectrumWHvsIA( wh_data_file_name,
                                            wh_data_name,
                                            ia_data_file_name,
                                            ia_data_name,
                                            is_a_current,
                                            top_ylims = None,
                                            bottom_ylims = None,
                                            xlims = None,
                                            legend_pos = None,
                                            dopp_data = False ):

    # Load the wh data
    wh_data = loadDataFromDataFile( wh_data_file_name )
    print wh_data.keys()
    
    # Load the ia data 
    ia_data = loadDataFromDataFile( ia_data_file_name )
    print ia_data.keys()

    output_file_name = "h_broomstick_"
    output_file_names = []

    if is_a_current:
        output_file_names.append( output_file_name + "current.eps" )
        output_file_names.append( output_file_name + "current.png" )
        data_type = "Current"
    else:
        output_file_names.append( output_file_name + "flux.eps" )
        output_file_names.append( output_file_name + "flux.png" )
        data_type = "Flux"

    if dopp_data:
        wh_data_abrv = "F-Hybrid"
        ia_data_abrv = "F-Consistent"
    else:
        wh_data_abrv = "F-WH"
        ia_data_abrv = "F-IA"
        
    # Plot the data
    plotSpectralDataWithErrors( ia_data_name,
                                ia_data,
                                wh_data_name,
                                wh_data,
                                data_type,
                                log_spacing = False,
                                per_lethargy = False,
                                top_ylims = top_ylims,
                                bottom_ylims = bottom_ylims,
                                xlims = xlims,
                                legend_pos = legend_pos,
                                output_plot_names = output_file_names,
                                frensie_data_abrv = ia_data_abrv,
                                test_data_abrv = wh_data_abrv )

def plotBroomstickSimulationSpectrum( rendezvous_file,
                                      estimator_id,
                                      entity_id,
                                      mcnp_file,
                                      mcnp_file_start,
                                      mcnp_file_end,
                                      is_a_current,
                                      top_ylims = None,
                                      bottom_ylims = None,
                                      xlims = None,
                                      legend_pos = None ):

    # Activate just-in-time initialization to prevent automatic loading of the
    # geometry and data tables
    Utility.activateJustInTimeInitialization()
    
    # Set the database path
    Collision.FilledGeometryModel.setDefaultDatabasePath( os.environ['DATABASE_PATH'] )
    
    # Reload the simulation
    manager = Manager.ParticleSimulationManagerFactory( rendezvous_file ).getManager()
    
    # Extract the estimator of interest
    estimator = manager.getEventHandler().getEstimator( estimator_id )

    full_entity_bin_data = estimator.getEntityBinProcessedData( entity_id )

    start_index = estimator.getNumberOfBins( Event.OBSERVER_ENERGY_DIMENSION )
    end_index = 2*start_index

    entity_bin_data = {"mean": [], "re": [], "e_bins": []}

    for i in range(start_index, end_index):
        entity_bin_data["mean"].append( full_entity_bin_data["mean"][i] )
        entity_bin_data["re"].append( full_entity_bin_data["re"][i] )

    entity_bin_data["e_bins"] = list(estimator.getEnergyDiscretization())

    # Extract the mcnp data from the output file
    mcnp_file = open( mcnp_file, "r" )
    mcnp_file_lines = mcnp_file.readlines()
    
    mcnp_bin_data = {"e_up": [], "mean": [], "re": []}

    mcnp_first_nonzero_index = 0
    
    for i in range(mcnp_file_start,mcnp_file_end+1):
        split_line = mcnp_file_lines[i-1].split()

        mean_value = float(split_line[1])

        if mean_value == 0.0:
            mcnp_first_nonzero_index += 1
        else:
            mcnp_bin_data["e_up"].append( float(split_line[0]) )
            mcnp_bin_data["mean"].append( mean_value )
            mcnp_bin_data["re"].append( float(split_line[2]) )

    # Filter out zero values
    del entity_bin_data["e_bins"][0:mcnp_first_nonzero_index]
    del entity_bin_data["mean"][0:mcnp_first_nonzero_index]
    del entity_bin_data["re"][0:mcnp_first_nonzero_index]

    output_file_name = "h_broomstick_"
    output_file_names = []

    if is_a_current:
        output_file_names.append( output_file_name + "current.eps" )
        output_file_names.append( output_file_name + "current.png" )
        data_type = "Current"
    else:
        output_file_names.append( output_file_name + "flux.eps" )
        output_file_names.append( output_file_name + "flux.png" )
        data_type = "Flux"
        
    # Plot the data
    plotSpectralDataWithErrors( "FRENSIE",
                                entity_bin_data,
                                "MCNP6",
                                mcnp_bin_data,
                                data_type,
                                log_spacing = False,
                                per_lethargy = False,
                                top_ylims = top_ylims,
                                bottom_ylims = bottom_ylims,
                                xlims = xlims,
                                legend_pos = legend_pos,
                                output_plot_names = output_file_names )
