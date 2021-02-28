// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 API request for spacecraft config lists.

 - see `ConfigRequest`
 */
public class SpacecraftConfigRequest: ConfigListRequest
{
   var name: String?
   var manufacturer: String?
   var inUse: String?
   var humanRated: String?
   /** The complete URL for the request. */
   override var requestURL: String
   {
      var url: String = super.requestURL
      var parameters: [String] = []

      if let name: String = name { parameters.append( "name=\(name)" ) }
      if let manufacturer: String = manufacturer { parameters.append( "manufacturer=\(manufacturer)" ) }
      if let inUse: String = inUse { parameters.append( "in_use=\(inUse)" ) }
      if let humanRated: String = humanRated { parameters.append( "human_rated=\(humanRated)" ) }

      if !parameters.isEmpty
      {
         url += "&"
         url += parameters.joined( separator: "&" )
      }

      return url
   }

   // MARK: Constructors

   /**
    Creates a request for a list of specific types.

    - parameter baseURL: `String` base part of the constructed request URL
    - parameter searchTerm: `String` search term to filter by
    - parameter orderingField: `String` which field to order by (can only be 'id' or 'name')
    - parameter limit: `Int` limit of records to return (max 100)
    - parameter offset: `Int` starting index of the types returned
    - parameter name: `String` spacecraft name
    - parameter manufacturer: `String` spacecraft manufacturer
    - parameter inUse: `String`
    - parameter humanRated: `String`
    */
   init( baseURL: String, searchTerm: String? = nil,
         orderingField: String? = nil, limit: Int = 100, offset: Int = 0,
         name: String? = nil, manufacturer: String? = nil, inUse: String? = nil,
         humanRated: String? = nil )
   {
      super.init( baseURL: baseURL, requestType: .spacecraft, searchTerm: searchTerm, orderingField: orderingField,
                  limit: limit, offset: offset )

      self.name = name
      self.manufacturer = manufacturer
      self.inUse = inUse
      self.humanRated = humanRated
   }
}
