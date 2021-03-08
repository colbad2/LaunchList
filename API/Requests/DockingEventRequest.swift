// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 Encapsulation of the API docking event endpoint parameters.
 */
public class DockingEventRequest: BaseAPIListRequest
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
      var parameters: [String] = []

      if let spaceStationID: Int64 = spaceStationID { parameters.append( "space_station__id=\(spaceStationID)" ) }
      if let dockingLocationID: Int64 = dockingLocationID { parameters.append( "docking_location__id=\(dockingLocationID)" ) }
      if let flightVehicleID: Int64 = flightVehicleID { parameters.append( "flight_vehicle__id=\(flightVehicleID)" ) }
      if let dockingAfterDate: String = dockingAfterDate { parameters.append( "docking__gt=\(dockingAfterDate)" ) }
      if let dockingBeforeDate: String = dockingBeforeDate { parameters.append( "docking__lt=\(dockingBeforeDate)" ) }
      if let dockingOnOrAfterDate: String = dockingOnOrAfterDate { parameters.append( "docking__gte=\(dockingOnOrAfterDate)" ) }
      if let dockingOnOrBeforeDate: String = dockingOnOrBeforeDate { parameters.append( "docking__lte=\(dockingOnOrBeforeDate)" ) }

      return super.requestURL + parameters.joined( separator: "&" )
   }

   init( base: String, endPoint: String,
         spaceStationID: Int64? = nil, dockingLocationID: Int64? = nil, flightVehicleID: Int64? = nil,
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

   public func parseResponse( json: JSONStructure ) -> [ DockingEventJSON ]
   {
      var data: [DockingEventJSON] = []
      if let dataArray: [JSONStructure] = json[ "sublist" ] as? [JSONStructure]
      {
         data = dataArray.compactMap { return DockingEventJSON( $0 ) }
      }

      return data
   }
}
