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
   let astronautFlightEntity: AstronautFlight? = getAstronautFlight( by: astronautFlight.id, context: context )
   astronautFlight.updateEntity( entity: astronautFlightEntity, context: context )
   return astronautFlightEntity ?? astronautFlight.addToCoreData( context: context )
}
