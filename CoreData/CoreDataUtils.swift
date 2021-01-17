// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 Saves the Core Data context, without having to handle any errors.

 - parameter context: `NSManagedObjectContext` the Core Data context to save
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
      // fatalError() causes the application to generate a crash log and terminate. You should not use this
      // function in a shipping application, although it may be useful during development.
      let nsError: NSError = error as NSError
      fatalError( "Unresolved error \(nsError), \(nsError.userInfo)" )
   }
}

/**
 Gets an entity of the given name and int ID.

 - parameter entityID:   `Int64` ID of the entity to fetch
 - parameter context:    `NSManagedObjectContext` Core Data context to get the entity from
 - parameter entityName: `String` type of the entity type to fetch
 - returns:              `Any?` the first entity with the given parameters, or nil otherwise
 */
func getEntityByID( entityID: Int64, context: NSManagedObjectContext, entityName: String ) -> Any?
{
   do
   {
      let request: NSFetchRequest = NSFetchRequest<NSFetchRequestResult>( entityName: entityName )
      request.predicate = NSPredicate( format: "id == %d", entityID )
      let entities: [Any] = try context.fetch( request )
      if !entities.isEmpty { return entities.first }
   }
   catch
   {
      let nsError: NSError = error as NSError
      fatalError( "Failed to fetch entity \(entityName) with ID \(entityID): \(error), \(nsError.userInfo)" )
   }

   return nil
}

/**
 Gets the entity of the given type and string ID.

 Needed to ID live streams.

 - parameter entityID:   `String` ID of the entity to fetch
 - parameter context:    `NSManagedObjectContext` Core Data context to fetch the entity from
 - parameter entityName: `String` type of the entity to fetch
 - returns:              `Any?` first entity with the given parameters, nil otherwise
 */
func getEntityByID( entityID: String, context: NSManagedObjectContext, entityName: String ) -> Any?
{
   do
   {
      let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest<NSFetchRequestResult>( entityName: entityName )
      request.predicate = NSPredicate( format: "id == %@", entityID )
      let entities: [Any] = try context.fetch( request )
      if !entities.isEmpty { return entities.first }
   }
   catch
   {
      let nsError: NSError = error as NSError
      fatalError( "Failed to fetch entity \(entityName) with ID \(entityID): \(error), \(nsError.userInfo)" )
   }

   return nil
}

/**
 Gets the first entity of the given type from Core Data.

 Unused.

 - parameter context:    `NSManagedObjectContext` Core Data context to get the entity from
 - parameter entityName: `String` type of the entity type to fetch
 - returns:              `Any?` the first entity with the given parameters, or nil otherwise
 */
// func getFirstEntity( context: NSManagedObjectContext, entityName: String ) -> Any?
// {
//   do
//   {
//      let request: NSFetchRequest = NSFetchRequest<NSFetchRequestResult>( entityName: entityName )
//      return try context.fetch( request ).first
//   }
//   catch
//   {
//      let nsError: NSError = error as NSError
//      fatalError( "Failed to fetch first entity \(entityName): \(error), \(nsError.userInfo)" )
//   }
// }

/**
 Gets the number of records of the given type.

 - parameter entityName: `String` type of entities to count
 - parameter context:    `NSManagedObjectContext` Core Data context to get the entity from
 - returns:              `Int?` number of records of the given type
 */
func getRecordsCount( entityName: String, context: NSManagedObjectContext ) -> Int?
{
   let fetchRequest: NSFetchRequest = NSFetchRequest<NSFetchRequestResult>( entityName: entityName )
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

/**
 Remove all entities from the context of the given entity type.

 - parameter entityName: `String` name of the entities to remove
 - parameter context:    `NSManagedObjectContext` context to remove entity from
 */
func deleteAllData( entityName: String, context: NSManagedObjectContext )
{
   let fetchRequest: NSFetchRequest = NSFetchRequest<NSFetchRequestResult>( entityName: entityName )
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

/**
 Delete all entities in the given context.

 - parameter entityType: `String` type of entity to remove
 - parameter context: `NSManagedObjectContext` context to remove entities from
 */
func deleteAllEntities( entityType: String, context: NSManagedObjectContext )
{
   let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest<NSFetchRequestResult>( entityName: entityType )
   let deleteRequest: NSBatchDeleteRequest = NSBatchDeleteRequest( fetchRequest: fetchRequest )
   do
   {
      try context.execute( deleteRequest )
   }
   catch
   {
      print( "Cannot delete all \(entityType) entities, error :", error)
   }
}

/**
 Gets the next `Launch` after the current date.

 - parameter context: `NSManagedObjectContext` context to get launches from
 - returns:           `Launch?` next launch, if any
 */
func getNextLaunch( context: NSManagedObjectContext ) -> Launch?
{
   return getNextLaunches( count: 1, context: context ).first
}

/**
 Returns a list of events after the current date.

 - parameter count:   `Int` number of records to return
 - parameter context: `NSManagedObjectContext`  Core Data database context
 - returns:           `[Launch]` list of the next launches
 */
func getNextLaunches( count: Int, context: NSManagedObjectContext ) -> [Launch]
{
   do
   {
      let request: NSFetchRequest< Launch > = Launch.fetchRequest()
      request.predicate = NSPredicate( format: "windowEnd > %@", NSDate() )
      request.sortDescriptors = [ NSSortDescriptor( key: "windowStart", ascending: true ) ]
      request.fetchLimit = count
      let entities: [Launch] = try context.fetch( request )
      if !entities.isEmpty { return entities }
   }
   catch
   {
      let nsError: NSError = error as NSError
      fatalError( "Failed to fetch next entity: \(error), \(nsError.userInfo)" )
   }

   return []
}

/**
 Gets the next `TimelineEvent` after the current date.

 - parameter context: `NSManagedObjectContext`  Core Data database context
 - returns:           `TimelineEntry?` next timeline entry, if any
 */
func getNextTimelineEvent( context: NSManagedObjectContext ) -> TimelineEntry?
{
   return getNextTimelineEvents( count: 1, context: context ).first
}

/**
 Returns a list of timeline entries after the current date.

 - parameter count:   `Int` number of records to return
 - parameter context: `NSManagedObjectContext`  Core Data database context
 - returns:           `[TimelineEntry]` list of the next timeline entries
 */
func getNextTimelineEvents( count: Int, context: NSManagedObjectContext ) -> [TimelineEntry]
{
   do
   {
      let request: NSFetchRequest< TimelineEntry > = TimelineEntry.fetchRequest()
      request.predicate = NSPredicate( format: "sortingDate > %@", NSDate() )
      request.sortDescriptors = [ NSSortDescriptor( key: "sortingDate", ascending: true ) ]
      request.fetchLimit = count
      let entities: [TimelineEntry] = try context.fetch( request )
      if !entities.isEmpty { return entities }
   }
   catch
   {
      let nsError: NSError = error as NSError
      fatalError( "Failed to fetch next entity: \(error), \(nsError.userInfo)" )
   }

   return []
}
