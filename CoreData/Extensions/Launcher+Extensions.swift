// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for `Launcher`. */
public let LAUNCHER_ENTITY_NAME: String = "Launcher"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated `Launcher` entity.
 */
extension Launcher
{
   /**
    Adds the JSON struct, creating or updating as necessary.

    - parameter config:  `LauncherConfigJSON?` JSON struct to add
    - parameter context: `NSManagedObjectContext` context to add the JSON struct in
    */
   func addLauncherConfigFromJSON( config: LauncherConfigJSON?, context: NSManagedObjectContext )
   {
      if let config: LauncherConfigJSON = config
      {
         self.launcherConfig = fetchLauncherConfig( launcherConfig: config, context: context )
         self.launcherConfig?.launcher = self
      }
   }
}

/**
 Add this data to Core Data as a `Launcher`. The context still needs to be saved after the add.

 - parameter json:    JSON to parse
 - parameter context: Core Data context to add the entity to.
 - returns: `Launcher` the added entity
 */
public func addToCoreData( json: LauncherJSON, context: NSManagedObjectContext ) -> Launcher
{
   let newLauncher: Launcher = Launcher( context: context )
   updateEntity( json: json, entity: newLauncher, context: context )

   return newLauncher
}

/**
 Set or update the values of the `Launcher` entity,

 - parameter json:    JSON to parse
 - parameter entity:  `Launcher?` entity to fill/update
 - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
 */
public func updateEntity( json: LauncherJSON, entity: Launcher?, context: NSManagedObjectContext )
{
   guard let launcherEntity = entity else { return }

   launcherEntity.id = json.id
   launcherEntity.flightProven = guaranteedBool( json.flightProven )
   launcherEntity.serialNumber = json.serialNumber
   launcherEntity.status = json.status
   launcherEntity.details = json.details
   launcherEntity.addLauncherConfigFromJSON( config: json.launcherConfig, context: context )
   launcherEntity.imageURL = json.imageURL
   launcherEntity.flights = guaranteedInt64( json.flights )
   launcherEntity.lastLaunchDate = json.lastLaunchDate
   launcherEntity.firstLaunchDate = json.firstLaunchDate
   launcherEntity.successfulLandings = json.successfulLandings
   launcherEntity.attemptedLandings = json.attemptedLandings

   launcherEntity.fetched = Date()
}

/**
 Gets all the `Launcher` entities in the context

 - parameter context:  `NSManagedObjectContext` context to get the `Launcher`s from
 - returns: `[Launcher]?` list of launchers, nil if not possible
 */
public func fetchAllLaunchers( context: NSManagedObjectContext ) -> [Launcher]?
{
   return fetchAllEntities( entityName: LAUNCHER_ENTITY_NAME, context: context ) as? [Launcher]
}

/**
 Gets a `Launcher` with the given ID in the given context.

 ### Example
     let launcher: Launcher = getLauncher( by: 2345, context: context )

 - parameter entityID: `Int64` ID of the `Launcher` to fetch
 - parameter context: `NSManagedObjectContext` context to get the `Launcher` from
 - returns: `Launcher?` launcher with the given ID in the context, nil if not found
 */
public func getLauncher( by entityID: Int64, context: NSManagedObjectContext ) -> Launcher?
{
   return getEntityByID( entityID: entityID, context: context, entityName: LAUNCHER_ENTITY_NAME ) as? Launcher
}

/**
 Fetches, updates, or creates a `Launcher` from the context, given the data

 - parameter launcher: `LauncherJSON` JSON data about the launcher
 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: updated `Launcher`
 */
public func fetchLauncher( launcher: LauncherJSON, context: NSManagedObjectContext ) -> Launcher
{
   let launcherEntity: Launcher? = getLauncher( by: launcher.id, context: context )
   launcher.updateEntity( entity: launcherEntity, context: context )
   return launcherEntity ?? launcher.addToCoreData( context: context )
}

/**
 Returns the number of `Launcher` records in the given context.

 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `Int?` Number of `Launcher` records in the context
 */
public func getLauncherCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: LAUNCHER_ENTITY_NAME, context: context )
}

/**
 Delete all `Launcher` entities in the given context.

 - parameter context: `NSManagedObjectContext` context to remove entities from
 */
func deleteAllLauncherEntities( context: NSManagedObjectContext )
{
   deleteAllEntities( entityType: LAUNCHER_ENTITY_NAME, context: context )
}
