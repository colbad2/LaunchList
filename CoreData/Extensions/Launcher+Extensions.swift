// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

extension Launcher
{
   // no sets
}

public func getLauncher( by entityID: Int64, context: NSManagedObjectContext ) -> Launcher?
{
   return getEntityByID( entityID: entityID, context: context, entityName: "Launcher" ) as? Launcher
}

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
   return getRecordsCount( entityName: "Launcher", context: context )
}
