// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

extension Docking
{
   // no sets
}

/**
 Returns a sorted version of the given [Docking] array.

 - parameter dockingArray - list of [Docking]s to sort
 - returns: sorted version of the given [Docking] list
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

public func getDocking( by entityID: Int64, context: NSManagedObjectContext ) -> Docking?
{
   return getEntityByID( entityID: entityID, context: context, entityName: "Docking" ) as? Docking
}

public func fetchDocking( docking: DockingJSON, context: NSManagedObjectContext ) -> Docking
{
   let dockingEntity: Docking? = getDocking( by: docking.id, context: context )
   docking.updateEntity( entity: dockingEntity, context: context )
   return dockingEntity ?? docking.addToCoreData( context: context )
}

/**
 Returns the number of [Docking] records in the given context.

 - parameter context: Core Data object context
 - returns: [Int?] Number of [Docking] records in the context
 */
public func getDockingCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "Docking", context: context )
}
