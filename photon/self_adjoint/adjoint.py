#! /usr/bin/env python
from os import path, makedirs
import sys
import numpy
import datetime
import socket

# Add the parent directory to the path
sys.path.insert(1,path.dirname(path.dirname(path.abspath(__file__))))
import simulation_setup as setup
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

pyfrensie_path =path.dirname( path.dirname(path.abspath(MonteCarlo.__file__)))

##----------------------------------------------------------------------------##
## ---------------------- GLOBAL SIMULATION VARIABLES ----------------------- ##
##----------------------------------------------------------------------------##

# Set the element
atom=Data.H_ATOM; element="H"; zaid=1000
# Set the forward source energy ( 0.001, 0.01, 0.1 )
energy=0.01

# Set database directory path (for Denali)
if socket.gethostname() == "Denali":
  database_path = "/home/software/mcnpdata/database.xml"
# Set database directory path (for Elbrus)
elif socket.gethostname() == "Elbrus":
  database_path = "/home/software/mcnpdata/database.xml"
# Set database directory path (for Cluster)
else:
  database_path = "/home/lkersting/software/mcnp6.2/MCNP_DATA/database.xml"

geometry_path = path.dirname(path.realpath(__file__)) + "/geom_"

# Set the energy bins
if energy == 0.1:
  geometry_path += "100keV.h5m"
elif energy == 0.01:
  geometry_path += "10keV.h5m"
elif energy == 0.001:
  geometry_path += "1keV.h5m"
else:
  print "ERROR: energy ", energy, " not supported!"

