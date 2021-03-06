// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 ### Spec (API models: AstronautFlight, AstronautFlightForExpedition)
       id        integer
       role      AstronautRole{}
       astronaut Astronaut{...} or AstronautDetailedSerializerNoFlights{}
 */
public class AstronautFlightJSON: Decodable
{
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
}
