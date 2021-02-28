// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 ### Spec
       id        integer
       role      string
       astronaut Astronaut{...}
 */
public class AstronautFlightJSON: Decodable
{
   // translate API attribute names into better var names
//   enum CodingKeys: String, CodingKey
//   {
//      case id, role, astronaut
//      case typeDescription = "description"
//   }

   /** ID of the astronaut flight within the API. */
   public let id: Int64
   var role: String?
   var astronaut: AstronautJSON?

   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.role = json[ "role" ] as? String
      self.astronaut = AstronautJSON( json: json[ "abbrev" ] as? JSONStructure )
   }

   /**
    Add this data to Core Data as a `AstronautFlight` entity. The context still needs to be saved after the add.

    - parameter context: Core Data context to add the entity to.
    - returns: the added entity
    */
   public func addToCoreData( context: NSManagedObjectContext ) -> AstronautFlight
   {
      let newAstronautFlight: AstronautFlight = AstronautFlight( context: context )
      updateEntity( entity: newAstronautFlight, context: context )

      return newAstronautFlight
   }

   /**
    Set or update the values of the `AstronautFlight` entity,

    - parameter entity: `AstronautFlight?` entity to fill/update
    - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
    */
   public func updateEntity( entity: AstronautFlight?, context: NSManagedObjectContext )
   {
      guard let flightEntity = entity else { return }

      flightEntity.id = id
      flightEntity.role = role
      if let astronaut: AstronautJSON = self.astronaut
      {
         flightEntity.astronaut = fetchAstronaut( astronaut: astronaut, context: context )
      }

      flightEntity.fetched = Date()
   }
}
