// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 Extensions to the Core Data generated [SpaceStation] entity.
 */
extension SpaceStation
{
   /** Set< Event > wrapper for the generated NSSet of [Event]s. */
   var eventsSet: Set< Event > { self.events as? Set< Event > ?? Set< Event >() }

   /** Set< Expedition > wrapper for the generated NSSet of [Expedition]s. */
   var expeditionsSet: Set< Expedition > { self.expeditions as? Set< Expedition > ?? Set< Expedition >() }

   func sortedEventsArray() -> [Event]
   {
      return sortEventsByName( eventArray: Array( self.eventsSet ) )
   }

   func hasEvents() -> Bool
   {
      return !eventsSet.isEmpty
   }

   func sortedExpeditionsArray() -> [Expedition]
   {
      return sortExpeditionsByName( expeditionArray: Array( self.expeditionsSet ) )
   }

   func hasExpeditions() -> Bool
   {
      return !expeditionsSet.isEmpty
   }
}

/**
 Returns a sorted version of the given [SpaceStation] array.

 - parameter spaceStationArray - list of [SpaceStation]s to sort
 - returns: sorted version of the given [SpaceStation] list
 */
public func sortSpaceStationsByName( spaceStationArray: [SpaceStation]? ) -> [SpaceStation]
{
   guard let spaceStationArray = spaceStationArray else { return [] }

   var spaceStations: [SpaceStation] = Array( spaceStationArray )
   spaceStations.sort
   {
      spaceStation1, spaceStation2 in

      if let name1: String = spaceStation1.name,
         let name2: String = spaceStation2.name
      {
         return name1 < name2
      }
      else
      {
         return false
      }
   }

   return spaceStations
}

public func getSpaceStation( by entityID: Int64, context: NSManagedObjectContext ) -> SpaceStation?
{
   return getEntityByID( entityID: entityID, context: context, entityName: "SpaceStation" ) as? SpaceStation
}

public func fetchSpaceStation( spaceStation: SpaceStationJSON, context: NSManagedObjectContext ) -> SpaceStation
{
   let spaceStationEntity: SpaceStation? = getSpaceStation( by: spaceStation.id, context: context )
   spaceStation.updateEntity( entity: spaceStationEntity, context: context )
   return spaceStationEntity ?? spaceStation.addToCoreData( context: context )
}

public func getSpaceStationCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "SpaceStation", context: context )
}
