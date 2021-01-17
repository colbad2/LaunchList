// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for `Location`. */
public let LOCATION_ENTITY_NAME: String = "Location"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated `Location` entity.
 */
extension Location
{
   // no sets
}

/**
 Gets a `Location` with the given ID in the given context.

 ### Example
     let location: Location = getLocation( by: 2345, context: context )

 - parameter entityID: `Int64` ID of the `Location` to fetch
 - parameter context: `NSManagedObjectContext` context to get the `Location` from
 - returns: `Location?` location with the given ID in the context, nil if not found
 */
public func getLocation( by entityID: Int64, context: NSManagedObjectContext ) -> Location?
{
   return getEntityByID( entityID: entityID, context: context, entityName: LOCATION_ENTITY_NAME ) as? Location
}

/**
 Fetches, updates, or creates a `Location` from the context, given the data

 - parameter location: `LocationJSON` JSON data about the location
 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: updated `Location`
 */
public func fetchLocation( location: LocationJSON, context: NSManagedObjectContext ) -> Location
{
   let locationEntity: Location? = getLocation( by: location.id, context: context )
   location.updateEntity( entity: locationEntity, context: context )
   return locationEntity ?? location.addToCoreData( context: context )
}

/**
 Returns the number of `Location` records in the given context.

 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `Int?` Number of `Location` records in the context
 */
public func getLocationCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: LOCATION_ENTITY_NAME, context: context )
}

/**
 Delete all `Location` entities in the given context.

 - parameter context: `NSManagedObjectContext` context to remove entities from
 */
func deleteAllLocationEntities( context: NSManagedObjectContext )
{
   deleteAllEntities( entityType: LOCATION_ENTITY_NAME, context: context )
}
