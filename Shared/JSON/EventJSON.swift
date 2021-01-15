// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable line_length
// swiftlint:disable identifier_name

/**
 ### Example

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
struct EventJSON: Decodable
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

   let id: Int64
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

   func addToCoreData( context: NSManagedObjectContext ) -> Event
   {
      let newEvent: Event = Event( context: context )
      updateEntity( entity: newEvent, context: context )

      return newEvent
   }

   func updateEntity( entity: Event?, context: NSManagedObjectContext )
   {
      guard let entity = entity else { return }

      entity.id = self.id
      entity.name = self.name
      entity.type = self.type?.name
      entity.eventDescription = self.eventDescription
      entity.location = self.location
      entity.newsURL = self.newsURL
      entity.videoURL = self.videoURL
      entity.featureImage = self.featureImage
      entity.date = parseISODate( isoDate: self.date )

      for launch in launches!
      {
         let newLaunch: Launch = fetchLaunch( launch: launch, context: context )
         entity.addToLaunches( newLaunch )
         newLaunch.addToEvents( entity )
      }

      for expedition in expeditions!
      {
         let newExpedition: Expedition = fetchExpedition( expedition: expedition, context: context )
         entity.addToExpeditions( newExpedition )
         newExpedition.addToEvents( entity )
      }

      for spaceStation in spaceStations!
      {
         let newSpaceStations: SpaceStation = fetchSpaceStation( spaceStation: spaceStation, context: context )
         entity.addToSpaceStations( newSpaceStations )
         newSpaceStations.addToEvents( entity )
      }

      for program in programs!
      {
         let newProgram: Program = fetchProgram( program: program, context: context )
         entity.addToPrograms( newProgram )
         newProgram.addToEvents( entity )
      }

      // TimelineEntry
      entity.sortingDate = parseISODate( isoDate: self.date )
   }
}

/**
 Status of an [EventJSON].

 Used in parsing [EventJSON]. Flattened into the [Event] CoreData entity.

 ### Example
 {
   "id": 21,
   "name": "Cryoproof Test"
 }
 */
struct EventTypeJSON: Decodable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, name
   }

   let id: Int64
   let name: String?
}

// Core Data search/update

func getEvent( by id: Int64, context: NSManagedObjectContext ) -> Event?
{
   return getEntityByID( entityID: id, context: context, entityName: "Event" ) as? Event
}

func fetchEvent( event: EventJSON, context: NSManagedObjectContext ) -> Event
{
   let eventEntity = getEvent( by: event.id, context: context )
   event.updateEntity( entity: eventEntity, context: context )
   return eventEntity ?? event.addToCoreData( context: context )
}

func getEventCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "Event", context: context )
}

func getSampleEvent() -> EventJSON?
{
   return parseJSONString( json: sampleEventJSON )
}

private let sampleEventJSON =
"""
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
"""
