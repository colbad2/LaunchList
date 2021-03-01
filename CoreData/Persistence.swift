// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 The Core Data datastore for the app.
 */
public struct PersistenceController
{
   /** Singleton access to the datastore. */
   public static let shared: PersistenceController = PersistenceController()

   /** Datastore for previews. */
   public static var preview: PersistenceController =
   {
      let result: PersistenceController = PersistenceController( inMemory: true )
      let viewContext: NSManagedObjectContext = result.container.viewContext

      // add single records to the store, so previews don't take too long to start
      _ = addToCoreData( json: getSampleAgency(), context: viewContext )
      _ = addToCoreData( json: getSampleProgram(), context: viewContext )
      _ = addToCoreData( json: getSampleProgram2(), context: viewContext )
      _ = addToCoreData( json: getSampleMission(), context: viewContext )
      _ = addToCoreData( json: getSamplePad(), context: viewContext )
      _ = addToCoreData( json: getSampleRocket(), context: viewContext )
      _ = addToCoreData( json: getSampleLaunch(), context: viewContext )
      _ = addToCoreData( json: getSampleAstronaut(), context: viewContext )
      _ = addToCoreData( json: getSampleAgency(), context: viewContext )
      _ = addToCoreData( json: getSampleSpaceStation(), context: viewContext )
      _ = addToCoreData( json: getSampleExpedition(), context: viewContext )
      _ = addToCoreData( json: getSampleLocation(), context: viewContext )
      _ = addToCoreData( json: getSampleLauncher(), context: viewContext )
      _ = addToCoreData( json: getSampleLiveStream(), context: viewContext )
      _ = addToCoreData( json: getSampleEvent(), context: viewContext )
      _ = addToCoreData( json: getSampleFlightVehicle(), context: viewContext )
      _ = addToCoreData( json: getSampleSpacecraft(), context: viewContext )
      _ = addToCoreData( json: getSampleSpacecraftConfig(), context: viewContext )

      return result
   }()

   /** Core Data persistent object container. */
   public let container: NSPersistentContainer

   /**
    Creates a datastore.

    - parameter inMemory: `Bool` if true, the datastore is memory-only
    */
   init( inMemory: Bool = false )
   {
      container = NSPersistentContainer( name: "LaunchList" )
      if inMemory
      {
         if let firstDescription: NSPersistentStoreDescription = container.persistentStoreDescriptions.first
         {
            firstDescription.url = URL( fileURLWithPath: "/dev/null" )
         }
      }

      container.loadPersistentStores
      {
         _, error in

         if let error: NSError = error as NSError?
         {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use
            // this function in a shipping application, although it may be useful during development.

            /*
            Typical reasons for an error here include:
            * The parent directory does not exist, cannot be created, or disallows writing.
            * The persistent store is not accessible, due to permissions or data protection when the device is locked.
            * The device is out of space.
            * The store could not be migrated to the current model version.
            Check the error message to determine what the actual problem was.
            */
            fatalError( "Unresolved error \(error), \(error.userInfo)" )
         }
      }

      // install the fixed content, if the db has never been filled
      if inMemory == false
      {
         let forceFill: Bool = false
         if getAgencyCount( context: container.viewContext ) == 0 || forceFill
         {
//            deleteAllData( entityName: AGENCY_ENTITY_NAME, context: container.viewContext )
//            deleteAllData( entityName: ASTRONAUT_ENTITY_NAME, context: container.viewContext )
//            deleteAllData( entityName: DOCKING_ENTITY_NAME, context: container.viewContext )
//            deleteAllData( entityName: EVENT_ENTITY_NAME, context: container.viewContext )
//            deleteAllData( entityName: EXPEDITION_ENTITY_NAME, context: container.viewContext )
//            deleteAllData( entityName: FLIGHT_VEHICLE_ENTITY_NAME, context: container.viewContext )
//            deleteAllData( entityName: LAUNCH_ENTITY_NAME, context: container.viewContext )
//            deleteAllData( entityName: LAUNCHER_CONFIG_ENTITY_NAME, context: container.viewContext )
//            deleteAllData( entityName: LIVE_STREAM_CONFIG_ENTITY_NAME, context: container.viewContext )
//            deleteAllData( entityName: LOCATION_ENTITY_NAME, context: container.viewContext )
//            deleteAllData( entityName: MISSION_ENTITY_NAME, context: container.viewContext )
//            deleteAllData( entityName: PAD_ENTITY_NAME, context: container.viewContext )
//            deleteAllData( entityName: PROGRAM_ENTITY_NAME, context: container.viewContext )
//            deleteAllData( entityName: ROCKET_ENTITY_NAME, context: container.viewContext )
//            deleteAllData( entityName: SERVICE_PROVIDER_ENTITY_NAME, context: container.viewContext )
//            deleteAllData( entityName: SPACECRAFT_ENTITY_NAME, context: container.viewContext )
//            deleteAllData( entityName: SPACECRAFT_CONFIG_ENTITY_NAME, context: container.viewContext )
//            deleteAllData( entityName: SPACESTATION_ENTITY_NAME, context: container.viewContext )
//            deleteAllData( entityName: VEHICLE_ENTITY_NAME, context: container.viewContext )
            fillStore( viewContext: container.viewContext )
         }
      }
   }
}

