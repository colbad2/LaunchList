// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

extension Rocket
{
   /** Set< Launch > wrapper for the generated NSSet of [Launch]s. */
   var launchesSet: Set< Launch > { self.launches as? Set< Launch > ?? Set< Launch >() }

   /** Set< Vehicle > wrapper for the generated NSSet of [Vehicle]s. */
   var vehiclesSet: Set< Vehicle > { self.vehicles as? Set< Vehicle > ?? Set< Vehicle >() }
}

/**
 Returns a sorted version of the given [Rocket] array.

 - parameter rocketArray - list of [Rocket]s to sort
 - returns: sorted version of the given [Rocket] list
 */
func sortRocketsByName( rocketArray: [Rocket]? ) -> [Rocket]
{
   guard let rocketArray = rocketArray else { return [] }

   var rockets: [Rocket] = Array( rocketArray )
   rockets.sort
   {
      rocket1, rocket2 in

      if let name1: String = rocket1.name,
         let name2: String = rocket2.name
      {
         return name1 < name2
      }
      else
      {
         return false
      }
   }

   return rockets
}

public func getRocket( by id: Int64, context: NSManagedObjectContext ) -> Rocket?
{
   return getEntityByID( entityID: id, context: context, entityName: "Rocket" ) as? Rocket
}

public func fetchRocket( rocket: RocketJSON, context: NSManagedObjectContext ) -> Rocket?
{
   guard let id = rocket.configuration?.id else { return nil }

   let rocketEntity: Rocket? = getRocket( by: id, context: context )
   rocket.updateEntity( entity: rocketEntity, context: context )
   return rocketEntity ?? rocket.addToCoreData( context: context )
}

public func getRocketCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "Rocket", context: context )
}
