// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for `Vehicle`. */
public let VEHICLE_ENTITY_NAME: String = "Vehicle"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated `Vehicle` entity.
 */
extension Vehicle
{
   // no sets

   /**
    Adds the JSON struct, creating or updating as necessary.

    - parameter launcher: `RocketJSON?` JSON struct to add
    - parameter context:  `NSManagedObjectContext` context to add the JSON struct in
    */
   func addRocketFromJSON( launcher: RocketJSON?, context: NSManagedObjectContext )
   {
      if let launcher: RocketJSON = launcher
      {
         self.launcher = fetchRocket( rocket: launcher, context: context )
         self.launcher?.addToVehicles( self )
      }
   }
}

/**
 Returns a sorted version of the given `Vehicle` array.

 - parameter vehicleArray: `[Vehicle]?` list of `Vehicle`s to sort
 - returns: `[Vehicle]` sorted version of the given `Vehicle` list, never nil
 */
func sortVehiclesByName( vehicleArray: [Vehicle]? ) -> [Vehicle]
{
   guard let vehicleArray = vehicleArray else { return [] }

   var vehicles: [Vehicle] = Array( vehicleArray )
   vehicles.sort
   {
      vehicle1, vehicle2 in

      if let serialNumber1: String = vehicle1.serialNumber,
         let serialNumber2: String = vehicle2.serialNumber
      {
         return serialNumber1 < serialNumber2
      }
      else
      {
         return false
      }
   }

   return vehicles
}

/**
 Gets a `Vehicle` with the given ID in the given context.

 ### Example
     let vehicle: Vehicle = getVehicle( by: 2345, context: context )

 - parameter entityID: `Int64` ID of the `Vehicle` to fetch
 - parameter context: `NSManagedObjectContext` context to get the `Vehicle` from
 - returns: `Vehicle?` with the given ID in the context, nil if not found
 */
public func getVehicle( by entityID: Int64, context: NSManagedObjectContext ) -> Vehicle?
{
   return getEntityByID( entityID: entityID, context: context, entityName: VEHICLE_ENTITY_NAME ) as? Vehicle
}

/**
 Fetches, updates, or creates a `Vehicle` from the context, given the data.

 - parameter vehicle: `VehicleJSON` JSON data about the vehicle
 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `Vehicle` updated entity
 */
public func fetchVehicle( vehicle: VehicleJSON, context: NSManagedObjectContext ) -> Vehicle
{
   let vehicleEntity: Vehicle? = getVehicle( by: vehicle.id, context: context )
   vehicle.updateEntity( entity: vehicleEntity, context: context )
   return vehicleEntity ?? vehicle.addToCoreData( context: context )
}

/**
 Returns the number of `Vehicle` records in the given context.

 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `Int?` Number of `Vehicle` records in the context
 */
public func getVehicleCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: VEHICLE_ENTITY_NAME, context: context )
}

/**
 Delete all `Vehicle` entities in the given context.

 - parameter context: `NSManagedObjectContext` context to remove entities from
 */
func deleteAllVehicleEntities( context: NSManagedObjectContext )
{
   deleteAllEntities( entityType: VEHICLE_ENTITY_NAME, context: context )
}
