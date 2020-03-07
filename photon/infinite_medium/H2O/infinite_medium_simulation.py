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
## Set up and run the forward simulation
def runForwardInfiniteMediumSimulation( sim_name,
                                        db_path,
                                        geom_name,
                                        num_particles,
                                        incoherent_model_type,
                                        source_energy,
                                        energy_bins,
                                        threads,
                                        log_file = None,
                                        use_native = False ):

    ## Initialize the MPI session
    session = MPI.GlobalMPISession( len(sys.argv), sys.argv )

    # Suppress logging on all procs except for the master (proc=0)
    Utility.removeAllLogs()
    session.initializeLogs( 0, True )

    if not log_file is None:
        session.initializeLogs( log_file, 0, True )

    ## Set the simulation properties
    simulation_properties = MonteCarlo.SimulationProperties()

    # Simulate photons only
    simulation_properties.setParticleMode( MonteCarlo.PHOTON_MODE )
    simulation_properties.setIncoherentModelType( incoherent_model_type )
    simulation_properties.setNumberOfPhotonHashGridBins( 100 )

    # Set the number of histories to run and the number of rendezvous
    simulation_properties.setNumberOfHistories( num_particles )
    simulation_properties.setMinNumberOfRendezvous( 10 )
    simulation_properties.setNumberOfSnapshotsPerBatch( 10 )

    ## Set up the materials
    database = Data.ScatteringCenterPropertiesDatabase( db_path )

    # Extract the properties for H and O from the database
    h_atom_properties = database.getAtomProperties( Data.ZAID(1000) )
    o_atom_properties = database.getAtomProperties( Data.ZAID(8000) )

    # Set the definition for H and O for this simulation
    scattering_center_definitions = Collision.ScatteringCenterDefinitionDatabase()
    h_atom_definition = scattering_center_definitions.createDefinition( "H", Data.ZAID(1000) )
    o_atom_definition = scattering_center_definitions.createDefinition( "O", Data.ZAID(8000) )

    if use_native:
        h_atom_definition.setPhotoatomicDataProperties( h_atom_properties.getSharedPhotoatomicDataProperties( Data.PhotoatomicDataProperties.Native_EPR_FILE, 0 ) )
        o_atom_definition.setPhotoatomicDataProperties( o_atom_properties.getSharedPhotoatomicDataProperties( Data.PhotoatomicDataProperties.Native_EPR_FILE, 0 ) )
    else:
        h_atom_definition.setPhotoatomicDataProperties( h_atom_properties.getSharedPhotoatomicDataProperties( Data.PhotoatomicDataProperties.ACE_EPR_FILE, 12 ) )
        o_atom_definition.setPhotoatomicDataProperties( o_atom_properties.getSharedPhotoatomicDataProperties( Data.PhotoatomicDataProperties.ACE_EPR_FILE, 12 ) )

    # Set the definition for material 1
    material_definitions = Collision.MaterialDefinitionDatabase()
    material_definitions.addDefinition( "Water", 1, ["H", "O"], [2.0, 1.0] )

    ## Set up the geometry
    model_properties = DagMC.DagMCModelProperties( geom_name )
    model_properties.setMaterialPropertyName( "mat" )
    model_properties.setDensityPropertyName( "rho" )
    model_properties.setTerminationCellPropertyName( "termination.cell" )
    model_properties.setSurfaceFluxName( "surface.flux" )
    model_properties.setSurfaceCurrentName( "surface.current" )
    model_properties.useFastIdLookup()

    # Load the model
    model = DagMC.DagMCModel( model_properties )

    # Fill the model with the defined material
    filled_model = Collision.FilledGeometryModel( db_path, scattering_center_definitions, material_definitions, simulation_properties, model, True )

    ## Set up the source
    particle_distribution = ActiveRegion.StandardParticleDistribution( "isotropic mono-energetic dist" )

    particle_distribution.setEnergy( source_energy )
    particle_distribution.setPosition( 0.0, 0.0, 0.0 )
    particle_distribution.constructDimensionDistributionDependencyTree()

    # The generic distribution will be used to generate photons
    photon_distribution = ActiveRegion.StandardPhotonSourceComponent( 0, 1.0, model, particle_distribution )

    # Assign the photon source component to the source
    source = ActiveRegion.StandardParticleSource( [photon_distribution] )

    ## Set up the event handler
    event_handler = Event.EventHandler( model, simulation_properties )

    # Create the surface flux estimator
    surface_flux_estimator = Event.WeightMultipliedSurfaceFluxEstimator( 1, 1.0, [1, 3, 6, 9, 12, 15, 18, 21, 24, 27], model )
    surface_flux_estimator.setEnergyDiscretization( energy_bins )
    surface_flux_estimator.setParticleTypes( [MonteCarlo.PHOTON] )
    surface_flux_estimator.setCosineCutoffValue( 0.1 )

    event_handler.addEstimator( surface_flux_estimator )

    ## Set up the simulation manager
    factory = Manager.ParticleSimulationManagerFactory( filled_model,
                                                        source,
                                                        event_handler,
                                                        simulation_properties,
                                                        sim_name,
                                                        "xml",
                                                        threads )

    # Create the simulation manager
    manager = factory.getManager()
    manager.useSingleRendezvousFile()

    # Allow logging on all procs
    session.restoreOutputStreams()

    ## Run the simulation
    if session.size() == 1:
        manager.runInterruptibleSimulation()
    else:
        manager.runSimulation()

