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
def snmSimulation( sim_name,
                      db_path,
                      num_particles,
                      source_energy,
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
    simulation_properties.setParticleMode( MonteCarlo.NEUTRON_MODE )
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
    scattering_center_definitions = Collision.ScatteringCenterDefinitionDatabase()
    material_definitions = Collision.MaterialDefinitionDatabase()

    # Material 1 - Air, done with atom fractions
    nuclide_properties = database.getNuclideProperties( Data.ZAID(6000) )
    nuclide_definition = scattering_center_definitions.createDefinition( "C", Data.ZAID(6000) )
    nuclide_definition.setNuclearDataProperties( nuclide_properties.getSharedNuclearDataProperties( Data.NuclearDataProperties.ACE_FILE, 8, 293.6 , False ) )

    nuclide_properties = database.getNuclideProperties( Data.ZAID(7014) )
    nuclide_definition = scattering_center_definitions.createDefinition( "N14", Data.ZAID(7014) )
    nuclide_definition.setNuclearDataProperties( nuclide_properties.getSharedNuclearDataProperties( Data.NuclearDataProperties.ACE_FILE, 8, 293.6 , False ) )

    nuclide_properties = database.getNuclideProperties( Data.ZAID(8016) )
    nuclide_definition = scattering_center_definitions.createDefinition( "O16", Data.ZAID(8016) )
    nuclide_definition.setNuclearDataProperties( nuclide_properties.getSharedNuclearDataProperties( Data.NuclearDataProperties.ACE_FILE, 8, 293.6 , False ) )

    nuclide_properties = database.getNuclideProperties( Data.ZAID(18040) )
    nuclide_definition = scattering_center_definitions.createDefinition( "Ar", Data.ZAID(18040) )
    nuclide_definition.setNuclearDataProperties( nuclide_properties.getSharedNuclearDataProperties( Data.NuclearDataProperties.ACE_FILE, 8, 293.6 , False ) )

    material_definitions.addDefinition( "Air", 1 , ["C","N14","O16","Ar"], [0.000150,0.784431,0.210748,0.004671] )

    # Material 2 - Stainless Steel 304 (SS304) done with atom fractions, reuse carbon definition from above
    nuclide_properties = database.getNuclideProperties( Data.ZAID(14028) )
    nuclide_definition = scattering_center_definitions.createDefinition( "Si", Data.ZAID(14028) )
    nuclide_definition.setNuclearDataProperties( nuclide_properties.getSharedNuclearDataProperties( Data.NuclearDataProperties.ACE_FILE, 8, 293.6 , False ) )

    nuclide_properties = database.getNuclideProperties( Data.ZAID(15031) )
    nuclide_definition = scattering_center_definitions.createDefinition( "P", Data.ZAID(15031) )
    nuclide_definition.setNuclearDataProperties( nuclide_properties.getSharedNuclearDataProperties( Data.NuclearDataProperties.ACE_FILE, 8, 293.6 , False ) )

    nuclide_properties = database.getNuclideProperties( Data.ZAID(16032) )
    nuclide_definition = scattering_center_definitions.createDefinition( "S", Data.ZAID(16032) )
    nuclide_definition.setNuclearDataProperties( nuclide_properties.getSharedNuclearDataProperties( Data.NuclearDataProperties.ACE_FILE, 8, 293.6 , False ) )

    nuclide_properties = database.getNuclideProperties( Data.ZAID(24052) )
    nuclide_definition = scattering_center_definitions.createDefinition( "Cr", Data.ZAID(24052) )
    nuclide_definition.setNuclearDataProperties( nuclide_properties.getSharedNuclearDataProperties( Data.NuclearDataProperties.ACE_FILE, 8, 293.6 , False ) )

    nuclide_properties = database.getNuclideProperties( Data.ZAID(25055) )
    nuclide_definition = scattering_center_definitions.createDefinition( "Mn", Data.ZAID(25055) )
    nuclide_definition.setNuclearDataProperties( nuclide_properties.getSharedNuclearDataProperties( Data.NuclearDataProperties.ACE_FILE, 8, 293.6 , False ) )

    nuclide_properties = database.getNuclideProperties( Data.ZAID(26056) )
    nuclide_definition = scattering_center_definitions.createDefinition( "Fe", Data.ZAID(26056) )
    nuclide_definition.setNuclearDataProperties( nuclide_properties.getSharedNuclearDataProperties( Data.NuclearDataProperties.ACE_FILE, 8, 293.6 , False ) )

    nuclide_properties = database.getNuclideProperties( Data.ZAID(28058) )
    nuclide_definition = scattering_center_definitions.createDefinition( "Ni", Data.ZAID(28058) )
    nuclide_definition.setNuclearDataProperties( nuclide_properties.getSharedNuclearDataProperties( Data.NuclearDataProperties.ACE_FILE, 8, 293.6 , False ) )

    material_definitions.addDefinition( "SS304", 2 , ["C","Si","P","S","Cr","Mn","Fe","Ni"], [0.001830,0.009781,0.000408,0.000257,0.200762,0.010001,0.690375,0.086587] )

    # Material 3 - HEU 
    nuclide_properties = database.getNuclideProperties( Data.ZAID(92235) )
    nuclide_definition = scattering_center_definitions.createDefinition( "U235", Data.ZAID(92235) )
    nuclide_definition.setNuclearDataProperties( nuclide_properties.getSharedNuclearDataProperties( Data.NuclearDataProperties.ACE_FILE, 8, 293.6 , False ) )

    material_definitions.addDefinition( "U235", 3 , ["U235"], [1.0] )
    
    
##---------------------------------------------------------------------------##
## Set up the geometry
##---------------------------------------------------------------------------##

    # Set the model properties before loading the model
    model_properties = DagMC.DagMCModelProperties( "snm.h5m" )
    model_properties.setMaterialPropertyName( "mat" )
    model_properties.setDensityPropertyName( "rho" )
    model_properties.setTerminationCellPropertyName( "termination.cell" )
    model_properties.setCellTrackLengthFluxName( "cell.tl.flux" )
    model_properties.useFastIdLookup()
    
    # Load the model
    model = DagMC.DagMCModel( model_properties )
    
    # Fill the model with the defined materials
    filled_model = Collision.FilledGeometryModel( db_path, scattering_center_definitions, material_definitions, simulation_properties, model, True )
    
##---------------------------------------------------------------------------##
## Set up the source
##---------------------------------------------------------------------------##
    # Define the generic particle distribution 1
    particle_distribution_1 = ActiveRegion.StandardParticleDistribution( "source distribution 1" ) # purpose of this line, other strings?
    
    # source that varies in y direction
    particle_distribution_1.setEnergy( source_energy )
    particle_distribution_1.setPosition( -55, -27, -40 )
    raw_spatial_component_distribution = Distribution.UniformDistribution( -27, 40 , 1.0 )
    spatial_component_distribution = ActiveRegion.IndependentSecondarySpatialDimensionDistribution( raw_spatial_component_distribution )

    # create time distribution
    raw_time_component_distribution = Distribution.UniformDistribution( 0, 0.1, 1.0 )
    time_component_distribution = ActiveRegion.IndependentTimeDimensionDistribution( raw_time_component_distribution )

    # apply space and time distributions to distribution 1
    particle_distribution_1.setDimensionDistribution( spatial_component_distribution )
    particle_distribution_1.setDimensionDistribution( time_component_distribution )

    # create dependency tree
    particle_distribution_1.constructDimensionDistributionDependencyTree()

    # Define the generic particle distribution 2
    particle_distribution_2 = ActiveRegion.StandardParticleDistribution( "source distribution 2"  ) # purpose of this line, other strings?

    # source that varies in z direction
    particle_distribution_2.setEnergy( source_energy )
    particle_distribution_2.setPosition( -55, -40, -27 )
    raw_spatial_component_distribution = Distribution.UniformDistribution( -27, 40 , 1.0 )
    spatial_component_distribution = ActiveRegion.IndependentTertiarySpatialDimensionDistribution( raw_spatial_component_distribution )

    # apply space and time distributions to distribution 2
    particle_distribution_2.setDimensionDistribution( spatial_component_distribution )
    particle_distribution_2.setDimensionDistribution( time_component_distribution ) # Note that the time distribution is reused

    # create dependency tree
    particle_distribution_2.constructDimensionDistributionDependencyTree()

    # The generic distribution will be used to generate neutrons
    #            The first argument is the source id - this needs to be unique 
    #            The second argument is the selection weight. For a volume
    #            source this is usually the volume of the source region. For
    #            a surface source this is usually the surface areaa and for
    #            a line source this is the length of the line. In your case
    #            the lines have equal length so using a value of 1.0 is
    #            equivalent (the weights are converted to a discrete CDF for
    #            sampling the source that will be used to generate a particle.)
    neutron_distribution_1 = ActiveRegion.StandardNeutronSourceComponent( 0, 1.0, model, particle_distribution_1 )
    neutron_distribution_2 = ActiveRegion.StandardNeutronSourceComponent( 1, 1.0, model, particle_distribution_2 )

     # Assign the neutron source component to the source
    source = ActiveRegion.StandardParticleSource( [neutron_distribution_1,neutron_distribution_2] )
    
##---------------------------------------------------------------------------##
## Set up the event handler
##---------------------------------------------------------------------------##
    
    # The model must be passed to the event handler so that the estimators
    # defined in the model can be constructed
    event_handler = Event.EventHandler( model, simulation_properties )
    
    # Set Time Bins for Estimators
    event_handler.getEstimator( 1 ).setTimeDiscretization( [0 , 0.1 , 0.12 , 0.14 , 0.16 , 0.18 , 0.2] )
    event_handler.getEstimator( 2 ).setTimeDiscretization( [0 , 0.1 , 0.12 , 0.14 , 0.16 , 0.18 , 0.2] )
    event_handler.getEstimator( 3 ).setTimeDiscretization( [0 , 0.1 , 0.12 , 0.14 , 0.16 , 0.18 , 0.2] )
    event_handler.getEstimator( 4 ).setTimeDiscretization( [0 , 0.1 , 0.12 , 0.14 , 0.16 , 0.18 , 0.2] )
    event_handler.getEstimator( 5 ).setTimeDiscretization( [0 , 0.1 , 0.12 , 0.14 , 0.16 , 0.18 , 0.2] )
    
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

