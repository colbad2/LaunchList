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
   /**
    Adds the JSON struct, creating or updating as necessary.

    - parameter spacecraftConfig: `SpacecraftConfigJSON?` JSON struct to add
    - parameter context:          `NSManagedObjectContext` context to add the JSON struct in
    */
   func addSpacecraftConfigFromJSON( spacecraftConfig: SpacecraftConfigJSON?, context: NSManagedObjectContext )
   {
      if let spacecraftConfig: SpacecraftConfigJSON = spacecraftConfig
      {
         let spacecraftConfigEntity: SpacecraftConfig = fetchSpacecraftConfig( spacecraftConfig: spacecraftConfig, context: context )
         self.spacecraftConfig = spacecraftConfigEntity
         spacecraftConfigEntity.spacecraft = self
      }
   }

   /**
    Adds the JSON structs, creating or updating as necessary.

    - parameter flights: `[SpacecraftFlightJSON]?` JSON struct to add
    - parameter context:  `NSManagedObjectContext` context to add the JSON struct in
    */
   func addFlightsFromJSON( flights: [SpacecraftFlightJSON]?, context: NSManagedObjectContext )
   {
      for flight in flights ?? []
      {
         let flightEntity: SpacecraftFlight = fetchSpacecraftFlight( flight: flight, context: context )
         self.addToSpacecraftFlights( flightEntity )
         flightEntity.spacecraft = self
      }
   }
}

/**
 Add this data to Core Data as a `Spacecraft` entity. The context still needs to be saved after the add.

 - parameter json:    JSON to parse
 - parameter context: Core Data context to add the entity to.
 - returns: the added entity
 */
public func addToCoreData( json: SpacecraftJSON, context: NSManagedObjectContext ) -> Spacecraft
{
   let newSpacecraft: Spacecraft = Spacecraft( context: context )
   updateEntity( json: json, spacecraftEntity: newSpacecraft, context: context )

   return newSpacecraft
}

/**
 Set or update the values of the `Spacecraft` entity,

 - parameter json:    JSON to parse
 - parameter spacecraftEntity: `Spacecraft?` entity to fill/update
 - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
 */
public func updateEntity( json: SpacecraftJSON, spacecraftEntity: Spacecraft?, context: NSManagedObjectContext )
{
   guard let entity = spacecraftEntity else { return }

   entity.id = json.id
   entity.url = json.url
   entity.name = json.name
   entity.serialNumber = json.serialNumber
   entity.status = json.status?.name
   entity.statusName = json.status?.name
   entity.spacecraftDescription = json.spacecraftDescription
   entity.addSpacecraftConfigFromJSON( spacecraftConfig: json.spacecraftConfig, context: context )
   entity.addFlightsFromJSON( flights: json.flights, context: context )

   entity.fetched = Date()
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
   spacecraft.updateEntity( spacecraftEntity: spacecraftEntity, context: context )
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

/**
 Delete all `Spacecraft` entities in the given context.

 - parameter context: `NSManagedObjectContext` context to remove entities from
 */
func deleteAllSpacecraftEntities( context: NSManagedObjectContext )
{
   deleteAllEntities( entityType: SPACECRAFT_ENTITY_NAME, context: context )
}
