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

def extractEstimatorTotalData( rendezvous_file,
                               estimator_id,
                               entity_id ):

    # Activate just-in-time initialization to prevent automatic loading of the
    # geometry and data tables
    Utility.activateJustInTimeInitialization()

    # Set the database path
    Collision.FilledGeometryModel.setDefaultDatabasePath( os.environ['DATABASE_PATH'] )
    
    # Reload the simulation
    manager = Manager.ParticleSimulationManagerFactory( rendezvous_file ).getManager()

    # Extract the estimator of interest
    estimator = manager.getEventHandler().getEstimator( estimator_id )

    # Extract the estimator data
    entity_total_data = estimator.getEntityTotalProcessedData( entity_id )

    print entity_total_data["mean"][0], entity_total_data["re"][0], entity_total_data["mean"][0]*entity_total_data["re"][0]

def extractMCNPEstimatorData( mcnp_output_file,
                              mcnp_file_start,
                              mcnp_file_end,
                              energy_bins ):

    # Open the mcnp output file
    mcnp_file = open( mcnp_output_file, "r" )
    mcnp_file_lines = mcnp_file.readlines()

    lower_energy = mcnp_file_lines[mcnp_file_start-2].split()[0]

    # Extract and print the data
    print "#bin start (MeV), bin end (MeV), mean, re, bin mid, mean/(bin width)"
    e_index = 0
    for i in range(mcnp_file_start,mcnp_file_end+1):
        split_line = mcnp_file_lines[i-1].split()
        print lower_energy, split_line[0], split_line[1], split_line[2], (energy_bins[e_index]+energy_bins[e_index+1])/2, float(split_line[1])/(energy_bins[e_index+1]-energy_bins[e_index])

        lower_energy = split_line[0]
        e_index += 1

def extractEstimatorEnergyBins( rendezvous_file, estimator_id ):

    # Activate just-in-time initialization to prevent automatic loading of the
    # geometry and data tables
    Utility.activateJustInTimeInitialization()

    # Set the database path
    Collision.FilledGeometryModel.setDefaultDatabasePath( os.environ['DATABASE_PATH'] )
    
    # Reload the simulation
    manager = Manager.ParticleSimulationManagerFactory( rendezvous_file ).getManager()

    # Extract the estimator of interest
    estimator = manager.getEventHandler().getEstimator( estimator_id )

    # Get the energy bins corresponding to the 
    return list(estimator.getEnergyDiscretization())

def extractEstimatorData( rendezvous_file,
                          estimator_id,
                          entity_id ):

    # Activate just-in-time initialization to prevent automatic loading of the
    # geometry and data tables
    Utility.activateJustInTimeInitialization()

    # Set the database path
    Collision.FilledGeometryModel.setDefaultDatabasePath( os.environ['DATABASE_PATH'] )
    
    # Reload the simulation
    manager = Manager.ParticleSimulationManagerFactory( rendezvous_file ).getManager()

    # Extract the estimator of interest
    estimator = manager.getEventHandler().getEstimator( estimator_id )

    energy_bins = list(estimator.getEnergyDiscretization())

    # Extract the estimator data
    entity_bin_data = estimator.getEntityBinProcessedData( entity_id )

    # Only take the data at the second collision number bin
    start_index = estimator.getNumberOfBins( Event.OBSERVER_ENERGY_DIMENSION )
    end_index = 2*start_index

    # Print out the extracted data
    print "#bin start (MeV), bin end (MeV), mean, re, vov, bin mid, mean/(bin width)"

    for i in range(0, len(energy_bins)-1):
        print energy_bins[i], energy_bins[i+1], entity_bin_data["mean"][i+start_index], entity_bin_data["re"][i+start_index], entity_bin_data["vov"][i+start_index], (energy_bins[i+1]+energy_bins[i])/2, entity_bin_data["mean"][i+start_index]/(energy_bins[i+1]-energy_bins[i])

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

