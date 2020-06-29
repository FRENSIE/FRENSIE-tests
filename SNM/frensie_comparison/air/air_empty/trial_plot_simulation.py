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

def plotSNMSimulationSpectrum( rendezvous_file,
                                  estimator_id,
                                  entity_id,
                                  mcnp_file,
                                  mcnp_file_start,
                                  mcnp_file_end,
                                  top_ylims = None,
                                  bottom_ylims = None,
                                  xlims = None,
                                  legend_pos = None ):
    # Reload the simulation
    manager = Manager.ParticleSimulationManagerFactory( rendezvous_file ).getManager()
    
    # Extract the estimator of interest from FRENSIE
    estimator = manager.getEventHandler().getEstimator( estimator_id )

    entity_bin_data = estimator.getEntityBinProcessedData( entity_id )
    entity_bin_data["t_bins"] = estimator.getTimeDiscretization()

    for i in range(0,len(entity_bin_data["mean"])):
        print entity_bin_data["t_bins"][i+1], entity_bin_data["mean"][i], entity_bin_data["re"][i]
    
    # TODO PAST HERE
    # Extract the mcnp data from the output file
    mcnp_file = open( mcnp_file, "r" )
    mcnp_file_lines = mcnp_file.readlines()
    
    mcnp_bin_data = {"e_up": [], "mean": [], "re": []}
    
    for i in range(mcnp_file_start,mcnp_file_end+1):
        split_line = mcnp_file_lines[i-1].split()
        
        mcnp_bin_data["e_up"].append( float(split_line[0]) )
        mcnp_bin_data["mean"].append( float(split_line[1]) )
        mcnp_bin_data["re"].append( float(split_line[2]) )
        
    output_file_name = "air_empty_25_flux.eps"
        
    # Plot the data
    plotSpectralDataWithErrors( "FRENSIE",
                                entity_bin_data,
                                "MCNP6",
                                mcnp_bin_data,
                                "Flux",
                                True,
                                False,
                                top_ylims = top_ylims,
                                bottom_ylims = bottom_ylims,
                                xlims = xlims,
                                legend_pos = legend_pos,
                                output_plot_names = output_file_name )
