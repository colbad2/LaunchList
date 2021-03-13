// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 Event list endpoint request.
 */
public class EventRequest: BaseAPIListRequest, APIListRequest
{
   var slug: String? // not in previous, upcoming
   // skipped ID
   var type: String?
   var program: String?

   /** URL for the request. */
   override var requestURL: String
   {
      parameters = []
      addParam( name: "slug", value: slug )
      addParam( name: "type", value: type )
      addParam( name: "program", value: program )

      return super.requestURL + parameters.joined( separator: "&" )
   }

   /**
    Creates a request for a list of specific types.

    - parameter baseURL:       `String` base part of the constructed request URL
    - parameter requestType:   `ConfigRequestMode` what type is being requested
    - parameter searchTerm:    `String` search term to filter by
    - parameter orderingField: `String` which field to order by (can only be 'id' or 'name')
    - parameter limit:         `Int` limit of records to return (max 100)
    - parameter offset:        `Int` starting index of the types returned
    */
   init( baseURL: String, searchTerm: String? = nil, limit: Int = 100, offset: Int = 0,
         slug: String? = nil, type: String? = nil, program: String? = nil )
   {
      super.init( baseURL: baseURL, endPoint: "event/", searchTerm: searchTerm,
                  orderingField: nil, limit: limit, offset: offset )

      self.slug = slug
      self.type = type
      self.program = program
   }

   /**
    Makes a copy of this request

    - returns: copy of this request
    */
   func copy() -> APIListRequest
   {
      return EventRequest( baseURL: base, searchTerm: search, limit: limit, offset: offset,
                           slug: slug, type: type, program: program )
   }
}
