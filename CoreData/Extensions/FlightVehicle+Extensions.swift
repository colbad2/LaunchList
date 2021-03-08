// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for `FlightVehicle`. */
public let FLIGHT_VEHICLE_ENTITY_NAME: String = "FlightVehicle"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated `Expedition` entity.
 */
extension FlightVehicle
{
   /** `Set< Docking >` wrapper for the generated `NSSet` of `Docking`s. */
   var dockingsSet: Set< Docking > { self.dockings as? Set< Docking > ?? Set< Docking >() }

   /** Array of `Docking`s, sorted by name. */
   var sortedDockings: [Docking] { return sortDockingsByName( dockingArray: Array( self.dockingsSet ) ) }

   /** True if the `FlightVehicle` has any `Docking`s. */
   var hasDockings: Bool { return !dockingsSet.isEmpty }

   /**
    Adds the JSON struct, creating or updating as necessary.

    - parameter spacecraft: `SpacecraftJSON?` JSON struct to add
    - parameter context:    `NSManagedObjectContext` context to add the JSON struct in
    */
   func addSpacecraftFromJSON( spacecraft: SpacecraftJSON?, context: NSManagedObjectContext )
   {
      if let spacecraft: SpacecraftJSON = spacecraft
      {
         let spacecraftEntity: Spacecraft = fetchSpacecraft( spacecraft: spacecraft, context: context )
         self.spacecraft = spacecraftEntity
         spacecraftEntity.flightVehicle = self
      }
   }
}

/**
 Add this data to Core Data as a `FlightVehicle`. The context still needs to be saved after the add.

 - parameter json:    JSON to parse
 - parameter context: Core Data context to add the entity to.
 - returns: `FlightVehicle` the added entity
 */
public func addToCoreData( json: FlightVehicleJSON, context: NSManagedObjectContext ) -> FlightVehicle
{
   let newFlightVehicle: FlightVehicle = FlightVehicle( context: context )
   updateEntity( json: json, entity: newFlightVehicle, context: context )

   return newFlightVehicle
}

/**
 Set or update the values of the `FlightVehicle` entity,

 - parameter json:    JSON to parse
 - parameter entity:  `FlightVehicle?` entity to fill/update
 - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
 */
public func updateEntity( json: FlightVehicleJSON, entity: FlightVehicle?, context: NSManagedObjectContext )
{
   guard let flightVehicleEntity = entity else { return }

   flightVehicleEntity.id = json.id ?? -1
   flightVehicleEntity.url = json.url
   flightVehicleEntity.destination = json.destination
   flightVehicleEntity.missionEnd = json.missionEnd
   flightVehicleEntity.addSpacecraftFromJSON( spacecraft: json.spacecraft, context: context )

   flightVehicleEntity.fetched = Date()
}

/**
 Returns a sorted version of the given `FlightVehicle` array.

 - parameter flightVehicleArray: `[FlightVehicle]?` list of `FlightVehicle`s to sort
 - returns: `[FlightVehicle]` sorted version of the given `FlightVehicle` list, never nil
 */
public func sortFlightVehiclesByName( flightVehicleArray: [FlightVehicle]? ) -> [FlightVehicle]
{
   guard let flightVehicleArray = flightVehicleArray else { return [] }

   var flightVehicles: [FlightVehicle] = Array( flightVehicleArray )
   flightVehicles.sort
   {
      flightVehicle1, flightVehicle2 in

      if let name1: String = flightVehicle1.destination,
         let name2: String = flightVehicle2.destination
      {
         return name1 < name2
      }
      else
      {
         return false
      }
   }

   return flightVehicles
}

/**
 Gets an `FlightVehicle` with the given ID in the given context.

 ### Example
     let flightVehicle: FlightVehicle = getFlightVehicle( by: 2345, context: context )

 - parameter entityID - `Int64` ID of the `FlightVehicle` to fetch
 - parameter context - `NSManagedObjectContext` context to get the `FlightVehicle` from
 - returns: `FlightVehicle?` flightVehicle with the given ID in the context, nil if not found
 */
public func getFlightVehicle( by entityID: Int64, context: NSManagedObjectContext ) -> FlightVehicle?
{
   return getEntityByID( entityID: entityID, context: context, entityName: FLIGHT_VEHICLE_ENTITY_NAME ) as? FlightVehicle
}

/**
 Fetches, updates, or creates a `FlightVehicle` from the context, given the data

 - parameter flightVehicle: `FlightVehicleJSON` JSON data about the flight vehicle
 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: updated `FlightVehicle`
 */
public func fetchFlightVehicle( flightVehicle: FlightVehicleJSON, context: NSManagedObjectContext ) -> FlightVehicle
{
   let flightVehicleEntity: FlightVehicle? = getFlightVehicle( by: flightVehicle.id ?? -1, context: context )
   updateEntity( json: flightVehicle, entity: flightVehicleEntity, context: context )
   return flightVehicleEntity ?? addToCoreData( json: flightVehicle, context: context )
}

/**
 Returns the number of `FlightVehicle` records in the given context.

 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `Int?` Number of `FlightVehicle` records in the context
 */
public func getFlightVehicleCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: FLIGHT_VEHICLE_ENTITY_NAME, context: context )
}

/**
 Delete all `FlightVehicle` entities in the given context.

 - parameter context: `NSManagedObjectContext` context to remove entities from
 */
func deleteAllFlightVehicleEntities( context: NSManagedObjectContext )
{
   deleteAllEntities( entityType: FLIGHT_VEHICLE_ENTITY_NAME, context: context )
}
