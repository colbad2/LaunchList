// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 ### Example JSON
       {
         "id": 100,
         "url": "https://ll.thespacedevs.com/2.1.0/docking_event/100/",
         "launch_id": "349eb56f-50e8-4858-9977-e4b7121c40f5",
         "docking": "2009-10-02T08:35:00Z",
         "departure": "2010-03-18T08:03:00Z",
         "flight_vehicle": { … },
         "docking_location": { … }
       }
 */
public class DockingJSON: Identifiable, JSONElement
{
   /** ID of the astronaut within the API. */
   public var id: Int64?
   /** URI of this data. */
   var url: String?
   var launchID: String?
   /** Docking date. */
   var docking: String?
   /** Docking position. */
   var dockingLocationName: String?
   /** Undocking date. */
   var departure: String?
   /** Vehicle docked. */
   var flightVehicle: FlightVehicleJSON?
   /** Docking position details. */
   var dockingLocation: IDNameJSON?

   /**
    Make a `DockingJSON` from a JSON structure.

    - parameter json: `Any` JSON to parse
    */
   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      self.id = nonNegativeInt( json[ "id" ] )
      self.url = nonEmptyString( json[ "url" ] )
      self.launchID = nonEmptyString( json[ "launchId" ] )
      self.docking = nonEmptyString( json[ "docking" ] )
      self.dockingLocationName = nonEmptyString( json[ "dockingLocationName" ] )
      self.departure = nonEmptyString( json[ "departure" ] )
      self.flightVehicle = FlightVehicleJSON( json[ "flightVehicle" ] )
      self.dockingLocation = IDNameJSON( json[ "dockingLocation" ] )
   }
}
