// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable line_length

/**
 Data that describe a launch.

    Example JSON:
    {
     "failreason": "",
     "hashtag": null,
     "holdreason": "",
     "id": "d5d607b7-05ed-4142-8703-14b553c195e0",
     "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon25209_image_20190224025007.jpeg",
     "infographic": null,
     "inhold": false,
     "launch_library_id": 1412,
     "launch_service_provider": { … },
     "mission": { … },
     "name": "Falcon 9 Block 5 | T\\u00fcrksat 5A",
     "net": "2021-01-05T01:27:00Z",
     "pad": { … },
     "probability": -1,
     "program": [],
     "rocket": { … },
     "slug": "falcon-9-block-5-turksat-5a",
     "status": { … },
     "tbddate": true,
     "tbdtime": true,
     "url": "https://ll.thespacedevs.com/2.1.0/launch/d5d607b7-05ed-4142-8703-14b553c195e0/",
     "webcast_live": false,
     "window_end": "2021-01-05T05:29:00Z",
     "window_start": "2021-01-05T01:27:00Z"
    }
 */
public struct LaunchJSON: Decodable, Identifiable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case hashtag, id, image, infographic, mission, name, program,
         net, pad, probability, rocket, slug, status, url, webcastLive, windowEnd, windowStart

//      case idString = "id"
      case failReason = "failreason"
      case holdReason = "holdreason"
      case inHold = "inhold"
      case launchLibraryID = "launchLibraryId"
      case tbdDate = "tbddate"
      case tbdTime = "tbdtime"
      case serviceProvider = "launchServiceProvider"
   }

   var failReason: String?
   var hashtag: String?
   var holdReason: String?
   public var id: String
   var image: String?
   var infographic: String?
   var inHold: Bool?
   var launchLibraryID: Int64? // unused
   var serviceProvider: ServiceProviderJSON?
   var mission: MissionJSON?
   var name: String?
   var net: String?
   var pad: PadJSON?
   var probability: Int16?
   var program: [ProgramJSON]?
   var rocket: RocketJSON?
   var slug: String?
   var status: StatusJSON?
   var statusName: String?
   var statusAbbreviation: String?
   var statusDescription: String?
   var tbdDate: Bool?
   var tbdTime: Bool?
   var url: String? // unused
   var webcastLive: Bool?
   var windowEnd: String?
   var windowStart: String?

   public func addToCoreData( context: NSManagedObjectContext ) -> Launch
   {
      let newLaunch: Launch = Launch( context: context )
      updateEntity( entity: newLaunch, context: context )

      return newLaunch
   }

   public func updateEntity( entity: Launch?, context: NSManagedObjectContext )
   {
      guard let entity = entity else { return }

      if let fail: String = self.failReason?.trim()
      {
         if !fail.isEmpty
         {
            entity.failReason = fail
         }
      }
      entity.hashtag = self.hashtag
      entity.holdReason = self.holdReason
      entity.id = self.id
      entity.image = self.image
      entity.infographic = self.infographic
      entity.inHold = self.inHold ?? false

      if let provider: ServiceProviderJSON = self.serviceProvider
      {
         entity.serviceProvider = fetchProvider( provider: provider, context: context )
         entity.serviceProvider?.addToLaunches( entity )
      }

      if let mission: MissionJSON = self.mission
      {
         entity.mission = fetchMission( mission: mission, context: context )
         entity.mission?.launch = entity
      }

      entity.name = self.name?.fixBadUTF() // TODO fix Ã© -> é problems

      entity.net = parseISODate( isoDate: self.net )

      if let pad: PadJSON = self.pad
      {
         entity.pad = fetchPad( pad: pad, context: context )
         entity.pad?.addToLaunches( entity )
      }

      entity.probability = self.probability ?? -1

      if let programs: [ProgramJSON] = self.program
      {
         for program in programs
         {
            let programEntity: Program = fetchProgram( program: program, context: context )
            entity.addToPrograms( programEntity )
            programEntity.addToLaunches( entity )
         }
      }

      if let rocket: RocketJSON = self.rocket
      {
         entity.rocket = fetchRocket( rocket: rocket, context: context )
         entity.rocket?.addToLaunches( entity )
      }

      entity.slug = self.slug

      entity.statusName = self.status?.name
      entity.statusAbbreviation = self.status?.abbreviation
      entity.statusDescription = self.status?.description

      entity.tbdDate = self.tbdDate ?? false
      entity.tbdTime = self.tbdTime ?? false
      entity.webcastLive = self.webcastLive ?? false
      entity.windowEnd = parseISODate( isoDate: self.windowEnd )
      entity.windowStart = parseISODate( isoDate: self.windowStart )

      // TimelineEntry
      entity.sortingDate = parseISODate( isoDate: self.windowStart )
   }
}
