#! /usr/bin/env python
from os import path
import sys
import numpy as np
import datetime
import getpass

frensie_install=''
# Set frensie install for the lkersting (always the same directory as frensie-tests)
if getpass.getuser() == 'lkersting':
  frensie_install = path.dirname(path.dirname(path.dirname(path.abspath(__file__))))
  sys.path.insert(1, frensie_install + '/bin/')
  sys.path.insert(1, frensie_install + '/lib/python2.7/site-packages/')

# NOTE: If a specific version of FRENSIE is desired, the path below can be
# uncommented and the desired path to the frensie/lib can be used.
# frensie_install = path.dirname(path.dirname(path.dirname(path.abspath(__file__))))
# sys.path.insert(1, frensie_install + '/bin/')
# sys.path.insert(1, frensie_install + '/lib/python2.7/site-packages/')

import PyFrensie.Data as Data
import PyFrensie.Data.Native as Native
import PyFrensie.Geometry.DagMC as DagMC
import PyFrensie.Geometry as Geometry
import PyFrensie.Utility as Utility
import PyFrensie.Utility.MPI as MPI
import PyFrensie.Utility.Prng as Prng
import PyFrensie.Utility.Coordinate as Coordinate
import PyFrensie.Utility.Distribution as Distribution
import PyFrensie.MonteCarlo as MonteCarlo
import PyFrensie.MonteCarlo.Collision as Collision
import PyFrensie.MonteCarlo.ActiveRegion as ActiveRegion
import PyFrensie.MonteCarlo.Event as Event
import PyFrensie.MonteCarlo.Manager as Manager

##----------------------------------------------------------------------------##
## ------------------------- SIMULATION PROPERTIES -------------------------- ##
##----------------------------------------------------------------------------##
def setSimulationProperties( histories, time ):

  properties = MonteCarlo.SimulationProperties()

  ## -------------------------- GENERAL PROPERTIES -------------------------- ##

  # Set the particle mode
  properties.setParticleMode( MonteCarlo.PHOTON_MODE )

  # Set the number of histories
  properties.setNumberOfHistories( histories )

  # Set the minimum number of rendezvous
  if histories > 100:
    properties.setMinNumberOfRendezvous( 10 )

  # Change time from minutes to seconds
  time_sec = time*60

  # Set the wall time
  properties.setSimulationWallTime( time_sec )

  ## -------------------------- NEUTRON PROPERTIES -------------------------- ##

  ## -------------------------- PHOTON PROPERTIES --------------------------- ##

  # # Set the min photon energy in MeV (Default is 100 eV)
  # properties.setMinPhotonEnergy( 1e-4 )

  # # Set the max photon energy in MeV (Default is 20 MeV)
  # properties.setMaxPhotonEnergy( 20.0 )

  # # Set the photon evaluation tolerance (Default is 1e-8)
  # properties.setPhotonEvaluationTolerance( 1e-8 )

  ## ------------------------- ELECTRON PROPERTIES -------------------------- ##

  return properties

##----------------------------------------------------------------------------##
## ------------------------- SIMULATION PROPERTIES -------------------------- ##
##----------------------------------------------------------------------------##
def setAdjointSimulationProperties( histories, time ):

  properties = MonteCarlo.SimulationProperties()

  ## -------------------------- GENERAL PROPERTIES -------------------------- ##

  # Set the particle mode
  properties.setParticleMode( MonteCarlo.ADJOINT_PHOTON_MODE )

  # Set the number of histories
  properties.setNumberOfHistories( histories )

  # Set the minimum number of rendezvous
  if histories > 100:
    properties.setMinNumberOfRendezvous( 10 )

  # Change time from minutes to seconds
  time_sec = time*60

  # Set the wall time
  properties.setSimulationWallTime( time_sec )

  ## ---------------------- ADJOINT NEUTRON PROPERTIES ---------------------- ##

  ## ---------------------- ADJOINT PHOTON PROPERTIES ----------------------- ##

  # # Set the min photon energy in MeV (Default is 1e-3 MeV)
  # properties.setMinAdjointPhotonEnergy( 1e-3 );

  # # Set the max photon energy in MeV (Default is 20 MeV)
  # properties.setMaxAdjointPhotonEnergy( 20.0 );


  ## --------------------- ADJOINT ELECTRON PROPERTIES ---------------------- ##

  return properties

##----------------------------------------------------------------------------##
## ---------------------- setSimulationNameExtention -------------------------##
##----------------------------------------------------------------------------##
# Define a function for naming an photon simulation
def setSimulationNameExtention( properties, file_type ):

  if file_type == Data.PhotoatomicDataProperties.ACE_EPR_FILE:
    # Use ACE EPR14 data
    name = "_epr14"
    title = "FRENSIE-ACE"
  else:
    # Use Native analog data
    name = ""
    title = "FRENSIE-Native"

  model = properties.getIncoherentModelType()

  if model == MonteCarlo.KN_INCOHERENT_MODEL:
    name += '_KN'
    title += ' KN'
  elif model == MonteCarlo.WH_INCOHERENT_MODEL:
    name += '_WH'
    title += ' WH'
  elif model == MonteCarlo.IMPULSE_INCOHERENT_MODEL:
    name += '_Impulse'
    title += ' Impulse'
  else:
    name += 'Other_DB_Impulse'
    title += ' Other DB Impulse'

  return (name, title)

