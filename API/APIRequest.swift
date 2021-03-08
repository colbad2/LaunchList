// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 Base class for all requests.
 */
public class BaseAPIRequest
{
   /** Base API URL. Here to redirect requests to test servers. */
   var base: String
   /** API end point. */
   let endPoint: String
   /** Partial URL for the request. */
   var requestURL: String
   {
      return base + endPoint + "/?"
   }
   var parameters: [String] = []

   /**
    Makes a new base API request.
    */
   init( base: String, endPoint: String )
   {
      self.base = base
      self.endPoint = endPoint
   }

   /**
    Add a URL parameter to a list of parameters.
    */
   func addParam( name: String, value: Any? )
   {
      if let okValue: Any = value { parameters.append( "\(name)=\(okValue)" ) }
   }
}

/**
 Base class for all ID requests.
 */
protocol APIListRequest
{
   /** Number of results to return per page. Max 100. */
   var limit: Int { get }
   /** The initial index from which to return the results. */
   var offset: Int { get set }

   var requestURL: String { get }

   /**
    Return the next API request, to get the next set of results.

    - parameter count: `Int?` max number of records available
    - returns: next API request based on limit/offset
    */
   func getNextRequest( count: Int? ) -> APIListRequest?

   /**
    Makes a copy of this request

    - returns: copy of this request
    */
   func copy() -> APIListRequest
}

extension APIListRequest
{
   /**
    Return the next API request, to get the next set of results.

    - parameter count: `Int?` max number of records available
    - returns: next API request based on limit/offset
    */
   func getNextRequest( count: Int? ) -> APIListRequest?
   {
      guard let launchCount: Int = count else { return nil }
      let nextOffset: Int = self.limit + self.offset
      if nextOffset > launchCount
      {
         return nil
      }

      var next: APIListRequest = self.copy()
      next.offset = self.offset + self.limit
      return next
   }
}

/**
 Base class for all list requests.
 */
public class BaseAPIListRequest: BaseAPIRequest
{
   /** Search term. */
   var search: String?
   /** Which field to use when ordering the results. */
   var ordering: String?
   /** Number of results to return per page. Max 100. */
   var limit: Int = 100
   /** The initial index from which to return the results. */
   var offset: Int = 0
   /** Partial URL for the request. */
   override var requestURL: String
   {
      var url: String = super.requestURL

      var parameters: [String] = []

      if let search: String = search { parameters.append( "search=\(search)" ) }
      if let ordering: String = ordering { parameters.append( "ordering=\(ordering)" ) }
      parameters.append( "limit=\(limit)" )
      parameters.append( "offset=\(offset)" )

      url += parameters.joined( separator: "&" )
      url += "&"

      return url
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
   init( baseURL: String, endPoint: String, searchTerm: String? = nil,
         orderingField: String? = nil, limit: Int = 100, offset: Int = 0 )
   {
      super.init( base: baseURL, endPoint: endPoint )

      self.search = searchTerm
      self.ordering = orderingField
      self.limit = limit
      self.offset = offset
   }
}

public class BaseAPIIDRequest: BaseAPIRequest
{
   /** ID of the object being fetched. */
   var id: Int64
   /** URL for the request. */
   override var requestURL: String
   {
      return super.requestURL + "id=\(id)"
   }

   /**
    Creates a request for a specific type, with a specific ID.

    - parameter baseURL: `String` base part of the constructed request URL
    - parameter endPoint: `String` API end point
    - parameter id: `Int64` ID of the type requested
    */
   init( baseURL: String, endPoint: String, id: Int64 )
   {
      self.id = id
      super.init( base: baseURL, endPoint: endPoint )
   }
}
