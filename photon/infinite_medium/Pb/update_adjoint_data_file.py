#!/usr/bin/python
import sys
from os import path, makedirs
import datetime
from optparse import *
from native_epr_to_native_aepr import generateData, addToDatabase
import PyFrensie.Data as Data

if __name__ == "__main__":

    # Parse the command-line arguments
    parser = OptionParser()
    parser.add_option("-d", "--db_name", type="string", dest="db_name", default="database.xml",
                      help="the database file with path")
    options,args = parser.parse_args()

    if path.exists( options.db_name ):
      # Open the database
      database = Data.ScatteringCenterPropertiesDatabase( options.db_name )
    else:
      print "ERROR: The file", options.db_name, "doesn't exist!"
      sys.exit(1)

    # Get the atom properties for the zaid
    if not database.doAtomPropertiesExist( Data.H_ATOM ):
        print "The database does not contain the H data"
        sys.exit(1)

    element_properties = database.getAtomProperties( Data.H_ATOM )

    # Check if the native file exists
    if not element_properties.photoatomicDataAvailable( Data.PhotoatomicDataProperties.Native_EPR_FILE ):
        print "The database does not contain the H native data"
        sys.exit(1)

    if not element_properties.photoatomicDataAvailable( Data.PhotoatomicDataProperties.Native_EPR_FILE, 0 ):
        print "The database does not contain version 0 of H native data"
        sys.exit(1)

    data_properties = element_properties.getSharedPhotoatomicDataProperties( Data.PhotoatomicDataProperties.Native_EPR_FILE, 0 )

    epr_file_name = path.dirname(options.db_name) + "/" + data_properties.filePath()

    # Get/create the aepr directory path
    aepr_directory = path.dirname(path.dirname( epr_file_name )) + "/aprobinson/aepr"

    if not path.exists(aepr_directory):
        makedirs( aepr_directory )

    # Set the aepr file name
    aepr_file_name = aepr_directory + "/aepr_native_1.xml"

    # Get the date for the table notes
    today = str(datetime.datetime.today())
    notes="This table was generated on " + today + ". It is for testing only!"

    # Update the adjoint hydrogen data
    max_electron_energy = 0.1
    min_electron_energy = 1e-5

    min_photon_energy = 1e-3
    max_photon_energy = 20.0

    # Set default photon grid tolerances
    photon_grid_convergence_tol = 1e-3
    photon_grid_abs_diff_tol = 1e-42
    photon_grid_dist_tol = 1e-80

    adjoint_pp_energy_dist_norm_const_eval_tol = 1e-3
    adjoint_pp_energy_dist_norm_const_nudge_val = 1e-6
    adjoint_tp_energy_dist_norm_const_eval_tol = 1e-3
    adjoint_tp_energy_dist_norm_const_nudge_val = 1e-6
    adjoint_incoherent_max_energy_nudge_val = 0.2
    adjoint_incoherent_energy_to_max_energy_nudge_val = 1e-5
    adjoint_incoherent_eval_tol = 1e-3
    adjoint_incoherent_grid_convergence_tol = 1e-3
    adjoint_incoherent_grid_abs_diff_tol = 1e-42
    adjoint_incoherent_grid_dist_tol = 1e-80

    # Set default electron grid tolerances
    electron_grid_convergence_tol = 0.1
    electron_grid_abs_diff_tol = 1e-20
    electron_grid_dist_tol = 1e-16

    cutoff_angle_cosine = 1.0
    num_moment_preserving_angles = 0
    tabular_evaluation_tol = 1e-7
    electron_two_d_interp_policy = "LogLogLog"
    electron_two_d_grid_policy = "UnitBaseCorrelated"
    brems_min_energy_nudge_val = 1e-9
    brems_max_energy_nudge_val = 1e-2
    brems_eval_tol = 1e-5
    brems_grid_convergence_tol = 1e-3
    brems_grid_abs_diff_tol = 1e-20
    brems_grid_dist_tol = 1e-16

    electroion_min_energy_nudge_val = 1e-9
    electroion_max_energy_nudge_val = 1e-2
    electroion_eval_tol = 1e-5
    electroion_convergence_tol = 1e-3
    electroion_abs_diff_tol = 1e-20
    electroion_dist_tol = 1e-16

    # Generate the data
    print "Updating file " + aepr_file_name + " with a max energy of 20.0 MeV\n"
    data_container = \
      generateData( epr_file_name,
                    aepr_file_name,
                    True,
                    notes,
                    min_photon_energy,
                    max_photon_energy,
                    min_electron_energy,
                    max_electron_energy,
                    photon_grid_convergence_tol,
                    photon_grid_abs_diff_tol,
                    photon_grid_dist_tol,
                    adjoint_pp_energy_dist_norm_const_eval_tol,
                    adjoint_pp_energy_dist_norm_const_nudge_val,
                    adjoint_tp_energy_dist_norm_const_eval_tol,
                    adjoint_tp_energy_dist_norm_const_nudge_val,
                    adjoint_incoherent_max_energy_nudge_val,
                    adjoint_incoherent_energy_to_max_energy_nudge_val,
                    adjoint_incoherent_eval_tol,
                    adjoint_incoherent_grid_convergence_tol,
                    adjoint_incoherent_grid_abs_diff_tol,
                    adjoint_incoherent_grid_dist_tol,
                    electron_grid_convergence_tol,
                    electron_grid_abs_diff_tol,
                    electron_grid_dist_tol,
                    cutoff_angle_cosine,
                    num_moment_preserving_angles,
                    tabular_evaluation_tol,
                    electron_two_d_interp_policy,
                    electron_two_d_grid_policy,
                    brems_min_energy_nudge_val,
                    brems_max_energy_nudge_val,
                    brems_eval_tol,
                    brems_grid_convergence_tol,
                    brems_grid_abs_diff_tol,
                    brems_grid_dist_tol,
                    electroion_min_energy_nudge_val,
                    electroion_max_energy_nudge_val,
                    electroion_eval_tol,
                    electroion_convergence_tol,
                    electroion_abs_diff_tol,
                    electroion_dist_tol )

    addToDatabase( aepr_file_name,
                   path.dirname( options.db_name ),
                   database,
                   data_container.getAtomicNumber(),
                   data_container.getAtomicWeight(),
                   0 )
    
    database.saveToFile( options.db_name, True )
    
    print "Adjoint H native data updated successfully!\n"
