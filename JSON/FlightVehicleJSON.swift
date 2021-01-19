// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 ### Example JSON
       {
         "id": 220,
         "url": "https://ll.thespacedevs.com/2.1.0/spacecraft/flight/220/",
         "destination": "International Space Station",
         "mission_end": "2010-03-18T11:24:00Z",
         "spacecraft": { … }
       }
 */
public struct FlightVehicleJSON: Decodable, Identifiable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, url, destination, missionEnd, spacecraft
   }

   public var id: Int64
   var url: String? // unused
   var destination: String?
   var missionEnd: String?
   var spacecraft: SpacecraftJSON?

   public func addToCoreData( context: NSManagedObjectContext ) -> FlightVehicle
   {
      let newFlightVehicle: FlightVehicle = FlightVehicle( context: context )
      updateEntity( entity: newFlightVehicle, context: context )

      return newFlightVehicle
   }

   public func updateEntity( entity: FlightVehicle?, context: NSManagedObjectContext )
   {
      guard let flightVehicleEntity = entity else { return }

      flightVehicleEntity.id = id
      flightVehicleEntity.url = url
      flightVehicleEntity.destination = destination
      flightVehicleEntity.missionEnd = missionEnd
      flightVehicleEntity.addSpacecraftFromJSON( spacecraft: spacecraft, context: context )
   }
}
