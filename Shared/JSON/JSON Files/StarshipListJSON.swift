// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 Base structure in the startship tests JSON returned from the API. Not encoded into a Core Data entity.

 ### Example

    {
     "upcoming": { … },
     "previous": { … },
     "live_streams": [ … ],
     "road_closures": [ … ],
     "notices": [ … ],
     "vehicles": [ … ]
    }
 */
public struct StarshipListJSON: Decodable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case upcoming, previous, liveStreams, roadClosures, notices, vehicles
   }

   let upcoming: StarshipEventsJSON?
   let previous: StarshipEventsJSON?
   let liveStreams: [LiveStreamJSON]?
   let roadClosures: [RoadClosureJSON]? // unused
   let notices: [NoticeJSON]?
   let vehicles: [VehicleJSON]?
}
