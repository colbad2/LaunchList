// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name

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

   func updateEntity( entity: ServiceProvider? )
   {
      guard let entity = entity else { return }

      entity.id = self.id
      entity.name = self.name
      entity.type = self.type
   }
}

// Core Data search/update

func getProvider( by entityID: Int64, context: NSManagedObjectContext ) -> ServiceProvider?
{
   return getEntityByID( entityID: entityID, context: context, entityName: "ServiceProvider" ) as? ServiceProvider
}

func fetchProvider( provider: ServiceProviderJSON, context: NSManagedObjectContext ) -> ServiceProvider
{
   let providerEntity = getProvider( by: provider.id, context: context )
   provider.updateEntity( entity: providerEntity )
   return providerEntity ?? provider.addToCoreData( context: context )
}

func getServiceProviderCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "ServiceProvider", context: context )
}

func getSampleServiceProvider() -> ServiceProviderJSON?
{
   return parseJSONString( json: sampleServiceProviderJSON )
}

private let sampleServiceProviderJSON =
"""
 {
     "id": 121,
     "name": "SpaceX",
     "type": "Commercial",
     "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
 }
"""
