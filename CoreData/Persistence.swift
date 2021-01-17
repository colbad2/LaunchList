// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 The Core Data datastore fo rthe app.
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
      _ = getSampleAgency()?.addToCoreData( context: viewContext )
      _ = getSampleProgram()?.addToCoreData( context: viewContext )
      _ = getSampleMission()?.addToCoreData( context: viewContext )
      _ = getSamplePad()?.addToCoreData( context: viewContext )
      _ = getSampleRocket()?.addToCoreData( context: viewContext )
      _ = getSampleLaunch()?.addToCoreData( context: viewContext )
      _ = getSampleAstronaut()?.addToCoreData( context: viewContext )
      _ = getSampleServiceProvider()?.addToCoreData( context: viewContext )
      _ = getSampleDocking()?.addToCoreData( context: viewContext )
      _ = getSampleVehicle()?.addToCoreData( context: viewContext )
      _ = getSampleSpaceStation()?.addToCoreData( context: viewContext )
      _ = getSampleExpedition()?.addToCoreData( context: viewContext )
      _ = getSampleLocation()?.addToCoreData( context: viewContext )
      _ = getSampleLauncher()?.addToCoreData( context: viewContext )
      _ = getSampleLiveStream()?.addToCoreData( context: viewContext )
      _ = getSampleEvent()?.addToCoreData( context: viewContext )
      _ = getSampleFlightVehicle()?.addToCoreData( context: viewContext )
      _ = getSampleSpacecraft()?.addToCoreData( context: viewContext )
      _ = getSampleSpacecraftConfig()?.addToCoreData( context: viewContext )

      return result
   }()

   /** TODO */
   public let container: NSPersistentContainer

   /**
    Creates a datastore.

    - parameter inMemory: if true, the datastore is memory-only
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
//            deleteAllData( entityName: "Agency", context: container.viewContext )
//            deleteAllData( entityName: "Astronaut", context: container.viewContext )
//            deleteAllData( entityName: "Docking", context: container.viewContext )
//            deleteAllData( entityName: "Event", context: container.viewContext )
//            deleteAllData( entityName: "Expedition", context: container.viewContext )
//            deleteAllData( entityName: "FlightVehicle", context: container.viewContext )
//            deleteAllData( entityName: "Launch", context: container.viewContext )
//            deleteAllData( entityName: "LauncherConfig", context: container.viewContext )
//            deleteAllData( entityName: "LiveStream", context: container.viewContext )
//            deleteAllData( entityName: "Location", context: container.viewContext )
//            deleteAllData( entityName: "Mission", context: container.viewContext )
//            deleteAllData( entityName: "Pad", context: container.viewContext )
//            deleteAllData( entityName: "Program", context: container.viewContext )
//            deleteAllData( entityName: "Rocket", context: container.viewContext )
//            deleteAllData( entityName: "ServiceProvider", context: container.viewContext )
//            deleteAllData( entityName: "Spacecraft", context: container.viewContext )
//            deleteAllData( entityName: "SpacecraftConfig", context: container.viewContext )
//            deleteAllData( entityName: "SpaceStation", context: container.viewContext )
//            deleteAllData( entityName: "Vehicle", context: container.viewContext )
            fillStore( viewContext: container.viewContext )
         }
      }
   }
}

/**
 Load entities from the agencies.json file

 - parameter context: Core Data context to store/update the entities in
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

 - parameter context: Core Data context to store/update the entities in
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

 - parameter context: Core Data context to store/update the entities in
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

 - parameter context: Core Data context to store/update the entities in
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

 - parameter context: Core Data context to store/update the entities in
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
   for vehicle in starshipData?.vehicles ?? []
   {
      _ = fetchVehicle( vehicle: vehicle, context: context )
   }
   print( "done starshipTests.json" )
}

/**
 Load entities from the docking.json file

 - parameter context: Core Data context to store/update the entities in
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

 - parameter context: Core Data context to store/update the entities in
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

 - parameter context: Core Data context to store/update the entities in
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

 - parameter context: Core Data context to store/update the entities in
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

 - parameter context: Core Data context to store/update the entities in
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

 - parameter context: Core Data context to store/update the entities in
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

 - parameter viewContext: the Core Data context to add the entities to
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

/**
 Reads the JSON in a bundle file, and returns it as [Data]

 - parameter name: name of the bundle file to load
 - returns: content of the bundle file, if it could be loaded, nil otherwise
 */
func readBundleJSONFile( forName name: String ) -> Data?
{
   do
   {
      if let bundlePath: String = Bundle.main.path( forResource: name, ofType: "json" ),
         let jsonData: Data = try String( contentsOfFile: bundlePath ).data( using: .utf8 )
      {
         return jsonData
      }
   }
   catch
   {
      print( error )
   }

   return nil
}
