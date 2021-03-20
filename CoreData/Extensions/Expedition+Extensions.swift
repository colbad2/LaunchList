// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for `Expedition`. */
public let EXPEDITION_ENTITY_NAME: String = "Expedition"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated `Expedition` entity.
 */
extension Expedition
{
   /** `Set< Event >` wrapper for the generated `NSSet` of `Event`s. */
   var eventsSet: Set< Event > { events as? Set< Event > ?? Set< Event >() }

   /** Array of `Event`s, sorted by name. */
   var sortedAgencies: [Event] { sortEventsByName( eventArray: Array( eventsSet ) ) }

   /** True if the `Expedition` has any `Event`s. */
   var hasAgencies: Bool { !eventsSet.isEmpty }

   /**
    Adds the JSON struct, creating or updating if necessary.

    - parameter spaceStation: `SpaceStationJSON?` JSON struct to add
    - parameter context:      `NSManagedObjectContext` context to add the JSON struct in
    */
   func addSpaceStationFromJSON( spaceStation: SpaceStationJSON?, context: NSManagedObjectContext )
   {
      if let station: SpaceStationJSON = spaceStation
      {
         let newSpaceStation: SpaceStation = fetchSpaceStation( spaceStation: station, context: context )
         self.spaceStation = newSpaceStation
         newSpaceStation.addToExpeditions( self )
      }
   }
}

/**
 Add this data to Core Data as a `Expedition` entity. The context still needs to be saved after the add.

 - parameter json:    JSON to parse
 - parameter context: Core Data context to add the entity to.
 - returns: the added entity
 */
public func addToCoreData( json: ExpeditionJSON, context: NSManagedObjectContext ) -> Expedition
{
   let newExpedition: Expedition = Expedition( context: context )
   updateEntity( json: json, entity: newExpedition, context: context )

   return newExpedition
}

/**
 Set or update the values of the `Expedition` entity,

 - parameter json:    JSON to parse
 - parameter entity: `Expedition?` entity to fill/update
 - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
 */
public func updateEntity( json: ExpeditionJSON, entity: Expedition?, context: NSManagedObjectContext )
{
   guard let expeditionEntity = entity else { return }

   expeditionEntity.id = json.id ?? -1
   expeditionEntity.name = json.name
   expeditionEntity.start = json.start
   expeditionEntity.end = json.end
   expeditionEntity.addSpaceStationFromJSON( spaceStation: json.spaceStation, context: context )

   expeditionEntity.fetched = Date()
}

/**
 Returns a name sorted version of the given `Expedition` array.

 - parameter expeditionArray: `[Expedition]?` list of `Expedition`s to sort
 - returns: `[Expedition]` sorted version of the given `Expedition` list, never nil
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

/**
 Returns a date sorted version of the given `Expedition` array.

 - parameter expeditionArray: `[Expedition]?` list of `Expedition`s to sort
 - returns: `[Expedition]` sorted version of the given `Expedition` list, never nil
 */
public func sortExpeditionsByDate( expeditionArray: [Expedition]? ) -> [Expedition]
{
   guard let expeditionArray = expeditionArray else { return [] }

   var expeditions: [Expedition] = Array( expeditionArray )
   expeditions.sort
   {
      expedition1, expedition2 in

      if let start1: String = expedition1.start,
         let start2: String = expedition2.start
      {
         return start1 < start2
      }
      else
      {
         return false
      }
   }

   return expeditions
}

/**
 Gets an `Expedition` with the given ID in the given context.

 ### Example
     let expedition: Expedition = getExpedition( by: 2345, context: context )

 - parameter entityID: `Int64` ID of the `Expedition` to fetch
 - parameter context: `NSManagedObjectContext` context to get the `Expedition` from
 - returns: `Expedition?` expedition with the given ID in the context, nil if not found
 */
public func getExpedition( by entityID: Int64, context: NSManagedObjectContext ) -> Expedition?
{
   getEntityByID( entityID: entityID, context: context, entityName: EXPEDITION_ENTITY_NAME ) as? Expedition
}

/**
 Fetches, updates, or creates a `Expedition` from the context, given the data

 - parameter expedition: `ExpeditionJSON` JSON data about the expedition
 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `Expedition` updated entity
 */
public func fetchExpedition( expedition: ExpeditionJSON, context: NSManagedObjectContext ) -> Expedition
{
   let expeditionEntity: Expedition? = getExpedition( by: expedition.id ?? -1, context: context )
   updateEntity( json: expedition, entity: expeditionEntity, context: context )
   return expeditionEntity ?? addToCoreData( json: expedition, context: context )
}

/**
 Returns the number of `Expedition` records in the given context.

 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `Int?` Number of `Expedition` records in the context
 */
public func getExpeditionCount( context: NSManagedObjectContext ) -> Int?
{
   getRecordsCount( entityName: EXPEDITION_ENTITY_NAME, context: context )
}

/**
 Delete all `Expedition` entities in the given context.

 - parameter context: `NSManagedObjectContext` context to remove entities from
 */
func deleteAllExpeditionEntities( context: NSManagedObjectContext )
{
   deleteAllEntities( entityType: EXPEDITION_ENTITY_NAME, context: context )
}
