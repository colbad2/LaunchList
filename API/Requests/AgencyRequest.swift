// Copyright © 2021 Bradford Holcombe. All rights reserved.

/** API end point for agency requests. */
private let apiEndPoint: String = "agencies/"

/**
 Agency list endpoint request.
 */
public class AgencyListRequest: BaseAPIListRequest, APIListRequest
{
   var featured: String?
   var agencyType: String?
   var countryCode: String?
   var mode: APIRequestMode = .detailed
   /** URL for the request. */
   override var requestURL: String
   {
      var parameters: [String] = []
      addParameter( param: featured, paramName: "featured", parameters: &parameters )
      addParameter( param: agencyType, paramName: "agency_type", parameters: &parameters )
      addParameter( param: countryCode, paramName: "country_code", parameters: &parameters )
      addParameter( param: mode, paramName: "mode", parameters: &parameters )

      return super.requestURL + parameters.joined( separator: "&" )
   }

   /**
    Creates a request for a list of specific types.

    - parameter baseURL: `String` base part of the constructed request URL
    - parameter requestType: `ConfigRequestMode` what type is being requested
    - parameter searchTerm: `String` search term to filter by
    - parameter orderingField: `String` which field to order by (can only be 'id' or 'name')
    - parameter limit: `Int` limit of records to return (max 100)
    - parameter offset: `Int` starting index of the types returned
    */
   init( baseURL: String, searchTerm: String? = nil,
         orderingField: String? = nil, limit: Int = 100, offset: Int = 0,
         featured: String? = nil, agencyType: String? = nil, countryCode: String? = nil )
   {
      super.init( baseURL: baseURL, endPoint: apiEndPoint, searchTerm: searchTerm,
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
                                orderingField: ordering, limit: limit, offset: offset )
   }
}

public class AgencyRequest: BaseAPIIDRequest
{
   /**
    Creates a request for a specific type, with a specific ID.

    - parameter baseURL: `String` base part of the constructed request URL
    - parameter id: `Int64` ID of the type requested
    */
   init( baseURL: String, id: Int64 )
   {
      super.init( baseURL: baseURL, endPoint: apiEndPoint, id: id )
   }
}

/**
 Parse the raw JSON returned from an agency list request.

 - parameter json: `JSONStructure` raw JSON to parse
 - returns: list of `AgencyJSON`
 */
public func parseAgencyListResponse( json: JSONStructure ) -> [AgencyJSON]
{
   var data: [AgencyJSON] = []
   if let dataArray: [JSONStructure] = json[ "sublist" ] as? [JSONStructure]
   {
      data = dataArray.compactMap { return AgencyJSON( $0 ) }
   }

   return data
}