# Run the simulation
def runSimulation( threads, histories, time ):

  ##--------------------------------------------------------------------------##
  ## ------------------------------ MPI Session ----------------------------- ##
  ##--------------------------------------------------------------------------##
  session = MPI.GlobalMPISession( len(sys.argv), sys.argv )
  Utility.removeAllLogs()
  session.initializeLogs( 0, True )

  if session.rank() == 0:
    print "The PyFrensie path is set to: ", pyfrensie_path

  properties = setSimulationProperties( histories, time )

  ##--------------------------------------------------------------------------##
  ## ---------------------------- GEOMETRY SETUP ---------------------------- ##
  ##--------------------------------------------------------------------------##


  # Set geometry path and type
  model_properties = DagMC.DagMCModelProperties( geometry_path )
  model_properties.useFastIdLookup()

  # Construct model
  geom_model = DagMC.DagMCModel( model_properties )

  ##--------------------------------------------------------------------------##
  ## -------------------------- EVENT HANDLER SETUP ------------------------- ##
  ##--------------------------------------------------------------------------##

  # Set event handler
  event_handler = Event.EventHandler( properties )

  # Set the energy bins
  if energy == 0.1:
    bins = list(Utility.doubleArrayFromString( "{ 1e-3, 198i, 1e-1}" ))
  elif energy == 0.01:
    bins = list(Utility.doubleArrayFromString( "{ 1e-3, 149i, 1e-2 }" ))
  elif energy == 0.001:
    bins = list(Utility.doubleArrayFromString( "{ 1e-3, 197i, 1e-3}" ))
  else:
    print "ERROR: energy ", energy, " not supported!"

  ## ------------------------ Surface Flux Estimator ------------------------ ##

  # Setup an adjoint surface flux estimator
  estimator_id = 2
  surface_ids = [1]
  surface_flux_estimator = Event.WeightMultipliedSurfaceFluxEstimator( estimator_id, 1.0, surface_ids, geom_model )

  # Set the particle type
  surface_flux_estimator.setParticleTypes( [MonteCarlo.ADJOINT_PHOTON] )

  # Set the energy bins
  surface_flux_estimator.setSourceEnergyDiscretization( bins )

  # Create response function
  delta_energy = Distribution.DeltaDistribution( energy )
  particle_response_function = ActiveRegion.EnergyParticleResponseFunction( delta_energy )
  response_function = ActiveRegion.StandardParticleResponse( particle_response_function )

  # Set the response function
  surface_flux_estimator.setResponseFunctions( [response_function] )

  # Add the estimator to the event handler
  event_handler.addEstimator( surface_flux_estimator )

  ##--------------------------------------------------------------------------##
  ## ----------------------- SIMULATION MANAGER SETUP ----------------------- ##
  ##--------------------------------------------------------------------------##

  # Initialized database
  database = Data.ScatteringCenterPropertiesDatabase(database_path)
  scattering_center_definition_database = Collision.ScatteringCenterDefinitionDatabase()

  # Set element properties
  element_properties = database.getAtomProperties( atom )

  element_definition = scattering_center_definition_database.createDefinition( element, Data.ZAID(zaid) )


  version = 0
  file_type = Data.AdjointPhotoatomicDataProperties.Native_EPR_FILE

  element_definition.setAdjointPhotoatomicDataProperties(
            element_properties.getSharedAdjointPhotoatomicDataProperties( file_type, version ) )

  material_definition_database = Collision.MaterialDefinitionDatabase()
  material_definition_database.addDefinition( element, 1, (element,), (1.0,) )

  # Fill model
  model = Collision.FilledGeometryModel( database_path, scattering_center_definition_database, material_definition_database, properties, geom_model, True )

  # Set particle distribution
  particle_distribution = ActiveRegion.StandardParticleDistribution( "source distribution" )

  energy_cutoff = properties.getMinAdjointPhotonEnergy()

  # Set the energy dimension distribution
  uniform_energy = Distribution.UniformDistribution( energy_cutoff, energy )
  energy_dimension_dist = ActiveRegion.IndependentEnergyDimensionDistribution( uniform_energy )
  particle_distribution.setDimensionDistribution( energy_dimension_dist )

  # Set the spatial dimension distribution
  particle_distribution.setPosition( 0.0, 0.0, 0.0 )

  particle_distribution.constructDimensionDistributionDependencyTree()

  # Set source components
  source_component = [ActiveRegion.StandardAdjointPhotonSourceComponent( 0, 1.0, model, particle_distribution )]

  # Set source
  source = ActiveRegion.StandardParticleSource( source_component )

  # Set the archive type
  archive_type = "xml"

  # Set the simulation name and title
  name, title = setSimulationName( properties )

  factory = Manager.ParticleSimulationManagerFactory( model,
                                                      source,
                                                      event_handler,
                                                      properties,
                                                      name,
                                                      archive_type,
                                                      threads )

  manager = factory.getManager()

  Utility.removeAllLogs()
  session.initializeLogs( 0, False )

  manager.runSimulation()

  if session.rank() == 0:

    print "Processing the results:"
    processData( event_handler, name, title )
    print "Results will be in ", path.dirname(name)

##----------------------------------------------------------------------------##
## --------------------- Run Simulation From Rendezvous --------------------- ##
##----------------------------------------------------------------------------##
def runSimulationFromRendezvous( threads, histories, time, rendezvous ):

  ##--------------------------------------------------------------------------##
  ## ------------------------------ MPI Session ----------------------------- ##
  ##--------------------------------------------------------------------------##
  session = MPI.GlobalMPISession( len(sys.argv), sys.argv )
  Utility.removeAllLogs()
  session.initializeLogs( 0, True )

  if session.rank() == 0:
    print "The PyFrensie path is set to: ", pyfrensie_path

  # Set the data path
  Collision.FilledGeometryModel.setDefaultDatabasePath( database_path )

  factory = Manager.ParticleSimulationManagerFactory( rendezvous, histories, time, threads )

  manager = factory.getManager()

  Utility.removeAllLogs()
  session.initializeLogs( 0, False )

  manager.runSimulation()

  if session.rank() == 0:

    rendezvous_number = manager.getNumberOfRendezvous()

    components = rendezvous.split("rendezvous_")
    archive_name = components[0] + "rendezvous_"
    archive_name += str( rendezvous_number - 1 )
    archive_name += "."
    archive_name += components[1].split(".")[1]

    # Get the event handler
    event_handler = manager.getEventHandler()

    # Get the simulation name and title
    properties = manager.getSimulationProperties()

    filename, title = setSimulationName( properties )

    print "Processing the results:"
    processData( event_handler, filename, title )

    print "Results will be in ", path.dirname(filename)

