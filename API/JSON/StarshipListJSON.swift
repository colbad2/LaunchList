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
      self.upcoming = StarshipEventsJSON( json[ "upcoming" ] as? JSONStructure )
      self.previous = StarshipEventsJSON( json[ "previous" ] as? JSONStructure )
      self.liveStreams = parseArray( json[ "liveStreams" ] )
      self.roadClosures = parseArray( json[ "roadClosures" ] )
      self.notices = parseArray( json[ "notices" ] )
      self.vehicles = parseArray( json[ "vehicles" ] )
   }
}
