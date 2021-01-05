import CoreData

/**
 The Core Data datastore fo rthe app.
 */
struct PersistenceController
{
   /** Singleton access to the datastore. */
   static let shared = PersistenceController()

   /** Datastore for previews. */
   static var preview: PersistenceController =
   {
      let result = PersistenceController( inMemory: true )
      let viewContext = result.container.viewContext

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
      // TODO all other types
      // TODO should samples return optionals or not

      return result
   }()

   /** TODO */
   let container: NSPersistentContainer

   /**
    Creates a datastore.

    - Parameter inMemory: if true, the datastore is memory-only
    */
   init( inMemory: Bool = false )
   {
      container = NSPersistentContainer( name: "LaunchList" )
      if inMemory
      {
         container.persistentStoreDescriptions.first!.url = URL( fileURLWithPath: "/dev/null" )
      }
      container.loadPersistentStores
      {
         ( storeDescription, error ) in

         if let error = error as NSError?
         {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

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
         let forceFill = false
         if getAgencyCount( context: container.viewContext ) == 0 || forceFill
         {
            // TODO shouldn't have to do this, but launches seemed to be duplicating
            deleteAllData( entityName: "Agency", context: container.viewContext )
            deleteAllData( entityName: "Astronaut", context: container.viewContext )
            deleteAllData( entityName: "Docking", context: container.viewContext )
            deleteAllData( entityName: "DockingLocation", context: container.viewContext )
            deleteAllData( entityName: "Event", context: container.viewContext )
            deleteAllData( entityName: "Expedition", context: container.viewContext )
            deleteAllData( entityName: "FlightVehicle", context: container.viewContext )
            deleteAllData( entityName: "Launch", context: container.viewContext )
            deleteAllData( entityName: "LauncherConfig", context: container.viewContext )
            deleteAllData( entityName: "LiveStream", context: container.viewContext )
            deleteAllData( entityName: "Location", context: container.viewContext )
            deleteAllData( entityName: "Mission", context: container.viewContext )
            deleteAllData( entityName: "Pad", context: container.viewContext )
            deleteAllData( entityName: "Program", context: container.viewContext )
            deleteAllData( entityName: "Rocket", context: container.viewContext )
            deleteAllData( entityName: "ServiceProvider", context: container.viewContext )
            deleteAllData( entityName: "Spacecraft", context: container.viewContext )
            deleteAllData( entityName: "SpacecraftConfig", context: container.viewContext )
            deleteAllData( entityName: "SpaceStation", context: container.viewContext )
            deleteAllData( entityName: "Status", context: container.viewContext )
            deleteAllData( entityName: "Vehicle", context: container.viewContext )
            fillStore( viewContext: container.viewContext )
         }
      }
   }
}

/**
 Adds the app's stored data to Core Data.

 - Parameter viewContext: the Core Data context to add the data to
 */
func fillStore( viewContext: NSManagedObjectContext )
{
   // agencies.json
   let agencies: AgenciesListJSON? = parseJSONFile( filename: "agencies" )
   for agency in agencies?.sublist ?? []
   {
      _ = fetchAgency( agency: agency, context: viewContext )
   }

   // launches.json
   let launches: LaunchListJSON? = parseJSONFile( filename: "launches" )
   for launch in launches?.sublist ?? []
   {
      _ = fetchLaunch( launch: launch, context: viewContext )
   }

   // pads.json
   let pads: PadListJSON? = parseJSONFile( filename: "pads" )
   for pad in pads?.sublist ?? []
   {
      _ = fetchPad( pad: pad, context: viewContext )
   }

   // astronauts.json
   let astronauts: AstronautListJSON? = parseJSONFile( filename: "astronauts" )
   for astronaut in astronauts?.sublist ?? []
   {
      _ = fetchAstronaut( astronaut: astronaut, context: viewContext )
   }

   // startshipTests.json
   let starshipData: StarshipListJSON? = parseJSONFile( filename: "starshipTests" )
   for event in starshipData?.upcoming?.events ?? []
   {
      _ = fetchEvent( event: event, context: viewContext )
   }
   for launch in starshipData?.upcoming?.launches ?? []
   {
      _ = fetchLaunch( launch: launch, context: viewContext )
   }
   for event in starshipData?.previous?.events ?? []
   {
      _ = fetchEvent( event: event, context: viewContext )
   }
   for launch in starshipData?.previous?.launches ?? []
   {
      _ = fetchLaunch( launch: launch, context: viewContext )
   }
   for liveStream in starshipData?.liveStreams ?? []
   {
      _ = fetchLiveStream( liveStream: liveStream, context: viewContext )
   }
   // TODO
//   for roadClosure in starshipData?.roadClosures ?? []
//   {
//      _ = fetchRoadClosure( roadClosure: roadClosure, context: viewContext )
//   }
//   for notice in starshipData?.notices ?? []
//   {
//      _ = fetchNotice( notice: notice, context: viewContext )
//   }
   for vehicle in starshipData?.vehicles ?? []
   {
      _ = fetchVehicle( vehicle: vehicle, context: viewContext )
   }

   // docking.json
   let dockingList: DockingListJSON? = parseJSONFile( filename: "docking" )
   for docking in dockingList?.sublist ?? []
   {
      _ = fetchDocking( docking: docking, context: viewContext )
   }

   // events.json
   let eventList: EventListJSON? = parseJSONFile( filename: "events" )
   for event in eventList?.sublist ?? []
   {
      _ = fetchEvent( event: event, context: viewContext )
   }

   // expeditions.json
   let expeditionList: ExpeditionListJSON? = parseJSONFile( filename: "expeditions" )
   for expedition in expeditionList?.sublist ?? []
   {
      _ = fetchExpedition( expedition: expedition, context: viewContext )
   }

   // launchers.json
   let launchersList: LauncherListJSON? = parseJSONFile( filename: "launchers" )
   for launcher in launchersList?.sublist ?? []
   {
      _ = fetchLauncher( launcher: launcher, context: viewContext )
   }

   // locations.json
   let locationList: LocationListJSON? = parseJSONFile( filename: "locations" )
   for location in locationList?.sublist ?? []
   {
      _ = fetchLocation( location: location, context: viewContext )
   }

   // programs.json
   let programList: ProgramListJSON? = parseJSONFile( filename: "programs" )
   for program in programList?.sublist ?? []
   {
      _ = fetchProgram( program: program, context: viewContext )
   }

   saveContext( viewContext )
}

/**
 Reads the JSON in a bundle file, and returns it as [Data]

 - Parameter name: name of the nundle file to load
 - Returns: content of the bundle file
 */
func readBundleJSONFile( forName name: String ) -> Data?
{
   do
   {
      if let bundlePath = Bundle.main.path( forResource: name, ofType: "json" ),
         let jsonData = try String( contentsOfFile: bundlePath ).data( using: .utf8 )
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
