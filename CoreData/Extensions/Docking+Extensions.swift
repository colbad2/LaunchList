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
   docking.updateEntity( entity: dockingEntity, context: context )
   return dockingEntity ?? docking.addToCoreData( context: context )
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
