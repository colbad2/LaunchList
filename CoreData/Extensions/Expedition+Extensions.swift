// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 Extensions to the Core Data generated [Expedition] entity.
 */
extension Expedition
{
   /** Set< Event > wrapper for the generated NSSet of [Event]s. */
   var eventsSet: Set< Event > { self.events as? Set< Event > ?? Set< Event >() }

   /** Array of [Event]s, sorted by name. */
   var sortedAgencies: [Event] { return sortEventsByName( eventArray: Array( self.eventsSet ) ) }

   /** True if the [Expedition] has any [Event]s. */
   var hasAgencies: Bool { return !eventsSet.isEmpty }
}

/**
 Returns a sorted version of the given [Expedition] array.

 - parameter expeditionArray - list of [Expedition]s to sort
 - returns: sorted version of the given [Expedition] list
 */
public func sortExpeditionsByName( expeditionArray: [Expedition]? ) -> [Expedition]
{
   guard let expeditionArray = expeditionArray else { return [] }

   var expeditions: [Expedition] = Array( expeditionArray )
   expeditions.sort
   {
      expedition1, expedition2 in

      if let name1: String = expedition1.name,
         let name2: String = expedition2.name
      {
         return name1 < name2
      }
      else
      {
         return false
      }
   }

   return expeditions
}

public func getExpedition( by entityID: Int64, context: NSManagedObjectContext ) -> Expedition?
{
   return getEntityByID( entityID: entityID, context: context, entityName: "Expedition" ) as? Expedition
}

public func fetchExpedition( expedition: ExpeditionJSON, context: NSManagedObjectContext ) -> Expedition
{
   let expeditionEntity: Expedition? = getExpedition( by: expedition.id, context: context )
   expedition.updateEntity( entity: expeditionEntity, context: context )
   return expeditionEntity ?? expedition.addToCoreData( context: context )
}

/**
 Returns the number of [Expedition] records in the given context.

 - parameter context: Core Data object context
 - returns: [Int?] Number of [Expedition] records in the context
 */
public func getExpeditionCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "Expedition", context: context )
}