def extractEstimatorRelaxDataFromWHAndIAData( wh_data_file,
                                              ia_data_file,
                                              relax_bins ):
    # Extract the data from the data files
    wh_data = loadDataFromDataFile( wh_data_file )
    energy_bins = wh_data["e_bins"]
    
    ia_data = loadDataFromDataFile( ia_data_file )

    # Extract and print the data
    print "#bin start (MeV), bin end (MeV), bin mid (MeV), FRENSIE IA mean/(bin width), FRENSIE WH mean/(bin width), IA/WH, IA/WH unc"
    
    for i in range(0,len(energy_bins)-1):
        if i in relax_bins:
            bin_width = energy_bins[i+1] - energy_bins[i]

            ia_mean = ia_data["mean"][i]/bin_width
            wh_mean = wh_data["mean"][i]/bin_width
            ia_over_wh = ia_mean/wh_mean
            
            sigma_ia = ia_mean*ia_data["re"][i]
            sigma_wh = wh_mean*wh_data["re"][i]
            
            ia_squared = ia_mean*ia_mean
            wh_squared = wh_mean*wh_mean
            
            ia_over_wh_unc = m.sqrt( sigma_ia*sigma_ia + (ia_squared/wh_squared)*sigma_wh*sigma_wh )/wh_mean
            
            print energy_bins[i], energy_bins[i+1], (energy_bins[i]+energy_bins[i+1])/2, ia_mean, wh_mean, ia_over_wh, ia_over_wh_unc

def extractEstimatorRelaxData( rendezvous_file,
                               estimator_id,
                               entity_id,
                               mcnp_file,
                               mcnp_file_start,
                               mcnp_file_end,
                               relax_bins ):

    # Activate just-in-time initialization to prevent automatic loading of the
    # geometry and data tables
    Utility.activateJustInTimeInitialization()

    # Set the database path
    Collision.FilledGeometryModel.setDefaultDatabasePath( os.environ['DATABASE_PATH'] )
    
    # Reload the simulation
    manager = Manager.ParticleSimulationManagerFactory( rendezvous_file ).getManager()

    # Extract the estimator of interest
    estimator = manager.getEventHandler().getEstimator( estimator_id )

    energy_bins = list(estimator.getEnergyDiscretization())

    # Extract the estimator data
    entity_bin_data = estimator.getEntityBinProcessedData( entity_id )

    # Only take the data at the second collision number bin
    start_index = estimator.getNumberOfBins( Event.OBSERVER_ENERGY_DIMENSION )
    end_index = 2*start_index

    entity_bin_data["mean"] = entity_bin_data["mean"][start_index:end_index]
    entity_bin_data["re"] = entity_bin_data["re"][start_index:end_index]
    entity_bin_data["vov"] = entity_bin_data["vov"][start_index:end_index]
    entity_bin_data["fom"] = entity_bin_data["fom"][start_index:end_index]

    # Open the mcnp output file
    mcnp_file = open( mcnp_file, "r" )
    mcnp_file_lines = mcnp_file.readlines()
    mcnp_file_lines = mcnp_file_lines[mcnp_file_start-1:mcnp_file_end]

    # Extract and print the data
    print "#bin start (MeV), bin end (MeV), bin mid (MeV), FRENSIE mean/(bin width), MCNP mean/(bin width), F/M, F/M unc"
    
    for i in range(0,len(energy_bins)-1):
        if i in relax_bins:
            mcnp_line = mcnp_file_lines[i].split()
        
            bin_width = energy_bins[i+1] - energy_bins[i]
            frensie_mean = entity_bin_data["mean"][i]/bin_width
            mcnp_mean = float(mcnp_line[1])/bin_width
            f_over_m = frensie_mean/mcnp_mean
            
            sigma_f = frensie_mean*entity_bin_data["re"][i]
            sigma_m = mcnp_mean*float(mcnp_line[2])
            
            f_squared = frensie_mean*frensie_mean
            m_squared = mcnp_mean*mcnp_mean
            
            f_over_m_unc = m.sqrt( sigma_f*sigma_f + (f_squared/m_squared)*sigma_m*sigma_m )/mcnp_mean
            
            print energy_bins[i], energy_bins[i+1], (energy_bins[i]+energy_bins[i+1])/2, frensie_mean, mcnp_mean, f_over_m, f_over_m_unc

