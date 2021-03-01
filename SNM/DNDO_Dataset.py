"""

Title:   MCNP_Dataset.py

Author:  Eli Moll

"""

# ---------------------------------------------------------------------------- #
#                               Module Imports                                 # 
# ---------------------------------------------------------------------------- #

import sys 
import numpy

# ---------------------------------------------------------------------------- #

class DNDO_Dataset():

    # Constructor
    def __init__( self,
                  filename, pseudonym ):
        self.tally_scores       = {}
        self.tally_errors       = {}
        self.tally_times        = {}
        self.tally_descriptions = {}
        self.filename     = filename
        self.pseudonym    = str(pseudonym)
        
        self.parseOutput()

    # Parsing function
    def parseOutput( self ):
        "Parse the associated filename and store all tallies in numpy arrays..."

        # Attempt to open the file and warn the user of an error
        try:
            tally_file = open( self.filename, 'r')
        except OSError:
            print("Error opening file: ", self.filename)

        tally_file = open( self.filename, 'r')

        line = self.readLine( tally_file )

        found_tallies = 0
        file_completed = False;

        while( not file_completed ):

            # Parse specific tallies when found
            if( not len(line.strip()) == 0 and line.split()[0] == "1tally" ):

                self.readTally( tally_file, int(line.split()[1]) )
                found_tallies = found_tallies + 1

            if( found_tallies == 5 ):
                file_completed = True
            else:
                line = self.readLine( tally_file )

    # Read line function
    def readLine( self, tally_file ):
        return tally_file.readline()

    # Read specific tally from meshtal file
    def readTally( self, tally_file, tally_number ):
        line = self.readLine( tally_file )

        for i in range(0, 8):
            line = self.readLine( tally_file )

        time  = numpy.zeros(5)
        score = numpy.zeros(5)
        error = numpy.zeros(5)

        # Parse data
        for i in range(0, 4):
            time[i] = (float(line.split()[i+2]) - 1e7)/1e5

        line = self.readLine( tally_file )

        for i in range(0, 4):
            score[i] = float(line.split()[2*i+2])
            error[i] = float(line.split()[2*i+3])

        line = self.readLine( tally_file )
        line = self.readLine( tally_file )
        for i in range(0, 1):
            time[4] = (float(line.split()[i+1]) - 1e7)/1e5

        line = self.readLine( tally_file )

        for i in range(0, 1):
            score[4] = float(line.split()[2*i])
            error[4] = float(line.split()[2*i+1])

        for i in range(0, 2):
            line = self.readLine( tally_file )

        # Map all of the appropriate data
        self.tally_scores.update({int(tally_number):score})
        self.tally_errors.update({int(tally_number):error})
        self.tally_times.update({int(tally_number):time})
