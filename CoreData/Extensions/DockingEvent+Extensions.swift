// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for `DockingEvent`. */
public let DOCKING_EVENT_ENTITY_NAME: String = "DockingEvent"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated {DockingEvent} entity.
 */
extension DockingEvent
{
   //
}

/**
 Add this data to Core Data as a `DockingEvent` entity. The context still needs to be saved after the add.

 - parameter json:    JSON to parse
 - parameter context: Core Data context to add the entity to.
 - returns:           the added entity
 */
public func addToCoreData( json: DockingEventJSON, context: NSManagedObjectContext ) -> DockingEvent
{
   let newDockingEvent: DockingEvent = DockingEvent( context: context )
   updateEntity( json: json, entity: newDockingEvent, context: context )

   return newDockingEvent
}

/**
 Set or update the values of the `DockingEvent` entity,

 - parameter json:    JSON to parse
 - parameter entity: `DockingEvent?` entity to fill/update
 - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
 */
public func updateEntity( json: DockingEventJSON, entity: DockingEvent?, context: NSManagedObjectContext )
{
   guard let dockingEventEntity = entity else { return }

   dockingEventEntity.id = json.id ?? -1
   dockingEventEntity.url = json.url
   dockingEventEntity.launch = getLaunch( by: json.launchID, context: context )
   dockingEventEntity.docking = json.docking
   dockingEventEntity.departure = json.departure
   if let flight: SpacecraftFlightJSON = json.flightVehicle
   {
      dockingEventEntity.flightVehicle = fetchSpacecraftFlight( flight: flight, context: context )
   }
   dockingEventEntity.dockingLocation = json.dockingLocation?.name
   if let spacestation: SpaceStationJSON = json.spacestation
   {
      dockingEventEntity.spacestation = fetchSpaceStation( spaceStation: spacestation, context: context )
   }

   dockingEventEntity.fetched = Date()
}

/**
 Gets a `DockingEvent` with the given ID in the given context.

 ### Example
     let dockingEvent: DockingEvent = getDockingEvent( by: 2345, context: context )

 - parameter entityID: `Int64` ID of the `DockingEvent` to fetch
 - parameter context:  `NSManagedObjectContext` context to get the `DockingEvent` from
 - returns:            `DockingEvent?` with the given ID in the context, nil if not found
 */
public func getDockingEvent( by entityID: Int64, context: NSManagedObjectContext ) -> DockingEvent?
{
   return getEntityByID( entityID: entityID, context: context, entityName: DOCKING_EVENT_ENTITY_NAME ) as? DockingEvent
}

/**
 Fetches, updates, or creates a `DockingEvent` from the context, given the data.

 - parameter dockingEvent: `DockingEventJSON` JSON data about the spacecraft config
 - parameter context:      `NSManagedObjectContext` Core Data object context
 - returns:                `DockingEvent` updated entity
 */
public func fetchDockingEvent( dockingEvent: DockingEventJSON, context: NSManagedObjectContext ) -> DockingEvent
{
   let dockingEventEntity: DockingEvent? = getDockingEvent( by: dockingEvent.id ?? -1, context: context )
   updateEntity( json: dockingEvent, entity: dockingEventEntity, context: context )
   return dockingEventEntity ?? addToCoreData( json: dockingEvent, context: context )
}