##----------------------------------------------------------------------------##
## ------------------ setAdjointSimulationNameExtention ----------------------##
##----------------------------------------------------------------------------##
# Define a function for naming an photon simulation
def setAdjointSimulationNameExtention( properties ):

  # Set the name reaction and extention
  title = ""
  name = ""

  model = properties.getIncoherentAdjointModelType()

  if model == MonteCarlo.KN_INCOHERENT_ADJOINT_MODEL:
    name += '_KN'
    title += ' KN'
  elif model == MonteCarlo.WH_INCOHERENT_ADJOINT_MODEL:
    name += '_WH'
    title += ' WH'
  elif model == MonteCarlo.IMPULSE_INCOHERENT_ADJOINT_MODEL:
    name += '_Impulse'
    title += ' Impulse'
  elif model == MonteCarlo.DB_IMPULSE_INCOHERENT_ADJOINT_MODEL:
    name += '_DB_Impulse'
    title += ' DB Impulse'

  return (name, title)


##----------------------------------------------------------------------------##
## ------------------------ Create Results Directory ------------------------ ##
##----------------------------------------------------------------------------##
def getResultsDirectory(file_type, interpolation):

  if file_type == Data.PhotoatomicDataProperties.ACE_EPR_FILE:
    # Use ACE EPR14 data
    name = "epr14"
  else:
    # Use Native analog data
    name = "native"

  date = str(datetime.datetime.today()).split()[0]
  directory = "results/" + name + "/" + date

  return directory

##----------------------------------------------------------------------------##
##---------------------- processTrackFluxEnergyBinData -----------------------##
##----------------------------------------------------------------------------##
def processTrackFluxEnergyBinData( estimator, est_id, filename, title ):

  processed_data = estimator.getEntityBinProcessedData( est_id )
  flux = processed_data['mean']
  rel_error = processed_data['re']
  energy_bins = estimator.getEnergyDiscretization()

  today = datetime.date.today()

  # Write the flux data to a file
  name = filename+"_track_flux.txt"
  out_file = open(name, 'w')

  # Write title to file
  out_file.write( "# " + title +"\n")

  # Write the header to the file
  header = "# Energy (MeV)\tTrack Flux (#/cm$^2$)\tError\t"+str(today)+"\n"
  out_file.write(header)

  # Insert a zero flux for below the firest bin boundary
  flux = np.insert( flux, 0, 0.0)
  rel_error = np.insert( rel_error, 0, 0.0)

  for i in range(0, len(flux)):
    data = str(energy_bins[i]) + '\t' + str(flux[i]) + '\t' + str(rel_error[i]) + '\n'
    out_file.write(data)
  out_file.close()

##----------------------------------------------------------------------------##
##--------------------- processSurfaceFluxEnergyBinData ----------------------##
##----------------------------------------------------------------------------##
def processSurfaceFluxEnergyBinData( estimator, est_id, filename, title ):

  processed_data = estimator.getEntityBinProcessedData( est_id )
  flux = processed_data['mean']
  rel_error = processed_data['re']
  energy_bins = estimator.getEnergyDiscretization()

  today = datetime.date.today()

  # Write the flux data to a file
  name = filename+"_flux.txt"
  out_file = open(name, 'w')

  # Write title to file
  out_file.write( "# " + title +"\n")

  # Write the header to the file
  header = "# Energy (MeV)\tSurface Flux (#/cm$^2$)\tError\t"+str(today)+"\n"
  out_file.write(header)

  # Insert a zero flux for below the firest bin boundary
  flux = np.insert( flux, 0, 0.0)
  rel_error = np.insert( rel_error, 0, 0.0)

  for i in range(0, len(flux)):
    data = str(energy_bins[i]) + '\t' + str(flux[i]) + '\t' + str(rel_error[i]) + '\n'
    out_file.write(data)
  out_file.close()

##----------------------------------------------------------------------------##
##-------------------- processSurfaceCurrentEnergyBinData --------------------##
##----------------------------------------------------------------------------##
def processSurfaceCurrentEnergyBinData( estimator, est_id, filename, title ):

  processed_data = estimator.getEntityBinProcessedData( est_id )
  current = processed_data['mean']
  rel_error = processed_data['re']
  energy_bins = estimator.getEnergyDiscretization()

  today = datetime.date.today()

  # Write the current data to a file
  name = filename+"_current.txt"
  out_file = open(name, 'w')

  # Write title to file
  out_file.write( "# " + title +"\n")

  # Write the header to the file
  header = "# Energy (MeV)\tSurface Current (#)\tError\t"+str(today)+"\n"
  out_file.write(header)

  # Insert a zero current for below the firest bin boundary
  current = np.insert( current, 0, 0.0)
  rel_error = np.insert( rel_error, 0, 0.0)

  for i in range(0, len(current)):
    data = str(energy_bins[i]) + '\t' + str(current[i]) + '\t' + str(rel_error[i]) + '\n'
    out_file.write(data)
  out_file.close()

