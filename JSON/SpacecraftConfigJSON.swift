// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 Spacecraft (as distinguished from launchers) details.

 ### Example JSON
       {
         "id": 1,
         "url": "https://ll.thespacedevs.com/2.1.0/config/spacecraft/1/",
         "name": "Soyuz",
         "type": { … },
         "agency": { … },
         "in_use": true,
         "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/soyuz_image_20201015191152.jpg"
       }

 ### Spec (base and details)
       id   integer, readOnly: true
       url   string($uri), readOnly: true
       name*   string, maxLength: 200, minLength: 1
       type   SpacecraftConfigType{...}
       agency   Agency{...}
       in_use   boolean
       image_url   string($uri), readOnly: true, x-nullable: true

       capability   string, maxLength: 2048, minLength: 1
       history   string, maxLength: 1000, minLength: 1
       details   string, maxLength: 1000, minLength: 1
       maiden_flight   string($date), x-nullable: true
       height   number, title: Length (m), x-nullable: true
       diameter   number, title: Diameter (m), x-nullable: true
       human_rated   boolean
       crew_capacity   integer, maximum: 2147483647, minimum: -2147483648, x-nullable: true
       payload_capacity   integer, title: Payload Capacity (kg), maximum: 2147483647, minimum: -2147483648, x-nullable: true
       flight_life   string, maxLength: 2048, x-nullable: true
       nation_url   string($uri), readOnly: true, x-nullable: true
       wiki_link   string($uri), maxLength: 200
       info_link   string($uri), maxLength: 200
 */
public class SpacecraftConfigJSON: Decodable, Identifiable, JSONElement
{
   // translate API attribute names into better var names
//   enum CodingKeys: String, CodingKey
//   {
//      case id, url, name, type, agency, inUse, imageURL,
//           capability, history, details, height, diameter
//
//      case maidenFlight = "maiden_flight"
//      case humanRated = "human_rated"
//      case crewCapacity = "crew_capacity"
//      case payloadCapacity = "payload_capacity"
//      case flightLife = "flight_life"
//      case nationURL = "nation_url"
//      case wikiURL = "wiki_link"
//      case infoURL = "info_link"
//   }

   /** ID of the config within the API. */
   public let id: Int64
   /** URI of this data in the API. Unused. */
   let url: String?
   /** Config name, like "Soyuz". */
   let name: String?
   /** What event used this configuration, like "Cryoproof Test". */
   let type: IDNameJSON?
   /** Agency to use this configuration. */
   let agency: AgencyJSON?
   /** true if this config is in use. */
   let inUse: Bool?
   /** Image URL for this config. */
   let imageURL: String?

   // details

   let capability: String?
   let history: String?
   let details: String?
   let maidenFlight: String? // ISO date
   let height: Int64?
   let diameter: Int64?
   let humanRated: Bool?
   let crewCapacity: Int64?
   let payloadCapacity: Int64?
   let flightLife: String?
   let nationURL: String? // URL
   let wikiURL: String? // URL
   let infoURL: String? // URL

   /**
    Make a `SpacecraftConfigJSON` from a JSON structure.

    - parameter json: `JSONStructure` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.url = json[ "url" ] as? String
      self.name = json[ "name" ] as? String
      self.type = IDNameJSON( json: json[ "type" ] as? JSONStructure )
      self.agency = AgencyJSON( json: json[ "agency" ] as? JSONStructure )
      self.inUse = json[ "inUse" ] as? Bool
      self.imageURL = json[ "imageURL" ] as? String

      // details

      self.capability = json[ "capability" ] as? String
      self.history = json[ "history" ] as? String
      self.details = json[ "details" ] as? String
      self.maidenFlight = json[ "imageURL" ] as? String
      self.height = json[ "height" ] as? Int64
      self.diameter = json[ "diameter" ] as? Int64
      self.humanRated = json[ "human_rated" ] as? Bool
      self.crewCapacity = json[ "crew_capacity" ] as? Int64
      self.payloadCapacity = json[ "payload_capacity" ] as? Int64
      self.flightLife = json[ "maiden_flight" ] as? String
      self.nationURL = json[ "nation_url" ] as? String
      self.wikiURL = json[ "wiki_link" ] as? String
      self.infoURL = json[ "info_link" ] as? String
   }

   /**
    Add this config to Core Data as a `SpacecraftConfig` entity. The context still needs to be saved after the add.

    - parameter context: Core Data context to add the entity to.
    - returns: the added entity
    */
   public func addToCoreData( context: NSManagedObjectContext ) -> SpacecraftConfig
   {
      let newSpacecraftConfig: SpacecraftConfig = SpacecraftConfig( context: context )
      updateEntity( entity: newSpacecraftConfig, context: context )

      return newSpacecraftConfig
   }

   /**
    Set or update the values of the `SpacecraftConfig` entity,

    - parameter entity: `SpacecraftConfig?` entity to fill/update
    - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
    */
   public func updateEntity( entity: SpacecraftConfig?, context: NSManagedObjectContext )
   {
      guard let spacecraftConfigEntity = entity else { return }

      spacecraftConfigEntity.id = id
      spacecraftConfigEntity.url = url
      spacecraftConfigEntity.type = type?.name
      spacecraftConfigEntity.addAgencyFromJSON( agency: agency, context: context )

      // details

      spacecraftConfigEntity.capability = capability
      spacecraftConfigEntity.history = history
      spacecraftConfigEntity.details = details
      spacecraftConfigEntity.maidenFlight = maidenFlight
      spacecraftConfigEntity.height = guaranteedInt64( height )
      spacecraftConfigEntity.diameter = guaranteedInt64( diameter )
      spacecraftConfigEntity.humanRated = guaranteedBool( humanRated )
      spacecraftConfigEntity.crewCapacity = guaranteedInt64( crewCapacity )
      spacecraftConfigEntity.payloadCapacity = guaranteedInt64( payloadCapacity )
      spacecraftConfigEntity.flightLife = flightLife
      spacecraftConfigEntity.nationURL = nationURL
      spacecraftConfigEntity.wikiURL = wikiURL
      spacecraftConfigEntity.infoURL = infoURL

      spacecraftConfigEntity.fetched = Date()
   }
}