##----------------------------------------------------------------------------##
## ------------------------- SIMULATION PROPERTIES -------------------------- ##
##----------------------------------------------------------------------------##
def setSimulationProperties( histories, time ):

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

  ## -------------------------- PHOTON PROPERTIES ------------------------- ##

  # Set the max photon energy in MeV (Default is 20 MeV)
  properties.setMaxAdjointPhotonEnergy( energy )

  # Set the critical line energies
  properties.setCriticalAdjointPhotonLineEnergies( [energy] )

  # Set the Incoherent Model
  # incoherent_model = MonteCarlo.KN_INCOHERENT_ADJOINT_MODEL
  # incoherent_model = MonteCarlo.WH_INCOHERENT_ADJOINT_MODEL
  incoherent_model = MonteCarlo.IMPULSE_INCOHERENT_ADJOINT_MODEL
  # incoherent_model = MonteCarlo.DB_IMPULSE_INCOHERENT_ADJOINT_MODEL

  properties.setIncoherentAdjointModelType( incoherent_model )

  # Set the cutoff weight properties for rouletting
  properties.setAdjointPhotonRouletteThresholdWeight( 1e-20 )
  properties.setAdjointPhotonRouletteSurvivalWeight( 1e-18 )

  return properties

##----------------------------------------------------------------------------##
## ------------------------ Create Results Directory ------------------------ ##
##----------------------------------------------------------------------------##
def createResultsDirectory():

  date = str(datetime.datetime.today()).split()[0]
  directory = "results/adjoint/" + date

  if not path.exists(directory):
    makedirs(directory)

  print directory
  return directory

##----------------------------------------------------------------------------##
## -------------------------- setSimulationName ------------------------------##
##----------------------------------------------------------------------------##
# Define a function for naming an photon simulation
def setSimulationName( properties ):
  extension, title = setup.setAdjointSimulationNameExtention( properties )
  name = "adjoint_" + str(energy) + extension
  date = str(datetime.datetime.today()).split()[0]

  output = "results/adjoint/" + date + "/" + name

  return (output, title)

##----------------------------------------------------------------------------##
## -------------------------- getSimulationName ------------------------------##
##----------------------------------------------------------------------------##
# Define a function for naming an photon simulation
def getSimulationName():

  properties = setSimulationProperties( 1, 1.0 )

  name, title = setSimulationName( properties )

  return name

##----------------------------------------------------------------------------##
##------------------------ processDataFromRendezvous -------------------------##
##----------------------------------------------------------------------------##

# This function pulls data from the rendezvous file
def processDataFromRendezvous( rendezvous_file ):

  Collision.FilledGeometryModel.setDefaultDatabasePath( database_path )

  # Load data from file
  manager = Manager.ParticleSimulationManagerFactory( rendezvous_file ).getManager()
  event_handler = manager.getEventHandler()

  # Get the simulation name and title
  properties = manager.getSimulationProperties()

  filename, title = setSimulationName( properties )

  print "Processing the results:"
  processData( event_handler, filename, title )

  print "Results will be in ", path.dirname(filename)

##----------------------------------------------------------------------------##
##------------------------------- processData --------------------------------##
##----------------------------------------------------------------------------##
def processData( event_handler, filename, title ):

  # Process surface flux data
  surface_flux = event_handler.getEstimator( 2 )
  ids = list( surface_flux.getEntityIds() )
  setup.processSurfaceFluxSourceEnergyBinData( surface_flux, ids[0], filename, title )
