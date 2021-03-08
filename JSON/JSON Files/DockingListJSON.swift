// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 List of launches returned from a URL.

 ### Example URL
     "https://ll.thespacedevs.com/2.1.0/launch/upcoming/?limit=10&offset=10"

 ### Example JSON:
       {
          "count": 242,
          "next": "https://ll.thespacedevs.com/2.1.0/docking_event/?limit=100&offset=100",
          "previous": null,
          "results": [ … ]
       }
 */
public struct DockingListJSON: JSONResponse, JSONElement
{
   /** total number of records that could be returned from exhaustive use of the URL */
   let totalCount: Int64?
   /** URL that fetches the next group of records, as defined by the limit/offset URL attributes, if any. If there
       are no other launches, then the string is "null" */
   let nextGroupURL: String?
   /** URL that fetches the previous group of records, as defined by the limit/offset URL attributes, if any. If there
       are no previous launches, then the string is "null" */
   let previousGroupURL: String?
   /** Current (sub)list of records, as defined by the URL */
   let sublist: [DockingJSON]?

   public init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      self.totalCount = nonNegativeInt( json[ "count" ] )
      self.nextGroupURL = nonEmptyString( json[ "next" ] )
      self.previousGroupURL = nonEmptyString( json[ "previous" ] )
      self.sublist = parseArray( json[ "info_url" ] )
   }
}
