// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 ### Example JSON

 ### Spec
       id               integer readOnly: true
       url              string($uri) readOnly: true
       launch_id*       string minLength: 1
       docking*         string($date-time)
       departure        string($date-time) x-nullable: true
       flight_vehicle   SpacecraftFlightSerializerForDockingEvent{...}
       docking_location DockingLocation{...}
       space_station    SpaceStation{}
 */
public class DockingEventJSON: Decodable, Identifiable, JSONElement
{
   public let id: Int64
   let url: String?
   let launchID: String?
   let docking: String?
   let departure: String?
   let flightVehicle: SpacecraftFlightJSON?
   let dockingLocation: IDNameJSON?
   var spacestation: SpaceStationJSON?

   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.url = json[ "url" ] as? String
      self.launchID = json[ "launch_id" ] as? String
      self.docking = json[ "docking" ] as? String
      self.departure = json[ "departure" ] as? String
      self.flightVehicle = SpacecraftFlightJSON( json: json[ "flight_vehicle" ] as? JSONStructure )
      self.dockingLocation = IDNameJSON( json: json[ "docking_location" ] as? JSONStructure )
      self.spacestation = SpaceStationJSON( json: json[ "docking_location" ] as? JSONStructure )
   }
}