##---------------------------------------------------------------------------##
## Set up and run the adjoint simulation
def runAdjointInfiniteMediumSimulation( sim_name,
                                        db_path,
                                        geom_name,
                                        num_particles,
                                        incoherent_model_type,
                                        energy_cutoff,
                                        source_energy,
                                        energy_bins,
                                        threads,
                                        log_file = None,
                                        col_bins = None,
                                        second_energy_bins = None,
                                        num_rendezvous = None ):

    ## Initialize the MPI session
    session = MPI.GlobalMPISession( len(sys.argv), sys.argv )

    # Suppress logging on all procs except for the master (proc=0)
    Utility.removeAllLogs()
    session.initializeLogs( 0, True )

    if not log_file is None:
        session.initializeLogs( log_file, 0, True )

    ## Set the simulation properties
    simulation_properties = MonteCarlo.SimulationProperties()

    # Simulate photons only
    simulation_properties.setParticleMode( MonteCarlo.ADJOINT_PHOTON_MODE )
    simulation_properties.setIncoherentAdjointModelType( incoherent_model_type )
    simulation_properties.setMinAdjointPhotonEnergy( energy_cutoff )
    
    if incoherent_model_type == MonteCarlo.DB_IMPULSE_INCOHERENT_ADJOINT_MODEL:
        simulation_properties.setMaxAdjointPhotonEnergy( source_energy*1.5 )
    else:
        simulation_properties.setMaxAdjointPhotonEnergy( source_energy )

    simulation_properties.setCriticalAdjointPhotonLineEnergies( [source_energy] )
    simulation_properties.setAdjointPhotonRouletteThresholdWeight( 0.0025 )
    simulation_properties.setAdjointPhotonRouletteSurvivalWeight(  0.005 )
    simulation_properties.setNumberOfAdjointPhotonHashGridBins( 100 )

    # Set the number of histories to run and the number of rendezvous
    simulation_properties.setNumberOfHistories( num_particles )

    if not num_rendezvous is None:
        simulation_properties.setMinNumberOfRendezvous( int(num_rendezvous) )
        simulation_properties.setNumberOfSnapshotsPerBatch( 1 )
    else:
        simulation_properties.setMinNumberOfRendezvous( 10 )
        simulation_properties.setNumberOfSnapshotsPerBatch( 10 )
    
    ## Set up the materials
    database = Data.ScatteringCenterPropertiesDatabase( db_path )

    # Extract the properties for H and O from the database
    h_atom_properties = database.getAtomProperties( Data.ZAID(1000) )
    o_atom_properties = database.getAtomProperties( Data.ZAID(8000) )
    
    # Extract the properties for H from the database
    scattering_center_definitions = Collision.ScatteringCenterDefinitionDatabase()
    h_atom_definition = scattering_center_definitions.createDefinition( "H", Data.ZAID(1000) )
    o_atom_definition = scattering_center_definitions.createDefinition( "O", Data.ZAID(8000) )

    h_atom_definition.setAdjointPhotoatomicDataProperties( h_atom_properties.getSharedAdjointPhotoatomicDataProperties( Data.AdjointPhotoatomicDataProperties.Native_EPR_FILE, 0 ) )
    o_atom_definition.setAdjointPhotoatomicDataProperties( o_atom_properties.getSharedAdjointPhotoatomicDataProperties( Data.AdjointPhotoatomicDataProperties.Native_EPR_FILE, 0 ) )
    
    # Set the definition for material 1
    material_definitions = Collision.MaterialDefinitionDatabase()
    material_definitions.addDefinition( "Water", 1, ["H", "O"], [2.0, 1.0] )

    ## Set up the geometry
    model_properties = DagMC.DagMCModelProperties( geom_name )
    model_properties.setMaterialPropertyName( "mat" )
    model_properties.setDensityPropertyName( "rho" )
    model_properties.setTerminationCellPropertyName( "termination.cell" )
    model_properties.setSurfaceFluxName( "surface.flux" )
    model_properties.setSurfaceCurrentName( "surface.current" )
    model_properties.useFastIdLookup()

    # Load the model
    model = DagMC.DagMCModel( model_properties )

    # Fill the model with the defined material
    filled_model = Collision.FilledGeometryModel( db_path, scattering_center_definitions, material_definitions, simulation_properties, model, True )

    ## Set up the source
    particle_distribution = ActiveRegion.StandardParticleDistribution( "isotropic mono-energetic dist" )

    uniform_energy = Distribution.UniformDistribution( energy_cutoff, source_energy )
    energy_dimension_dist = ActiveRegion.IndependentEnergyDimensionDistribution( uniform_energy )
    particle_distribution.setDimensionDistribution( energy_dimension_dist )
    particle_distribution.setPosition( 0.0, 0.0, 0.0 )
    particle_distribution.constructDimensionDistributionDependencyTree()

    # The generic distribution will be used to generate photons
    adjoint_photon_distribution = ActiveRegion.StandardAdjointPhotonSourceComponent( 0, 1.0, filled_model, particle_distribution )

    # Assign the photon source component to the source
    source = ActiveRegion.StandardParticleSource( [adjoint_photon_distribution] )

    ## Set up the event handler
    event_handler = Event.EventHandler( model, simulation_properties )

    # Create the estimator response function
    response_function = ActiveRegion.EnergyParticleResponseFunction( Distribution.DeltaDistribution( source_energy ) )
    response = ActiveRegion.StandardParticleResponse( response_function )

    # Create the surface flux estimator
    surface_flux_estimator = Event.WeightMultipliedSurfaceFluxEstimator( 1, (source_energy - energy_cutoff), [1, 3, 6, 9, 12, 15, 18, 21, 24, 27], model )
    surface_flux_estimator.setSourceEnergyDiscretization( energy_bins )

    if not col_bins is None:
        surface_flux_estimator.setCollisionNumberDiscretization( col_bins )
    
    surface_flux_estimator.setResponseFunctions( [response] )
    surface_flux_estimator.setParticleTypes( [MonteCarlo.ADJOINT_PHOTON] )
    surface_flux_estimator.setCosineCutoffValue( 0.1 )

    event_handler.addEstimator( surface_flux_estimator )

    # Create the second surface eflux estimator
    if not second_energy_bins is None:
        second_surface_flux_estimator = Event.WeightMultipliedSurfaceFluxEstimator( 2, (source_energy - energy_cutoff), [1, 3, 6, 9, 12, 15, 18, 21, 24, 27], model )
        second_surface_flux_estimator.setSourceEnergyDiscretization( second_energy_bins )

        second_surface_flux_estimator.setResponseFunctions( [response] )
        second_surface_flux_estimator.setParticleTypes( [MonteCarlo.ADJOINT_PHOTON] )
        second_surface_flux_estimator.setCosineCutoffValue( 0.1 )
        second_surface_flux_estimator.enableSnapshotsOnEntityBins()
        second_surface_flux_estimator.enableSampleMomentHistogramsOnEntityBins()

        event_handler.addEstimator( second_surface_flux_estimator )

    ## Set up the simulation manager
    factory = Manager.ParticleSimulationManagerFactory( filled_model,
                                                        source,
                                                        event_handler,
                                                        simulation_properties,
                                                        sim_name,
                                                        "xml",
                                                        threads )

    # Create the simulation manager
    manager = factory.getManager()
    manager.useSingleRendezvousFile()

    # Allow logging on all procs
    session.restoreOutputStreams()

    ## Run the simulation
    if session.size() == 1:
        manager.runInterruptibleSimulation()
    else:
        manager.runSimulation()

