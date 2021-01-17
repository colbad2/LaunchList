// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 Extensions to the Core Data generated [Pad] entity.
 */
extension Pad
{
   /** Set< Launch > wrapper for the generated NSSet of [Launch]s. */
   var launchSet: Set< Launch > { self.launches as? Set< Launch > ?? Set< Launch >() }

   /** Array of [Launch]s, sorted by name. */
   var sortedLaunches: [Launch] { sortLaunchesByName( launchArray: Array( self.launchSet ) ) }

   /** True if the [Pad] has any [Launch]s. */
   var hasLaunches: Bool { return !launchSet.isEmpty }
}

/**
 Returns a sorted version of the given [Pad] array.

 - parameter padArray - list of [Pad]s to sort
 - returns: sorted version of the given [Pad] list
 */
public func sortPadsByName( padArray: [Pad]? ) -> [Pad]
{
   guard let padArray = padArray else { return [] }

   var pads: [Pad] = Array( padArray )
   pads.sort
   {
      pad1, pad2 in

      if let name1: String = pad1.name,
         let name2: String = pad2.name
      {
         return name1 < name2
      }
      else
      {
         return false
      }
   }

   return pads
}

public func getPad( by entityID: Int64, context: NSManagedObjectContext ) -> Pad?
{
   return getEntityByID( entityID: entityID, context: context, entityName: "Pad" ) as? Pad
}

public func fetchPad( pad: PadJSON, context: NSManagedObjectContext ) -> Pad
{
   let padEntity: Pad? = getPad( by: pad.id, context: context )
   pad.updateEntity( entity: padEntity, context: context )
   return padEntity ?? pad.addToCoreData( context: context )
}

/**
 Returns the number of [Pad] records in the given context.

 - parameter context: Core Data object context
 - returns: [Int?] Number of [Pad] records in the context
 */
public func getPadCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "Pad", context: context )
}
