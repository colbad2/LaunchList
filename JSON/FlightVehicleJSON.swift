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
public class FlightVehicleJSON: Decodable, Identifiable, JSONElement
{
   // translate API attribute names into better var names
//   enum CodingKeys: String, CodingKey
//   {
//      case id, url, destination, missionEnd, spacecraft
//   }

   /** ID of the astronaut within the API. */
   public var id: Int64
   /** URI of this data. Unused. */
   var url: String?
   var destination: String?
   var missionEnd: String?
   var spacecraft: SpacecraftJSON?

   /**
    Make a `DockingJSON` from a JSON structure.

    - parameter json: `JSONStructure` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.url = json[ "url" ] as? String
      self.destination = json[ "destination" ] as? String
      self.missionEnd = json[ "missionEnd" ] as? String
      self.spacecraft = SpacecraftJSON( json: json[ "spacecraft" ] as? JSONStructure )
   }

   /**
    Add this data to Core Data as a `FlightVehicle`. The context still needs to be saved after the add.

    - parameter context: Core Data context to add the entity to.
    - returns: `FlightVehicle` the added entity
    */
   public func addToCoreData( context: NSManagedObjectContext ) -> FlightVehicle
   {
      let newFlightVehicle: FlightVehicle = FlightVehicle( context: context )
      updateEntity( entity: newFlightVehicle, context: context )

      return newFlightVehicle
   }

   /**
    Set or update the values of the `FlightVehicle` entity,

    - parameter entity:  `FlightVehicle?` entity to fill/update
    - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
    */
   public func updateEntity( entity: FlightVehicle?, context: NSManagedObjectContext )
   {
      guard let flightVehicleEntity = entity else { return }

      flightVehicleEntity.id = id
      flightVehicleEntity.url = url
      flightVehicleEntity.destination = destination
      flightVehicleEntity.missionEnd = missionEnd
      flightVehicleEntity.addSpacecraftFromJSON( spacecraft: spacecraft, context: context )

      flightVehicleEntity.fetched = Date()
   }
}
