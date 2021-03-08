// Copyright © 2021 Bradford Holcombe. All rights reserved.

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
public class FlightVehicleJSON: Identifiable, JSONElement
{
   /** ID of the astronaut within the API. */
   public var id: Int64?
   /** URI of this data. Unused. */
   var url: String?
   var destination: String?
   var missionEnd: String?
   var spacecraft: SpacecraftJSON?

   /**
    Make a `DockingJSON` from a JSON structure.

    - parameter json: `JSONStructure` JSON to parse
    */
   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      self.id = nonNegativeInt( json[ "id" ] )
      self.url = nonEmptyString( json[ "url" ] )
      self.destination = nonEmptyString( json[ "destination" ] )
      self.missionEnd = nonEmptyString( json[ "missionEnd" ] )
      self.spacecraft = SpacecraftJSON( json[ "spacecraft" ] )
   }
}
