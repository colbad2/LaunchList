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
   public let id: Int64
   let title: String?
   let status: IDNameJSON?
   let windowStart: String?
   let windowEnd: String?

   /**
    Make a `LauncherJSON` from a JSON structure.

    - parameter json: `JSONStructure` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.title = json[ "title" ] as? String
      self.status = IDNameJSON( json: json[ "status" ] as? JSONStructure )
      self.windowStart = json[ "windowStart" ] as? String
      self.windowEnd = json[ "windowEnd" ] as? String
   }
}
