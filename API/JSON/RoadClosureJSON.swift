// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 ### Example JSON
       {
         "id": 82,
         "title": "Secondary Date",
         "status": {
           "id": 1,
           "name": "Scheduled"
         },
         "window_start": "2020-12-30T14:00:00Z",
         "window_end": "2020-12-30T23:00:00Z"
       }
 */
public class RoadClosureJSON: Decodable, Identifiable, JSONElement
{
   public let id: Int64?
   let title: String?
   let status: IDNameJSON?
   let windowStart: String?
   let windowEnd: String?

   /**
    Make a `LauncherJSON` from a JSON structure.

    - parameter json: `Any` JSON to parse
    */
   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      id = nonNegativeInt( json[ "id" ] )
      title = nonEmptyString( json[ "title" ] )
      status = IDNameJSON( json[ "status" ] )
      windowStart = nonEmptyString( json[ "windowStart" ] )
      windowEnd = nonEmptyString( json[ "windowEnd" ] )
   }
}
