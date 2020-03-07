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

# Set the source energy (0.001, 0.01, 0.1)
energy=0.01

# Set the elastic distribution mode ( DECOUPLED, COUPLED, HYBRID )
mode=MonteCarlo.COUPLED_DISTRIBUTION

# Set the elastic coupled sampling method
# ( TWO_D_UNION, ONE_D_UNION, MODIFIED_TWO_D_UNION )
method=MonteCarlo.MODIFIED_TWO_D_UNION

# Set database directory path (for Denali)
if socket.gethostname() == "Denali":
  database_path = "/home/software/mcnpdata/database.xml"
else: # Set database directory path (for Cluster)
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

# Set the bivariate interpolation (LOGLOGLOG, LINLINLIN, LINLINLOG)
interpolation=MonteCarlo.LOGLOGLOG_INTERPOLATION

# Set the bivariate Grid Policy (UNIT_BASE_CORRELATED, CORRELATED, UNIT_BASE)
grid_policy=MonteCarlo.UNIT_BASE_CORRELATED_GRID

# Set the data file type (ACE_EPR_FILE, Native_EPR_FILE)
file_type=Data.PhotoatomicDataProperties.Native_EPR_FILE

##----------------------------------------------------------------------------##
## ----------------------------- RUN SIMULATION ----------------------------- ##
##----------------------------------------------------------------------------##
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

  # Set element zaid and name
  atom=Data.H_ATOM
  zaid=1000
  element="H"

  # Set geometry path and type
  model_properties = DagMC.DagMCModelProperties( geometry_path )
  model_properties.useFastIdLookup()

  # Set model
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

  # Setup a surface flux estimator
  estimator_id = 1
  surface_ids = [1]
  surface_flux_estimator = Event.WeightMultipliedSurfaceFluxEstimator( estimator_id, 1.0, surface_ids, geom_model )

  # Set the particle type
  surface_flux_estimator.setParticleTypes( [MonteCarlo.PHOTON] )

  # Set the energy bins
  surface_flux_estimator.setEnergyDiscretization( bins )

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
  if file_type == Data.PhotoatomicDataProperties.ACE_EPR_FILE:
    version = 14

  element_definition.setPhotoatomicDataProperties(
            element_properties.getSharedPhotoatomicDataProperties( file_type, version ) )

  material_definition_database = Collision.MaterialDefinitionDatabase()
  material_definition_database.addDefinition( element, 1, (element,), (1.0,) )

  # Fill model
  model = Collision.FilledGeometryModel( database_path, scattering_center_definition_database, material_definition_database, properties, geom_model, True )

  # Set particle distribution
  particle_distribution = ActiveRegion.StandardParticleDistribution( "source distribution" )

  # Set the energy dimension distribution
  delta_energy = Distribution.DeltaDistribution( energy )
  energy_dimension_dist = ActiveRegion.IndependentEnergyDimensionDistribution( delta_energy )
  particle_distribution.setDimensionDistribution( energy_dimension_dist )

  # Set the spatial dimension distribution
  particle_distribution.setPosition( 0.0, 0.0, 0.0 )

  particle_distribution.constructDimensionDistributionDependencyTree()

  # Set source components
  source_component = [ActiveRegion.StandardPhotonSourceComponent( 0, 1.0, geom_model, particle_distribution )]

  # Set source
  source = ActiveRegion.StandardParticleSource( source_component )

  # Set the archive type
  archive_type = "xml"

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

    # Call destructor for manager and factory
    manager = 0
    factory = 0

    print "Processing the results:"
    processDataFromRendezvous( archive_name )

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

  ## -------------------------- PHOTON PROPERTIES ------------------------- ##

  # Set the min and max photon energy
  # properties.setMinPhotonEnergy( 1e-3 )
  properties.setMaxPhotonEnergy( energy )

  # Set the Kahn Sampling Cutoff Energy
  # properties.setKahnSamplingCutoffEnergy( 3.0 )

  # Set the Incoherent Scattering Model
  # incoherent_model = MonteCarlo.KN_INCOHERENT_MODEL
  # incoherent_model = MonteCarlo.WH_INCOHERENT_MODEL
  incoherent_model = MonteCarlo.IMPULSE_INCOHERENT_MODEL
  # incoherent_model = MonteCarlo.DECOUPLED_HALF_PROFILE_DB_HYBRID_INCOHERENT_MODEL
  # incoherent_model = MonteCarlo.DECOUPLED_FULL_PROFILE_DB_HYBRID_INCOHERENT_MODEL
  # incoherent_model = MonteCarlo.COUPLED_HALF_PROFILE_DB_HYBRID_INCOHERENT_MODEL
  # incoherent_model = MonteCarlo.COUPLED_FULL_PROFILE_DB_HYBRID_INCOHERENT_MODEL
  # incoherent_model = MonteCarlo.FULL_PROFILE_DB_IMPULSE_INCOHERENT_MODEL

  properties.setIncoherentModelType( incoherent_model )

  # Turn off Atomic Relaxation
  properties.setAtomicRelaxationModeOff( MonteCarlo.PHOTON )

  # Set the detailed Pair Production Mode
  properties.setDetailedPairProductionModeOn()
  # properties.setDetailedPairProductionModeOff()

  # Set the detailed Photonuclear Interaction Mode
  properties.setPhotonuclearInteractionModeOn()
  # properties.setPhotonuclearInteractionModeOff()

  return properties

##----------------------------------------------------------------------------##
## ------------------------ Create Results Directory ------------------------ ##
##----------------------------------------------------------------------------##
def createResultsDirectory():

  date = str(datetime.datetime.today()).split()[0]
  directory = "results/forward/" + date

  if not path.exists(directory):
    makedirs(directory)

  return directory

##----------------------------------------------------------------------------##
## -------------------------- setSimulationName ------------------------------##
##----------------------------------------------------------------------------##
# Define a function for naming an photon simulation
def setSimulationName( properties ):
  extension, title = setup.setSimulationNameExtention( properties, file_type )
  name = "forward_" + str(energy) + extension

  date = str(datetime.datetime.today()).split()[0]
  directory = "results/forward/" + date

  output = directory + "/" + name

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

  if "epr14" not in rendezvous_file:
    file_type = Data.PhotoatomicDataProperties.Native_EPR_FILE
  else:
    file_type = Data.PhotoatomicDataProperties.ACE_EPR_FILE

  filename, title = setSimulationName( properties )

  print "Processing the results:"
  processData( event_handler, filename, title )

  print "Results will be in ", path.dirname(filename)

##----------------------------------------------------------------------------##
##------------------------------- processData --------------------------------##
##----------------------------------------------------------------------------##
def processData( event_handler, filename, title ):

  # Process track flux data
  surface_flux = event_handler.getEstimator( 1 )
  ids = list( surface_flux.getEntityIds() )
  setup.processSurfaceFluxEnergyBinData( surface_flux, ids[0], filename, title )
