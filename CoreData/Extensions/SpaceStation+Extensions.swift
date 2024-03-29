// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for `SpaceStation`. */
public let SPACESTATION_ENTITY_NAME: String = "SpaceStation"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated `SpaceStation` entity.
 */
extension SpaceStation
{
   /** `Set< Event >` wrapper for the generated `NSSet` of `Event`s. */
   var eventsSet: Set< Event > { events as? Set< Event > ?? Set< Event >() }

   /** `Set< Expedition >` wrapper for the generated `NSSet` of `Expedition`s. */
   var expeditionsSet: Set< Expedition > { expeditions as? Set< Expedition > ?? Set< Expedition >() }

   /** Array of `Event`s, sorted by name. */
   var sortedEvents: [Event] { sortEventsByName( eventArray: Array( eventsSet ) ) }

   /** True if the `SpaceStation` has any `Event`s. */
   var hasEvents: Bool { !eventsSet.isEmpty }

   /** Array of `Expedition`s, sorted by name. */
   var sortedExpeditions: [Expedition] { sortExpeditionsByName( expeditionArray: Array( expeditionsSet ) ) }

   /** True if the `SpaceStation` has any `Expedition`s. */
   var hasExpeditions: Bool { !expeditionsSet.isEmpty }

   /**
    Adds the JSON structs, creating or updating as necessary.

    - parameter owners: `[AgencyJSON]?` JSON struct to add
    - parameter context:  `NSManagedObjectContext` context to add the JSON struct in
    */
   func addOwnersFromJSON( owners: [AgencyJSON]?, context: NSManagedObjectContext )
   {
      for owner in owners ?? []
      {
         let agencyEntity: Agency = fetchAgency( agency: owner, context: context )
         self.addToOwners( agencyEntity )
         agencyEntity.addToSpaceStations( self )
      }
   }

   /**
    Adds the JSON structs, creating or updating as necessary.

    - parameter expeditions: `[ExpeditionJSON]?` JSON struct to add
    - parameter context:  `NSManagedObjectContext` context to add the JSON struct in
    */
   func addExpeditionsFromJSON( expeditions: [ExpeditionJSON]?, context: NSManagedObjectContext )
   {
      for expedition in expeditions ?? []
      {
         let expeditionEntity: Expedition = fetchExpedition( expedition: expedition, context: context )
         self.addToExpeditions( expeditionEntity )
         expeditionEntity.spaceStation = self
      }
   }
}

/**
 Add this data to Core Data as a `SpaceStation` entity. The context still needs to be saved after the add.

 - parameter json:    JSON to parse
 - parameter context: Core Data context to add the entity to.
 - returns: the added entity
 */
public func addToCoreData( json: SpaceStationJSON, context: NSManagedObjectContext ) -> SpaceStation
{
   let newSpaceStation: SpaceStation = SpaceStation( context: context )
   updateEntity( json: json, entity: newSpaceStation, context: context )

   return newSpaceStation
}

/**
 Set or update the values of the `SpaceStation` entity,

 - parameter json:    JSON to parse
 - parameter entity: `SpaceStation?` entity to fill/update
 - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
 */
public func updateEntity( json: SpaceStationJSON, entity: SpaceStation?, context: NSManagedObjectContext )
{
   guard let spaceStationEntity = entity else { return }

   spaceStationEntity.id = json.id ?? -1
   spaceStationEntity.name = json.name
   spaceStationEntity.status = json.status?.name
   spaceStationEntity.statusName = json.status?.name
   spaceStationEntity.statusAbbreviation = json.status?.abbreviation
   spaceStationEntity.statusDescription = json.status?.description
   spaceStationEntity.orbit = json.orbit
   spaceStationEntity.imageURL = json.imageURL
   spaceStationEntity.founded = json.founded
   spaceStationEntity.spaceStationDescription = json.spaceStationDescription
   spaceStationEntity.addOwnersFromJSON( owners: json.owners, context: context )
   spaceStationEntity.type = json.type
   spaceStationEntity.deorbited = json.deorbited
   spaceStationEntity.addExpeditionsFromJSON( expeditions: json.activeExpeditions, context: context )

   spaceStationEntity.fetched = Date()
}

/**
 Gets all the `SpaceStation` entities in the context

 - parameter context:  `NSManagedObjectContext` context to get the `SpaceStation`s from
 - returns: `[SpaceStation]?` list of space stations, nil if not possible
 */
public func fetchAllSpaceStations( context: NSManagedObjectContext ) -> [SpaceStation]?
{
   fetchAllEntities( entityName: SPACESTATION_ENTITY_NAME, context: context ) as? [ SpaceStation ]
}

/**
 Returns a sorted version of the given `SpaceStation` array.

 - parameter spaceStationArray: `[SpaceStation]?` list of `SpaceStation`s to sort
 - returns: `[SpaceStation]` sorted version of the given `SpaceStation` list
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

/**
 Gets a `SpaceStation` with the given ID in the given context.

 ### Example
     let spaceStation: SpaceStation = getSpaceStation( by: 2345, context: context )

 - parameter entityID: `Int64` ID of the `SpaceStation` to fetch
 - parameter context: `NSManagedObjectContext` context to get the `SpaceStation` from
 - returns: `SpaceStation?` with the given ID in the context, nil if not found
 */
public func getSpaceStation( by entityID: Int64, context: NSManagedObjectContext ) -> SpaceStation?
{
   getEntityByID( entityID: entityID, context: context, entityName: SPACESTATION_ENTITY_NAME ) as? SpaceStation
}

/**
 Fetches, updates, or creates a `SpaceStation` from the context, given the data.

 - parameter spaceStation: `SpaceStationJSON` JSON data about the space station
 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `SpaceStation` updated entity
 */
public func fetchSpaceStation( spaceStation: SpaceStationJSON, context: NSManagedObjectContext ) -> SpaceStation
{
   let spaceStationEntity: SpaceStation? = getSpaceStation( by: spaceStation.id ?? -1, context: context )
   updateEntity( json: spaceStation, entity: spaceStationEntity, context: context )
   return spaceStationEntity ?? addToCoreData( json: spaceStation, context: context )
}

/**
 Returns the number of `SpaceStation` records in the given context.

 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `Int?` Number of `SpaceStation` records in the context
 */
public func getSpaceStationCount( context: NSManagedObjectContext ) -> Int?
{
   getRecordsCount( entityName: SPACESTATION_ENTITY_NAME, context: context )
}

/**
 Delete all `SpaceStation` entities in the given context.

 - parameter context: `NSManagedObjectContext` context to remove entities from
 */
func deleteAllSpaceStationConfigEntities( context: NSManagedObjectContext )
{
   deleteAllEntities( entityType: SPACESTATION_ENTITY_NAME, context: context )
}
