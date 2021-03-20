// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 List of records returned from a URL.
 */
public struct LocationListJSON: Decodable, JSONResponse, JSONElement
{
   /** Total number of records that could be returned from exhaustive use of the URL */
   let totalCount: Int64?
   /** URL that fetches the next group of records, as defined by the limit/offset URL attributes, if any. If there
       are no other records, then the string is "null" */
   let nextGroupURL: String?
   /** URL that fetches the previous group of records, as defined by the limit/offset URL attributes, if any. If there
       are no previous records, then the string is "null" */
   let previousGroupURL: String?
   /** Current sublist of records, as defined by the URL */
   let sublist: [LocationJSON]?

   public init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      totalCount = nonNegativeInt( json[ "count" ] )
      nextGroupURL = nonEmptyString( json[ "next" ] )
      previousGroupURL = nonEmptyString( json[ "previous" ] )
      sublist = parseArray( json[ "results" ] )
   }
}
