// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for [Location]. */
public let LOCATION_ENTITY_NAME: String = "Location"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated [Location] entity.
 */
extension Location
{
   // no sets
}

public func getLocation( by entityID: Int64, context: NSManagedObjectContext ) -> Location?
{
   return getEntityByID( entityID: entityID, context: context, entityName: LOCATION_ENTITY_NAME ) as? Location
}

public func fetchLocation( location: LocationJSON, context: NSManagedObjectContext ) -> Location
{
   let locationEntity: Location? = getLocation( by: location.id, context: context )
   location.updateEntity( entity: locationEntity, context: context )
   return locationEntity ?? location.addToCoreData( context: context )
}

/**
 Returns the number of [Location] records in the given context.

 - parameter context: Core Data object context
 - returns: [Int?] Number of [Location] records in the context
 */
public func getLocationCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: LOCATION_ENTITY_NAME, context: context )
}
