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

 ### Spec
 id   integer
 url   string($uri)
 slug*   string($slug) pattern: ^[-a-zA-Z0-9_]+$ minLength: 1
 name*   string maxLength: 200 minLength: 1
 type   EventType{...}
 description   string maxLength: 2048
 location   string maxLength: 100 x-nullable: true
 news_url   string($uri) maxLength: 250 x-nullable: true
 video_url   string($uri) maxLength: 250 x-nullable: true
 feature_image   string($uri)
 date   string($date-time) x-nullable: true
 launches*   [LaunchSerializerCommon{...}]
 expeditions*   [Expedition{...}]
 spacestations*   [SpaceStationSerializerForCommon{...}]
 program   [Program{...}]
 */
public class EventJSON: Decodable, Identifiable, JSONElement
{
   // translate API attribute names into better var names
//   enum CodingKeys: String, CodingKey
//   {
//      case id, url, slug, name, type, location, date, launches, expeditions
//
//      case eventDescription = "description"
//      case newsURL = "news_url"
//      case videoURL = "video_url"
//      case spaceStations = "spacestations"
//      case programs = "program"
//      case featureImage = "feature_image"
//   }

   /** ID of the astronaut within the API. */
   public let id: Int64
   /** URI of this data. Unused. */
   let url: String?
   let slug: String? // unused
   let name: String?
   let type: IDNameJSON?
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

   /**
    Make a `EventJSON` from a JSON structure.

    - parameter json: `JSONStructure` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.url = json[ "url" ] as? String
      self.slug = json[ "slug" ] as? String
      self.name = json[ "name" ] as? String
      self.type = IDNameJSON( json: json[ "type" ] as? JSONStructure )
      self.eventDescription = json[ "description" ] as? String
      self.location = json[ "location" ] as? String
      self.newsURL = json[ "news_url" ] as? String
      self.videoURL = json[ "video_url" ] as? String
      self.featureImage = json[ "feature_image" ] as? String
      self.date = json[ "date" ] as? String
      self.launches = ( json[ "launches" ] as? [JSONStructure] )?.compactMap { LaunchJSON( json: $0 ) }
      self.expeditions = ( json[ "expeditions" ] as? [JSONStructure] )?.compactMap { ExpeditionJSON( json: $0 ) }
      self.spaceStations = ( json[ "spaceStations" ] as? [JSONStructure] )?.compactMap { SpaceStationJSON( json: $0 ) }
      self.programs = ( json[ "programs" ] as? [JSONStructure] )?.compactMap { ProgramJSON( json: $0 ) }
   }

   /**
    Add this data to Core Data as a `Event` entity. The context still needs to be saved after the add.

    - parameter context: Core Data context to add the entity to.
    - returns: `Event` the added entity
    */
   public func addToCoreData( context: NSManagedObjectContext ) -> Event
   {
      let newEvent: Event = Event( context: context )
      updateEntity( entity: newEvent, context: context )

      return newEvent
   }

   /**
    Set or update the values of the `Event` entity,

    - parameter entity:  `Event?` entity to fill/update
    - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
    */
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