/**
 Load entities from the agencies.json file

 - parameter context: `NSManagedObjectContext` Core Data context to store/update the entities in
 */
public func loadAgencies( context: NSManagedObjectContext )
{
   print( "loading agencies.json" )
   let agencies: AgenciesListJSON? = parseJSONFile( filename: "agencies" )
   print( "parsing agencies.json" )
   for agency in agencies?.sublist ?? []
   {
      if agency.name == "Unknown" { continue } // DATABASE CHANGE
      _ = fetchAgency( agency: agency, context: context )
   }
   print( "done agencies.json" )
}

/**
 Load entities from the launches.json file

 - parameter context: `NSManagedObjectContext` Core Data context to store/update the entities in
 */
public func loadLaunches( context: NSManagedObjectContext )
{
   print( "loading launches.json" )
   let launches: LaunchListJSON? = parseJSONFile( filename: "launches" )
   print( "parsing launches.json" )
   for launch in launches?.sublist ?? []
   {
      _ = fetchLaunch( launch: launch, context: context )
   }
   print( "done launches.json" )
}

/**
 Load entities from the pads.json file

 - parameter context: `NSManagedObjectContext` Core Data context to store/update the entities in
 */
public func loadPads( context: NSManagedObjectContext )
{
   print( "loading pads.json" )
   let pads: PadListJSON? = parseJSONFile( filename: "pads" )
   print( "parsing pads.json" )
   for pad in pads?.sublist ?? []
   {
      _ = fetchPad( pad: pad, context: context )
   }
   print( "done pads.json" )
}

/**
 Load entities from the astronauts.json file

 - parameter context: `NSManagedObjectContext` Core Data context to store/update the entities in
 */
func loadAstronauts( context: NSManagedObjectContext )
{
   print( "loading astronauts.json" )
   let astronauts: AstronautListJSON? = parseJSONFile( filename: "astronauts" )
   print( "parsing astronauts.json" )
   for astronaut in astronauts?.sublist ?? []
   {
      _ = fetchAstronaut( astronaut: astronaut, context: context )
   }
   print( "done astronauts.json" )
}

/**
 Load entities from the starshipTests.json file

 - parameter context: `NSManagedObjectContext` Core Data context to store/update the entities in
 */
func loadStarshipTests( context: NSManagedObjectContext )
{
   print( "loading starshipTests.json" )
   let starshipData: StarshipListJSON? = parseJSONFile( filename: "starshipTests" )
   print( "parsing upcoming events" )
   for event in starshipData?.upcoming?.events ?? []
   {
      _ = fetchEvent( event: event, context: context )
   }
   print( "parsing upcominglaunches" )
   for launch in starshipData?.upcoming?.launches ?? []
   {
      _ = fetchLaunch( launch: launch, context: context )
   }
   print( "parsing previous events" )
   for event in starshipData?.previous?.events ?? []
   {
      _ = fetchEvent( event: event, context: context )
   }
   print( "parsing previous launches" )
   for launch in starshipData?.previous?.launches ?? []
   {
      _ = fetchLaunch( launch: launch, context: context )
   }
   print( "parsing live streams" )
   for liveStream in starshipData?.liveStreams ?? []
   {
      _ = fetchLiveStream( liveStream: liveStream, context: context )
   }
   // Not used
//   for roadClosure in starshipData?.roadClosures ?? []
//   {
//      _ = fetchRoadClosure( roadClosure: roadClosure, context: context )
//   }
//   for notice in starshipData?.notices ?? []
//   {
//      _ = fetchNotice( notice: notice, context: context )
//   }
   print( "parsing vehicles" )
   for rocket in starshipData?.vehicles ?? []
   {
      _ = fetchLauncher( launcher: rocket, context: context )
   }
   print( "done starshipTests.json" )
}

