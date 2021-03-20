// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for `URLLink`. */
public let ROAD_CLOSURE_ENTITY_NAME: String = "RoadClosure"
// swiftlint:enable identifier_name

extension RoadClosure
{
   //
}

/**
 Add this data to Core Data as a `RoadClosure`. The context still needs to be saved after the add.

 - parameter json:    JSON to parse
 - parameter context: Core Data context to add the entity to.
 - returns: `RoadClosure` the added entity
 */
public func addToCoreData( json: RoadClosureJSON, context: NSManagedObjectContext ) -> RoadClosure
{
   let newRoadClosure: RoadClosure = RoadClosure( context: context )
   updateEntity( json: json, entity: newRoadClosure, context: context )

   return newRoadClosure
}

/**
 Set or update the values of the `RoadClosure` entity,

 - parameter json:    JSON to parse
 - parameter entity:  `RoadClosure?` entity to fill/update
 - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
 */
public func updateEntity( json: RoadClosureJSON, entity: RoadClosure?, context: NSManagedObjectContext )
{
   guard let entity = entity else { return }

   entity.id = json.id ?? -1
   entity.title = json.title
   entity.statusID = guaranteedInt64( json.status?.id )
   entity.statusName = json.status?.name
   entity.windowStart = json.windowStart
   entity.windowEnd = json.windowEnd

   entity.fetched = Date()
}
