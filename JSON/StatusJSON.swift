// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 Status of an enclosing data object, like a spacecraft or spacestation.

 Part of `LaunchJSON`, `SpacecraftJSON`, and `SpaceStationJSON` objects

 ### Example JSON:
       {
           "abbrev": "TBC",
           "description": "Awaiting official confirmation - current date is known with some certainty.",
           "id": 8,
           "name": "To Be Confirmed"
       }
 */
public class StatusJSON: Decodable, Identifiable, JSONElement
{
   /** ID of the rocket within the API. */
   public var id: Int64?
   /** Staus abbreviation. */
   var abbreviation: String?
   /** Status description. */
   var description: String?
   /** Status name. */
   var name: String?

   /**
    Make a `StatusJSON` from a JSON structure.

    - parameter json: `Any?` JSON to parse
    */
   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      self.id = nonNegativeInt( json[ "id" ] )
      self.name = nonEmptyString( json[ "name" ] )
      self.abbreviation = nonEmptyString( json[ "abbrev" ] )
      self.description = nonEmptyString( json[ "description" ] )
   }
}
