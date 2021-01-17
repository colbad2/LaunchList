// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

extension LauncherConfig
{
   // no sets
}

public func getLauncherConfig( by entityID: Int64, context: NSManagedObjectContext ) -> LauncherConfig?
{
   return getEntityByID( entityID: entityID, context: context, entityName: "LauncherConfig" ) as? LauncherConfig
}

public func fetchLauncherConfig( launcherConfig: LauncherConfigJSON, context: NSManagedObjectContext ) -> LauncherConfig
{
   let launcherConfigEntity: LauncherConfig? = getLauncherConfig( by: launcherConfig.id, context: context )
   launcherConfig.updateEntity( entity: launcherConfigEntity, context: context )
   return launcherConfigEntity ?? launcherConfig.addToCoreData( context: context )
}

public func getLauncherConfigCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "LauncherConfig", context: context )
}
