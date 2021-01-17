// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

extension Spacecraft
{
   // no sets
}

public func getSpacecraft( by entityID: Int64, context: NSManagedObjectContext ) -> Spacecraft?
{
   return getEntityByID( entityID: entityID, context: context, entityName: "Spacecraft" ) as? Spacecraft
}

public func fetchSpacecraft( spacecraft: SpacecraftJSON, context: NSManagedObjectContext ) -> Spacecraft
{
   let spacecraftEntity: Spacecraft? = getSpacecraft( by: spacecraft.id, context: context )
   spacecraft.updateEntity( entity: spacecraftEntity, context: context )
   return spacecraftEntity ?? spacecraft.addToCoreData( context: context )
}

/**
 Returns the number of [Spacecraft] records in the given context.

 - parameter context: Core Data object context
 - returns: [Int?] Number of [Spacecraft] records in the context
 */
public func getSpacecraftCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "Spacecraft", context: context )
}
