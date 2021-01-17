// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable line_length

/**
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
   var url: String?
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
      guard let entity = entity else { return }

      entity.id = self.id
      entity.url = self.url
      entity.destination = self.destination
      entity.missionEnd = self.missionEnd

      if let spacecraft: SpacecraftJSON = self.spacecraft
      {
         let spacecraftEntity: Spacecraft = fetchSpacecraft( spacecraft: spacecraft, context: context )
         entity.spacecraft = spacecraftEntity
         spacecraftEntity.flightVehicle = entity
      }
   }
}