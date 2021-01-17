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
   // no sets
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
   return getEntityByID( entityID: entityID, context: context, entityName: LAUNCHER_CONFIG_ENTITY_NAME ) as? LauncherConfig
}

/**
 Fetches, updates, or creates a `LauncherConfig` from the context, given the data

 - parameter launcherConfig: `LauncherConfigJSON` JSON data about the launcher configuration
 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: updated `LauncherConfig`
 */
public func fetchLauncherConfig( launcherConfig: LauncherConfigJSON, context: NSManagedObjectContext ) -> LauncherConfig
{
   let launcherConfigEntity: LauncherConfig? = getLauncherConfig( by: launcherConfig.id, context: context )
   launcherConfig.updateEntity( entity: launcherConfigEntity, context: context )
   return launcherConfigEntity ?? launcherConfig.addToCoreData( context: context )
}

/**
 Returns the number of `LauncherConfig` records in the given context.

 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `Int?` Number of `LauncherConfig` records in the context
 */
public func getLauncherConfigCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: LAUNCHER_CONFIG_ENTITY_NAME, context: context )
}
