#!/usr/bin/python
import sys, os
import math as m
import matplotlib.pyplot as plt
import os.path as path
from optparse import *

if __name__ == "__main__":

    # Parse the command line options
    parser = OptionParser()
    parser.add_option("-f", "--file", type="string", dest="data_file",
                      help="the data file name")
    parser.add_option("--eff_min", type="float", dest="eff_min", default=0.0,
                      help="the min efficiency value (for plotting)")
    parser.add_option("--eff_max", type="float", dest="eff_max", default=1.0,
                      help="the max efficiency value (for plotting)")
    parser.add_option("--rate_min", type="float", dest="rate_min", default=0.0,
                      help="the min samples/s value (for plotting)")
    parser.add_option("--rate_max", type="float", dest="rate_max", default=600000.0,
                      help="the max samples/s value (for plotting)")
    parser.add_option("--legend_x", type="float", dest="legend_x", default=1.0,
                      help="the legend x position")
    parser.add_option("--legend_y", type="float", dest="legend_y", default=1.0,
                      help="the legend y position")
    options,args = parser.parse_args()

    if options.data_file is None:
        print "The data file must be specified!"
        sys.exit(1)

    # Load the file and parse the data
    file = open(options.data_file, 'r')

    energy_grid = []
    two_branch_eff_values = []
    two_branch_sample_rate_values = []
    three_branch_lin_eff_values = []
    three_branch_lin_sample_rate_values = []
    three_branch_inv_eff_values = []
    three_branch_inv_sample_rate_values = []

    line_num = 0

    for line in file:
        # Ignore the header
        if line_num == 0:
            line_num += 1
        else:
            split_line = line.split()
            energy_grid.append( float(split_line[0]) )
            two_branch_eff_values.append( float(split_line[1]) )
            two_branch_sample_rate_values.append( float(split_line[2]) )
            three_branch_lin_eff_values.append( float(split_line[3]) )
            three_branch_lin_sample_rate_values.append( float(split_line[4]) )
            three_branch_inv_eff_values.append( float(split_line[5]) )
            three_branch_inv_sample_rate_values.append( float(split_line[6]) )

    # Calculate the relative sample rate
    two_branch_rel_sample_rate_values = [1.0]*len(two_branch_sample_rate_values)
    three_branch_lin_rel_sample_rate_values = [0.0]*len(three_branch_lin_sample_rate_values)
    three_branch_inv_rel_sample_rate_values = [0.0]*len(three_branch_inv_sample_rate_values)

    for i in range(0,len(two_branch_rel_sample_rate_values)):
        three_branch_lin_rel_sample_rate_values[i] = three_branch_lin_sample_rate_values[i]/two_branch_sample_rate_values[i]
        three_branch_inv_rel_sample_rate_values[i] = three_branch_inv_sample_rate_values[i]/two_branch_sample_rate_values[i]

    edge_thickness = 1.1

    # Plot the efficiencies and sampling rates
    fig, ax = plt.subplots(2, 1, sharex=True)
    plt.subplots_adjust( top=0.95, bottom=0.17, hspace=0.0 )

    # Set up the top subplot
    line1, = ax[0].plot( energy_grid, two_branch_eff_values, label="Two Branch" )
    line1.set_color("black")
    line1.set_linewidth( 1 )

    line2, = ax[0].plot( energy_grid, three_branch_lin_eff_values, label="Three Branch Lin")
    line2.set_dashes([2, 1, 2, 1])
    line2.set_color("red")
    line2.set_linewidth( 1 )

    line3, = ax[0].plot( energy_grid, three_branch_inv_eff_values, label="Three Branch Inv")
    line3.set_dashes([1, 1, 1, 1])
    line3.set_color("blue")
    line3.set_linewidth( 1 )

    ax[0].set_ylabel( "Efficiency" )
    ax[0].grid(True, linestyle=":", linewidth=1)

    ax[0].set_ylim( options.eff_min, options.eff_max )
    ax[0].set_xscale( "log" )

    yticklabels = ax[0].yaxis.get_ticklabels()
    yticklabels[0].set_color('white')
    yticklabels[-1].set_color('white')

    ax[0].yaxis.set_ticks_position("both")
    ax[0].xaxis.set_ticks_position("both")
    ax[0].tick_params(direction="in", width=edge_thickness)
    ax[0].tick_params(which="minor", direction="in", width=edge_thickness)

    for axis in ['top','bottom','left','right']:
        ax[0].spines[axis].set_linewidth(edge_thickness)

    # Set up the bottom subplot
    line4, = ax[1].plot( energy_grid, two_branch_rel_sample_rate_values, label="Two Branch" )
    line4.set_color("black")
    line4.set_linewidth( 1 )

    line5, = ax[1].plot( energy_grid, three_branch_lin_rel_sample_rate_values, label="Three Branch Lin")
    line5.set_dashes([2, 1, 2, 1])
    line5.set_color("red")
    line5.set_linewidth( 1 )

    line6, = ax[1].plot( energy_grid, three_branch_inv_rel_sample_rate_values, label="Three Branch Inv")
    line6.set_dashes([1, 1, 1, 1])
    line6.set_color("blue")
    line6.set_linewidth( 1 )

    ax[1].set_ylabel( "Relative Sample Rate\n(Compared to Two Branch)" )
    ax[1].set_xlabel( "Energy (MeV)" )
    ax[1].grid(True, linestyle=":", linewidth=1)
    ax[1].legend(frameon=False, bbox_to_anchor=[options.legend_x,options.legend_y])

    ax[1].set_xlim( energy_grid[0], energy_grid[-1] )
    ax[1].set_ylim( options.rate_min, options.rate_max )
    ax[1].set_xscale( "log" )

    yticklabels = ax[1].yaxis.get_ticklabels()
    yticklabels[0].set_color('white')
    yticklabels[-1].set_color('white')

    ax[1].yaxis.set_ticks_position("both")
    ax[1].xaxis.set_ticks_position("both")
    ax[1].tick_params(direction="in", width=edge_thickness)
    ax[1].tick_params(which="minor", direction="in", width=edge_thickness)

    for axis in ['top','bottom','left','right']:
        ax[1].spines[axis].set_linewidth(edge_thickness)

    # Save the figure
    fig.savefig("eff_rate.eps")

    plt.show()
