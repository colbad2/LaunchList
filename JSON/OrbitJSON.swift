// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 Mission orbit.

 Used in `MissionJSON`

 ### example JSON:
       {
           "abbrev": "GTO",
           "id": 2,
           "name": "Geostationary Transfer Orbit"
       }
 */
public struct OrbitJSON: Decodable, Identifiable, JSONElement
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, name

      case abbreviation = "abbrev"
   }

   var abbreviation: String?
   public var id: Int64
   var name: String?
}
