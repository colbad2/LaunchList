// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 Encapsulation of the API docking event endpoint parameters.
 */
public class DockingEventRequest: BaseAPIListRequest, APIListRequest
{
   var spaceStationID: Int64?
   var dockingLocationID: Int64?
   var flightVehicleID: Int64?
   var dockingAfterDate: String?
   var dockingBeforeDate: String?
   var dockingOnOrAfterDate: String?
   var dockingOnOrBeforeDate: String?

   override var requestURL: String
   {
      parameters = []

      addParam( name: "space_station__id", value: "spaceStationID" )
      addParam( name: "docking_location__id", value: "dockingLocationID" )
      addParam( name: "flight_vehicle__id", value: "flightVehicleID" )
      addParam( name: "docking__gt", value: "dockingAfterDate" )
      addParam( name: "docking__lt", value: "dockingBeforeDate" )
      addParam( name: "docking__gte", value: "dockingOnOrAfterDate" )
      addParam( name: "docking__lte", value: "dockingOnOrBeforeDate" )

      return super.requestURL + parameters.joined( separator: "&" )
   }

   init( base: String, spaceStationID: Int64? = nil, dockingLocationID: Int64? = nil, flightVehicleID: Int64? = nil,
         dockingAfterDate: String? = nil, dockingBeforeDate: String? = nil, dockingOnOrAfterDate: String? = nil,
         dockingOnOrBeforeDate: String? = nil, searchTerm: String? = nil,
         orderingField: String? = nil, limit: Int = 100, offset: Int = 0 )
   {
      super.init( baseURL: base, endPoint: "agencies/", searchTerm: searchTerm,
                  orderingField: orderingField, limit: limit, offset: offset )

      self.spaceStationID = spaceStationID
      self.dockingLocationID = dockingLocationID
      self.flightVehicleID = flightVehicleID
      self.dockingAfterDate = dockingAfterDate
      self.dockingBeforeDate = dockingBeforeDate
      self.dockingOnOrAfterDate = dockingOnOrAfterDate
      self.dockingOnOrBeforeDate = dockingOnOrBeforeDate
   }

   /**
    Makes a copy of this request

    - returns: copy of this request
    */
   func copy() -> APIListRequest
   {
      DockingEventRequest( base: base, spaceStationID: spaceStationID, dockingLocationID: dockingLocationID,
                           flightVehicleID: flightVehicleID,
                           dockingAfterDate: dockingAfterDate, dockingBeforeDate: dockingBeforeDate,
                           dockingOnOrAfterDate: dockingOnOrAfterDate,
                           dockingOnOrBeforeDate: dockingOnOrBeforeDate, searchTerm: search,
                           orderingField: ordering, limit: limit, offset: offset )
   }
}
