// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name

/**
 Mission orbit.

 Used in [MissionJSON]

 example JSON:
 {
     "abbrev": "GTO",
     "id": 2,
     "name": "Geostationary Transfer Orbit"
 }
 */
struct OrbitJSON: Decodable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, name

      case abbreviation = "abbrev"
   }

   var abbreviation: String?
   var id: Int64
   var name: String?
}
