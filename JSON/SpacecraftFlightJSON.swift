// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 ### Spec (API models: SpacecraftFlight, SpacecraftFlightSerializerForDockingEvent,
                         SpacecraftFlightDetailedSerializerForLaunch, SpacecraftFlightDetailed,
                         SpacecraftFlightForDockingEvent)
       id*           integer
       url           string($uri)
       destination   string,             maxLength: 255,   x-nullable: true
       mission_end   string($date-time), x-nullable: true
       spacecraft    Spacecraft{...} or SpacecraftDetailedNoFlights{}
       launch        Launch{...} or LaunchSerializerCommon
       launch_crew   [AstronautFlight{...}]
       onboard_crew   [AstronautFlight{...}]
       landing_crew   [AstronautFlight{...}]
       docking_events   [DockingEvent{...}] or DockingEventSerializerForSpacecraftFlight[]
 */
public class SpacecraftFlightJSON: Identifiable, JSONElement, AutoEquatable, AutoHashable
{
   /** ID of the spacecraft flight within the API. */
   public var id: Int64?
   /** URI of this data. Unused. */
   var url: String? // URL
   let destination: String?
   let missionEnd: String?
   let spacecraft: SpacecraftJSON?
   let launch: LaunchJSON?
   var launchCrew: [AstronautFlightJSON] = []
   var onboardCrew: [AstronautFlightJSON] = []
   var landingCrew: [AstronautFlightJSON] = []
   var dockingEvents: [DockingEventJSON] = []

   /**
    Make a `SpacecraftFlightJSON` from a JSON structure.

    - parameter json: `Any` JSON to parse
    */
   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      self.id = nonNegativeInt( json[ "id" ] )
      self.url = nonEmptyString( json[ "url" ] )
      self.destination = nonEmptyString( json[ "destination" ] )
      self.missionEnd = nonEmptyString( json[ "mission_end" ] )
      self.spacecraft = SpacecraftJSON( json[ "spacecraft" ] )
      self.launch = LaunchJSON( json[ "launch" ] )
      self.launchCrew = parseArray( json[ "launch_crew" ] )
      self.onboardCrew = parseArray( json[ "onboard_crew" ] )
      self.landingCrew = parseArray( json[ "landing_crew" ] )
      self.dockingEvents = parseArray( json[ "docking_events" ] )
   }
}
