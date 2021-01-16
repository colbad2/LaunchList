// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable line_length

/**
 Part of the starship API.
 
 ### Example

 {
   "title": "LabPadre 24/7 Livestream",
   "description": "LabPadre is a free 24/7 live stream of the SpaceX Starship construction and testing site in Boca Chica, Texas. Multi camera views placed in several locations capture every moment of the Starship's construction and testing. LabPadre is devoted to supporting and growing the amazing community surrounding SpaceX and their fascinating developments.",
   "image": "https://i.ytimg.com/vi/5QbM7Vsz3kg/maxresdefault_live.jpg",
   "url": "https://www.youtube.com/watch?v=Ky5l9ZxsG9M"
 }
 */
struct LiveStreamJSON: Decodable
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

   func addToCoreData( context: NSManagedObjectContext ) -> LiveStream
   {
      let newLiveStream: LiveStream = LiveStream( context: context )
      updateEntity( entity: newLiveStream, context: context )

      return newLiveStream
   }

   func updateEntity( entity: LiveStream?, context: NSManagedObjectContext )
   {
      guard let entity = entity else { return }

      entity.id = self.url // use the URL as an ID
      entity.url = self.url
      entity.liveStreamDescription = self.liveStreamDescription
      entity.title = self.title
      entity.image = self.image
   }
}

// Core Data search/update

func getLiveStream( by entityID: String, context: NSManagedObjectContext ) -> LiveStream?
{
   return getEntityByID( entityID: entityID, context: context, entityName: "LiveStream" ) as? LiveStream
}

func fetchLiveStream( liveStream: LiveStreamJSON, context: NSManagedObjectContext ) -> LiveStream
{
   let liveStreamEntity: LiveStream? = getLiveStream( by: liveStream.url, context: context )
   liveStream.updateEntity( entity: liveStreamEntity, context: context )
   return liveStreamEntity ?? liveStream.addToCoreData( context: context )
}

func getLiveStreamCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "LiveStream", context: context )
}

func getSampleLiveStream() -> LiveStreamJSON?
{
   return parseJSONString( json: sampleLiveStreamJSON )
}

private let sampleLiveStreamJSON =
"""
 {
   "title": "LabPadre 24/7 Livestream",
   "description": "LabPadre is a free 24/7 live stream of the SpaceX Starship construction and testing site in Boca Chica, Texas. Multi camera views placed in several locations capture every moment of the Starship's construction and testing. LabPadre is devoted to supporting and growing the amazing community surrounding SpaceX and their fascinating developments.",
   "image": "https://i.ytimg.com/vi/5QbM7Vsz3kg/maxresdefault_live.jpg",
   "url": "https://www.youtube.com/watch?v=Ky5l9ZxsG9M"
 }
"""
