// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 API request for spacecraft config lists.
 */
public class SpacecraftConfigRequest: BaseAPIListRequest, APIListRequest
{
   var name: String?
   var manufacturer: String?
   var inUse: String?
   var humanRated: String?

   /** The complete URL for the request. */
   override var requestURL: String
   {
      parameters = []

      addParam( name: "name", value: name )
      addParam( name: "manufacturer", value: manufacturer )
      addParam( name: "in_use", value: inUse )
      addParam( name: "human_rated", value: humanRated )

      return super.requestURL + parameters.joined( separator: "&" )
   }

   /**
    Creates a request for a list of specific types.

    - parameter baseURL:       `String` base part of the constructed request URL
    - parameter searchTerm:    `String` search term to filter by
    - parameter orderingField: `String` which field to order by (can only be 'id' or 'name')
    - parameter limit:         `Int` limit of records to return (max 100)
    - parameter offset:        `Int` starting index of the types returned
    - parameter name:          `String` spacecraft name
    - parameter manufacturer:  `String` spacecraft manufacturer
    - parameter inUse:         `String`
    - parameter humanRated:    `String`
    */
   init( baseURL: String, searchTerm: String? = nil,
         orderingField: String? = nil, limit: Int = 100, offset: Int = 0,
         name: String? = nil, manufacturer: String? = nil, inUse: String? = nil,
         humanRated: String? = nil )
   {
      super.init( baseURL: baseURL, endPoint: "astronaut/", searchTerm: searchTerm, orderingField: orderingField,
                  limit: limit, offset: offset )

      self.name = name
      self.manufacturer = manufacturer
      self.inUse = inUse
      self.humanRated = humanRated
   }

   func copy() -> APIListRequest
   {
      SpacecraftConfigRequest( baseURL: base, searchTerm: search, orderingField: ordering, limit: limit, offset: offset,
                               name: name, manufacturer: manufacturer, inUse: inUse, humanRated: humanRated )
   }
}
