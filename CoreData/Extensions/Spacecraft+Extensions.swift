// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for `Spacecraft`. */
public let SPACECRAFT_ENTITY_NAME: String = "Spacecraft"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated `Spacecraft` entity.
 */
extension Spacecraft
{
   // no sets
}

/**
 Gets a `Spacecraft` with the given ID in the given context.

 ### Example
     let spacecraft: Spacecraft = getSpacecraft( by: 2345, context: context )

 - parameter entityID: `Int64` ID of the `Spacecraft` to fetch
 - parameter context: `NSManagedObjectContext` context to get the `Spacecraft` from
 - returns: `Spacecraft` with the given ID in the context, nil if not found
 */
public func getSpacecraft( by entityID: Int64, context: NSManagedObjectContext ) -> Spacecraft?
{
   return getEntityByID( entityID: entityID, context: context, entityName: SPACECRAFT_ENTITY_NAME ) as? Spacecraft
}

/**
 Fetches, updates, or creates a `Spacecraft` from the context, given the data.

 - parameter spacecraft: `SpacecraftJSON` JSON data about the spacecraft
 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `Spacecraft` updated entity
 */
public func fetchSpacecraft( spacecraft: SpacecraftJSON, context: NSManagedObjectContext ) -> Spacecraft
{
   let spacecraftEntity: Spacecraft? = getSpacecraft( by: spacecraft.id, context: context )
   spacecraft.updateEntity( entity: spacecraftEntity, context: context )
   return spacecraftEntity ?? spacecraft.addToCoreData( context: context )
}

/**
 Returns the number of `Spacecraft` records in the given context.

 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `Int?` Number of `Spacecraft` records in the context
 */
public func getSpacecraftCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: SPACECRAFT_ENTITY_NAME, context: context )
}
