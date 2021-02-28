// Copyright © 2021 Bradford Holcombe. All rights reserved.

/** API end point for astronaut requests. */
private let apiEndPoint: String = "astronaut/"

/**
 Astronaut list endpoint request.
 */
public class AstronautListRequest: BaseAPIListRequest, APIListRequest
{
   var agencyAbbreviation: String?
   var agencyName: String?
   var nationality: String?
   var status: String?
   var dateOfBirth: String?
   var dateOfDeath: String?
   var name: String?
   var bornAfterDate: String?
   var bornBeforeDate: String?
   var bornAfterOrOnDate: String?
   var bornBeforeOrOnDate: String?
   var diedAfterDate: String?
   var diedBeforeDate: String?
   var diedAfterOrOnDate: String?
   var diedBeforeOrOnDate: String?
   /** URL for the request. */
   override var requestURL: String
   {
      var parameters: [String] = []
      addParameter( param: agencyAbbreviation, paramName: "agency__abbrev", parameters: &parameters )
      addParameter( param: agencyName, paramName: "agency__name", parameters: &parameters )
      addParameter( param: nationality, paramName: "nationality", parameters: &parameters )
      addParameter( param: status, paramName: "status", parameters: &parameters )
      addParameter( param: dateOfBirth, paramName: "date_of_birth", parameters: &parameters )
      addParameter( param: dateOfDeath, paramName: "date_of_death", parameters: &parameters )
      addParameter( param: name, paramName: "name", parameters: &parameters )
      addParameter( param: bornAfterDate, paramName: "date_of_birth__gt", parameters: &parameters )
      addParameter( param: bornBeforeDate, paramName: "date_of_birth__lt", parameters: &parameters )
      addParameter( param: bornAfterOrOnDate, paramName: "date_of_birth__gte", parameters: &parameters )
      addParameter( param: bornBeforeOrOnDate, paramName: "date_of_birth__lte", parameters: &parameters )
      addParameter( param: diedAfterDate, paramName: "date_of_death__gt", parameters: &parameters )
      addParameter( param: diedBeforeDate, paramName: "date_of_death__lt", parameters: &parameters )
      addParameter( param: diedAfterOrOnDate, paramName: "date_of_death__gte", parameters: &parameters )
      addParameter( param: diedBeforeOrOnDate, paramName: "date_of_death__lte", parameters: &parameters )

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
         agencyAbbreviation: String? = nil, agencyName: String? = nil, nationality: String? = nil,
         status: String? = nil, dateOfBirth: String? = nil, dateOfDeath: String? = nil, name: String? = nil,
         bornAfterDate: String? = nil, bornBeforeDate: String? = nil, bornAfterOrOnDate: String? = nil,
         bornBeforeOrOnDate: String? = nil, diedAfterDate: String? = nil, diedBeforeDate: String? = nil,
         diedAfterOrOnDate: String? = nil, diedBeforeOrOnDate: String? = nil )
   {
      super.init( baseURL: baseURL, endPoint: apiEndPoint, searchTerm: searchTerm,
                  orderingField: orderingField, limit: limit, offset: offset )

      self.agencyAbbreviation = agencyAbbreviation
      self.agencyName = agencyName
      self.nationality = nationality
      self.status = status
      self.dateOfBirth = dateOfBirth
      self.dateOfDeath = dateOfDeath
      self.name = name
      self.bornAfterDate = bornAfterDate
      self.bornBeforeDate = bornBeforeDate
      self.bornAfterOrOnDate = bornAfterOrOnDate
      self.bornBeforeOrOnDate = bornBeforeOrOnDate
      self.diedAfterDate = diedAfterDate
      self.diedBeforeDate = diedBeforeDate
      self.diedAfterOrOnDate = diedAfterOrOnDate
      self.diedBeforeOrOnDate = diedBeforeOrOnDate
   }

   /**
    Makes a copy of this request

    - returns: copy of this request
    */
   func copy() -> APIListRequest
   {
      return AstronautListRequest( baseURL: base, searchTerm: search,
                                   orderingField: ordering, limit: limit, offset: offset )
   }
}

public class AstronautRequest: BaseAPIIDRequest
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
