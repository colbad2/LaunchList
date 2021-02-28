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
public class FlightVehicleJSON: Decodable, Identifiable, JSONElement
{
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
}
