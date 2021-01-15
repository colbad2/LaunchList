// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name

/**
 Part of [LaunchJSON], [SpacecraftJSON], and [SpaceStationJSON] objects

 example JSON:
 {
     "abbrev": "TBC",
     "description": "Awaiting official confirmation - current date is known with some certainty.",
     "id": 8,
     "name": "To Be Confirmed"
 }
 */
struct StatusJSON: Decodable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case description, id, name

      case abbreviation = "abbrev"
   }

   var abbreviation: String?
   var description: String?
   var id: Int64
   var name: String?
}
