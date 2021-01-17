// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for [Launcher]. */
public let LAUNCHER_ENTITY_NAME: String = "Launcher"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated [Launcher] entity.
 */
extension Launcher
{
   // no sets
}

/**
 Gets a [Launcher] with the given ID in the given context.

 ### Example
 ````
 let launcher: Launcher = getLauncher( by: 2345, context: context )
 ````

 - parameter entityID - [Int64] ID of the [Launcher] to fetch
 - parameter context - [NSManagedObjectContext] context to get the [Launcher] from
 - returns: [Launcher?] launcher with the given ID in the context, nil if not found
 */
public func getLauncher( by entityID: Int64, context: NSManagedObjectContext ) -> Launcher?
{
   return getEntityByID( entityID: entityID, context: context, entityName: LAUNCHER_ENTITY_NAME ) as? Launcher
}

/**
 Fetches, updates, or creates a [Launcher] from the context, given the data

 - parameter agency: JSON data about the launcher
 - parameter context: Core Data object context
 - returns: updated [Launcher]
 */
public func fetchLauncher( launcher: LauncherJSON, context: NSManagedObjectContext ) -> Launcher
{
   let launcherEntity: Launcher? = getLauncher( by: launcher.id, context: context )
   launcher.updateEntity( entity: launcherEntity, context: context )
   return launcherEntity ?? launcher.addToCoreData( context: context )
}

/**
 Returns the number of [Launcher] records in the given context.

 - parameter context: Core Data object context
 - returns: [Int?] Number of [Launcher] records in the context
 */
public func getLauncherCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: LAUNCHER_ENTITY_NAME, context: context )
}
