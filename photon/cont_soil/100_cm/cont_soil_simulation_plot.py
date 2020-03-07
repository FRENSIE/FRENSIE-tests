import numpy
import math as m
import matplotlib.pyplot as plt
import os
import sys
import PyFrensie.Utility as Utility
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

def plotExtractedContSoilSimulationData( data_file_name_1,
                                         data_name_1,
                                         data_name_abrv_1,
                                         data_file_name_2,
                                         data_name_2,
                                         data_name_abrv_2,
                                         top_ylims = None,
                                         bottom_ylims = None,
                                         xlims = None,
                                         legend_pos = None ):

    # Load the first data
    data_1 = loadDataFromDataFile( data_file_name_1 )
    
    # Load the second data
    data_2 = loadDataFromDataFile( data_file_name_2 )

    # for i in range(0,len(data_2["mean"])):
    #     data_2["mean"][i] *= 0.51099891013;
    # for i in range(0,len(data_2["e_bins"])-1):
    #     #data_2["mean"][i] *= 0.51099891013
        
    #     if data_2["e_bins"][i] > 0.0718705616632476:
    #         data_2["mean"][i] /= 2

    output_file_name = "cont_soil_effective_dose_rate"
    output_file_names = []
    output_file_names.append( output_file_name + ".eps" )
    output_file_names.append( output_file_name + ".png" )

    # Plot the data
    plotSpectralDataWithErrors( data_name_2,
                                data_2,
                                data_name_1,
                                data_1,
                                "Effective Dose Rate",
                                log_spacing = False,
                                per_lethargy = False,
                                top_ylims = top_ylims,
                                bottom_ylims = bottom_ylims,
                                xlims = xlims,
                                legend_pos = legend_pos,
                                output_plot_names = output_file_names,
                                frensie_data_abrv = data_name_abrv_2,
                                test_data_abrv = data_name_abrv_1,
                                y_log_spacing = True )

def plotContSoilSimulationSpectrum( rendezvous_file,
                                    estimator_id,
                                    entity_id,
                                    mcnp_file,
                                    mcnp_file_start,
                                    mcnp_file_end,
                                    is_a_current,
                                    is_forward,
                                    col_bin = None,
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

    # Print the leakage current
    # estimator = manager.getEventHandler().getEstimator( 2 )
    # print estimator.getEntityTotalProcessedData( 20 )
    # print estimator.getEntityTotalProcessedData( 21 )
    # print estimator.getEntityTotalProcessedData( 22 )
    # print estimator.getEntityTotalProcessedData( 23 )
    # print estimator.getEntityTotalProcessedData( 24 )
    # print estimator.getEntityTotalProcessedData( 25 )
    
    # Extract the estimator of interest
    estimator = manager.getEventHandler().getEstimator( estimator_id )

    full_entity_bin_data = estimator.getEntityBinProcessedData( entity_id )
    
    num_energy_bins = 0

    if is_forward:
        num_energy_bins = estimator.getNumberOfBins( Event.OBSERVER_ENERGY_DIMENSION )
    else:
        num_energy_bins = estimator.getNumberOfBins( Event.OBSERVER_SOURCE_ENERGY_DIMENSION )

    start_index = 0
    end_index = num_energy_bins

    if not col_bin is None:
        num_col_bins = estimator.getNumberOfBins( Event.OBSERVER_COLLISION_NUMBER_DIMENSION )
        
        if col_bin >= num_col_bins:
            print "There are only", num_col_bins, "collision number bins!"
            sys.exit(1)
        
        start_index = col_bin*num_energy_bins
        end_index = start_index + num_energy_bins
        
    entity_bin_data = {"mean": [], "re": [], "e_bins": [], "vov": [], "fom": []}

    for i in range(start_index, end_index):
        entity_bin_data["mean"].append( full_entity_bin_data["mean"][i] )
        entity_bin_data["re"].append( full_entity_bin_data["re"][i] )
        #entity_bin_data["vov"].append( full_entity_bin_data["vov"][i] )
        entity_bin_data["fom"].append( full_entity_bin_data["fom"][i] )

    if is_forward:
        entity_bin_data["e_bins"] = list(estimator.getEnergyDiscretization())
    else:
        entity_bin_data["e_bins"] = list(estimator.getSourceEnergyDiscretization())
    
    # Extract the mcnp data from the output file
    mcnp_file = open( mcnp_file, "r" )
    mcnp_file_lines = mcnp_file.readlines()
    
    mcnp_bin_data = {"e_up": [], "mean": [], "re": []}

    mcnp_first_nonzero_index = 0
    first_nonzero_value_found = False
    
    for i in range(mcnp_file_start,mcnp_file_end+1):
        split_line = mcnp_file_lines[i-1].split()

        mean_value = float(split_line[1])

        mcnp_bin_data["e_up"].append( float(split_line[0]) )
        mcnp_bin_data["mean"].append( mean_value )
        mcnp_bin_data["re"].append( float(split_line[2]) )
    
    for i in range(0,len(mcnp_bin_data["e_up"])):
        print i, mcnp_bin_data["e_up"][i], entity_bin_data["e_bins"][i+1], mcnp_bin_data["mean"][i], entity_bin_data["mean"][i], entity_bin_data["re"][i]
        #print i, entity_bin_data["e_bins"][i], entity_bin_data["e_bins"][i+1], entity_bin_data["mean"][i], entity_bin_data["re"][i], entity_bin_data["vov"][i], entity_bin_data["fom"][i]
        
    output_file_name = "h_infinite_medium_"
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
