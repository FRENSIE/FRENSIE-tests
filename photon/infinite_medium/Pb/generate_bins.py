#!/usr/bin/python
import sys
import PyFrensie.Utility as Utility

x_ray_lines = {"KL2": 7.3039e-2,
               "KL3": 7.525e-2,
               "KM2": 8.47407e-2,
               "KM3": 8.52354e-2,
               "KM4": 8.56953e-2,
               "KM5": 8.5801e-2,
               "KN2": 8.7534e-2,
               "KN3": 8.76557e-2,
               "KN4": 8.78548e-2,
               "KN5": 8.78775e-2,
               "KO2": 8.81791e-2,
               "KO3": 8.82024e-2,
               "KO4": 8.82612e-2,
               "KO5": 8.8264e-2,
               "KP2": 8.8283e-2,
               "KP3": 8.82847e-2}

sorted_x_ray_line_names = ["KL2", "KL3", "KM2", "KM3", "KM4", "KM5", "KN2", "KN3", "KN4", "KN5", "KO2", "KO3", "KO4", "KO5", "KP2", "KP3"]

#energy_bins = list(Utility.doubleArrayFromString( "{1e-3, 499i, 0.1}" ))
#energy_bins = list(Utility.doubleArrayFromString( "{1e-3, 499i, 0.2}" ))
energy_bins = list(Utility.doubleArrayFromString( "{1e-3, 499i, 0.5}" ))
#energy_bins = list(Utility.doubleArrayFromString( "{1e-3, 499i, 1.0}" ))
#energy_bins = list(Utility.doubleArrayFromString( "{1e-3, 499i, 10.0}" ))

x_ray_line_indices = set()

# Loop through each x-ray line and determine the bin that it falls in
for i in range(0,len(sorted_x_ray_line_names)):
    name = sorted_x_ray_line_names[i]
    x_ray_energy = x_ray_lines[name]

    for j in range(0,len(energy_bins)-1):
        if x_ray_energy > energy_bins[j] and x_ray_energy <= energy_bins[j+1]:
            #print name, "in bin", j, "->", x_ray_energy, energy_bins[j], energy_bins[j+1]
            index = 0
            
            if j in x_ray_line_indices:
                print "Error: x-ray line energy bin width too large!"
                sys.exit(1)
            elif j-1 in x_ray_line_indices:
                index = j+1
            else:
                index = j
                # print energy_bins.pop( j )
                # print energy_bins.pop( j )
                energy_bins.pop( j )
                energy_bins.pop( j )
                
            print x_ray_energy, "at bin", index

            energy_bins.insert(index, x_ray_energy+5e-7 )
            energy_bins.insert(index, x_ray_energy-5e-7 )
            x_ray_line_indices.add(index)
            
            break

print ""

for i in range(1,len(energy_bins)):
    if energy_bins[i] < energy_bins[i-1]:
        print "bad bin: ", i, energy_bins[i], energy_bins[i-1]

# FRENSIE Bins
bin_string = "["
for i in range(0,len(energy_bins)):
    #print i, energy_bins[i]
    bin_string += str(energy_bins[i])
    
    if i < len(energy_bins)-1:
        bin_string += ", "
        
    if (i+1)%6 == 0:
        bin_string += "\n                   "
        
bin_string += "]"

print bin_string, "\n"

# MCNP Bins
bin_string = ""
for i in range(0,len(energy_bins)):
    #print i, energy_bins[i]
    bin_string += str(energy_bins[i])
    
    if i < len(energy_bins)-1:
        bin_string += " "
        
    if (i+1)%6 == 0:
        bin_string += "&\n   "

print bin_string

