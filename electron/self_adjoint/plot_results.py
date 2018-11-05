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

# Number of data points in each file
M = 169
NORM=536.7
# Get Adjoint Data
with open(adjoint_path) as input:
      adjoint_name = input.readline()[1:].strip()
      print adjoint_name
      print input.readline().strip()[1:]
      data = zip(*(line.strip().split('\t') for line in input))
      adjoint_x = np.asfarray(data[0][0:M])
      adjoint_y = np.asfarray(data[1][0:M])/NORM
      adjoint_error = np.asfarray(data[2][0:M])*adjoint_y

# Get forward data
with open(forward_path) as input:
      forward_name = input.readline()[1:].strip()
      print forward_name
      print input.readline().strip()[1:]
      data = zip(*(line.strip().split('\t') for line in input))
      forward_x = np.asfarray(data[0][0:M])
      forward_y = np.asfarray(data[1][0:M])
      forward_error = np.asfarray(data[2][0:M])*forward_y

# Plot
fig = plt.figure(num=1, figsize=(10,6))

# set height ratios for sublots
gs = gridspec.GridSpec(2, 1, height_ratios=[2, 1])

# the first subplot
ax0 = plt.subplot(gs[0])

x_label = 'Energy (MeV)'
plt.xlabel(x_label, size=14)
plt.ylabel('Surface Flux (#/cm$^2$)', size=14)
plt.title('$\mathrm{0.01\/MeV\/Electron\/Surface\/Flux\/on\/a\/0.5\/cm\/Hydrogen\/Sphere}$', size=16)
ax=plt.gca()

# plt.xlim(0.0,7.0)
plt.ylim(0.0,0.03)

# plt.plot(exp_x, exp_y, label="Hanson (Exp.)", marker='s', markersize=5 )

markers = ["--v","-.o",":^","--<","-.>",":+","--x","-.1",":2","--3","-.4",":8","--p","-.P",":*","--h","-.H",":X","--D","-.d"]
markerssizes = [6,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6]
marker_color = ['g', 'r', 'c', 'm', 'y', 'k', 'w', 'g', 'r', 'c', 'm', 'y', 'k', 'w']
# names = ['MCNP6.2','FRENSIE-ACE', 'FRENSIE-ENDL' ]

linestyles = [(0, ()), (0, (5, 5)), (0, (3, 5, 1, 5)), (0, (1, 1)), (0, (3, 5, 1, 5, 1, 5)), (0, (5, 1)), (0, (3, 1, 1, 1)), (0, (3, 1, 1, 1, 1, 1)), (0, (1, 5)), (0, (5, 10)), (0, (3, 10, 1, 10)), (0, (3, 10, 1, 10, 1, 10))]

plots = []
labels = []
# Plot Adjoint Data

# Insert first bin lower bounds as an angle of 0
print "adjoint_x = \t", adjoint_x, "\n"

x = np.insert( adjoint_x, 0, 0.0)

# Plot histogram of results
m, bins, plt1 = plt.hist(x[:-1], bins=x, weights=adjoint_y, histtype='step', label="adjoint/537", color='b', linestyle=linestyles[0], linewidth=1.8 )

# Plot error bars
mid = 0.5*(bins[1:] + bins[:-1])
plt2 = plt.errorbar(mid, m, yerr=adjoint_error, ecolor='b', fmt=None)

# plt.errorbar(mid, adjoint_y, yerr=adjoint_error, label="adjoint", fmt="--s", markersize=6, color='b' )

handle1 = Line2D([], [], c='b', linestyle='--', dashes=linestyles[0][1], linewidth=1.8)
plots.append( handle1 )
labels.append("adjoint")

# Plot Forward Data

# Insert first bin lower bounds as an angle of 0
x = np.insert( forward_x, 0, 0.0)

# Plot histogram of results
m, bins, plt1 = plt.hist(x[:-1], bins=x, weights=forward_y, histtype='step', label="forward", color='g', linestyle=linestyles[1], linewidth=1.8 )

# Plot error bars
mid = 0.5*(bins[1:] + bins[:-1])
plt2 = plt.errorbar(mid, m, yerr=forward_error, ecolor='g', fmt=None)

# plt.errorbar(mid, forward_y, yerr=forward_error, label="forward", fmt="--s", markersize=6, color='b' )

handle1 = Line2D([], [], c='g', linestyle='--', dashes=linestyles[1][1], linewidth=1.8)
plots.append( handle1 )
labels.append("forward")


plt.legend(loc=1)
ax.yaxis.set_major_formatter(FormatStrFormatter('%.2f'))



markers = ["v","o","^","<",">","+","x","1","2","3","4","8","p","P","*","h","H","X","D","d"]


# The C/R subplot (with shared x-axis)
ax1 = plt.subplot(gs[1], sharex = ax0)
plt.xlabel(x_label, size=14)
plt.ylabel('C/R', size=14)

N=8

# Insert first bin lower bounds as an angle of 0
x = np.insert( adjoint_x[:-N], 0, 0.0)

# Calculate C/R
yerr = np.sqrt( ((1.0/forward_y[:-N])**2)*(adjoint_error[:-N])**2 + ((adjoint_x[:-N]/forward_y[:-N]**2)**2)*(forward_error[:-N])**2 )
y = adjoint_y[:-N]/forward_y[:-N]

# Print C/R results
for i in range(0, len(y)):
  # print x[i+1], ": ", (1.0-y[i])*100, u"\u00B1", yerr[i]*100, "%"
  print x[i+1], ": ", y[i], "\t",forward_y[i]

# Plot histogram of results
m, bins, _ = ax1.hist(x[:-1], bins=x, weights=y, histtype='step', label="ratio", color='b', linestyle=linestyles[0], linewidth=1.8 )
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

# plt.xlim(0.0,6.78)
plt.ylim(0.1,5.0)

# remove vertical gap between subplots
plt.subplots_adjust(hspace=.0)

output = "sefl_adjoint_results.pdf"
if user_args.o:
    output = user_args.o

print "Plot outputted to: ",output
# fig.savefig(output, bbox_inches='tight', dpi=600)
plt.show()