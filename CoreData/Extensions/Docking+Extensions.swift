// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for `Docking`. */
public let DOCKING_ENTITY_NAME: String = "Docking"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated `Docking` entity.
 */
extension Docking
{
   // no sets

   /**
    Adds the JSON struct, creating or updating it if necessary.

    - parameter json:    `FlightVehicleJSON?` JSON struct to add
    - parameter context: `NSManagedObjectContext` context to add the JSON struct in
    */
   func addEntityFromJSON( json: FlightVehicleJSON?, context: NSManagedObjectContext )
   {
      guard let json = json else { return }
      let flightVehicleEntity: FlightVehicle = fetchFlightVehicle( flightVehicle: json, context: context )
      self.flightVehicle = flightVehicleEntity
      flightVehicleEntity.addToDockings( self )
   }
}

/**
 Add this data to Core Data as a `Docking` entity. The context still needs to be saved after the add.

 - parameter json:    JSON to parse
 - parameter context: Core Data context to add the entity to.
 - returns: `Docking` the added entity
 */
public func addToCoreData( json: DockingJSON, context: NSManagedObjectContext ) -> Docking
{
   let newDocking: Docking = Docking( context: context )
   updateEntity( json: json, entity: newDocking, context: context )

   return newDocking
}

/**
 Set or update the values of the `Docking` entity,

 - parameter json:    JSON to parse
 - parameter entity:  `Docking?` entity to fill/update
 - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
 */
public func updateEntity( json: DockingJSON, entity: Docking?, context: NSManagedObjectContext )
{
   guard let dockingEntity = entity else { return }

   dockingEntity.id = json.id
   dockingEntity.launchID = json.launchID
   dockingEntity.docking = json.docking
   dockingEntity.departure = json.departure
   dockingEntity.addEntityFromJSON( json: json.flightVehicle, context: context )
   dockingEntity.dockingLocationName = json.dockingLocation?.name
   dockingEntity.sortingDate = parseISODate( isoDate: json.docking )

   dockingEntity.fetched = Date()
}

/**
 Returns a sorted version of the given `Docking` array.

 - parameter dockingArray: `[Docking]?` list of `Docking`s to sort
 - returns: `[Docking]` sorted version of the given `Docking` list, never nil
 */
public func sortDockingsByName( dockingArray: [Docking]? ) -> [Docking]
{
   guard let dockingArray = dockingArray else { return [] }

   var dockings: [Docking] = Array( dockingArray )
   dockings.sort
   {
      docking1, docking2 in

      if let name1: String = docking1.docking,
         let name2: String = docking2.docking
      {
         return name1 < name2
      }
      else
      {
         return false
      }
   }

   return dockings
}

/**
 Gets a `Docking` with the given ID in the given context.

 ### Example
     let docking: Docking = getDocking( by: 2345, context: context )

 - parameter entityID: `Int64` ID of the `Docking` to fetch
 - parameter context: `NSManagedObjectContext` context to get the `Docking` from
 - returns: `Docking?` docking with the given ID in the context, nil if not found
 */
public func getDocking( by entityID: Int64, context: NSManagedObjectContext ) -> Docking?
{
   return getEntityByID( entityID: entityID, context: context, entityName: DOCKING_ENTITY_NAME ) as? Docking
}

/**
 Fetches, updates, or creates a `Docking` from the context, given the data

 - parameter docking: `DockingJSON` JSON data about the docking
 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: updated `Docking`
 */
public func fetchDocking( docking: DockingJSON, context: NSManagedObjectContext ) -> Docking
{
   let dockingEntity: Docking? = getDocking( by: docking.id, context: context )
   updateEntity( json: docking, entity: dockingEntity, context: context )
   return dockingEntity ?? addToCoreData( json: docking, context: context )
}

/**
 Returns the number of `Docking` records in the given context.

 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `Int?` Number of `Docking` records in the context
 */
public func getDockingCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: DOCKING_ENTITY_NAME, context: context )
}

/**
 Delete all `Docking` entities in the given context.

 - parameter context: `NSManagedObjectContext` context to remove entities from
 */
func deleteAllDockingEntities( context: NSManagedObjectContext )
{
   deleteAllEntities( entityType: DOCKING_ENTITY_NAME, context: context )
}
