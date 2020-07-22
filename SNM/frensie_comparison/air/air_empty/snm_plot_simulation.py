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
from spectrum_plot_tools import plotSpectralDataWithErrors
from MCNP_data_extractor import extractData

def plotSNMSimulationSpectrum( rendezvous_file,
                                  estimator_id,
                                  entity_id,
                                  mcnp_file,
                                  mcnp_file_start,
                                  top_ylims = None,
                                  bottom_ylims = None,
                                  xlims = None,
                                  legend_pos = None ):
    # Reload the simulation
    manager = Manager.ParticleSimulationManagerFactory( rendezvous_file ).getManager()
    
    # Extract the estimator of interest from FRENSIE
    estimator = manager.getEventHandler().getEstimator( estimator_id )

    entity_bin_data = estimator.getEntityBinProcessedData( entity_id )
    entity_bin_data["e_bins"] = estimator.getTimeDiscretization()
    #TODO ASK IF THIS IS CORRECT, "e_bins" meaning?

    # print FRENSIE results
    for i in range(0,len(entity_bin_data["mean"])):
        print entity_bin_data["e_bins"][i+1], entity_bin_data["mean"][i], entity_bin_data["re"][i]
    
    # create a dictionary for the mcnp data
    # TODO ASK ABOUT TIME VS ENERGY
    mcnp_bin_data = {"e_up": [], "mean": [], "re": []}
    
    # Extract the mcnp data from the output file
    time , mean , re = extractData( mcnp_file_start, mcnp_file)

    for i in range(0,length(time)):
        mcnp_bin_data["e_up"].append( float(time[i]) )
        mcnp_bin_data["mean"].append( float(mean[i]) )
        mcnp_bin_data["re"].append( float( re[i] )

    # Plot the data
    plotSpectralDataWithErrors( "FRENSIE",
                                entity_bin_data,
                                "MCNP6",
                                mcnp_bin_data,
                                "Flux",
                                False,
                                False,
                                top_ylims = top_ylims,
                                bottom_ylims = bottom_ylims,
                                xlims = xlims,
                                legend_pos = legend_pos,
                                output_plot_names = 'air_empty_25.eps' )