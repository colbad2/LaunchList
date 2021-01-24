// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable line_length

/**
 ### Example JSON
       {
         "id": 206,
         "url": "https://ll.thespacedevs.com/2.1.0/event/206/",
         "slug": "starship-sn9-cryoproof-test",
         "name": "Starship SN9 Cryoproof Test",
         "type": {
           "id": 21,
           "name": "Cryoproof Test"
         },
         "description": "SpaceX will likely conduct a cryoproof test on Starship SN9. This is the first cryo test performed on the vehicle.",
         "location": "Boca Chica, Texas",
         "news_url": null,
         "video_url": "https://www.youtube.com/watch?v=Ky5l9ZxsG9M",
         "feature_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/event_images/starship_sn9_te_image_20201229002608.png",
         "date": "2020-12-29T23:00:00Z",
         "launches": [],
         "expeditions": [],
         "spacestations": [],
         "program": [
           {
             "id": 1,
             "url": "https://ll.thespacedevs.com/2.1.0/program/1/",
             "name": "SpaceX Starship",
             "description": "The SpaceX Starship is a fully reusable super heavy-lift launch vehicle under development by SpaceX since 2012, as a self-funded private spaceflight project.  The second stage of the Starship — is designed as a long-duration cargo and passenger-carrying spacecraft. It is expected to be initially used without any booster stage at all, as part of an extensive development program to prove out launch-and-landing and iterate on a variety of design details, particularly with respect to the vehicle's atmospheric reentry.",
             "agencies": [
               {
                 "id": 121,
                 "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/",
                 "name": "SpaceX",
                 "type": "Commercial"
               }
             ],
             "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/program_images/spacex2520star_program_20201129204513.png",
             "start_date": "2019-03-01T05:00:00Z",
             "end_date": null,
             "info_url": "https://www.spacex.com/vehicles/starship/",
             "wiki_url": "https://en.wikipedia.org/wiki/SpaceX_Starship"
           }
         ]
       }
 */
public struct EventJSON: Decodable, Identifiable, JSONElement
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, url, slug, name, type, location, featureImage, date, launches, expeditions

      case eventDescription = "description"
      case newsURL = "newsUrl"
      case videoURL = "videoUrl"
      case spaceStations = "spacestations"
      case programs = "program"
   }

   public let id: Int64
   let url: String? // unused
   let slug: String? // unused
   let name: String?
   let type: EventTypeJSON?
   let eventDescription: String?
   let location: String?
   let newsURL: String?
   let videoURL: String?
   let featureImage: String?
   let date: String?
   let launches: [LaunchJSON]?
   let expeditions: [ExpeditionJSON]?
   let spaceStations: [SpaceStationJSON]?
   let programs: [ProgramJSON]?

   public func addToCoreData( context: NSManagedObjectContext ) -> Event
   {
      let newEvent: Event = Event( context: context )
      updateEntity( entity: newEvent, context: context )

      return newEvent
   }

   public func updateEntity( entity: Event?, context: NSManagedObjectContext )
   {
      guard let eventEntity = entity else { return }

      eventEntity.id = id
      eventEntity.name = name
      eventEntity.type = type?.name
      eventEntity.eventDescription = eventDescription
      eventEntity.location = location
      eventEntity.newsURL = newsURL
      eventEntity.videoURL = videoURL
      eventEntity.featureImage = featureImage
      eventEntity.date = parseISODate( isoDate: date )
      eventEntity.addLaunchesFromJSONList( launches: launches, context: context )
      eventEntity.addExpeditionsFromJSONList( expeditions: expeditions, context: context )
      eventEntity.addSpaceStationsFromJSONList( spaceStations: spaceStations, context: context )
      eventEntity.addProgramsFromJSONList( programs: programs, context: context )
      eventEntity.sortingDate = parseISODate( isoDate: self.date )

      eventEntity.fetched = Date()
   }
}
