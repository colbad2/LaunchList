// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for `LandingLocation`. */
public let LANDING_LOCATION_ENTITY_NAME: String = "LandingLocation"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated `LandingLocation` entity.
 */
extension LandingLocation
{
   /**
    Adds the JSON struct, creating or updating as necessary.

    - parameter config:  `LandingLocationJSON?` JSON struct to add
    - parameter context: `NSManagedObjectContext` context to add the JSON struct in
    */
   func addLocationFromJSON( location: LocationJSON?, context: NSManagedObjectContext )
   {
      if let location: LocationJSON = location
      {
         self.location = fetchLocation( location: location, context: context )
         self.location?.landingLocation = self
      }
   }
}

/**
 Add this location to Core Data as a `LandingLocation` entity. The context still needs to be saved after the add.

 - parameter json:    JSON to parse
 - parameter context: `NSManagedObjectContext` Core Data context to add the entity to.
 - returns:           `LandingLocation` the added entity
 */
public func addToCoreData( json: LandingLocationJSON, context: NSManagedObjectContext ) -> LandingLocation
{
   let newLandingLocation: LandingLocation = LandingLocation( context: context )
   updateEntity( json: json, entity: newLandingLocation, context: context )

   return newLandingLocation
}

/**
 Set or update the values of the `LandingLocation` entity,

 - parameter json:    JSON to parse
 - parameter entity:  `LandingLocation?` entity to fill/update
 - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
 */
public func updateEntity( json: LandingLocationJSON, entity: LandingLocation?, context: NSManagedObjectContext )
{
   guard let landingLocationEntity = entity else { return }

   landingLocationEntity.id = json.id ?? -1
   landingLocationEntity.name = json.name
   landingLocationEntity.abbreviation = json.abbreviation
   landingLocationEntity.addLocationFromJSON( location: json.location, context: context )
   landingLocationEntity.successfulLandings = json.successfulLandings

   landingLocationEntity.fetched = Date()
}

/**
 Gets all the `LandingLocation` entities in the context

 - parameter context:  `NSManagedObjectContext` context to get the `LandingLocation`s from
 - returns: `[LandingLocation]?` list of launchers, nil if not possible
 */
public func fetchAllLandingLocations( context: NSManagedObjectContext ) -> [LandingLocation]?
{
   return fetchAllEntities( entityName: LAUNCHER_ENTITY_NAME, context: context ) as? [LandingLocation]
}

/**
 Gets a `LandingLocation` with the given ID in the given context.

 ### Example
     let launcher: LandingLocation = getLandingLocation( by: 2345, context: context )

 - parameter entityID: `Int64` ID of the `LandingLocation` to fetch
 - parameter context: `NSManagedObjectContext` context to get the `LandingLocation` from
 - returns: `LandingLocation?` launcher with the given ID in the context, nil if not found
 */
public func getLandingLocation( by entityID: Int64, context: NSManagedObjectContext ) -> LandingLocation?
{
   return getEntityByID( entityID: entityID, context: context, entityName: LAUNCHER_ENTITY_NAME ) as? LandingLocation
}

/**
 Fetches, updates, or creates a `LandingLocation` from the context, given the data

 - parameter launcher: `LandingLocationJSON` JSON data about the launcher
 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: updated `LandingLocation`
 */
public func fetchLandingLocation( launcher: LandingLocationJSON, context: NSManagedObjectContext ) -> LandingLocation
{
   let launcherEntity: LandingLocation? = getLandingLocation( by: launcher.id ?? -1, context: context )
   updateEntity( json: launcher, entity: launcherEntity, context: context )
   return launcherEntity ?? addToCoreData( json: launcher, context: context )
}

/**
 Returns the number of `LandingLocation` records in the given context.

 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `Int?` Number of `LandingLocation` records in the context
 */
public func getLandingLocationCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: LAUNCHER_ENTITY_NAME, context: context )
}

/**
 Delete all `LandingLocation` entities in the given context.

 - parameter context: `NSManagedObjectContext` context to remove entities from
 */
func deleteAllLandingLocationEntities( context: NSManagedObjectContext )
{
   deleteAllEntities( entityType: LAUNCHER_ENTITY_NAME, context: context )
}
