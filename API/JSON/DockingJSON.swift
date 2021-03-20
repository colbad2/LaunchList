// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 ### Example JSON

 ### Spec (API model: DockingEvent, DockingEventDetailed, DockingEventSerializerForSpacecraftFlight,
            DockingEventDetailedSerializerForSpacestation)
       id               integer
       url              string($uri)
       launch_id*       string minLength: 1
       docking*         string($date-time) x-nullable: true
       flight_vehicle   SpacecraftFlightSerializerForDockingEvent{...} or SpacecraftFlightForDockingEvent{...}
       docking_location DockingLocation{...}
       space_station (or spacestation)    SpaceStation{} or SpaceStationSerializerForDockingEvent{}, SpaceStationSerializerForCommon{}
       departure        string($date-time)
 */
public class DockingJSON: Identifiable, JSONElement
{
   public let id: Int64?
   let url: String?
   let launchID: String?
   let docking: String?
   let departure: String?
   let flightVehicle: SpacecraftFlightJSON?
   let dockingLocation: IDNameJSON?
   var spacestation: SpaceStationJSON?

   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      id = nonNegativeInt( json[ "id" ] )
      url = nonEmptyString( json[ "url" ] )
      launchID = nonEmptyString( json[ "launch_id" ] )
      docking = nonEmptyString( json[ "docking" ] )
      departure = nonEmptyString( json[ "departure" ] )
      flightVehicle = SpacecraftFlightJSON( json[ "flight_vehicle" ] )
      dockingLocation = IDNameJSON( json[ "docking_location" ] )

      var spaceStationJSON: Any? = json[ "space_station" ]
      if spaceStationJSON == nil
      {
         spaceStationJSON = json[ "spacestation" ]
      }
      spacestation = SpaceStationJSON( spaceStationJSON )
   }
}
