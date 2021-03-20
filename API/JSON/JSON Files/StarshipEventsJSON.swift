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
public struct StarshipEventsJSON: JSONElement
{
   let launches: [LaunchJSON]?
   let events: [EventJSON]?

   public init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      launches = parseArray( json[ "launches" ] )
      events = parseArray( json[ "events" ] )
   }
}
