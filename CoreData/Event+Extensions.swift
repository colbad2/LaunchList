// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 Extensions to the Core Data generated [Event] entity.
 */
extension Event
{
   /** Set< Launch > wrapper for the generated NSSet of [Launch]s. */
   var launchesSet: Set< Launch > { self.launches as? Set< Launch > ?? Set< Launch >() }

   /** Set< Expedition > wrapper for the generated NSSet of [Expedition]s. */
   var expeditionsSet: Set< Expedition > { self.expeditions as? Set< Expedition > ?? Set< Expedition >() }

   /** Set< Program > wrapper for the generated NSSet of [Program]s. */
   var programsSet: Set< Program > { self.programs as? Set< Program > ?? Set< Program >() }

   /** Set< SpaceStation > wrapper for the generated NSSet of [SpaceStation]s. */
   var spaceStationsSet: Set< SpaceStation > { self.spaceStations as? Set< SpaceStation > ?? Set< SpaceStation >() }

   /** Array of [Launch]s, sorted by name. */
   var sortedLaunches: [Launch] { sortLaunchesByName( launchArray: Array( self.launchesSet ) ) }

   /** True if the [Event] has any [Launch]s. */
   var hasLaunches: Bool { !launchesSet.isEmpty }

   /** Array of [Expedition]s, sorted by name. */
   var sortedExpeditions: [Expedition] { sortExpeditionsByName( expeditionArray: Array( self.expeditionsSet ) ) }

   /** True if the [Event] has any [Expeditions]s. */
   var hasExpeditions: Bool { !expeditionsSet.isEmpty }

   /** Array of [Program]s, sorted by name. */
   var sortedPrograms: [Program] { sortProgramsByName( programArray: Array( self.programsSet ) ) }

   /** True if the [Event] has any [Program]s. */
   var hasPrograms: Bool { !programsSet.isEmpty }

   /** Array of [SpaceStation]s, sorted by name. */
   var sortedSpaceStations: [SpaceStation] { sortSpaceStationsByName( spaceStationArray: Array( self.spaceStationsSet ) ) }

   /** True if the [Event] has any [SpaceStation]s. */
   var hasSpaceStations: Bool { !spaceStationsSet.isEmpty }
}

/**
 Returns a sorted version of the given [Event] array.

 - parameter eventArray - list of [Event]s to sort
 - returns: sorted version of the given [Event] list
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

public func getEvent( by id: Int64, context: NSManagedObjectContext ) -> Event?
{
   return getEntityByID( entityID: id, context: context, entityName: "Event" ) as? Event
}

public func fetchEvent( event: EventJSON, context: NSManagedObjectContext ) -> Event
{
   let eventEntity: Event? = getEvent( by: event.id, context: context )
   event.updateEntity( entity: eventEntity, context: context )
   return eventEntity ?? event.addToCoreData( context: context )
}

public func getEventCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "Event", context: context )
}
