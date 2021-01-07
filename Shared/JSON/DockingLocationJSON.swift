// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 {
   "id": 2,
   "name": "Zvezda aft"
 }
 */
public struct DockingLocationJSON: Decodable, Identifiable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, name
   }

   public var id: Int64
   var name: String?

   func addToCoreData( context: NSManagedObjectContext ) -> DockingLocation
   {
      let newDockingLocation: DockingLocation = DockingLocation( context: context )
      updateEntity( entity: newDockingLocation, context: context )

      return newDockingLocation
   }

   func updateEntity( entity: DockingLocation?, context: NSManagedObjectContext )
   {
      guard let entity = entity else { return }

      entity.id = self.id
      entity.name = self.name
   }
}


// Core Data search/update

func getDockingLocation( by id: Int64, context: NSManagedObjectContext ) -> DockingLocation?
{
   return getEntityByID( id: id, context: context, entityName: "DockingLocation" ) as? DockingLocation
}

func fetchDockingLocation( dockingLocation: DockingLocationJSON, context: NSManagedObjectContext ) -> DockingLocation
{
   let dockingLocationEntity = getDockingLocation( by: dockingLocation.id, context: context )
   dockingLocation.updateEntity( entity: dockingLocationEntity, context: context )
   return dockingLocationEntity ?? dockingLocation.addToCoreData( context: context )
}

func getDockingLocationCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "DockingLocation", context: context )
}

func getSampleDockingLocation() -> DockingLocationJSON?
{
   return parseJSONString( json: sampleDockingLocationJSON )
}

private let sampleDockingLocationJSON =
"""
 {
   "id": 2,
   "name": "Zvezda aft"
 }
"""
