// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

extension Vehicle
{
   // no sets
}

public func getVehicle( by entityID: Int64, context: NSManagedObjectContext ) -> Vehicle?
{
   return getEntityByID( entityID: entityID, context: context, entityName: "Vehicle" ) as? Vehicle
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
   return getRecordsCount( entityName: "Vehicle", context: context )
}
