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
public class DockingJSON: Decodable, Identifiable, JSONElement
{
   /** ID of the astronaut within the API. */
   public var id: Int64
   /** URI of this data. Unused. */
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

    - parameter json: `JSONStructure` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.url = json[ "url" ] as? String
      self.launchID = json[ "launchId" ] as? String
      self.docking = json[ "docking" ] as? String
      self.dockingLocationName = json[ "dockingLocationName" ] as? String
      self.departure = json[ "departure" ] as? String
      self.flightVehicle = FlightVehicleJSON( json: json[ "flightVehicle" ] as? JSONStructure )
      self.dockingLocation = IDNameJSON( json: json[ "dockingLocation" ] as? JSONStructure )
   }
}
