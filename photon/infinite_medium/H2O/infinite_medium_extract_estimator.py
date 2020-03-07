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

def extractEstimatorEnergyBins( rendezvous_file,
                                estimator_id,
                                is_adjoint ):

    # Activate just-in-time initialization to prevent automatic loading of the
    # geometry and data tables
    Utility.activateJustInTimeInitialization()

    # Set the database path
    Collision.FilledGeometryModel.setDefaultDatabasePath( os.environ['DATABASE_PATH'] )
    
    # Reload the simulation
    manager = Manager.ParticleSimulationManagerFactory( rendezvous_file ).getManager()

    # Extract the estimator of interest
    estimator = manager.getEventHandler().getEstimator( estimator_id )

    if is_adjoint:
        return list(estimator.getSourceEnergyDiscretization())
    else:
        return list(estimator.getEnergyDiscretization())

def extractEstimatorData( rendezvous_file,
                          estimator_id,
                          entity_id,
                          is_adjoint ):

    # Activate just-in-time initialization to prevent automatic loading of the
    # geometry and data tables
    Utility.activateJustInTimeInitialization()

    # Set the database path
    Collision.FilledGeometryModel.setDefaultDatabasePath( os.environ['DATABASE_PATH'] )
    
    # Reload the simulation
    manager = Manager.ParticleSimulationManagerFactory( rendezvous_file ).getManager()

    # Extract the estimator of interest
    estimator = manager.getEventHandler().getEstimator( estimator_id )

    if is_adjoint:
        energy_bins = list(estimator.getSourceEnergyDiscretization())
    else:
        energy_bins = list(estimator.getEnergyDiscretization())

    # Extract the estimator data
    entity_bin_data = estimator.getEntityBinProcessedData( entity_id )

    # Print out the extracted data
    print "#bin start (MeV), bin end (MeV), mean, re, vov, bin mid, mean/(bin width)"

    for i in range(0, len(energy_bins)-1):
        print energy_bins[i], energy_bins[i+1], entity_bin_data["mean"][i], entity_bin_data["re"][i], entity_bin_data["vov"][i], (energy_bins[i+1]+energy_bins[i])/2, entity_bin_data["mean"][i]/(energy_bins[i+1]-energy_bins[i])

