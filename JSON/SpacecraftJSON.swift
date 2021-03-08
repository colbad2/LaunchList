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
       id                 integer
       url                string($uri)
       name*              string, length 1-255
       serial_number      string, maxLength: 255
       status             SpacecraftStatus{...} (IDNameJSON)
       description*       string length: 1-2048
       spacecraft_config  SpacecraftConfig{...} or SpacecraftConfigDetail
       flights            [SpacecraftFlight]
 */
public class SpacecraftJSON: Identifiable, JSONElement
{
   /** ID of the config within the API. */
   public var id: Int64?
   /** URI of this data in the API. Unused. */
   var url: String?
   /** Spacecraft name. */
   var name: String?
   var serialNumber: String?
   var status: IDNameJSON?
   var spacecraftDescription: String?
   var spacecraftConfig: SpacecraftConfigJSON?
   var flights: [SpacecraftFlightJSON] = []

   /**
    Make a `SpacecraftJSON` from a JSON structure.

    - parameter json: `Any` JSON to parse
    */
   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      self.id = nonNegativeInt( json[ "id" ] )
      self.url = nonEmptyString( json[ "url" ] )
      self.name = nonEmptyString( json[ "name" ] )
      self.serialNumber = nonEmptyString( json[ "serial_number" ] )
      self.status = IDNameJSON( json[ "status" ] )
      self.spacecraftDescription = nonEmptyString( json[ "description" ] )
      self.spacecraftConfig = SpacecraftConfigJSON( json[ "spacecraft_config" ] )
      self.flights = parseArray( json[ "flights" ] )
   }
}
