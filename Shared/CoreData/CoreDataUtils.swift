import Foundation
import CoreData

func saveContext( _ context: NSManagedObjectContext )
{
   do
   {
      try context.save()
   }
   catch
   {
      // Replace this implementation with code to handle the error appropriately.
      // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
      let nsError = error as NSError
      fatalError( "Unresolved error \(nsError), \(nsError.userInfo)" )
   }
}

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
       fatalError( "Failed to fetch agencies: \(error)" )
   }

   return nil
}

func getFirstEntity( context: NSManagedObjectContext, entityName: String ) -> Any?
{
   do
   {
      let request = NSFetchRequest<NSFetchRequestResult>( entityName: entityName )
      return try context.fetch( request ).first
   }
   catch
   {
       fatalError( "Failed to fetch agencies: \(error)" )
   }

   // return nil
}
