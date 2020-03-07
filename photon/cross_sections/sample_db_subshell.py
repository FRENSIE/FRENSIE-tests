#!/usr/bin/python
import sys, os
import os.path as path
import matplotlib.pyplot as plt
from optparse import *
import PyFrensie.Utility as Utility
import PyFrensie.Utility.Distribution as Distribution
import PyFrensie.Data as Data
import PyFrensie.Data.ACE as ACE
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
    parser.add_option("--sample_energy", type="float", dest="sample_energy",
                      help="the energy where incoherent scattering will occur")
    options,args = parser.parse_args()

    if options.db_path is None:
        print "The database path must be specified!"
        sys.exit(1)

    # Load the data
    database = Data.ScatteringCenterPropertiesDatabase( options.db_path )
    atom_properties = database.getAtomProperties( Data.ZAID(options.atomic_number*1000) )
    ace_file_props = atom_properties.getPhotoatomicDataProperties( Data.PhotoatomicDataProperties.ACE_EPR_FILE, 12 )

    print "Loading forward data..."
    ace_file = ACE.ACEFileHandler( os.path.dirname(options.db_path) + "/" + ace_file_props.filePath(),
                                   ace_file_props.tableName(),
                                   ace_file_props.fileStartLine() )
    ace_data = ACE.XSSEPRDataExtractor( ace_file.getTableNXSArray(),
                                        ace_file.getTableJXSArray(),
                                        ace_file.getTableXSSArray() )
    print "Forward data loaded"

    db_incoherent_energy_dist = Photon.DopplerBroadenedPhotonEnergyDistributionACEFactory.createCoupledCompleteDistribution( ace_data, False )
