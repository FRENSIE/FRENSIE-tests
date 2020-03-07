#!/usr/bin/python
import sys
import PyFrensie.Utility as Utility

gamma_lines = [0.186211,
               0.241995,
               0.2656,
               0.2952228,
               0.3046,
               0.3519321,
               0.51099891013, # This is actually the annihilation photon energy
               0.60932,
               0.6496,
               0.665447,
               0.76836,
               0.78596,
               0.80618,
               0.934056,
               1.120294,
               1.15521,
               1.238122,
               1.280976,
               1.377669,
               1.401515,
               1.407988,
               1.50921,
               1.661274,
               1.729595,
               1.764491,
               1.847429,
               2.118514,
               2.204059,
               2.44770]

energy_bins = list(Utility.doubleArrayFromString( "{1e-3, 998i, 2.44770}" ))

gamma_line_indices = set()

# Loop through each gamma line and determine the bin that it falls in
for i in range(0,len(gamma_lines)):
    gamma_energy = gamma_lines[i]

    for j in range(0,len(energy_bins)-1):
        if gamma_energy > energy_bins[j] and gamma_energy <= energy_bins[j+1]:
            #print name, "in bin", j, "->", gamma_energy, energy_bins[j], energy_bins[j+1]
            index = 0
            
            if j in gamma_line_indices:
                print "Error: x-ray line energy bin width too large!"
                sys.exit(1)
            elif j-1 in gamma_line_indices:
                index = j+1
            else:
                index = j
                # print energy_bins.pop( j )
                # print energy_bins.pop( j )
                energy_bins.pop( j )
                energy_bins.pop( j )
                
            print gamma_energy, "at bin", index

            energy_bins.insert(index, gamma_energy+5e-7 )
            energy_bins.insert(index, gamma_energy-5e-7 )
            gamma_line_indices.add(index)
            
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
