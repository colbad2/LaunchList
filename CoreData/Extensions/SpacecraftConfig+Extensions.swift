// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for `SpacecraftConfig`. */
public let SPACECRAFT_CONFIG_ENTITY_NAME: String = "SpacecraftConfig"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated `SpacecraftConfig` entity.
 */
extension SpacecraftConfig
{
   /**
    Adds the JSON struct, creating or updating as necessary.

    - parameter agency:  `AgencyJSON?` JSON struct to add
    - parameter context: `NSManagedObjectContext` context to add the JSON struct in
    */
   func addAgencyFromJSON( agency: AgencyJSON?, context: NSManagedObjectContext )
   {
      if let agency: AgencyJSON = agency
      {
         let agencyEntity: Agency = fetchAgency( agency: agency, context: context )
         self.addToAgencies( agencyEntity )
         agencyEntity.addToSpacecraftConfigs( self )
      }
   }
}

/**
 Add this config to Core Data as a `SpacecraftConfig` entity. The context still needs to be saved after the add.

 - parameter json:    JSON to parse
 - parameter context: Core Data context to add the entity to.
 - returns: the added entity
 */
public func addToCoreData( json: SpacecraftConfigJSON, context: NSManagedObjectContext ) -> SpacecraftConfig
{
   let newSpacecraftConfig: SpacecraftConfig = SpacecraftConfig( context: context )
   updateEntity( json: json, entity: newSpacecraftConfig, context: context )

   return newSpacecraftConfig
}

/**
 Set or update the values of the `SpacecraftConfig` entity,

 - parameter json:    JSON to parse
 - parameter entity: `SpacecraftConfig?` entity to fill/update
 - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
 */
public func updateEntity( json: SpacecraftConfigJSON, entity: SpacecraftConfig?, context: NSManagedObjectContext )
{
   guard let spacecraftConfigEntity = entity else { return }

   spacecraftConfigEntity.id = json.id ?? -1
   spacecraftConfigEntity.url = json.url
   spacecraftConfigEntity.type = json.type?.name
   spacecraftConfigEntity.addAgencyFromJSON( agency: json.agency, context: context )
   spacecraftConfigEntity.capability = json.capability
   spacecraftConfigEntity.history = json.history
   spacecraftConfigEntity.details = json.details
   spacecraftConfigEntity.maidenFlight = json.maidenFlight
   spacecraftConfigEntity.height = guaranteedDouble( json.height )
   spacecraftConfigEntity.diameter = guaranteedDouble( json.diameter )
   spacecraftConfigEntity.humanRated = guaranteedBool( json.humanRated )
   spacecraftConfigEntity.crewCapacity = guaranteedInt64( json.crewCapacity )
   spacecraftConfigEntity.payloadCapacity = guaranteedInt64( json.payloadCapacity )
   spacecraftConfigEntity.flightLife = json.flightLife
   spacecraftConfigEntity.nationURL = json.nationURL
   spacecraftConfigEntity.wikiURL = json.wikiURL
   spacecraftConfigEntity.infoURL = json.infoURL

   spacecraftConfigEntity.fetched = Date()
}

/**
 Gets all the `SpacecraftConfig` entities in the context

 - parameter context:  `NSManagedObjectContext` context to get the `SpacecraftConfig`s from
 - returns: `[SpacecraftConfig]?` list of spacecraft configs, nil if not possible
 */
public func fetchAllSpacecraftConfigs( context: NSManagedObjectContext ) -> [SpacecraftConfig]?
{
   fetchAllEntities( entityName: SPACECRAFT_CONFIG_ENTITY_NAME, context: context ) as? [ SpacecraftConfig ]
}

/**
 Returns a sorted version of the given `SpacecraftConfig` array.

 - parameter spacecraftConfigArray: `[SpacecraftConfig]?` list of `SpacecraftConfig`s to sort
 - returns: `[SpacecraftConfig]` sorted version of the given `SpacecraftConfig` list
 */
func sortSpacecraftConfigsByName( spacecraftConfigArray: [SpacecraftConfig]? ) -> [SpacecraftConfig]
{
   guard let spacecraftConfigArray = spacecraftConfigArray else { return [] }

   var spacecraftConfigs: [SpacecraftConfig] = Array( spacecraftConfigArray )
   spacecraftConfigs.sort
   {
      spacecraftConfig1, spacecraftConfig2 in

      if let name1: String = spacecraftConfig1.name,
         let name2: String = spacecraftConfig2.name
      {
         return name1 < name2
      }
      else
      {
         return false
      }
   }

   return spacecraftConfigs
}

/**
 Gets a `SpacecraftConfig` with the given ID in the given context.

 ### Example
     let spacecraftConfig: SpacecraftConfig = getSpacecraftConfig( by: 2345, context: context )

 - parameter entityID: `Int64` ID of the `SpacecraftConfig` to fetch
 - parameter context: `NSManagedObjectContext` context to get the `SpacecraftConfig` from
 - returns: `SpacecraftConfig?` with the given ID in the context, nil if not found
 */
public func getSpacecraftConfig( by entityID: Int64, context: NSManagedObjectContext ) -> SpacecraftConfig?
{
   getEntityByID( entityID: entityID, context: context, entityName: SPACECRAFT_CONFIG_ENTITY_NAME ) as? SpacecraftConfig
}

/**
 Fetches, updates, or creates a `SpacecraftConfig` from the context, given the data.

 - parameter spacecraftConfig: `SpacecraftConfigJSON` JSON data about the spacecraft config
 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `SpacecraftConfig` updated entity
 */
public func fetchSpacecraftConfig( spacecraftConfig: SpacecraftConfigJSON, context: NSManagedObjectContext ) -> SpacecraftConfig
{
   let spacecraftConfigEntity: SpacecraftConfig? = getSpacecraftConfig( by: spacecraftConfig.id ?? -1, context: context )
   updateEntity( json: spacecraftConfig, entity: spacecraftConfigEntity, context: context )
   return spacecraftConfigEntity ?? addToCoreData( json: spacecraftConfig, context: context )
}

/**
 Returns the number of `SpacecraftConfig` records in the given context.

 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `Int?` Number of `SpacecraftConfig` records in the context
 */
public func getSpacecraftConfigCount( context: NSManagedObjectContext ) -> Int?
{
   getRecordsCount( entityName: SPACECRAFT_CONFIG_ENTITY_NAME, context: context )
}

/**
 Delete all `SpacecraftConfig` entities in the given context.

 - parameter context: `NSManagedObjectContext` context to remove entities from
 */
func deleteAllSpacecraftConfigEntities( context: NSManagedObjectContext )
{
   deleteAllEntities( entityType: SPACECRAFT_CONFIG_ENTITY_NAME, context: context )
}
