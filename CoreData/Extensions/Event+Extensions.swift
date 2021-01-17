// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for `Event`. */
public let EVENT_ENTITY_NAME: String = "Event"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated `Event` entity.
 */
extension Event
{
   /** `Set< Launch >` wrapper for the generated `NSSet` of `Launch`s. */
   var launchesSet: Set< Launch > { self.launches as? Set< Launch > ?? Set< Launch >() }

   /** `Set< Expedition >` wrapper for the generated `NSSet` of `Expedition`s. */
   var expeditionsSet: Set< Expedition > { self.expeditions as? Set< Expedition > ?? Set< Expedition >() }

   /** `Set< Program >` wrapper for the generated `NSSet` of `Program`s. */
   var programsSet: Set< Program > { self.programs as? Set< Program > ?? Set< Program >() }

   /** `Set< SpaceStation >` wrapper for the generated `NSSet` of `SpaceStation`s. */
   var spaceStationsSet: Set< SpaceStation > { self.spaceStations as? Set< SpaceStation > ?? Set< SpaceStation >() }

   /** Array of `Launch`s, sorted by name. */
   var sortedLaunches: [Launch] { sortLaunchesByName( launchArray: Array( self.launchesSet ) ) }

   /** True if the `Event` has any `Launch`s. */
   var hasLaunches: Bool { !launchesSet.isEmpty }

   /** Array of `Expedition`s, sorted by name. */
   var sortedExpeditions: [Expedition] { sortExpeditionsByName( expeditionArray: Array( self.expeditionsSet ) ) }

   /** True if the `Event` has any `Expeditions`s. */
   var hasExpeditions: Bool { !expeditionsSet.isEmpty }

   /** Array of `Program`s, sorted by name. */
   var sortedPrograms: [Program] { sortProgramsByName( programArray: Array( self.programsSet ) ) }

   /** True if the `Event` has any `Program`s. */
   var hasPrograms: Bool { !programsSet.isEmpty }

   /** Array of `SpaceStation`s, sorted by name. */
   var sortedSpaceStations: [SpaceStation] { sortSpaceStationsByName( spaceStationArray: Array( self.spaceStationsSet ) ) }

   /** True if the `Event` has any `SpaceStation`s. */
   var hasSpaceStations: Bool { !spaceStationsSet.isEmpty }

   /**
    Adds the JSON structs, creating or updating as necessary.

    - parameter launches: `[LaunchJSON]?` JSON structs to add
    - parameter context:  `NSManagedObjectContext` context to add the JSON struct in
    */
   func addLaunchesFromJSONList( launches: [LaunchJSON]?, context: NSManagedObjectContext )
   {
      for launch in launches ?? []
      {
         let newLaunch: Launch = fetchLaunch( launch: launch, context: context )
         self.addToLaunches( newLaunch )
         newLaunch.addToEvents( self )
      }
   }

   /**
    Adds the JSON structs, creating or updating as necessary.

    - parameter expeditions: `[ExpeditionJSON]?` JSON structs to add
    - parameter context:     `NSManagedObjectContext` context to add the JSON struct in
    */
   func addExpeditionsFromJSONList( expeditions: [ExpeditionJSON]?, context: NSManagedObjectContext )
   {
      for expedition in expeditions ?? []
      {
         let newExpedition: Expedition = fetchExpedition( expedition: expedition, context: context )
         self.addToExpeditions( newExpedition )
         newExpedition.addToEvents( self )
      }
   }

   /**
    Adds the JSON structs, creating or updating as necessary.

    - parameter spaceStations: `[SpaceStationJSON]?` JSON structs to add
    - parameter context:       `NSManagedObjectContext` context to add the JSON struct in
    */
   func addSpaceStationsFromJSONList( spaceStations: [SpaceStationJSON]?, context: NSManagedObjectContext )
   {
      for spaceStation in spaceStations ?? []
      {
         let newSpaceStations: SpaceStation = fetchSpaceStation( spaceStation: spaceStation, context: context )
         self.addToSpaceStations( newSpaceStations )
         newSpaceStations.addToEvents( self )
      }
   }

   /**
    Adds the JSON structs , creating or updating as necessary.

    - parameter programs: `[ProgramJSON]?` JSON structs to add
    - parameter context:  `NSManagedObjectContext` context to add the JSON struct in
    */
   func addProgramsFromJSONList( programs: [ProgramJSON]?, context: NSManagedObjectContext )
   {
      for program in programs ?? []
      {
         let newProgram: Program = fetchProgram( program: program, context: context )
         self.addToPrograms( newProgram )
         newProgram.addToEvents( self )
      }
   }
}

/**
 Returns a sorted version of the given `Event` array.

 - parameter eventArray: `[Event]?` list of `Event`s to sort
 - returns: `[Event]` sorted version of the given `Event` list, never nil
 */
public func sortEventsByName( eventArray: [Event]? ) -> [Event]
{
   guard let eventArray = eventArray else { return [] }

   var events: [Event] = Array( eventArray )
   events.sort
   {
      event1, event2 in

      if let name1: String = event1.name,
         let name2: String = event2.name
      {
         return name1 < name2
      }
      else
      {
         return false
      }
   }

   return events
}

/**
 Gets an `Event` with the given ID in the given context.

 ### Example
     let event: Event = getEvent( by: 2345, context: context )

 - parameter id: `Int64` ID of the `Event` to fetch
 - parameter context: `NSManagedObjectContext` context to get the `Event` from
 - returns: `Event?` event with the given ID in the context, nil if not found
 */
public func getEvent( by id: Int64, context: NSManagedObjectContext ) -> Event?
{
   return getEntityByID( entityID: id, context: context, entityName: EVENT_ENTITY_NAME ) as? Event
}

/**
 Fetches, updates, or creates a `Event` from the context, given the data

 - parameter event: `EventJSON` JSON data about the event
 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `Event` updated entity
 */
public func fetchEvent( event: EventJSON, context: NSManagedObjectContext ) -> Event
{
   let eventEntity: Event? = getEvent( by: event.id, context: context )
   event.updateEntity( entity: eventEntity, context: context )
   return eventEntity ?? event.addToCoreData( context: context )
}

/**
 Returns the number of `Event` records in the given context.

 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `Int?` Number of `Event` records in the context
 */
public func getEventCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: EVENT_ENTITY_NAME, context: context )
}

/**
 Delete all `Event` entities in the given context.

 - parameter context: `NSManagedObjectContext` context to remove entities from
 */
func deleteAllEventEntities( context: NSManagedObjectContext )
{
   deleteAllEntities( entityType: EVENT_ENTITY_NAME, context: context )
}
