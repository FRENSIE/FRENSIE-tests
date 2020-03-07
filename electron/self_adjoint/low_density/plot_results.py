#! /usr/bin/env python
# Luke Kersting
# This script plots the surface flux results for the self adjoint problem.
import csv
import math
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import gridspec
from matplotlib.ticker import FormatStrFormatter
from matplotlib.lines import Line2D
import argparse as ap
import inspect, os

# Set up the argument parser
description = "This script asks for a forward and adjoint surface flux file "\
              "which it then plots."

parser = ap.ArgumentParser(description=description)

adjoint_msg = "The adjoint input file name."
parser.add_argument('-a', help=adjoint_msg, required=False)

forward_msg = "The forward input file name."
parser.add_argument('-f', help=forward_msg, required=False)

output_msg = "The output file name."
parser.add_argument('-o', help=output_msg, required=False)

# Parse the user's arguments
user_args = parser.parse_args()
adjoint_path = user_args.a
forward_path = user_args.f

# Adjoint normalization factor
NORM=1

# Get Adjoint Data
with open(adjoint_path) as input:
      adjoint_name = input.readline()[1:].strip()
      print adjoint_name
      print input.readline().strip()[1:]
      data = zip(*(line.strip().split('\t') for line in input))
      # Get the adjoint x bin boundaries
      adjoint_x = np.asfarray(data[0][:])
      # Get the x bin widths
      bin_widths = (adjoint_x[1:] - adjoint_x[:-1])
      # Get the binned adjoint surface flux
      adjoint_bin_y = np.asfarray(data[1][1:])/NORM
      # Average the flux to the bin width
      adjoint_y = adjoint_bin_y/bin_widths
      # Calculate the error for the bin averaged surface flux
      adjoint_error = np.asfarray(data[2][1:])*adjoint_y

# Get forward data
with open(forward_path) as input:
      forward_name = input.readline()[1:].strip()
      print forward_name
      print input.readline().strip()[1:]
      data = zip(*(line.strip().split('\t') for line in input))
      # Get the forward x bin boundaries
      forward_x = np.asfarray(data[0][:])
      # Get the x bin widths
      bin_widths = (forward_x[1:] - forward_x[:-1])
      # Get the binned forward surface flux
      forward_bin_y = np.asfarray(data[1][1:])
      # Average the flux to the bin width
      forward_y = forward_bin_y/bin_widths
      # Calculate the error for the bin averaged surface flux
      forward_error = np.asfarray(data[2][1:])*forward_y

# Plot
fig = plt.figure(num=1, figsize=(10,6))

# set height ratios for sublots
gs = gridspec.GridSpec(2, 1, height_ratios=[2, 1])

# the first subplot
ax0 = plt.subplot(gs[0])

radius = forward_path.split("_")[-2]
plot_title = '$\mathrm{0.01\/MeV\/Electron\/Surface\/Flux\/on\/a\/' + radius +'\/cm\/Hydrogen\/Sphere}$'
x_label = 'Energy (MeV)'
plt.xlabel(x_label, size=14)
plt.ylabel('Surface Flux (#/cm$^2$)', size=14)
plt.title( plot_title, size=16)
ax=plt.gca()

plt.xlim(0.006,0.01)
# plt.ylim(0.0,2000)

# plt.plot(exp_x, exp_y, label="Hanson (Exp.)", marker='s', markersize=5 )

markers = ["--v","-.o",":^","--<","-.>",":+","--x","-.1",":2","--3","-.4",":8","--p","-.P",":*","--h","-.H",":X","--D","-.d"]
markerssizes = [6,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6]
marker_color = ['g', 'r', 'c', 'm', 'y', 'k', 'w', 'g', 'r', 'c', 'm', 'y', 'k', 'w']
# names = ['MCNP6.2','FRENSIE-ACE', 'FRENSIE-ENDL' ]

