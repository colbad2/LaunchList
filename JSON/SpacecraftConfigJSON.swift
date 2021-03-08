// Copyright © 2021 Bradford Holcombe. All rights reserved.

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

 ### Spec (API models: SpacecraftConfigurationDetail, SpacecraftConfig, SpacecraftConfiguration)
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
public class SpacecraftConfigJSON: Identifiable, JSONElement
{
   /** ID of the config within the API. */
   public let id: Int64?
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
   let capability: String?
   let history: String?
   let details: String?
   let maidenFlight: String? // ISO date
   let height: Double?
   let diameter: Double?
   let humanRated: Bool?
   let crewCapacity: Int64?
   let payloadCapacity: Int64?
   let flightLife: String?
   let nationURL: String? // URL
   let wikiURL: String? // URL
   let infoURL: String? // URL

   /**
    Make a `SpacecraftConfigJSON` from a JSON structure.

    - parameter json: `Any` JSON to parse
    */
   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      self.id = nonNegativeInt( json[ "id" ] )
      self.url = nonEmptyString( json[ "url" ] )
      self.name = nonEmptyString( json[ "name" ] )
      self.type = IDNameJSON( json[ "type" ] )
      self.agency = AgencyJSON( json[ "agency" ] )
      self.inUse = json[ "in_use" ] as? Bool
      self.imageURL = nonEmptyString( json[ "image_url" ] )
      self.capability = nonEmptyString( json[ "capability" ] )
      self.history = nonEmptyString( json[ "history" ] )
      self.details = nonEmptyString( json[ "details" ] )
      self.maidenFlight = nonEmptyString( json[ "maiden_flight" ] )
      self.height = nonNegativeDouble( json[ "height" ] )
      self.diameter = nonNegativeDouble( json[ "diameter" ] )
      self.humanRated = json[ "human_rated" ] as? Bool
      self.crewCapacity = nonNegativeInt( json[ "crew_capacity" ] )
      self.payloadCapacity = nonNegativeInt( json[ "payload_capacity" ] )
      self.flightLife = nonEmptyString( json[ "flight_life" ] )
      self.nationURL = nonEmptyString( json[ "nation_url" ] )
      self.wikiURL = nonEmptyString( json[ "wiki_link" ] )
      self.infoURL = nonEmptyString( json[ "info_link" ] )
   }
}
