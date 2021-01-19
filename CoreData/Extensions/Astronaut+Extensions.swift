// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for `Astronaut`. */
public let ASTRONAUT_ENTITY_NAME: String = "Astronaut"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated {Astronaut} entity.
 */
extension Astronaut
{
   /**
    Adds the JSON struct, creating or updating as necessary.

    - parameter agency:  `AgencyJSON?` JSON struct to add
    - parameter context: `NSManagedObjectContext` context to add the JSON struct in
    */
   func addAgencyFromJSON( agency: AgencyJSON?, context: NSManagedObjectContext )
   {
      guard let json = agency else { return }
      let agencyEntity: Agency = fetchAgency( agency: json, context: context )
      self.agency = agencyEntity
      agencyEntity.addToAstronauts( self )
   }
}

/**
 Gets all the `Agency` entities in the context

 - parameter context:  `NSManagedObjectContext` context to get the `Astronaut`s from
 - returns: `[Astronaut]?` list of astronauts, nil if not possible
 */
public func fetchAllAstronauts( context: NSManagedObjectContext ) -> [Astronaut]?
{
   return fetchAllEntities( entityName: ASTRONAUT_ENTITY_NAME, context: context ) as? [Astronaut]
}

/**
 Returns a sorted version of the given `Astronaut` array.

 - parameter astronautArray: `[Astronaut]?` list of `Astronaut`s to sort
 - returns: `[Astronaut]` sorted version of the given `Astronaut` list
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

/**
 Gets an `Astronaut` with the given ID in the given context.

 ### Example
     let astronaut: Astronaut = getAstronaut( by: 2345, context: context )

 - parameter id: `Int64` ID of the `Astronaut` to fetch
 - parameter context: `NSManagedObjectContext` context to get the `Astronaut` from
 - returns: `Astronaut?` astronaut with the given ID in the context, nil if not found
 */
public func getAstronaut( by id: Int64, context: NSManagedObjectContext ) -> Astronaut?
{
   return getEntityByID( entityID: id, context: context, entityName: ASTRONAUT_ENTITY_NAME ) as? Astronaut
}

/**
 Fetches, updates, or creates a `Astronaut` from the context, given the data

 - parameter astronaut: `AstronautJSON` JSON data about the astronaut
 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: updated `Astronaut`
 */
public func fetchAstronaut( astronaut: AstronautJSON, context: NSManagedObjectContext ) -> Astronaut
{
   let astronautEntity: Astronaut? = getAstronaut( by: astronaut.id, context: context )
   astronaut.updateEntity( entity: astronautEntity, context: context )
   return astronautEntity ?? astronaut.addToCoreData( context: context )
}

/**
 Returns the number of `Astronaut` records in the given context.

 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `Int?` Number of `Astronaut` records in the context
 */
public func getAstronautCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: ASTRONAUT_ENTITY_NAME, context: context )
}

/**
 Delete all `Astronaut` entities in the given context.

 - parameter context: `NSManagedObjectContext` context to remove entities from
 */
func deleteAllAstronautEntities( context: NSManagedObjectContext )
{
   deleteAllEntities( entityType: ASTRONAUT_ENTITY_NAME, context: context )
}
