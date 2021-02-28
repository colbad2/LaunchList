// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 ### Example JSON
      {
         "id": 2,
         "url": "https://ll.thespacedevs.com/2.1.0/expedition/2/",
         "name": "Skylab 2",
         "start": "1973-05-25T13:00:00Z",
         "end": "1973-06-22T13:49:48Z",
         "spacestation": {
           "id": 6,
           "url": "https://ll.thespacedevs.com/2.1.0/spacestation/6/",
           "name": "Skylab",
           "status": {
             "id": 2,
             "name": "De-Orbited"
           },
           "orbit": "Low Earth Orbit",
           "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/spacestation_images/skylab_image_20190215230143.jpeg"
         }
      }

 ### Spec
       id   integer
       url   string($uri)
       name*   string maxLength: 255 minLength: 1
       start*   string($date-time)
       end   string($date-time)
       spacestation   SpaceStation
       crew   [AstronautFlight]
*/
public class ExpeditionJSON: Decodable, Identifiable, JSONElement
{
   // translate API attribute names into better var names
//   enum CodingKeys: String, CodingKey
//   {
//      case id, url, name, start, end
//
//      case spaceStation = "spacestation"
//   }

   /** ID of the rocket within the API. */
   public let id: Int64
   /** URI for this data in the API. Unused. */
   let url: String?
   /** Expedition name. */
   let name: String?
   /** Expedition start date, ISO format. */
   let start: String?
   /** Expedition end date, ISO format. */
   let end: String?
   /** Station target for the mission. */
   let spaceStation: SpaceStationJSON?

   /**
    Make a `ExpeditionJSON` from a JSON structure.

    - parameter json: `JSONStructure` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.url = json[ "url" ] as? String
      self.name = json[ "name" ] as? String
      self.start = json[ "start" ] as? String
      self.end = json[ "end" ] as? String
      self.spaceStation = SpaceStationJSON( json: json[ "spacestation" ] as? JSONStructure )
   }

   /**
    Add this data to Core Data as a `Expedition` entity. The context still needs to be saved after the add.

    - parameter context: Core Data context to add the entity to.
    - returns: the added entity
    */
   public func addToCoreData( context: NSManagedObjectContext ) -> Expedition
   {
      let newExpedition: Expedition = Expedition( context: context )
      updateEntity( entity: newExpedition, context: context )

      return newExpedition
   }

   /**
    Set or update the values of the `Expedition` entity,

    - parameter entity: `Expedition?` entity to fill/update
    - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
    */
   public func updateEntity( entity: Expedition?, context: NSManagedObjectContext )
   {
      guard let expeditionEntity = entity else { return }

      expeditionEntity.id = id
      expeditionEntity.name = name
      expeditionEntity.start = start
      expeditionEntity.end = end
      expeditionEntity.addSpaceStationFromJSON( spaceStation: spaceStation, context: context )

      expeditionEntity.fetched = Date()
   }
}
