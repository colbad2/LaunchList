// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for `Rocket`. */
public let ROCKET_ENTITY_NAME: String = "Rocket"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated [Rocket` entity.
 */
extension Rocket
{
   /** `Set< Launch >` wrapper for the generated `NSSet` of `Launch`s. */
   var launchesSet: Set< Launch > { self.launches as? Set< Launch > ?? Set< Launch >() }

   /** `Set< Vehicle >` wrapper for the generated `NSSet` of `Vehicle`s. */
   var rocketsSet: Set< Rocket > { self.vehicles as? Set< Rocket > ?? Set< Rocket >() }

   /** Array of `Launch`s, sorted by name. */
   var sortedLaunches: [Launch] { sortLaunchesByName( launchArray: Array( self.launchesSet ) ) }

   /** True if the `Rocket` has any `Launch`s. */
   var hasLaunches: Bool { !launchesSet.isEmpty }

   /** Array of `Vehicle`s, sorted by name. */
   var sortedRockets: [Rocket] { sortRocketsByName( rocketArray: Array( self.rocketsSet ) ) }

   /** True if the `Rocket` has any `Vehicle`s. */
   var hasVehicles: Bool { !rocketsSet.isEmpty }

   func addConfigurationFromJSON( configuration: ConfigurationJSON?, context: NSManagedObjectContext )
   {
      guard let json = configuration else { return }
      let configurationEntity: Configuration = fetchConfiguration( configuration: json, context: context )
      self.configuration = configurationEntity
      configurationEntity.addToRockets( self )
   }
}

/**
 Returns a sorted version of the given `Rocket` array.

 - parameter rocketArray: `[Rocket]?` list of `Rocket`s to sort
 - returns: `[Rocket]` sorted version of the given `Rocket` list, never nil
 */
func sortRocketsByName( rocketArray: [Rocket]? ) -> [Rocket]
{
   guard let rocketArray = rocketArray else { return [] }

   var rockets: [Rocket] = Array( rocketArray )
   rockets.sort
   {
      rocket1, rocket2 in

      if let name1: String = rocket1.configuration?.name,
         let name2: String = rocket2.configuration?.name
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

/**
 Gets a `Rocket` with the given ID in the given context.

 ### Example
     let rocket: Rocket = getRocket( by: 2345, context: context )

 - parameter id: `Int64` ID of the `Rocket` to fetch
 - parameter context: `NSManagedObjectContext` context to get the `Rocket` from
 - returns: `Rocket?` with the given ID in the context, nil if not found
 */
public func getRocket( by id: Int64, context: NSManagedObjectContext ) -> Rocket?
{
   return getEntityByID( entityID: id, context: context, entityName: ROCKET_ENTITY_NAME ) as? Rocket
}

/**
 Fetches, updates, or creates a `Rocket` from the context, given the data.

 - parameter rocket: `RocketJSON` JSON data about the rocket
 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `Rocket` updated entity
 */
public func fetchRocket( rocket: RocketJSON, context: NSManagedObjectContext ) -> Rocket
{
   let rocketEntity: Rocket? = getRocket( by: rocket.id, context: context )
   rocket.updateEntity( entity: rocketEntity, context: context )
   return rocketEntity ?? rocket.addToCoreData( context: context )
}

/**
 Returns the number of `Rocket` records in the given context.

 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `Int?` Number of `Rocket` records in the context
 */
public func getRocketCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: ROCKET_ENTITY_NAME, context: context )
}

/**
 Delete all `Rocket` entities in the given context.

 - parameter context: `NSManagedObjectContext` context to remove entities from
 */
func deleteAllRocketEntities( context: NSManagedObjectContext )
{
   deleteAllEntities( entityType: ROCKET_ENTITY_NAME, context: context )
}
