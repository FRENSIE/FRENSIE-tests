import numpy
import math as m
import matplotlib.pyplot as plt
import os
import sys
import PyFrensie.Geometry.DagMC as DagMC
import PyFrensie.Utility as Utility
import PyFrensie.MonteCarlo as MonteCarlo
import PyFrensie.MonteCarlo.Event as Event
import PyFrensie.MonteCarlo.Manager as Manager
#from spectrum_plot_tools import plotSpectralDataWithErrors

def plotSimulationSpectrum( rendezvous_file,
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
    # Reload the simulation
    manager = Manager.ParticleSimulationManagerFactory( rendezvous_file ).getManager()
    
    # Extract the estimator of interest
    estimator = manager.getEventHandler().getEstimator( estimator_id )

    entity_bin_data = estimator.getEntityBinProcessedData( entity_id )
    entity_bin_data["e_bins"] = estimator.getEnergyDiscretization()

    for i in range(0,len(entity_bin_data["mean"])):
        print entity_bin_data["e_bins"][i+1], entity_bin_data["mean"][i], entity_bin_data["re"][i]
    
