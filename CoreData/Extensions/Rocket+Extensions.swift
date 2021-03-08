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

   func addConfigurationFromJSON( configuration: LauncherConfigJSON?, context: NSManagedObjectContext )
   {
      guard let json = configuration else { return }
      let configurationEntity: LauncherConfig = fetchLauncherConfig( launcherConfig: json, context: context )
      self.configuration = configurationEntity
      configurationEntity.addToRockets( self )
   }
}

/**
 Add this rocket to Core Data as a `Rocket` entity. The context still needs to be saved after the add.

 - parameter json:    JSON to parse
 - parameter context: Core Data context to add the entity to.
 - returns: the added entity
 */
func addToCoreData( json: RocketJSON, context: NSManagedObjectContext ) -> Rocket
{
   let newRocket: Rocket = Rocket( context: context )
   updateEntity( json: json, entity: newRocket, context: context )

   return newRocket
}

/**
 Set or update the values of the `Rocket` entity,

 - parameter json:    JSON to parse
 - parameter entity: `Rocket?` entity to fill/update
 - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
 */
func updateEntity( json: RocketJSON, entity: Rocket?, context: NSManagedObjectContext )
{
   guard let rocketEntity = entity else { return }

   rocketEntity.id = json.id ?? -1
   rocketEntity.addConfigurationFromJSON( configuration: json.configuration, context: context )
   rocketEntity.name = json.configuration?.name

   rocketEntity.fetched = Date()
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
   let rocketEntity: Rocket? = getRocket( by: rocket.id ?? -1, context: context )
   updateEntity( json: rocket, entity: rocketEntity, context: context )
   return rocketEntity ?? addToCoreData( json: rocket, context: context )
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
