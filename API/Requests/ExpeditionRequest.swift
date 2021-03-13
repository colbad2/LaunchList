// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 Expedition list endpoint request.
 */
public class ExpeditionRequest: BaseAPIListRequest, APIListRequest
{
   var agency: String? // not in previous, upcoming
   // skipped ID
   var astronaut: String?
   var name: String?
   var spaceStation: String?
   var startAfter: String?
   var startBefore: String?
   var startAfterOrOn: String?
   var startBeforeOrOn: String?
   var endAfter: String?
   var endBefore: String?
   var endAfterOrOn: String?
   var endBeforeOrOn: String?

   /** URL for the request. */
   override var requestURL: String
   {
      parameters = []
      addParam( name: "crew__astronaut__agency", value: agency )
      addParam( name: "crew__astronaut", value: astronaut )
      addParam( name: "name", value: name )
      addParam( name: "space_station", value: spaceStation )
      addParam( name: "start__gt", value: startAfter )
      addParam( name: "start__lt", value: startBefore )
      addParam( name: "start__gte", value: startAfterOrOn )
      addParam( name: "start__lte", value: startBeforeOrOn )
      addParam( name: "end__gt", value: endAfter )
      addParam( name: "end__lt", value: endBefore )
      addParam( name: "end__gte", value: endAfterOrOn )
      addParam( name: "end__lte", value: endBeforeOrOn )

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
   init( baseURL: String, searchTerm: String? = nil, ordering: String? = nil, limit: Int = 100, offset: Int = 0,
         agency: String? = nil, astronaut: String? = nil, name: String? = nil, spaceStation: String? = nil,
         startAfter: String? = nil, startBefore: String? = nil, startAfterOrOn: String? = nil, startBeforeOrOn: String? = nil,
         endAfter: String? = nil, endBefore: String? = nil, endAfterOrOn: String? = nil, endBeforeOrOn: String? = nil )
   {
      super.init( baseURL: baseURL, endPoint: "Expedition/", searchTerm: searchTerm,
                  orderingField: ordering, limit: limit, offset: offset )

      self.agency = agency
      self.astronaut = astronaut
      self.name = name
      self.spaceStation = spaceStation
      self.startAfter = startAfter
      self.startBefore = startBefore
      self.startAfterOrOn = startAfterOrOn
      self.startBeforeOrOn = startBeforeOrOn
      self.endAfter = endAfter
      self.endBefore = endBefore
      self.endAfterOrOn = endAfterOrOn
      self.endBeforeOrOn = endBeforeOrOn
   }

   /**
    Makes a copy of this request

    - returns: copy of this request
    */
   func copy() -> APIListRequest
   {
      return ExpeditionRequest( baseURL: base, searchTerm: search, limit: limit, offset: offset,
                                agency: agency, astronaut: astronaut, name: name, spaceStation: spaceStation,
                                startAfter: startAfter, startBefore: startBefore, startAfterOrOn: startAfterOrOn, startBeforeOrOn: startBeforeOrOn,
                                endAfter: endAfter, endBefore: endBefore, endAfterOrOn: endAfterOrOn, endBeforeOrOn: endBeforeOrOn )
   }
}
