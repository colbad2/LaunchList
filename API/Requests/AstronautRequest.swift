// Copyright © 2021 Bradford Holcombe. All rights reserved.

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
      parameters = []
      addParam( name: "agency__abbrev", value: agencyAbbreviation )
      addParam( name: "agency__name", value: agencyName )
      addParam( name: "nationality", value: nationality )
      addParam( name: "status", value: status )
      addParam( name: "date_of_birth", value: dateOfBirth )
      addParam( name: "date_of_death", value: dateOfDeath )
      addParam( name: "name", value: name )
      addParam( name: "date_of_birth__gt", value: bornAfterDate )
      addParam( name: "date_of_birth__lt", value: bornBeforeDate )
      addParam( name: "date_of_birth__gte", value: bornAfterOrOnDate )
      addParam( name: "date_of_birth__lte", value: bornBeforeOrOnDate )
      addParam( name: "date_of_death__gt", value: diedAfterDate )
      addParam( name: "date_of_death__lt", value: diedBeforeDate )
      addParam( name: "date_of_death__gte", value: diedAfterOrOnDate )
      addParam( name: "date_of_death__lte", value: diedBeforeOrOnDate )

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
      super.init( baseURL: baseURL, endPoint: "astronaut/", searchTerm: searchTerm,
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
      return AstronautListRequest( baseURL: base, searchTerm: search, orderingField: ordering, limit: limit, offset: offset,
                                   agencyAbbreviation: agencyAbbreviation, agencyName: agencyName, nationality: nationality,
                                   status: status, dateOfBirth: dateOfBirth, dateOfDeath: dateOfDeath, name: name,
                                   bornAfterDate: bornAfterDate, bornBeforeDate: bornBeforeDate, bornAfterOrOnDate: bornAfterOrOnDate,
                                   bornBeforeOrOnDate: bornBeforeOrOnDate, diedAfterDate: diedAfterDate, diedBeforeDate: diedBeforeDate,
                                   diedAfterOrOnDate: diedAfterOrOnDate, diedBeforeOrOnDate: diedBeforeOrOnDate )
   }
}
