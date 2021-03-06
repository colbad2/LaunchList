// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 ### Example JSON
       {
         "id": 77,
         "url": "https://ll.thespacedevs.com/2.1.0/spacecraft/77/",
         "name": "Soyuz TMA-16",
         "serial_number": "Soyuz TMA 11F732A17 #226",
         "status": { … },
         "description": "Soyuz TMA-16 was a Soyuz spacecraft which launched on September 30 2009 07:14 UTC…",
         "spacecraft_config": { … }
       }

 ## Spec (API models: Spacecraft, SpacecraftDetailedNoFlights, SpacecraftDetailed)
       id                integer
       url               string($uri)
       name*             string maxLength: 255 minLength: 1
       serial_number     string maxLength: 255 x-nullable: true
       status            SpacecraftStatus{...}
       description*      string maxLength: 2048 minLength: 1
       spacecraft_config  SpacecraftConfig{...} or SpacecraftConfigDetail
       flights           [SpacecraftFlight]
 */
public class SpacecraftJSON: Decodable, Identifiable, JSONElement
{
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
}
