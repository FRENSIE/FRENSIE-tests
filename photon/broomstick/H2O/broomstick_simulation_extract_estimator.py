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

    # Extract the estimator data
    entity_bin_data = estimator.getEntityBinProcessedData( entity_id )
    energy_bins = list(estimator.getEnergyDiscretization())

    start_index = estimator.getNumberOfBins( Event.OBSERVER_ENERGY_DIMENSION )
    end_index = 2*start_index

    # Print out the extracted data
    print "#bin start (MeV), bin end (MeV), mean, re, vov"

    for i in range(start_index, end_index):
        print energy_bins[i-start_index], energy_bins[i+1-start_index], entity_bin_data["mean"][i], entity_bin_data["re"][i], entity_bin_data["vov"][i]
