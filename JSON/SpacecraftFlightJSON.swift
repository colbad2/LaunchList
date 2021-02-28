// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 ### Spec
       id            integer
       url           string($uri)
       destination   string,             maxLength: 255,   x-nullable: true
       mission_end   string($date-time), x-nullable: true
       spacecraft    Spacecraft{...}
       launch        Launch{...}
       launch_crew   [AstronautFlight{...}]
       onboard_crew   [AstronautFlight{...}]
       landing_crew   [AstronautFlight{...}]
       docking_events   [DockingEvent{...}]
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

   /**
    Add this data to Core Data as a `SpacecraftFlight` entity. The context still needs to be saved after the add.

    - parameter context: Core Data context to add the entity to.
    - returns: the added entity
    */
   public func addToCoreData( context: NSManagedObjectContext ) -> SpacecraftFlight
   {
      let newSpacecraftFlight: SpacecraftFlight = SpacecraftFlight( context: context )
      updateEntity( entity: newSpacecraftFlight, context: context )

      return newSpacecraftFlight
   }

   /**
    Set or update the values of the `SpacecraftFlight` entity,

    - parameter entity: `SpacecraftFlight?` entity to fill/update
    - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
    */
   public func updateEntity( entity: SpacecraftFlight?, context: NSManagedObjectContext )
   {
      guard let flightEntity = entity else { return }

      flightEntity.id = id
      flightEntity.destination = destination
      flightEntity.missionEnd = missionEnd
      flightEntity.addSpacecraftFromJSON( spacecraft: spacecraft, context: context )
      flightEntity.addLaunchFromJSON( launch: self.launch, context: context )
      flightEntity.addLaunchCrewFromJSON( crew: self.launchCrew, context: context )
      flightEntity.addOnboardCrewFromJSON( crew: self.onboardCrew, context: context )
      flightEntity.addLandingCrewFromJSON( crew: self.landingCrew, context: context )
      flightEntity.addDockingEventsFromJSON( dockingEvents: self.dockingEvents, context: context )

      flightEntity.fetched = Date()
   }
}
