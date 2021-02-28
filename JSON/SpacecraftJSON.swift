// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable line_length

/**
 ### Example JSON
       {
         "id": 77,
         "url": "https://ll.thespacedevs.com/2.1.0/spacecraft/77/",
         "name": "Soyuz TMA-16",
         "serial_number": "Soyuz TMA 11F732A17 #226",
         "status": { … },
         "description": "Soyuz TMA-16 was a Soyuz spacecraft which launched on September 30 2009 07:14 UTC. It transported two members of the Expedition 21 crew and one participant to the International Space Station. The Expedition 21 crew consisted of Maksim Surayev and Jeffrey Williams. The spaceflight participant was tourist Guy Laliberté.",
         "spacecraft_config": { … }
       }

 ## Spec
       id                integer
       url               string($uri)
       name*             string maxLength: 255 minLength: 1
       serial_number     string maxLength: 255 x-nullable: true
       status            SpacecraftStatus{...}
       description*      string maxLength: 2048 minLength: 1
       spacecraft_config  SpacecraftConfig{...}
       flights           [SpacecraftFlight]
 */
public class SpacecraftJSON: Decodable, Identifiable, JSONElement
{
   // translate API attribute names into better var names
//   enum CodingKeys: String, CodingKey
//   {
//      case id, url, name, serialNumber, status, spacecraftConfig
//
//      case spacecraftDescription = "description"
//   }

   /** ID of the config within the API. */
   public var id: Int64
   /** URI of this data in the API. Unused. */
   var url: String?
   /** Spacecraft name. */
   var name: String?
   var serialNumber: String?
   var status: IDNameJSON?
   var statusName: String?
   var spacecraftDescription: String?
   var spacecraftConfig: SpacecraftConfigJSON?
   var flights: [SpacecraftFlightJSON] = []

   /**
    Make a `SpacecraftJSON` from a JSON structure.

    - parameter json: `JSONStructure` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.url = json[ "url" ] as? String
      self.name = json[ "name" ] as? String
      self.serialNumber = json[ "serial_number" ] as? String
      self.status = IDNameJSON( json: json[ "status" ] as? JSONStructure )
      self.statusName = json[ "statusName" ] as? String
      self.spacecraftDescription = json[ "description" ] as? String
      self.spacecraftConfig = SpacecraftConfigJSON( json: json[ "spacecraftConfig" ] as? JSONStructure )
      self.flights = ( json[ "flights" ] as? [JSONStructure] ?? [] ).compactMap { return SpacecraftFlightJSON( json: $0 ) }
   }

   /**
    Add this data to Core Data as a `Spacecraft` entity. The context still needs to be saved after the add.

    - parameter context: Core Data context to add the entity to.
    - returns: the added entity
    */
   public func addToCoreData( context: NSManagedObjectContext ) -> Spacecraft
   {
      let newSpacecraft: Spacecraft = Spacecraft( context: context )
      updateEntity( spacecraftEntity: newSpacecraft, context: context )

      return newSpacecraft
   }

   /**
    Set or update the values of the `Spacecraft` entity,

    - parameter spacecraftEntity: `Spacecraft?` entity to fill/update
    - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
    */
   public func updateEntity( spacecraftEntity: Spacecraft?, context: NSManagedObjectContext )
   {
      guard let entity = spacecraftEntity else { return }

      entity.id = id
      entity.url = url
      entity.name = name
      entity.serialNumber = serialNumber
      entity.status = status?.name
      entity.statusName = status?.name
      entity.spacecraftDescription = spacecraftDescription
      entity.addSpacecraftConfigFromJSON( spacecraftConfig: spacecraftConfig, context: context )
      entity.addFlightsFromJSON( flights: flights, context: context )

      entity.fetched = Date()
   }
}
