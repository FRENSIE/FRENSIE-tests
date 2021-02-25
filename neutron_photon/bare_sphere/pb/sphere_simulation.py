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
def sphereSimulation( sim_name,
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
    simulation_properties.setParticleMode( MonteCarlo.NEUTRON_PHOTON_MODE )
    simulation_properties.setUnresolvedResonanceProbabilityTableModeOff()
    simulation_properties.setNumberOfNeutronHashGridBins( 100 )

    # Set the number of histories to run and the number of rendezvous
    simulation_properties.setNumberOfHistories( num_particles )
    simulation_properties.setMinNumberOfRendezvous( 10 )



##---------------------------------------------------------------------------##
## Set up the materials
##---------------------------------------------------------------------------##

    # Load the database
    database = Data.ScatteringCenterPropertiesDatabase( db_path )

    # Set the definition of H1 for this simulation
    scattering_center_definitions = Collision.ScatteringCenterDefinitionDatabase()

    # Extract the properties for H1 from the database
    nuclide_properties = database.getNuclideProperties( Data.ZAID(82204) )
    nuclide_definition = scattering_center_definitions.createDefinition( "Pb204", Data.ZAID(82204) )
    nuclide_definition.setNuclearDataProperties( nuclide_properties.getSharedNuclearDataProperties( Data.NuclearDataProperties.ACE_FILE, 8, 293.6 , False ) )

    nuclide_properties = database.getNuclideProperties( Data.ZAID(82206) )
    nuclide_definition = scattering_center_definitions.createDefinition( "Pb206", Data.ZAID(82206) )
    nuclide_definition.setNuclearDataProperties( nuclide_properties.getSharedNuclearDataProperties( Data.NuclearDataProperties.ACE_FILE, 8, 293.6 , False ) )


    nuclide_properties = database.getNuclideProperties( Data.ZAID(82207) )
    nuclide_definition = scattering_center_definitions.createDefinition( "Pb207", Data.ZAID(82207) )
    nuclide_definition.setNuclearDataProperties( nuclide_properties.getSharedNuclearDataProperties( Data.NuclearDataProperties.ACE_FILE, 8, 293.6 , False ) )

    nuclide_properties = database.getNuclideProperties( Data.ZAID(82208) )
    nuclide_definition = scattering_center_definitions.createDefinition( "Pb208", Data.ZAID(82208) )
    nuclide_definition.setNuclearDataProperties( nuclide_properties.getSharedNuclearDataProperties( Data.NuclearDataProperties.ACE_FILE, 8, 293.6 , False ) )


    material_definitions = Collision.MaterialDefinitionDatabase()
    material_definitions.addDefinition( "Pb_nat", 1 , ["Pb204","Pb206","Pb207","Pb208"], [0.014,0.241,0.221,0.524] )


##---------------------------------------------------------------------------##
## Set up the geometry
##---------------------------------------------------------------------------##

    # Set the model properties before loading the model
    model_properties = DagMC.DagMCModelProperties( "sphere.h5m" )
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

    # Define the generic particle distribution
    particle_distribution = ActiveRegion.StandardParticleDistribution( "source distribution" )

    particle_distribution.setEnergy(source_energy );
    particle_distribution.setPosition( 0.0, 0.0, 0.0 )
    particle_distribution.constructDimensionDistributionDependencyTree()

    # The generic distribution will be used to generate neutrons
    neutron_distribution = ActiveRegion.StandardNeutronSourceComponent( 0, 1.0, model, particle_distribution )

    # Assign the neutron source component to the source
    source = ActiveRegion.StandardParticleSource( [neutron_distribution] )


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

