// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for `AstronautFlight`. */
public let ASTRONAUT_FLIGHT_ENTITY_NAME: String = "AstronautFlight"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated {AstronautFlight} entity.
 */
extension AstronautFlight
{
   //
}

/**
 Add this data to Core Data as a `AstronautFlight` entity. The context still needs to be saved after the add.

 - parameter json:    JSON to parse
 - parameter context: Core Data context to add the entity to.
 - returns: the added entity
 */
public func addToCoreData( json: AstronautFlightJSON, context: NSManagedObjectContext ) -> AstronautFlight
{
   let newAstronautFlight: AstronautFlight = AstronautFlight( context: context )
   updateEntity( json: json, entity: newAstronautFlight, context: context )

   return newAstronautFlight
}

/**
 Set or update the values of the `AstronautFlight` entity,

 - parameter json:    JSON to parse
 - parameter entity: `AstronautFlight?` entity to fill/update
 - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
 */
public func updateEntity( json: AstronautFlightJSON, entity: AstronautFlight?, context: NSManagedObjectContext )
{
   guard let flightEntity = entity else { return }

   flightEntity.id = json.id ?? -1
   flightEntity.role = json.role
   if let astronaut: AstronautJSON = json.astronaut
   {
      flightEntity.astronaut = fetchAstronaut( astronaut: astronaut, context: context )
   }

   flightEntity.fetched = Date()
}

/**
 Gets an `AstronautFlight` with the given ID in the given context.

 ### Example
     let astronautFlight: AstronautFlight = getAstronautFlight( by: 2345, context: context )

 - parameter id: `Int64` ID of the `AstronautFlight` to fetch
 - parameter context: `NSManagedObjectContext` context to get the `AstronautFlight` from
 - returns: `AstronautFlight?` astronaut flight with the given ID in the context, nil if not found
 */
public func getAstronautFlight( by id: Int64, context: NSManagedObjectContext ) -> AstronautFlight?
{
   return getEntityByID( entityID: id, context: context, entityName: ASTRONAUT_FLIGHT_ENTITY_NAME ) as? AstronautFlight
}

/**
 Fetches, updates, or creates a `AstronautFlight` from the context, given the data

 - parameter astronaut: `AstronautFlightJSON` JSON data about the astronaut flight
 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: updated `AstronautFlight`
 */
public func fetchAstronautFlight( astronautFlight: AstronautFlightJSON, context: NSManagedObjectContext ) -> AstronautFlight
{
   let astronautFlightEntity: AstronautFlight? = getAstronautFlight( by: astronautFlight.id ?? -1, context: context )
   updateEntity( json: astronautFlight, entity: astronautFlightEntity, context: context )
   return astronautFlightEntity ?? addToCoreData( json: astronautFlight, context: context )
}