linestyles = [(0, ()), (0, (5, 5)), (0, (3, 5, 1, 5)), (0, (1, 1)), (0, (3, 5, 1, 5, 1, 5)), (0, (5, 1)), (0, (3, 1, 1, 1)), (0, (3, 1, 1, 1, 1, 1)), (0, (1, 5)), (0, (5, 10)), (0, (3, 10, 1, 10)), (0, (3, 10, 1, 10, 1, 10))]

plots = []
labels = []

# Plot Adjoint Data

# Plot histogram of results
label = "adjoint"
if NORM > 1.0:
  label += "/" + str(NORM)
m, bins, plt1 = plt.hist(adjoint_x[:-1], bins=adjoint_x, weights=adjoint_y, histtype='step', label=label, color='b', linestyle=linestyles[0], linewidth=1.8 )

# Plot error bars
mid = 0.5*(bins[1:] + bins[:-1])
plt2 = plt.errorbar(mid, m, yerr=adjoint_error, ecolor='b', fmt=None)

# plt.errorbar(mid, adjoint_y, yerr=adjoint_error, label="adjoint", fmt="--s", markersize=6, color='b' )

handle1 = Line2D([], [], c='b', linestyle='--', dashes=linestyles[0][1], linewidth=1.8)
plots.append( handle1 )
labels.append("adjoint")

# Plot Forward Data

# Plot histogram of results
m, bins, plt1 = plt.hist(forward_x[:-1], bins=forward_x, weights=forward_y, histtype='step', label="forward", color='g', linestyle=linestyles[1], linewidth=1.8 )

# Plot error bars
mid = 0.5*(bins[1:] + bins[:-1])
plt2 = plt.errorbar(mid, m, yerr=forward_error, ecolor='g', fmt=None)

# plt.errorbar(mid, forward_y, yerr=forward_error, label="forward", fmt="--s", markersize=6, color='b' )

handle1 = Line2D([], [], c='g', linestyle='--', dashes=linestyles[1][1], linewidth=1.8)
plots.append( handle1 )
labels.append("forward")


plt.legend(loc=2)
ax.yaxis.set_major_formatter(FormatStrFormatter('%.2e'))
ax.xaxis.set_major_formatter(FormatStrFormatter('%.1e'))



markers = ["v","o","^","<",">","+","x","1","2","3","4","8","p","P","*","h","H","X","D","d"]


# The C/R subplot (with shared x-axis)
ax1 = plt.subplot(gs[1], sharex = ax0)
plt.xlabel(x_label, size=14)
plt.ylabel('C/R', size=14)

yerr = np.sqrt( ((1.0/forward_y)**2)*(adjoint_error)**2 + ((adjoint_x[:-1]/forward_y**2)**2)*(forward_error)**2 )
y = adjoint_y/forward_y

# Print C/R results
for i in range(0, len(y)):
  # print x[i+1], ": ", (1.0-y[i])*100, u"\u00B1", yerr[i]*100, "%"
  print adjoint_x[i+1], ": ", y[i], "\t",forward_y[i]
  if not np.isfinite( y[i] ):
    y[i] = 0
    yerr[i] = 0

# Plot histogram of results
m, bins, _ = ax1.hist(adjoint_x[:-1], bins=adjoint_x, weights=y, histtype='step', label="ratio", color='b', linestyle=linestyles[0], linewidth=1.8 )
# Plot error bars
mid = 0.5*(bins[1:] + bins[:-1])
ax1.errorbar(mid, m, yerr=yerr, ecolor='b', fmt=None)

# make x ticks for first suplot invisible
plt.setp(ax0.get_xticklabels(), visible=False)

# remove first tick label for the first subplot
yticks = ax0.yaxis.get_major_ticks()
yticks[0].label1.set_visible(False)
ax0.grid(linestyle=':')
ax1.grid(linestyle=':')

plt.xlim(0.006,0.01)
plt.ylim(0.0,1.1)

# remove vertical gap between subplots
plt.subplots_adjust(hspace=.0)

output = "self_adjoint_results.pdf"
if user_args.o:
    output = user_args.o

print "Plot outputted to: ",output
fig.savefig(output, bbox_inches='tight', dpi=600)
plt.show()