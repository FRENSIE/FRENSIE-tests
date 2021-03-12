import numpy
import os
import sys
import PyFrensie.Geometry as Geometry
import PyFrensie.Geometry.DagMC as DagMC
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
import PyFrensie.Data as Data
import PyFrensie.Data.Native as Native



##---------------------------------------------------------------------------##
## Set up and run the simulation
##---------------------------------------------------------------------------##
def Simulation( sim_name,
                      db_path,
                      num_particles,
                      source_energy,
                      energy_bins,
                      threads,
                      log_file = None ):
##---------------------------------------------------------------------------##
## Initialize the MPI Session
##---------------------------------------------------------------------------##

    session = MPI.GlobalMPISession( len(sys.argv), sys.argv )

    # Suppress logging on all procs except for the master (proc=0)
    Utility.removeAllLogs()
    session.initializeLogs( 0, True )

    if not log_file is None:
        session.initializeLogs( log_file, 0, True )

##---------------------------------------------------------------------------##
## Set the simulation properties
##---------------------------------------------------------------------------##
    

    simulation_properties = MonteCarlo.SimulationProperties()

    # Simulate neutrons only
    simulation_properties.setParticleMode( MonteCarlo.PHOTON_ELECTRON_MODE )
    #simulation_properties.setIncoherentModelType( incoherent_model_type )
    simulation_properties.setNumberOfPhotonHashGridBins( 100 )

    # Set the number of histories to run and the number of rendezvous
    simulation_properties.setNumberOfHistories( num_particles )
    simulation_properties.setMinNumberOfRendezvous( 10 )



##---------------------------------------------------------------------------##
## Set up the materials
##---------------------------------------------------------------------------##

    # Load the database
    database = Data.ScatteringCenterPropertiesDatabase( db_path )

    # Extract the properties for H from the database
    atom_properties = database.getAtomProperties( Data.ZAID(1000) )

    # Set the definition for H for this simulation
    scattering_center_definitions = Collision.ScatteringCenterDefinitionDatabase()

    # Photon
    H_definition = scattering_center_definitions.createDefinition( "H", Data.ZAID(1000) )
    H_definition.setPhotoatomicDataProperties( atom_properties.getSharedPhotoatomicDataProperties( Data.PhotoatomicDataProperties.Native_EPR_FILE, 0 ) )

    # Electron
    H_properties = database.getAtomProperties( Data.H_ATOM )
    H_definition.setElectroatomicDataProperties(H_properties.getSharedElectroatomicDataProperties( Data.ElectroatomicDataProperties.Native_EPR_FILE, 0 ) )

    # Set the definition for material 1
    material_definitions = Collision.MaterialDefinitionDatabase()
    material_definitions.addDefinition( "H", 1, ["H"], [1.0] )

##---------------------------------------------------------------------------##
## Set up the geometry
##---------------------------------------------------------------------------##

    # Set the model properties before loading the model
    model_properties = DagMC.DagMCModelProperties( "cube.h5m" )
    model_properties.setMaterialPropertyName( "mat" )
    model_properties.setDensityPropertyName( "rho" )
    model_properties.setTerminationCellPropertyName( "termination.cell" )
    model_properties.setSurfaceFluxName( "surface.flux" )
    model_properties.setSurfaceCurrentName( "surface.current" )
    model_properties.useFastIdLookup()

    # Load the model
    model = DagMC.DagMCModel( model_properties )

    # Fill the model with the defined materials
    filled_model = Collision.FilledGeometryModel( db_path, scattering_center_definitions, material_definitions, simulation_properties, model, True )

##---------------------------------------------------------------------------##
## Set up the source
##---------------------------------------------------------------------------##

    ## Set up the source
    particle_distribution = ActiveRegion.StandardParticleDistribution( "isotropic mono-energetic dist" )

    particle_distribution.setEnergy( source_energy )
    particle_distribution.setPosition( 0.0, 0.0, 0.0 )
    particle_distribution.constructDimensionDistributionDependencyTree()

    # The generic distribution will be used to generate photons
    photon_distribution = ActiveRegion.StandardPhotonSourceComponent( 0, 1.0, model, particle_distribution )

    # Assign the photon source component to the source
    source = ActiveRegion.StandardParticleSource( [photon_distribution] )


##---------------------------------------------------------------------------##
## Set up the event handler
##---------------------------------------------------------------------------##

    # The model must be passed to the event handler so that the estimators
    # defined in the model can be constructed
    event_handler = Event.EventHandler( model, simulation_properties )

    # Set the energy and collision number bins in estimator 1
    event_handler.getEstimator( 1 ).setEnergyDiscretization(energy_bins )

    # Set the energy and collision number bins in estimator 2
    event_handler.getEstimator( 2 ).setEnergyDiscretization( energy_bins )

##---------------------------------------------------------------------------##
## Set up the simulation manager
##---------------------------------------------------------------------------##

    # The factory will use the simulation properties and the MPI session
    # properties to determine the appropriate simulation manager to construct
    factory = Manager.ParticleSimulationManagerFactory( filled_model,
                                                        source,
                                                        event_handler,
                                                        simulation_properties,
                                                        sim_name,
                                                        "xml",
                                                        threads )

    # Create the simulation manager
    manager = factory.getManager()

    # Allow logging on all procs
    session.restoreOutputStreams()

##---------------------------------------------------------------------------##
## Run the simulation
##---------------------------------------------------------------------------##

    if session.size() == 1:
        manager.runInterruptibleSimulation()
    else:
        manager.runSimulation()

