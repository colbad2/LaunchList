// Copyright © 2021 Bradford Holcombe. All rights reserved.

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
public struct ServiceProviderJSON: Decodable
{
   var id: Int64
   var name: String?
   var type: String?
   var url: URL? // unused

   public func addToCoreData( context: NSManagedObjectContext ) -> ServiceProvider
   {
      let newServiceProvider: ServiceProvider = ServiceProvider( context: context )
      updateEntity( entity: newServiceProvider )

      return newServiceProvider
   }

   public func updateEntity( entity: ServiceProvider? )
   {
      guard let entity = entity else { return }

      entity.id = self.id
      entity.name = self.name
      entity.type = self.type
   }
}