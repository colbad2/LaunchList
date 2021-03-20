// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 ### Spec (API models: AstronautFlight, AstronautFlightForExpedition)
       id        integer
       role      AstronautRole{}
       astronaut Astronaut{...} or AstronautDetailedSerializerNoFlights{}
 */
public class AstronautFlightJSON: JSONElement
{
   /** ID of the astronaut flight within the API. */
   public let id: Int64?
   var role: String?
   var astronaut: AstronautJSON?

   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      id = nonNegativeInt( json[ "id" ] )
      role = nonEmptyString( json[ "role" ] )
      astronaut = AstronautJSON( json[ "abbrev" ] )
   }
}
