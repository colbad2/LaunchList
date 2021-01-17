// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 Extensions to the Core Data generated {Astronaut} entity.
 */
extension Astronaut
{
   // no sets
}

/**
 Returns a sorted version of the given [Astronaut] array.

 - parameter astronautArray - list of [Astronaut]s to sort
 - returns: sorted version of the given [Astronaut] list
 */
public func sortAstronautsByName( astronautArray: [Astronaut]? ) -> [Astronaut]
{
   guard let astronautArray = astronautArray else { return [] }

   var astronauts: [Astronaut] = Array( astronautArray )
   astronauts.sort
   {
      astronaut1, astronaut2 in

      if let name1: String = astronaut1.name,
         let name2: String = astronaut2.name
      {
         return name1 < name2
      }
      else
      {
         return false
      }
   }

   return astronauts
}


public func getAstronaut( by id: Int64, context: NSManagedObjectContext ) -> Astronaut?
{
   return getEntityByID( entityID: id, context: context, entityName: "Astronaut" ) as? Astronaut
}

public func fetchAstronaut( astronaut: AstronautJSON, context: NSManagedObjectContext ) -> Astronaut
{
   let astronautEntity: Astronaut? = getAstronaut( by: astronaut.id, context: context )
   astronaut.updateEntity( entity: astronautEntity, context: context )
   return astronautEntity ?? astronaut.addToCoreData( context: context )
}

/**
 Returns the number of [Astronaut] records in the given context.

 - parameter context: Core Data object context
 - returns: [Int?] Number of [Astronaut] records in the context
 */
public func getAstronautCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "Astronaut", context: context )
}
