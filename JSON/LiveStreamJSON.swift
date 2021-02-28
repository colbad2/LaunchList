// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 Part of the starship API.
 
 ### Example JSON
       {
         "title": "LabPadre 24/7 Livestream",
         "description": "LabPadre is a free 24/7 live stream of the SpaceX …",
         "image": "https://i.ytimg.com/vi/5QbM7Vsz3kg/maxresdefault_live.jpg",
         "url": "https://www.youtube.com/watch?v=Ky5l9ZxsG9M"
       }
 */
public class LiveStreamJSON: Decodable, JSONElement
{
   // translate API attribute names into better var names
//   enum CodingKeys: String, CodingKey
//   {
//      case title, image, url
//
//      case liveStreamDescription = "description"
//   }

   let title: String?
   let liveStreamDescription: String?
   let image: String?
   let url: String

   /**
    Make a `LiveStreamJSON` from a JSON structure.

    - parameter json: `JSONStructure` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }

      self.title = json[ "title" ] as? String
      self.liveStreamDescription = json[ "description" ] as? String
      self.image = json[ "image" ] as? String
      self.url = json[ "url" ] as! String
   }

   /**
    Add this data to Core Data as a `LiveStream`. The context still needs to be saved after the add.

    - parameter context: Core Data context to add the entity to.
    - returns: `LiveStream` the added entity
    */
   public func addToCoreData( context: NSManagedObjectContext ) -> LiveStream
   {
      let newLiveStream: LiveStream = LiveStream( context: context )
      updateEntity( entity: newLiveStream, context: context )

      return newLiveStream
   }

   /**
    Set or update the values of the `LiveStream` entity,

    - parameter entity:  `LiveStream?` entity to fill/update
    - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
    */
   public func updateEntity( entity: LiveStream?, context: NSManagedObjectContext )
   {
      guard let liveStreamEntity = entity else { return }

      liveStreamEntity.id = url // use the URL as an ID
      liveStreamEntity.url = url
      liveStreamEntity.liveStreamDescription = liveStreamDescription
      liveStreamEntity.title = title
      liveStreamEntity.image = image

      liveStreamEntity.fetched = Date()
   }
}
