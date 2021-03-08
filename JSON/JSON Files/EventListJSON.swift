// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 List of records returned from a URL.
 */
public struct EventListJSON: JSONResponse, JSONElement
{
   // total number of records that could be returned from exhaustive use of the URL
   let totalCount: Int64?
   // URL that fetches the next group of records, as defined by the limit/offset URL attributes, if any. If there
   // are no other records, then the string is "null"
   let nextGroupURL: String?
   // URL that fetches the previous group of records, as defined by the limit/offset URL attributes, if any. If there
   // are no previous records, then the string is "null"
   let previousGroupURL: String?
   // Current sublist of records, as defined by the URL
   let sublist: [EventJSON]?

   public init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      self.totalCount = nonNegativeInt( json[ "count" ] )
      self.nextGroupURL = nonEmptyString( json[ "next" ] )
      self.previousGroupURL = nonEmptyString( json[ "previous" ] )
      self.sublist = parseArray( json[ "info_url" ] )
   }
}
