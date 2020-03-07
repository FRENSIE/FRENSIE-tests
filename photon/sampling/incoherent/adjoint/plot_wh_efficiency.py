#!/usr/bin/python
import sys, os
import math as m
import matplotlib.pyplot as plt
import os.path as path
from optparse import *

if __name__ == "__main__":

    # Parse the command line options
    parser = OptionParser()
    parser.add_option("--file1", type="string", dest="data_file1",
                      help="the data file1 name")
    parser.add_option("--file2", type="string", dest="data_file2",
                      help="the data file2 name")
    parser.add_option("--file3", type="string", dest="data_file3",
                      help="the data file3 name")
    parser.add_option("--eff_min", type="float", dest="eff_min", default=0.0,
                      help="the min efficiency value (for plotting)")
    parser.add_option("--eff_max", type="float", dest="eff_max", default=1.0,
                      help="the max efficiency value (for plotting)")
    parser.add_option("--legend_x", type="float", dest="legend_x", default=1.0,
                      help="the legend x position")
    parser.add_option("--legend_y", type="float", dest="legend_y", default=1.0,
                      help="the legend y position")
    options,args = parser.parse_args()

    if options.data_file1 is None:
        print "Data file1 must be specified!"
        sys.exit(1)

    if options.data_file2 is None:
        print "Data file2 must be specified!"
        sys.exit(1)

    if options.data_file3 is None:
        print "Data file3 must be specified!"
        sys.exit(1)

    data_file_names = [options.data_file1, options.data_file2, options.data_file3]
    energy_grids = []
    three_branch_lin_eff_values = []

    for i in range(0,len(data_file_names)):

        # load the file and parse the data
        file = open(data_file_names[i], 'r')

        line_num = 0
        local_energy_grid = []
        local_three_branch_lin_eff_values = []

        for line in file:
            # Ignore the header
            if line_num == 0:
                line_num += 1
            else:
                split_line = line.split()
                local_energy_grid.append( float(split_line[0]) )
                local_three_branch_lin_eff_values.append( float(split_line[3]) )

        energy_grids.append( local_energy_grid )
        three_branch_lin_eff_values.append( local_three_branch_lin_eff_values )

    # Plot the efficiencies
    edge_thickness = 1.1
    fig, ax = plt.subplots(1, 1, sharex=True)

    line1, = ax.plot( energy_grids[0], three_branch_lin_eff_values[0], label="Free Electron" )
    line1.set_color("black")
    line1.set_linewidth( 1 )

    line2, = ax.plot( energy_grids[1], three_branch_lin_eff_values[1], label="Al" )
    line2.set_dashes([2, 1, 2, 1])
    line2.set_color("red")
    line2.set_linewidth( 1 )

    line3, = ax.plot( energy_grids[2], three_branch_lin_eff_values[2], label="Pb" )
    line3.set_dashes([1, 1, 1, 1])
    line3.set_color("blue")
    line3.set_linewidth( 1 )

    ax.grid( True, linestyle=":", linewidth=1 )
    ax.legend( frameon=False, bbox_to_anchor=[options.legend_x,options.legend_y] )
    
    ax.set_ylabel( "Efficiency" )
    ax.set_ylim( options.eff_min, options.eff_max )
    
    ax.set_xlabel( "Energy (MeV)" )
    ax.set_xlim( energy_grids[0][0], energy_grids[0][-1] )
    ax.set_xscale( "log" )

    for axis in ['top','bottom','left','right']:
        ax.spines[axis].set_linewidth(edge_thickness)

    # Save the figure
    fig.savefig("wh_eff_rate.eps")

    plt.show()
