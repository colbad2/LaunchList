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
      self.id = nonNegativeInt( json[ "id" ] )
      self.title = nonEmptyString( json[ "title" ] )
      self.status = IDNameJSON( json[ "status" ] )
      self.windowStart = nonEmptyString( json[ "windowStart" ] )
      self.windowEnd = nonEmptyString( json[ "windowEnd" ] )
   }
}
