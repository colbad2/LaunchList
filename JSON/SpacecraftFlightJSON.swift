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
public class SpacecraftFlightJSON: Decodable, Identifiable, JSONElement, AutoEquatable, AutoHashable
{
   /** ID of the astronaut within the API. */
   public var id: Int64
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

    - parameter json: `JSONStructure` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.url = json[ "url" ] as? String
      self.destination = json[ "destination" ] as? String
      self.missionEnd = json[ "mission_end" ] as? String
      self.spacecraft = SpacecraftJSON( json: json[ "spacecraft" ] as? JSONStructure )
      self.launch = LaunchJSON( json: json[ "launch" ] as? JSONStructure )
      self.launchCrew = ( json[ "launch_crew" ] as? [JSONStructure] ?? [] ).compactMap { return AstronautFlightJSON( json: $0 ) }
      self.onboardCrew = ( json[ "onboard_crew" ] as? [JSONStructure] ?? [] ).compactMap { return AstronautFlightJSON( json: $0 ) }
      self.landingCrew = ( json[ "landing_crew" ] as? [JSONStructure] ?? [] ).compactMap { return AstronautFlightJSON( json: $0 ) }
      self.dockingEvents = ( json[ "docking_events" ] as? [JSONStructure] ?? [] ).compactMap { return DockingEventJSON( json: $0 ) }
   }
}
