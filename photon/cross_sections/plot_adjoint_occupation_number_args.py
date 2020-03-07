#!/usr/bin/python
import sys, os
import os.path as path
import matplotlib.pyplot as plt
import numpy as np
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
    parser.add_option("--energies", type="string", dest="energies",
                      help="energies")
    parser.add_option("--pz_min", type="float", default=-1.0, dest="pz_min",
                      help="the min cross section value for the plot")
    parser.add_option("--pz_max", type="float", default=1.0, dest="pz_max",
                      help="the max cross section value for the plot")
    parser.add_option("--emax_label_x", type="float", default=-1.0, dest="emax_label_x",
                      help="the x location of the emax label")
    parser.add_option("--emax_label_y", type="float", default=1.0, dest="emax_label_y",
                      help="the y location of the emax label")
    options,args = parser.parse_args()

    if options.db_path is None:
        print "The database path must be specified!"
        sys.exit(1)

    if options.atomic_number < 1 or options.atomic_number > 100:
        print "The atomic number must be between 1 and 100!"
        sys.exit(1)

    # Parse the energies
    energies = options.energies.split( ',' )

    for i in range(0,len(energies)):
        energies[i] = float(energies[i])

    energies.sort()
    print "max energy:", options.max_energy
    print "energies:", energies

    # Load the data
    database = Data.ScatteringCenterPropertiesDatabase( options.db_path )
    atom_properties = database.getAtomProperties( Data.ZAID(options.atomic_number*1000) )

    native_data = Native.ElectronPhotonRelaxationDataContainer( os.path.dirname(options.db_path) + "/" + atom_properties.getPhotoatomicDataProperties( Data.PhotoatomicDataProperties.Native_EPR_FILE, 0 ).filePath() )

    # Load the binding energy
    binding_energy = native_data.getSubshellBindingEnergy( Data.K_SUBSHELL )

    # Plot the min and max arguments for each energy
    fig, ax = plt.subplots( 1, 1, sharex=True )
    plt.subplots_adjust(left=0.15)

    colors = ["black", "red", "blue"]
    hatches = ["///", "\\\\", "|"]

    min_mu_min = 1.0

    for i in range(0,len(energies)):

        mu_min = Photon.calculateMinScatteringAngleCosine( energies[i], options.max_energy )
        if mu_min < min_mu_min:
            min_mu_min = mu_min
            
        mu_range = np.linspace( mu_min, 1.0, 1000 )

        max_arg = [0.0]*len(mu_range)
        min_arg = [0.0]*len(mu_range)

        max_diff = 0.0
        mu_of_max_diff = -1.0
        arg_range_at_max_diff = []

        for j in range(0,len(mu_range)):
            max_arg[j] = Photon.calculateMaxElectronMomentumProjectionAdjoint( energies[i], binding_energy, mu_range[j] )
            min_arg[j] = Photon.calculateMinElectronMomentumProjectionAdjoint( energies[i], options.max_energy, mu_range[j] )

            diff = max_arg[j] - min_arg[j]
            
            if diff > max_diff:
                max_diff = diff
                mu_of_max_diff = mu_range[j]
                arg_range_at_max_diff = [min_arg[j],max_arg[j]]

        print mu_of_max_diff, max_diff, arg_range_at_max_diff

        label = "E = " + str(energies[i]) + " MeV"
        color = colors[i%len(colors)]
        hatch = hatches[i%len(hatches)]

        # Plot the argument range
        # if i > 0:
        #     line2.set_dashes( [i, 1, i, 1] )
        # if i == 0:
        #     ax.fill_between( mu_range, max_arg, min_arg, label=label, facecolor="none", edgecolor=color, linewidth=1, hatch=hatch )
        # else:
        ax.fill_between( mu_range, max_arg, min_arg, label=label, color=color, alpha=0.25 )

        # Plot the location of the max difference
        ax.vlines( x=mu_of_max_diff, ymin=arg_range_at_max_diff[0], ymax=arg_range_at_max_diff[1], color=color, linewidth=1 )


    ax.grid( True, linestyle=':', linewidth=1 )
    ax.legend( frameon=False, loc="best" )
    ax.set_ylabel( r"Adjoint Electron Momentum Projection Range ($\frac{p^{\dagger}_z}{m_ec}$)" )
    ax.set_ylim( options.pz_min, options.pz_max )
    ax.set_xlabel( "Scattering Angle Cosine" )
    ax.set_xlim( min_mu_min, 1.0 )
    ax.text( options.emax_label_x, options.emax_label_y, "Max Energy = " + str(options.max_energy) + " MeV" )
        
    for axis in ['top','bottom','left','right']:
        ax.spines[axis].set_linewidth( 1.1 )

    plt.savefig( "adjoint_occupation_number_args.eps" )
    plt.savefig( "adjoint_occupation_number_args.png" )
    plt.show()
