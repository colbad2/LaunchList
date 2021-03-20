// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 Base structure in the starship tests JSON returned from the API. Not encoded into a Core Data entity.

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
public struct StarshipListJSON: JSONElement
{
   let upcoming: StarshipEventsJSON?
   let previous: StarshipEventsJSON?
   let liveStreams: [LiveStreamJSON]?
   let roadClosures: [RoadClosureJSON]?
   let notices: [IDNameJSON]?
   let vehicles: [LauncherJSON]?

   public init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      upcoming = StarshipEventsJSON( json[ "upcoming" ] as? JSONStructure )
      previous = StarshipEventsJSON( json[ "previous" ] as? JSONStructure )
      liveStreams = parseArray( json[ "liveStreams" ] )
      roadClosures = parseArray( json[ "roadClosures" ] )
      notices = parseArray( json[ "notices" ] )
      vehicles = parseArray( json[ "vehicles" ] )
   }
}
