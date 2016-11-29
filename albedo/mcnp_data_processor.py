#! /usr/bin/env python
import datetime
import os
import shutil
import sys, getopt
from subprocess import call

def main(argv):
    directory = ''
    try:
        opts, args = getopt.getopt(argv,"hd:",["out_dir="])
    except getopt.GetoptError:
        print 'data_processor.py -d <directory>'
        sys.exit(1)
    for opt, arg in opts:
        if opt == '-h':
            print 'data_processor.py -d <directory>'
            sys.exit(1)
        elif opt in ("-d", "--out_dir"):
            directory = arg

    cell_list = ['10']
    surface_list = ['100', '101']
    angle_list = ['', 'full' ]

    # Get mcnp output file name
    base = "mcnp"
    mcnp_output = base+".o"

    # Check if file exists
    if os.path.isfile(mcnp_output):
        # Check if the ouput directory exists and make if necessary
        if not os.path.isdir(directory):
            print "Making directory",directory
            os.makedirs(directory)

        # Move file to output directory
        new_name = str(directory)+base
        shutil.move(mcnp_output,new_name+".o")
        shutil.move(base+".m",new_name+".m")
        shutil.move(base+".r",new_name+".r")

        # Move to output data directory
        os.chdir(directory)

        today = datetime.date.today()
        # Read the mcnp data file for surface tallys
        with open(mcnp_output) as data:
            # go through all surface tallies
            for i in cell_list:
                start=" cell  "+i
                name = base+"_cell_flux.txt"
                file = open(name, 'w')
                header = "# Energy   flux \t   Sigma\t"+str(today)+"\n"
                file.write(header)
                # Skips text before the beginning of the interesting block:
                for line in data:
                    if line.startswith(start):
                        data.next()
                        break
                # Reads text until the end of the block:
                for line in data:  # This keeps reading the file
                    if line.startswith('      total'):
                        file.close()
                        break
                    line = line.lstrip()
                    line = line.replace('   ',' ')
                    file.write(line)

        with open(mcnp_output) as data:
            # go through all surface tallies
            for i in surface_list:
                start=" surface  "+i

                # go through the current estimators first angle
                name = base+"_"+i+".txt"
                file = open(name, 'w')
                header = "# Angle     Current     Sigma\t"+str(today)+"\n"
                file.write(header)
                # Skips text before the beginning of the interesting block:
                for line in data:
                    if line.startswith(start):
                        break
                # Reads text until the end of the block:
                for line in data:  # This keeps reading the file
                    line = line.strip()
                    line = line.replace('angle  bin:  -1.          to  ','')
                    line = line.replace(' mu',' ')
                    line+=data.next().strip()+'\n'
                    file.write(line)
                    break

                # Skips text before the beginning of the interesting block:
                for line in data:
                    if line.startswith(start):
                        break
                # Reads text until the end of the block:
                for line in data:  # This keeps reading the file
                    line = line.strip()
                    line = line.replace('angle  bin:   9.90000E-01 to  ','')
                    line = line.replace(' mu',' ')
                    line+=data.next().strip()
                    file.write(line)
                    break
                file.close()

            # go through all surface tallies
            for i in surface_list:
                start=" surface  "+i

                # go through the current estimators first angle
                name = base+"_"+i+"_full.txt"
                file = open(name, 'w')
                header = "# Angle     Current     Sigma\t"+str(today)+"\n"
                file.write(header)
                # Skips text before the beginning of the interesting block:
                for line in data:
                    if line.startswith(start):
                        break
                # Reads text until the end of the block:
                for line in data:  # This keeps reading the file
                    line = line.strip()
                    line = line.replace('angle  bin:  -1.          to  ','')
                    line = line.replace(' mu',' ')
                    line+=data.next().strip()+'\n'
                    file.write(line)
                    break

                # Skips text before the beginning of the interesting block:
                for line in data:
                    if line.startswith(start):
                        break
                # Reads text until the end of the block:
                for line in data:  # This keeps reading the file
                    line = line.strip()
                    line = line.replace('angle  bin:   0.00000E+00 to  ','')
                    line = line.replace(' mu',' ')
                    line+=data.next().strip()
                    file.write(line)
                    break
                file.close()
        # Plot results
#        plot = "../../plot_"+base+".p"
#        call(["gnuplot", plot])

    else:
        print "File ",mcnp_output," does not exist!"

if __name__ == "__main__":
   main(sys.argv[1:])
