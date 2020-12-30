import Foundation
import CoreData

/**
 Organization providing services for the launch.

 Part of a [LaunchJSON] object

 example JSON:
 {
     "id": 121,
     "name": "SpaceX",
     "type": "Commercial",
     "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
 }
 */
struct ServiceProviderJSON: Decodable
{
   var id: Int64
   var name: String?
   var type: String?
   var url: URL? // unused

   func addToCoreData( context: NSManagedObjectContext ) -> ServiceProvider
   {
      let newServiceProvider = ServiceProvider( context: context )
      updateEntity( entity: newServiceProvider )

      return newServiceProvider
   }

   func updateEntity( entity: ServiceProvider? ) -> Void
   {
      if entity == nil { return }

      entity!.id = self.id
      entity!.name = self.name
      entity!.type = self.type
   }
}

// Core Data search/update

func getProvider( by id: Int64, context: NSManagedObjectContext ) -> ServiceProvider?
{
   return getEntityByID( id: id, context: context, entityName: "ServiceProvider" ) as? ServiceProvider
}

func fetchProvider( provider: ServiceProviderJSON, context: NSManagedObjectContext ) -> ServiceProvider
{
   let providerEntity = getProvider( by: provider.id, context: context )
   provider.updateEntity( entity: providerEntity )
   return providerEntity ?? provider.addToCoreData( context: context )
}
