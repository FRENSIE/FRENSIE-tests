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
    parser.add_option("--model_type", type="string", dest="raw_model_type",
                      help="the model type")
    parser.add_option("--max_energies", type="string", dest="max_energies",
                      help="the max energies")
    parser.add_option("--cs_min", type="float", default=0.0, dest="cs_min",
                      help="the min cross section value for the plot")
    parser.add_option("--cs_max", type="float", default=1.0, dest="cs_max",
                      help="the max cross section value for the plot")
    parser.add_option("--adjoint_label_x", type="float", default= 0.03, dest="adjoint_label_x",
                      help="the x location of the adjoint label")
    parser.add_option("--adjoint_label_y", type="float", default=1.0, dest="adjoint_label_y",
                      help="the y location of the adjoint label")
    parser.add_option("--forward_label_x", type="float", default=0.008, dest="forward_label_x",
                      help="the x location of the forward label")
    parser.add_option("--forward_label_y", type="float", default=1.0, dest="forward_label_y",
                      help="the y location of the forward label")
    options,args = parser.parse_args()

    if options.db_path is None:
        print "The database path must be specified!"
        sys.exit(1)

    if options.atomic_number < 1 or options.atomic_number > 100:
        print "The atomic number must be between 1 and 100!"
        sys.exit(1)

    if options.raw_model_type != "wh" and options.raw_model_type != "impulse" and options.raw_model_type != "db_impulse":
        print "The model type is not valid!"
        sys.exit(1)

    # Parse the max energies
    max_energies = options.max_energies.split( ',' )

    for i in range(0,len(max_energies)):
        max_energies[i] = float(max_energies[i])

    max_energies.sort()
    print "max energies:", max_energies

    # Load the data
    database = Data.ScatteringCenterPropertiesDatabase( options.db_path )
    atom_properties = database.getAtomProperties( Data.ZAID(options.atomic_number*1000) )

    print "Loading forward data..."
    native_data = Native.ElectronPhotonRelaxationDataContainer( os.path.dirname(options.db_path) + "/" + atom_properties.getPhotoatomicDataProperties( Data.PhotoatomicDataProperties.Native_EPR_FILE, 0 ).filePath() )
    print "Forward data loaded"

    print "Loading adjoint data..."
    adjoint_native_data = Native.AdjointElectronPhotonRelaxationDataContainer( os.path.dirname(options.db_path) + "/" + atom_properties.getAdjointPhotoatomicDataProperties( Data.AdjointPhotoatomicDataProperties.Native_EPR_FILE, 0 ).filePath() )
    print "Adjoint data loaded"

    # Load the forward incoherent cross section
    forward_energy_grid = native_data.getPhotonEnergyGrid()

    if options.raw_model_type == "wh":
        forward_incoh_cs = native_data.getWallerHartreeIncoherentCrossSection()
    elif options.raw_model_type == "impulse" or options.raw_model_type == "db_impulse":
        forward_incoh_cs = native_data.getImpulseApproxIncoherentCrossSection()

    # Get the adjoint energy grid
    adjoint_energy_grid = adjoint_native_data.getAdjointPhotonEnergyGrid()

    # Get the adjoint incoherent cross section
    if options.raw_model_type == "wh":
        adjoint_incoh_cs = Distribution.InterpolatedFullyTabularBasicBivariateDistribution_LinLinLin_UnitBase( adjoint_energy_grid, adjoint_native_data.getAdjointWallerHartreeIncoherentMaxEnergyGrid(), adjoint_native_data.getAdjointWallerHartreeIncoherentCrossSection() )
    elif options.raw_model_type == "impulse":
        adjoint_incoh_cs = Distribution.InterpolatedFullyTabularBasicBivariateDistribution_LinLinLin_UnitBase( adjoint_energy_grid, adjoint_native_data.getAdjointImpulseApproxIncoherentMaxEnergyGrid(), adjoint_native_data.getAdjointImpulseApproxIncoherentCrossSection() )
    elif options.raw_model_type == "db_impulse":
        adjoint_incoh_cs = Distribution.InterpolatedFullyTabularBasicBivariateDistribution_LinLinLin_UnitBase( adjoint_energy_grid, adjoint_native_data.getAdjointDopplerBroadenedImpulseApproxIncoherentMaxEnergyGrid(), adjoint_native_data.getAdjointDopplerBroadenedImpulseApproxIncoherentCrossSection() )
    else:
        print "The model type is not valid!"
        sys.exit(1)

    
    # Reduce the adjoint incoherent cross section to 1-D grids for each max energy
    adjoint_incoh_data = []
    for i in range(0,len(max_energies)):
        local_energy_grid = []
        local_adjoint_incoh_cs = []

        for j in range(0,len(adjoint_energy_grid)):
            if adjoint_energy_grid[j] < max_energies[i]:
                local_energy_grid.append( adjoint_energy_grid[j] )
                local_adjoint_incoh_cs.append( adjoint_incoh_cs.evaluate( adjoint_energy_grid[j], max_energies[i] ) )

        # Add the max energy point
        local_energy_grid.append( max_energies[i] )
        local_adjoint_incoh_cs.append( 0.0 )

        adjoint_incoh_data.append( [local_energy_grid, local_adjoint_incoh_cs] )

    # Plot the cross sections
    fig, ax = plt.subplots( 1, 1, sharex=True )

    line1, = ax.plot( forward_energy_grid, forward_incoh_cs, label="Forward" )
    line1.set_color( "black" )
    line1.set_linewidth( 1 )

    for i in range(0,len(max_energies)):
        label = "Adjoint (E = " + str(max_energies[i]) + " MeV)"
        
        line, = ax.plot( adjoint_incoh_data[i][0], adjoint_incoh_data[i][1], label=label )
        line.set_color( "red" )
        line.set_linewidth( 1 )
        line.set_dashes( [1+i, 1, 1+i, 1] )

    ax.grid( True, linestyle=':', linewidth=1 )
    ax.set_ylabel( "Cross Section (b)" )
    ax.set_ylim( options.cs_min, options.cs_max )
    ax.set_xlabel( "Energy (MeV)" )
    ax.set_xlim( 1e-3, max_energies[-1] )
    ax.set_xscale( "log" )

    ax.text( options.adjoint_label_x, options.adjoint_label_y, "Adjoint\nIncoherent", multialignment='center' )
    ax.text( options.forward_label_x, options.forward_label_y, "Incoherent" )

    for axis in ['top','bottom','left','right']:
        ax.spines[axis].set_linewidth( 1.1 )

    plt.savefig( "adjoint_forward_incoh.eps" )
    plt.show()
