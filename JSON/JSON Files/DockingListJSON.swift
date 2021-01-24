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
public struct DockingListJSON: Decodable, JSONResponse
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case totalCount = "count"
      case nextGroupURL = "next"
      case previousGroupURL = "previous"
      case sublist = "results"
   }

   /** total number of records that could be returned from exhaustive use of the URL */
   let totalCount: Int?
   /** URL that fetches the next group of records, as defined by the limit/offset URL attributes, if any. If there
       are no other launches, then the string is "null" */
   let nextGroupURL: String?
   /** URL that fetches the previous group of records, as defined by the limit/offset URL attributes, if any. If there
       are no previous launches, then the string is "null" */
   let previousGroupURL: String?
   /** Current (sub)list of records, as defined by the URL */
   let sublist: [DockingJSON]?
}