##----------------------------------------------------------------------------##
##-------------------- processSurfaceCurrentCosineBinData --------------------##
##----------------------------------------------------------------------------##
def processSurfaceCurrentCosineBinData( estimator, est_id, filename, title ):

  processed_data = estimator.getEntityBinProcessedData( est_id )
  current = processed_data['mean']
  rel_error = processed_data['re']
  cosine_bins = estimator.getCosineDiscretization()

  today = datetime.date.today()

  # Write the current data to a file
  name = filename+"_current.txt"
  out_file = open(name, 'w')

  # Write title to file
  out_file.write( "# " + title +"\n")

  # Write the header to the file
  header = "# Cosine \tSurface Current (#)\tError\t"+str(today)+"\n"
  out_file.write(header)

  # Insert a zero current for below the firest bin boundary
  current = np.insert( current, 0, 0.0)
  rel_error = np.insert( rel_error, 0, 0.0)

  for i in range(0, len(current)):
    data = str(cosine_bins[i]) + '\t' + str(current[i]) + '\t' + str(rel_error[i]) + '\n'
    out_file.write(data)
  out_file.close()

##----------------------------------------------------------------------------##
##------------------- processTrackFluxSourceEnergyBinData --------------------##
##----------------------------------------------------------------------------##
def processTrackFluxSourceEnergyBinData( estimator, est_id, filename, title ):

  processed_data = estimator.getEntityBinProcessedData( est_id )
  flux = processed_data['mean']
  rel_error = processed_data['re']
  energy_bins = estimator.getSourceEnergyDiscretization()

  today = datetime.date.today()

  # Write the flux data to a file
  name = filename+"_source_track_flux.txt"
  out_file = open(name, 'w')

  # Write title to file
  out_file.write( "# " + title +"\n")

  # Write the header to the file
  header = "# Source Energy (MeV)\tTrack Flux (#/cm$^2$)\tError\t"+str(today)+"\n"
  out_file.write(header)

  # Insert a zero flux for below the firest bin boundary
  flux = np.insert( flux, 0, 0.0)
  rel_error = np.insert( rel_error, 0, 0.0)

  for i in range(0, len(flux)):
    data = str(energy_bins[i]) + '\t' + str(flux[i]) + '\t' + str(rel_error[i]) + '\n'
    out_file.write(data)
  out_file.close()

##----------------------------------------------------------------------------##
##------------------ processSurfaceFluxSourceEnergyBinData -------------------##
##----------------------------------------------------------------------------##
def processSurfaceFluxSourceEnergyBinData( estimator, est_id, filename, title ):

  processed_data = estimator.getEntityBinProcessedData( est_id )
  flux = processed_data['mean']
  rel_error = processed_data['re']
  energy_bins = estimator.getSourceEnergyDiscretization()

  today = datetime.date.today()

  # Write the flux data to a file
  name = filename+"_source_flux.txt"
  out_file = open(name, 'w')

  # Write title to file
  out_file.write( "# " + title +"\n")

  # Write the header to the file
  header = "# Source Energy (MeV)\tSurface Flux (#/cm$^2$)\tError\t"+str(today)+"\n"
  out_file.write(header)

  # Insert a zero flux for below the firest bin boundary
  flux = np.insert( flux, 0, 0.0)
  rel_error = np.insert( rel_error, 0, 0.0)

  for i in range(0, len(flux)):
    data = str(energy_bins[i]) + '\t' + str(flux[i]) + '\t' + str(rel_error[i]) + '\n'
    out_file.write(data)
  out_file.close()

##----------------------------------------------------------------------------##
##---------------- processSurfaceCurrentSourceEnergyBinData ------------------##
##----------------------------------------------------------------------------##
def processSurfaceCurrentSourceEnergyBinData( estimator, est_id, filename, title ):

  processed_data = estimator.getEntityBinProcessedData( est_id )
  current = processed_data['mean']
  rel_error = processed_data['re']
  energy_bins = estimator.getSourceEnergyDiscretization()

  today = datetime.date.today()

  # Write the current data to a file
  name = filename+"_source_current.txt"
  out_file = open(name, 'w')

  # Write title to file
  out_file.write( "# " + title +"\n")

  # Write the header to the file
  header = "# Source Energy (MeV)\tSurface Current (#)\tError\t"+str(today)+"\n"
  out_file.write(header)

  # Insert a zero current for below the firest bin boundary
  current = np.insert( current, 0, 0.0)
  rel_error = np.insert( rel_error, 0, 0.0)

  for i in range(0, len(current)):
    data = str(energy_bins[i]) + '\t' + str(current[i]) + '\t' + str(rel_error[i]) + '\n'
    out_file.write(data)
  out_file.close()