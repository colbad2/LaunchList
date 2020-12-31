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
      _ = getSampleLaunch().addToCoreData( context: viewContext )
      _ = getSampleAstronaut().addToCoreData( context: viewContext )

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
      container.loadPersistentStores( completionHandler:
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
      })

      // install the fixed content, if the db has never been filled
      if inMemory == false
      {
         let forceFill = false
         if getAgencyCount( context: container.viewContext ) == 0 || forceFill
         {
            // TODO shouldn't have to do this, but launches seemed to be duplicationg
            deleteAllData( entityName: "Agency", context: container.viewContext )
            deleteAllData( entityName: "Astronaut", context: container.viewContext )
            deleteAllData( entityName: "Launch", context: container.viewContext )
            deleteAllData( entityName: "Location", context: container.viewContext )
            deleteAllData( entityName: "Mission", context: container.viewContext )
            deleteAllData( entityName: "Pad", context: container.viewContext )
            deleteAllData( entityName: "Program", context: container.viewContext )
            deleteAllData( entityName: "Rocket", context: container.viewContext )
            deleteAllData( entityName: "ServiceProvider", context: container.viewContext )
            deleteAllData( entityName: "Status", context: container.viewContext )
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
   let agencies: AgenciesListJSON? = parseJSONFile( filename: "agencies" )
   for agency in agencies?.sublist ?? []
   {
      _ = fetchAgency( agency: agency, context: viewContext )
   }

   let launches: LaunchListJSON? = parseJSONFile( filename: "launches" )
   for launch in launches?.sublist ?? []
   {
      _ = fetchLaunch( launch: launch, context: viewContext )
   }

   let pads: PadListJSON? = parseJSONFile( filename: "pads" )
   for pad in pads?.sublist ?? []
   {
      _ = fetchPad( pad: pad, context: viewContext )
   }

   let astronauts: AstronautListJSON? = parseJSONFile( filename: "astronauts" )
   for astronaut in astronauts?.sublist ?? []
   {
      _ = fetchAstronaut( astronaut: astronaut, context: viewContext )
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
