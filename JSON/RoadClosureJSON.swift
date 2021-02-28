// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 ### Example JSON
       {
         "id": 82,
         "title": "Secondary Date",
         "status": {
           "id": 1,
           "name": "Scheduled"
         },
         "window_start": "2020-12-30T14:00:00Z",
         "window_end": "2020-12-30T23:00:00Z"
       }
 */
public class RoadClosureJSON: Decodable, Identifiable, JSONElement
{
   // translate API attribute names into better var names
//   enum CodingKeys: String, CodingKey
//   {
//      case id, title, status, windowStart, windowEnd
//   }

   public let id: Int64
   let title: String?
   let status: IDNameJSON?
   let windowStart: String?
   let windowEnd: String?

   /**
    Make a `LauncherJSON` from a JSON structure.

    - parameter json: `JSONStructure` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.title = json[ "title" ] as? String
      self.status = IDNameJSON( json: json[ "status" ] as? JSONStructure )
      self.windowStart = json[ "windowStart" ] as? String
      self.windowEnd = json[ "windowEnd" ] as? String
   }

   /**
    Add this data to Core Data as a `RoadClosure`. The context still needs to be saved after the add.

    - parameter context: Core Data context to add the entity to.
    - returns: `RoadClosure` the added entity
    */
   public func addToCoreData( context: NSManagedObjectContext ) -> RoadClosure
   {
      let newRoadClosure: RoadClosure = RoadClosure( context: context )
      updateEntity( entity: newRoadClosure, context: context )

      return newRoadClosure
   }

   /**
    Set or update the values of the `RoadClosure` entity,

    - parameter entity:  `RoadClosure?` entity to fill/update
    - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
    */
   public func updateEntity( entity: RoadClosure?, context: NSManagedObjectContext )
   {
      guard let entity = entity else { return }

      entity.id = id
      entity.title = title
      entity.statusID = guaranteedInt64( status?.id )
      entity.statusName = status?.name
      entity.windowStart = windowStart
      entity.windowEnd = windowEnd

      entity.fetched = Date()
   }
}
