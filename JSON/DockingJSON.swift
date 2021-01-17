// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 {
   "id": 100,
   "url": "https://ll.thespacedevs.com/2.1.0/docking_event/100/",
   "launch_id": "349eb56f-50e8-4858-9977-e4b7121c40f5",
   "docking": "2009-10-02T08:35:00Z",
   "departure": "2010-03-18T08:03:00Z",
   "flight_vehicle": { … },
   "docking_location": { … }
 }
 */
public struct DockingJSON: Decodable, Identifiable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, url, docking, departure, flightVehicle

      case launchID = "launchId"
   }

   public var id: Int64
   var url: String? // unused
   var launchID: String?
   var docking: String?
   var dockingLocationName: String?
   var departure: String?
   var flightVehicle: FlightVehicleJSON?
   var dockingLocation: DockingLocationJSON?

   public func addToCoreData( context: NSManagedObjectContext ) -> Docking
   {
      let newDocking: Docking = Docking( context: context )
      updateEntity( entity: newDocking, context: context )

      return newDocking
   }

   public func updateEntity( entity: Docking?, context: NSManagedObjectContext )
   {
      guard let entity = entity else { return }

      entity.id = self.id
      entity.launchID = self.launchID
      entity.docking = self.docking
      entity.departure = self.departure

      if let flightVehicle: FlightVehicleJSON = self.flightVehicle
      {
         let flightVehicleEntity: FlightVehicle = fetchFlightVehicle( flightVehicle: flightVehicle, context: context )
         entity.flightVehicle = flightVehicleEntity
         flightVehicleEntity.addToDockings( entity )
      }

      entity.dockingLocationName = self.dockingLocation?.name

      // TimelineEntry
      entity.sortingDate = parseISODate( isoDate: self.docking )
   }
}