/**
 Load entities from the docking.json file

 - parameter context: `NSManagedObjectContext` Core Data context to store/update the entities in
 */
func loadDockings( context: NSManagedObjectContext )
{
   print( "loading docking.json" )
   let dockingList: DockingListJSON? = parseJSONFile( filename: "docking" )
   print( "parsing dockings" )
   for docking in dockingList?.sublist ?? []
   {
      _ = fetchDocking( docking: docking, context: context )
   }
   print( "done docking.json" )
}

/**
 Load entities from the events.json file

 - parameter context: `NSManagedObjectContext` Core Data context to store/update the entities in
 */
func loadEvents( context: NSManagedObjectContext )
{
   print( "loading events.json" )
   let eventList: EventListJSON? = parseJSONFile( filename: "events" )
   print( "parsing events" )
   for event in eventList?.sublist ?? []
   {
      _ = fetchEvent( event: event, context: context )
   }
   print( "done events.json" )
}

/**
 Load entities from the expeditions.json file

 - parameter context: `NSManagedObjectContext` Core Data context to store/update the entities in
 */
func loadExpeditions( context: NSManagedObjectContext )
{
   print( "loading expeditions.json" )
   let expeditionList: ExpeditionListJSON? = parseJSONFile( filename: "expeditions" )
   print( "parsing expeditions" )
   for expedition in expeditionList?.sublist ?? []
   {
      _ = fetchExpedition( expedition: expedition, context: context )
   }
   print( "done expeditions.json" )
}

/**
 Load entities from the launchers.json file

 - parameter context: `NSManagedObjectContext`  Core Data context to store/update the entities in
 */
func loadLaunchers( context: NSManagedObjectContext )
{
   print( "loading launchers.json" )
   let launchersList: LauncherListJSON? = parseJSONFile( filename: "launchers" )
   print( "parsing launchers" )
   for launcher in launchersList?.sublist ?? []
   {
      _ = fetchLauncher( launcher: launcher, context: context )
   }
   print( "done launchers.json" )
}

/**
 Load entities from the locations.json file

 - parameter context: `NSManagedObjectContext` Core Data context to store/update the entities in
 */
func loadLocations( context: NSManagedObjectContext )
{
   print( "loading locations.json" )
   let locationList: LocationListJSON? = parseJSONFile( filename: "locations" )
   print( "parsing locations" )
   for location in locationList?.sublist ?? []
   {
      _ = fetchLocation( location: location, context: context )
   }
   print( "done locations.json" )
}

/**
 Load entities from the programs.json file

 - parameter context: `NSManagedObjectContext` Core Data context to store/update the entities in
 */
func loadPrograms( context: NSManagedObjectContext )
{
   print( "loading programs.json" )
   let programList: ProgramListJSON? = parseJSONFile( filename: "programs" )
   print( "parsing programs" )
   for program in programList?.sublist ?? []
   {
      _ = fetchProgram( program: program, context: context )
   }
   print( "done programs.json" )
}

/**
 Adds the app's stored data to Core Data.

 - parameter viewContext: `NSManagedObjectContext` the Core Data context to add the entities to
 */
func fillStore( viewContext: NSManagedObjectContext )
{
   loadAgencies( context: viewContext )
   loadLaunches( context: viewContext )
   loadPads( context: viewContext )
   loadAstronauts( context: viewContext )
   loadStarshipTests( context: viewContext )
   loadDockings( context: viewContext )
   loadEvents( context: viewContext )
   loadExpeditions( context: viewContext )
   loadLaunchers( context: viewContext )
   loadLocations( context: viewContext )
   loadPrograms( context: viewContext )

   saveContext( viewContext )
}
