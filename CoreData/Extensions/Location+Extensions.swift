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
   /**
    Adds the JSON structs, creating or updating as necessary.

    - parameter links: `[PadJSON]?` JSON struct to add
    - parameter context:  `NSManagedObjectContext` context to add the JSON struct in
    */
   func addPadsFromJSON( pads: [PadJSON]?, context: NSManagedObjectContext )
   {
      for pad in pads ?? []
      {
         let padEntity: Pad = fetchPad( pad: pad, context: context )
         self.addToPads( padEntity )
         padEntity.location = self
      }
   }
}

/**
 Add this location to Core Data as a `Location` entity. The context still needs to be saved after the add.

 - parameter json:    JSON to parse
 - parameter context: `NSManagedObjectContext` Core Data context to add the entity to.
 - returns:           `Location` the added entity
 */
public func addToCoreData( json: LocationJSON, context: NSManagedObjectContext ) -> Location
{
   let newLocation: Location = Location( context: context )
   updateEntity( json: json, entity: newLocation, context: context )

   return newLocation
}

/**
 Set or update the values of the `Location` entity,

 - parameter json:    JSON to parse
 - parameter entity:  `Location?` entity to fill/update
 - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
 */
public func updateEntity( json: LocationJSON, entity: Location?, context: NSManagedObjectContext )
{
   guard let locationEntity = entity else { return }

   locationEntity.countryCode = json.countryCode
   locationEntity.id = json.id
   locationEntity.mapImage = json.mapImage
   locationEntity.name = json.name
   locationEntity.totalLandingCount = guaranteedInt64( json.totalLandingCount )
   locationEntity.totalLaunchCount = guaranteedInt64( json.totalLaunchCount )
   locationEntity.addPadsFromJSON( pads: json.pads, context: context )

   locationEntity.fetched = Date()
}

/**
 Gets all the `Location` entities in the context

 - parameter context:  `NSManagedObjectContext` context to get the `Location`s from
 - returns: `[Location]?` list of location, nil if not possible
 */
public func fetchAllLocations( context: NSManagedObjectContext ) -> [Location]?
{
   return fetchAllEntities( entityName: LOCATION_ENTITY_NAME, context: context ) as? [Location]
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
   updateEntity( json: location, entity: locationEntity, context: context )
   return locationEntity ?? addToCoreData( json: location, context: context )
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
