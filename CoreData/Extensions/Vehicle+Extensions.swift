// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for [Vehicle]. */
public let VEHICLE_ENTITY_NAME: String = "Vehicle"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated [Vehicle] entity.
 */
extension Vehicle
{
   // no sets
}

public func getVehicle( by entityID: Int64, context: NSManagedObjectContext ) -> Vehicle?
{
   return getEntityByID( entityID: entityID, context: context, entityName: VEHICLE_ENTITY_NAME ) as? Vehicle
}

public func fetchVehicle( vehicle: VehicleJSON, context: NSManagedObjectContext ) -> Vehicle
{
   let vehicleEntity: Vehicle? = getVehicle( by: vehicle.id, context: context )
   vehicle.updateEntity( entity: vehicleEntity, context: context )
   return vehicleEntity ?? vehicle.addToCoreData( context: context )
}

/**
 Returns the number of [Vehicle] records in the given context.

 - parameter context: Core Data object context
 - returns: [Int?] Number of [Vehicle] records in the context
 */
public func getVehicleCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: VEHICLE_ENTITY_NAME, context: context )
}
