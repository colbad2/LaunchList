import Foundation
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
 Gets an entity of the given name and ID from Core Data.

 - Parameter id: id of the entity to fetch
 - Parameter context: the Core Data context to ge tthe entity from
 - Parameter entityName: the name of the entity type to fetch
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

func getEntityByID( id: String, context: NSManagedObjectContext, entityName: String ) -> Any?
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
 Gets the first entity of the given name from Core Data.

 - Parameter context: the Core Data context to ge tthe entity from
 - Parameter entityName: the name of the entity type to fetch
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

//func deleteAllData( entityName: String, context: NSManagedObjectContext )
//{
//   let fetchRequest = NSFetchRequest<NSFetchRequestResult>( entityName: entityName )
//   fetchRequest.returnsObjectsAsFaults = false
//   do
//   {
//      for object in try context.fetch( fetchRequest )
//      {
//         guard let objectData = object as? NSManagedObject else { continue }
//         context.delete( objectData )
//      }
//   }
//   catch
//   {
//      print( "Delete all data of type \(entityName) error :", error)
//   }
//}

func deleteAllData( entityName: String, context: NSManagedObjectContext )
{
   let fetchRequest = NSFetchRequest<NSFetchRequestResult>( entityName: entityName )
   let deleteRequest = NSBatchDeleteRequest( fetchRequest: fetchRequest)
   do
   {
      try context.execute( deleteRequest )
   }
   catch
   {
      print( "Delete all data of type \(entityName) error :", error)
   }
}
