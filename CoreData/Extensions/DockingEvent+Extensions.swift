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
   let dockingEventEntity: DockingEvent? = getDockingEvent( by: dockingEvent.id, context: context )
   dockingEvent.updateEntity( entity: dockingEventEntity, context: context )
   return dockingEventEntity ?? dockingEvent.addToCoreData( context: context )
}
