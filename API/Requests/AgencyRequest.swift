// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 Agency list endpoint request.
 */
public class AgencyListRequest: BaseAPIListRequest, APIListRequest
{
   var featured: String?
   var agencyType: String?
   var countryCode: String?

   /** URL for the request. */
   override var requestURL: String
   {
      parameters = []
      addParam( name: "featured", value: featured )
      addParam( name: "agency_type", value: agencyType )
      addParam( name: "country_code", value: countryCode )

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
   init( baseURL: String, searchTerm: String? = nil, orderingField: String? = nil, limit: Int = 100, offset: Int = 0,
         featured: String? = nil, agencyType: String? = nil, countryCode: String? = nil )
   {
      super.init( baseURL: baseURL, endPoint: "agencies/", searchTerm: searchTerm,
                  orderingField: orderingField, limit: limit, offset: offset )

      self.featured = featured
      self.agencyType = agencyType
      self.countryCode = countryCode
   }

   /**
    Makes a copy of this request

    - returns: copy of this request
    */
   func copy() -> APIListRequest
   {
      return AgencyListRequest( baseURL: base, searchTerm: search,
                                orderingField: ordering, limit: limit, offset: offset,
                                featured: featured, agencyType: agencyType, countryCode: countryCode )
   }
}
