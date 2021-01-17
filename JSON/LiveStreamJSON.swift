// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable line_length

/**
 Part of the starship API.
 
 ### Example JSON
       {
         "title": "LabPadre 24/7 Livestream",
         "description": "LabPadre is a free 24/7 live stream of the SpaceX Starship construction and testing site in Boca Chica, Texas. Multi camera views placed in several locations capture every moment of the Starship's construction and testing. LabPadre is devoted to supporting and growing the amazing community surrounding SpaceX and their fascinating developments.",
         "image": "https://i.ytimg.com/vi/5QbM7Vsz3kg/maxresdefault_live.jpg",
         "url": "https://www.youtube.com/watch?v=Ky5l9ZxsG9M"
       }
 */
public struct LiveStreamJSON: Decodable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case title, image, url

      case liveStreamDescription = "description"
   }

   let title: String?
   let liveStreamDescription: String?
   let image: String?
   let url: String

   public func addToCoreData( context: NSManagedObjectContext ) -> LiveStream
   {
      let newLiveStream: LiveStream = LiveStream( context: context )
      updateEntity( entity: newLiveStream, context: context )

      return newLiveStream
   }

   public func updateEntity( entity: LiveStream?, context: NSManagedObjectContext )
   {
      guard let entity = entity else { return }

      entity.id = self.url // use the URL as an ID
      entity.url = self.url
      entity.liveStreamDescription = self.liveStreamDescription
      entity.title = self.title
      entity.image = self.image
   }
}