##---------------------------------------------------------------------------##
def restartInfiniteMediumSimulation( rendezvous_file_name,
                                     db_path,
                                     num_particles,
                                     threads,
                                     log_file = None,
                                     num_rendezvous = None ):

    ## Initialize the MPI session
    session = MPI.GlobalMPISession( len(sys.argv), sys.argv )

    # Suppress logging on all procs except for the master (proc=0)
    Utility.removeAllLogs()
    session.initializeLogs( 0, True )

    if not log_file is None:
        session.initializeLogs( log_file, 0, True )

    # Set the database path
    Collision.FilledGeometryModel.setDefaultDatabasePath( db_path )

    if not num_rendezvous is None:
        new_simulation_properties = MonteCarlo.SimulationGeneralProperties()
        new_simulation_properties.setNumberOfHistories( int(num_particles) )
        new_simulation_properties.setMinNumberOfRendezvous( int(num_rendezvous) )

        factory = Manager.ParticleSimulationManagerFactory( rendezvous_file_name,
                                                            new_simulation_properties,
                                                            threads )
    else:
        factory = Manger.ParticleSimulationManagerFactory( rendezvous_file_name,
                                                           int(num_particles),
                                                           threads )
    
    manager = factory.getManager()
    manager.useSingleRendezvousFile()

    manager.initialize()

    # Allow logging on all procs
    session.restoreOutputStreams()

    ## Run the simulation
    if session.size() == 1:
        manager.runInterruptibleSimulation()
    else:
        manager.runSimulation()

