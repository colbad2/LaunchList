// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

extension FlightVehicle
{
   /** Set< Docking > wrapper for the generated NSSet of {Docking}s. */
   var dockingsSet: Set< Docking > { self.dockings as? Set< Docking > ?? Set< Docking >() }

   /** Array of [Docking]s, sorted by name. */
   var sortedDockings: [Docking] { return sortDockingsByName( dockingArray: Array( self.dockingsSet ) ) }

   /** True if the [FlightVehicle] has any [Docking]s. */
   var hasDockings: Bool { return !dockingsSet.isEmpty }
}

/**
 Returns a sorted version of the given [FlightVehicle] array.

 - parameter flightVehicleArray - list of [FlightVehicle]s to sort
 - returns: sorted version of the given [FlightVehicle] list
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

public func getFlightVehicle( by entityID: Int64, context: NSManagedObjectContext ) -> FlightVehicle?
{
   return getEntityByID( entityID: entityID, context: context, entityName: "FlightVehicle" ) as? FlightVehicle
}

public func fetchFlightVehicle( flightVehicle: FlightVehicleJSON, context: NSManagedObjectContext ) -> FlightVehicle
{
   let flightVehicleEntity: FlightVehicle? = getFlightVehicle( by: flightVehicle.id, context: context )
   flightVehicle.updateEntity( entity: flightVehicleEntity, context: context )
   return flightVehicleEntity ?? flightVehicle.addToCoreData( context: context )
}

/**
 Returns the number of [FlightVehicle] records in the given context.

 - parameter context: Core Data object context
 - returns: [Int?] Number of [FlightVehicle] records in the context
 */
public func getFlightVehicleCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "FlightVehicle", context: context )
}
