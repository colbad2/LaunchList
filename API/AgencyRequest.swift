// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 Encapsulation of the API agency endpoint parameters.
 */
struct AgencyRequest: APIRequest
{
   var base: String
   var endPoint: String
   var featured: String?
   var agencyType: String?
   var countryCode: String?
   var search: String?
   var ordering: String?
   var limit: Int = 100
   var offset: Int = 0
   var mode: APIRequestMode = .detailed

   var requestURL: String
   {
      var url: String = base + endPoint // "agencies/?"

      var parameters: [String] = []

      if let featured: String = featured { parameters.append( "featured=\(featured)" ) }
      if let agencyType: String = agencyType { parameters.append( "agency_type=\(agencyType)" ) }
      if let countryCode: String = countryCode { parameters.append( "country_code=\(countryCode)" ) }
      if let search: String = search { parameters.append( "search=\(search)" ) }
      if let ordering: String = ordering { parameters.append( "ordering=\(ordering)" ) }
      parameters.append( "limit=\(limit)" )
      parameters.append( "offset=\(offset)" )
      parameters.append( "mode=\(mode)" )

      url += parameters.joined( separator: "&" )

      return url
   }
}

// preserves auto-generated init
extension AgencyRequest
{
   init( base: String, endPoint: String, limit: Int = 100, offset: Int = 0 )
   {
      self.base = base
      self.endPoint = endPoint + "?"

      self.featured = nil
      self.agencyType = nil
      self.countryCode = nil
      self.search = nil
      self.ordering = nil
      self.limit = limit
      self.offset = offset
      self.mode = .detailed
   }
}
