import Foundation

/**
 List of records returned from a URL.

 TODO genericize this
 */
public struct PadListJSON: Decodable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case totalCount = "count"
      case nextGroupURL = "next"
      case previousGroupURL = "previous"
      case sublist = "results"
   }

   // total number of records that could be returned from exhaustive use of the URL
   let totalCount: Int?
   // URL that fetches the next group of records, as defined by the limit/offset URL attributes, if any. If there
   // are no other records, then the string is "null"
   let nextGroupURL: String?
   // URL that fetches the previous group of records, as defined by the limit/offset URL attributes, if any. If there
   // are no previous records, then the string is "null"
   let previousGroupURL: String?
   // Current sublist of records, as defined by the URL
   let sublist: [PadJSON]?
}
