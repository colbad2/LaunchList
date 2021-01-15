import CoreData

/**
 Saves the Core Data context, without having to handle any errors.

 - Parameter context: the Core Data context to save
 */
func saveContext( _ context: NSManagedObjectContext )
{
   do
   {
      if context.hasChanges
      {
         try context.save()
      }
   }
   catch
   {
      // Replace this implementation with code to handle the error appropriately.
      // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
      let nsError = error as NSError
      fatalError( "Unresolved error \(nsError), \(nsError.userInfo)" )
   }
}

/**
 Gets an entity of the given name and int ID.

 - Parameter id: ID of the entity to fetch
 - Parameter context: Core Data context to get the entity from
 - Parameter entityName: type of the entity type to fetch
 - Returns: the first entity with the given parameters, or nil otherwise
 */
func getEntityByID( id: Int64, context: NSManagedObjectContext, entityName: String ) -> Any?
{
   do
   {
      let request = NSFetchRequest<NSFetchRequestResult>( entityName: entityName )
      request.predicate = NSPredicate( format: "id == %d", id )
      let entities: [Any] = try context.fetch( request )
      if entities.count > 0 { return entities.first }
   }
   catch
   {
      let nsError = error as NSError
      fatalError( "Failed to fetch entity \(entityName) with ID \(id): \(error), \(nsError.userInfo)" )
   }

   return nil
}

/**
 Gets the entity of the given type and string ID.

 Needed to ID live streams.

 - Parameter id: ID of the entity to fetch
 - Parameter context: Core Data context to fetch the entity from
 - Parameter entityName- type of the entity to fetch
 - Returns: first entity with the given parameters, nil otherwise
 */
func getEntityByID( id: String, context: NSManagedObjectContext, entityName: String ) -> Any?
{
   do
   {
      let request = NSFetchRequest<NSFetchRequestResult>( entityName: entityName )
      request.predicate = NSPredicate( format: "id == %@", id )
      let entities: [Any] = try context.fetch( request )
      if entities.count > 0 { return entities.first }
   }
   catch
   {
      let nsError = error as NSError
      fatalError( "Failed to fetch entity \(entityName) with ID \(id): \(error), \(nsError.userInfo)" )
   }

   return nil
}


/**
 Gets the first entity of the given type from Core Data.

 Used to get a random record for previews

 TODO remove, use fixed records for previews

 - Parameter context: Core Data context to get the entity from
 - Parameter entityName: type of the entity type to fetch
 - Returns: the first entity with the given parameters, or nil otherwise
 */
func getFirstEntity( context: NSManagedObjectContext, entityName: String ) -> Any?
{
   do
   {
      let request = NSFetchRequest<NSFetchRequestResult>( entityName: entityName )
      return try context.fetch( request ).first
   }
   catch
   {
      let nsError = error as NSError
      fatalError( "Failed to fetch first entity \(entityName): \(error), \(nsError.userInfo)" )
   }
}

/**
 Gets the number of records of the given type.

 - Parameter entityName: type of entities to count
 - Parameter context: Core Data context to get the entity from
 - Returns: number of records of the given type
 */
func getRecordsCount( entityName: String, context: NSManagedObjectContext ) -> Int?
{
   let fetchRequest = NSFetchRequest<NSFetchRequestResult>( entityName: entityName )
   do
   {
      return try context.count( for: fetchRequest )
   }
   catch
   {
      print( error.localizedDescription )
   }

   return nil
}

func deleteAllData( entityName: String, context: NSManagedObjectContext )
{
   let fetchRequest = NSFetchRequest<NSFetchRequestResult>( entityName: entityName )
   fetchRequest.returnsObjectsAsFaults = false
   do
   {
      for object in try context.fetch( fetchRequest )
      {
         guard let objectData = object as? NSManagedObject else { continue }
         context.delete( objectData )
      }
   }
   catch
   {
      print( "Delete all data of type \(entityName) error :", error)
   }
}

// TODO get this to work
//func deleteAllData( entityName: String, context: NSManagedObjectContext )
//{
//   let fetchRequest = NSFetchRequest<NSFetchRequestResult>( entityName: entityName )
//   let deleteRequest = NSBatchDeleteRequest( fetchRequest: fetchRequest)
//   do
//   {
//      try context.execute( deleteRequest )
//   }
//   catch
//   {
//      print( "Delete all data of type \(entityName) error :", error)
//   }
//}


func getNextLaunch( context: NSManagedObjectContext ) -> Launch?
{
   return getNextLaunches( count: 1, context: context ).first
}

/**
 Returns a list of events after the current date.

 - Parameter count: {Int} number of records to return
 - Parameter context: {NSManagedObjectContext} Core Data database context
 */
func getNextLaunches( count: Int, context: NSManagedObjectContext ) -> [Launch]
{
   do
   {
      /*
       TODO use full timeline list, not just launches
       let request: NSFetchRequest<TimelineEntry> = TimelineEntry.fetchRequest()
       request.predicate = NSPredicate( format: "sortingDate > %@", NSDate() )
       request.sortDescriptors = [ NSSortDescriptor( key: "sortingDate", ascending: true ) ]
       request.fetchLimit = count
       let entities: [TimelineEntry] = try context.fetch( request )
       */
      let request: NSFetchRequest<Launch> = Launch.fetchRequest()
      request.predicate = NSPredicate( format: "windowEnd > %@", NSDate() )
      request.sortDescriptors = [ NSSortDescriptor( key: "windowStart", ascending: true ) ]
      request.fetchLimit = count
      let entities: [Launch] = try context.fetch( request )
      if entities.count > 0 { return entities }
   }
   catch
   {
      let nsError = error as NSError
      fatalError( "Failed to fetch next entity: \(error), \(nsError.userInfo)" )
   }

   return []
}
