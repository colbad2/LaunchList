// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 Structure in the starship API. Not copied into Core Data.
 
 ### Example

 {
   "launches": [ … ],
   "events": [ … ]
 }
 */
struct StarshipEventsJSON: Decodable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case launches, events
   }

   let launches: [LaunchJSON]?
   let events: [EventJSON]?
}
