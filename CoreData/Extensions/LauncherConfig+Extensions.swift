// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for `LauncherConfig`. */
public let LAUNCHER_CONFIG_ENTITY_NAME: String = "LauncherConfig"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated `LauncherConfig` entity.
 */
extension LauncherConfig
{
   /**
    Adds the JSON struct, creating or updating as necessary.

    - parameter provider: `AgencyJSON?` JSON struct to add
    - parameter context: `NSManagedObjectContext` context to add the JSON struct in
    */
   func addManufacturerFromJSON( manufacturer: AgencyJSON?, context: NSManagedObjectContext )
   {
      guard let json = manufacturer else { return }
      let agencyEntity: Agency = fetchAgency( agency: json, context: context )
      self.manufacturer = agencyEntity
      agencyEntity.addToLauncherConfigs( self )
   }

   /**
    Adds the JSON structs, creating or updating as necessary.

    - parameter programs: `[ProgramJSON]?` JSON struct to add
    - parameter context:  `NSManagedObjectContext` context to add the JSON struct in
    */
   func addProgramsFromJSON( programs: [ProgramJSON]?, context: NSManagedObjectContext )
   {
      for program in programs ?? []
      {
         let programEntity: Program = fetchProgram( program: program, context: context )
         self.addToPrograms( programEntity )
         programEntity.addToLauncherConfigs( self )
      }
   }
}

/**
 Add this data to Core Data as a `LauncherConfig`. The context still needs to be saved after the add.

 - parameter json:    JSON to parse
 - parameter context: Core Data context to add the entity to.
 - returns: `LauncherConfig` the added entity
 */
public func addToCoreData( json: LauncherConfigJSON, context: NSManagedObjectContext ) -> LauncherConfig
{
   let newLauncherConfig: LauncherConfig = LauncherConfig( context: context )
   updateEntity( json: json, entity: newLauncherConfig, context: context )

   return newLauncherConfig
}

/**
 Set or update the values of the `LauncherConfig` entity,

 - parameter json:    JSON to parse
 - parameter entity:  `LauncherConfig?` entity to fill/update
 - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
 */
public func updateEntity( json: LauncherConfigJSON, entity: LauncherConfig?, context: NSManagedObjectContext )
{
   guard let launcherConfigEntity = entity else { return }

   launcherConfigEntity.id = json.id ?? -1
   launcherConfigEntity.name = json.name
   launcherConfigEntity.family = json.family
   launcherConfigEntity.fullName = json.fullName
   launcherConfigEntity.launcherConfigDescription = json.launcherConfigDescription
   launcherConfigEntity.variant = json.variant
   launcherConfigEntity.alias = json.alias
   launcherConfigEntity.minStage = guaranteedInt64( json.minStage )
   launcherConfigEntity.maxStage = guaranteedInt64( json.maxStage )
   launcherConfigEntity.length = guaranteedDouble( json.length )
   launcherConfigEntity.diameter = guaranteedDouble( json.diameter )
   launcherConfigEntity.maidenFlight = json.maidenFlight
   launcherConfigEntity.launchMass = guaranteedInt64( json.launchMass )
   launcherConfigEntity.leoCapacity = guaranteedInt64( json.leoCapacity )
   launcherConfigEntity.gtoCapacity = guaranteedInt64( json.gtoCapacity )
   launcherConfigEntity.takeoffThrust = guaranteedInt64( json.takeoffThrust )
   launcherConfigEntity.apogee = guaranteedInt64( json.apogee )
   launcherConfigEntity.vehicleRange = guaranteedInt64( json.vehicleRange )
   launcherConfigEntity.imageURL = json.imageURL
   launcherConfigEntity.infoURL = json.infoURL
   launcherConfigEntity.wikiURL = json.wikiURL
   launcherConfigEntity.consecutiveSuccessfulLaunches = guaranteedInt64( json.consecutiveSuccessfulLaunches )
   launcherConfigEntity.successfulLaunches = guaranteedInt64( json.successfulLaunches )
   launcherConfigEntity.failedLaunches = guaranteedInt64( json.failedLaunches )
   launcherConfigEntity.pendingLaunches = guaranteedInt64( json.pendingLaunches )
   launcherConfigEntity.addManufacturerFromJSON( manufacturer: json.manufacturer, context: context )
   launcherConfigEntity.addProgramsFromJSON( programs: json.programs, context: context )
   launcherConfigEntity.reusable = guaranteedBool( json.reusable )
   launcherConfigEntity.totalLaunchCount = json.totalLaunchCount

   // additional generated info, not in the JSON
   launcherConfigEntity.fetched = Date()
}

/**
 Gets a `LauncherConfig` with the given ID in the given context.

 ### Example
     let launcherConfig: LauncherConfig = getLauncherConfig( by: 2345, context: context )

 - parameter entityID: `Int64` ID of the `LauncherConfig` to fetch
 - parameter context: `NSManagedObjectContext` context to get the `LauncherConfig` from
 - returns: `LauncherConfig?` launcher configuration with the given ID in the context, nil if not found
 */
public func getLauncherConfig( by entityID: Int64, context: NSManagedObjectContext ) -> LauncherConfig?
{
   getEntityByID( entityID: entityID, context: context, entityName: LAUNCHER_CONFIG_ENTITY_NAME ) as? LauncherConfig
}

/**
 Fetches, updates, or creates a `LauncherConfig` from the context, given the data

 - parameter launcherConfig: `LauncherConfigJSON` JSON data about the launcher configuration
 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: updated `LauncherConfig`
 */
public func fetchLauncherConfig( launcherConfig: LauncherConfigJSON, context: NSManagedObjectContext ) -> LauncherConfig
{
   let launcherConfigEntity: LauncherConfig? = getLauncherConfig( by: launcherConfig.id ?? -1, context: context )
   updateEntity( json: launcherConfig, entity: launcherConfigEntity, context: context )
   return launcherConfigEntity ?? addToCoreData( json: launcherConfig, context: context )
}

/**
 Returns the number of `LauncherConfig` records in the given context.

 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `Int?` Number of `LauncherConfig` records in the context
 */
public func getLauncherConfigCount( context: NSManagedObjectContext ) -> Int?
{
   getRecordsCount( entityName: LAUNCHER_CONFIG_ENTITY_NAME, context: context )
}

/**
 Delete all `LauncherConfig` entities in the given context.

 - parameter context: `NSManagedObjectContext` context to remove entities from
 */
func deleteAllLauncherConfigEntities( context: NSManagedObjectContext )
{
   deleteAllEntities( entityType: LAUNCHER_CONFIG_ENTITY_NAME, context: context )
}
