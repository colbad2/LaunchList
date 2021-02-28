// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for `SpacecraftFlight`. */
public let SPACECRAFT_FLIGHT_ENTITY_NAME: String = "SpacecraftFlight"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated `SpacecraftFlight` entity.
 */
extension SpacecraftFlight
{
   /**
    Adds the JSON struct, creating or updating as necessary.

    - parameter spacecraft:  `SpacecraftJSON?` JSON struct to add
    - parameter context: `NSManagedObjectContext` context to add the JSON struct in
    */
   func addSpacecraftFromJSON( spacecraft: SpacecraftJSON?, context: NSManagedObjectContext )
   {
      if let spacecraft: SpacecraftJSON = spacecraft
      {
         let spacecraftEntity: Spacecraft = fetchSpacecraft( spacecraft: spacecraft, context: context )
         self.spacecraft = spacecraftEntity
         spacecraftEntity.addToSpacecraftFlights( self )
      }
   }

   /**
    Adds the JSON struct, creating or updating as necessary.

    - parameter launch:  `LaunchJSON?` JSON struct to add
    - parameter context: `NSManagedObjectContext` context to add the JSON struct in
    */
   func addLaunchFromJSON( launch: LaunchJSON?, context: NSManagedObjectContext )
   {
      if let launch: LaunchJSON = launch
      {
         let launchEntity: Launch = fetchLaunch( launch: launch, context: context )
         self.launch = launchEntity
         launchEntity.spacecraftFlight = self
      }
   }

   func addLaunch( launch: Launch?, context: NSManagedObjectContext )
   {
      if let launch: Launch = launch
      {
         self.launch = launch
         launch.spacecraftFlight = self
      }
   }

   /**
    Adds the JSON structs, creating or updating as necessary.

    - parameter crew:    `[AstronautFlightJSON]?` JSON struct to add
    - parameter context: `NSManagedObjectContext` context to add the JSON struct in
    */
   func addLaunchCrewFromJSON( crew: [AstronautFlightJSON]?, context: NSManagedObjectContext )
   {
      for astronautFlight in crew ?? []
      {
         let astronautFlightEntity: AstronautFlight = fetchAstronautFlight( astronautFlight: astronautFlight, context: context )
         self.addToLaunchCrewFlights( astronautFlightEntity )
         astronautFlightEntity.launchFlight = self
      }
   }

   /**
    Adds the JSON structs, creating or updating as necessary.

    - parameter crew:    `[AstronautFlightJSON]?` JSON struct to add
    - parameter context: `NSManagedObjectContext` context to add the JSON struct in
    */
   func addOnboardCrewFromJSON( crew: [AstronautFlightJSON]?, context: NSManagedObjectContext )
   {
      for astronautFlight in crew ?? []
      {
         let astronautFlightEntity: AstronautFlight = fetchAstronautFlight( astronautFlight: astronautFlight, context: context )
         self.addToOnboardCrewFlights( astronautFlightEntity )
         astronautFlightEntity.onboardFlight = self
      }
   }

   /**
    Adds the JSON structs, creating or updating as necessary.

    - parameter crew:    `[AstronautFlightJSON]?` JSON struct to add
    - parameter context: `NSManagedObjectContext` context to add the JSON struct in
    */
   func addLandingCrewFromJSON( crew: [AstronautFlightJSON]?, context: NSManagedObjectContext )
   {
      for astronautFlight in crew ?? []
      {
         let astronautFlightEntity: AstronautFlight = fetchAstronautFlight( astronautFlight: astronautFlight, context: context )
         self.addToLandingCrewFlights( astronautFlightEntity )
         astronautFlightEntity.landingFlight = self
      }
   }

   /**
    Adds the JSON structs, creating or updating as necessary.

    - parameter dockingEvents: `[DockingEventJSON]?` JSON struct to add
    - parameter context:       `NSManagedObjectContext` context to add the JSON struct in
    */
   func addDockingEventsFromJSON( dockingEvents: [DockingEventJSON]?, context: NSManagedObjectContext )
   {
      for dockingEvent in dockingEvents ?? []
      {
         let dockingEventEntity: DockingEvent = fetchDockingEvent( dockingEvent: dockingEvent, context: context )
         self.addToDockingEvents( dockingEventEntity )
         dockingEventEntity.flightVehicle = self
      }
   }
}

/**
 Gets all the `SpacecraftFlight` entities in the context

 - parameter context: `NSManagedObjectContext` context to get the `SpacecraftFlight`s from
 - returns:           `[SpacecraftFlight]?` list of spacecraft configs, nil if not possible
 */
public func fetchAllSpacecraftFlights( context: NSManagedObjectContext ) -> [SpacecraftFlight]?
{
   return fetchAllEntities( entityName: SPACECRAFT_CONFIG_ENTITY_NAME, context: context ) as? [SpacecraftFlight]
}

/**
 Gets a `SpacecraftFlight` with the given ID in the given context.

 ### Example
 let spacecraftFlight: SpacecraftFlight = getSpacecraftFlight( by: 2345, context: context )

 - parameter entityID: `Int64` ID of the `SpacecraftFlight` to fetch
 - parameter context:  `NSManagedObjectContext` context to get the `SpacecraftFlight` from
 - returns:            `SpacecraftFlight?` with the given ID in the context, nil if not found
 */
public func getSpacecraftFlight( by entityID: Int64, context: NSManagedObjectContext ) -> SpacecraftFlight?
{
   return getEntityByID( entityID: entityID, context: context, entityName: SPACECRAFT_CONFIG_ENTITY_NAME ) as? SpacecraftFlight
}

/**
 Fetches, updates, or creates a `SpacecraftFlight` from the context, given the data.

 - parameter flight: `SpacecraftFlightJSON` JSON data about the spacecraft config
 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `SpacecraftFlight` updated entity
 */
public func fetchSpacecraftFlight( flight: SpacecraftFlightJSON, context: NSManagedObjectContext ) -> SpacecraftFlight
{
   let spacecraftFlightEntity: SpacecraftFlight? = getSpacecraftFlight( by: flight.id, context: context )
   flight.updateEntity( entity: spacecraftFlightEntity, context: context )
   return spacecraftFlightEntity ?? flight.addToCoreData( context: context )
}

/**
 Returns the number of `SpacecraftFlight` records in the given context.

 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `Int?` Number of `SpacecraftFlight` records in the context
 */
public func getSpacecraftFlightCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: SPACECRAFT_CONFIG_ENTITY_NAME, context: context )
}

/**
 Delete all `SpacecraftFlight` entities in the given context.

 - parameter context: `NSManagedObjectContext` context to remove entities from
 */
func deleteAllSpacecraftFlightEntities( context: NSManagedObjectContext )
{
   deleteAllEntities( entityType: SPACECRAFT_CONFIG_ENTITY_NAME, context: context )
}
