// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

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
   // translate API attribute names into better var names
//   enum CodingKeys: String, CodingKey
//   {
//      case description, id, name
//
//      case abbreviation = "abbrev"
//   }

   /** ID of the rocket within the API. */
   public var id: Int64
   /** Staus abbreviation. */
   var abbreviation: String?
   /** Status description. */
   var description: String?
   /** Status name. */
   var name: String?

   /**
    Make a `StatusJSON` from a JSON structure.

    - parameter json: `JSONStructure?` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.name = json[ "name" ] as? String
      self.abbreviation = json[ "abbrev" ] as? String
      self.description = json[ "description" ] as? String
   }
}
