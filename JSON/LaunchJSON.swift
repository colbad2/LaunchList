// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 Data that describe a launch.

 ### Example JSON:
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
      case hashtag, id, image, infographic, mission, name,
         net, pad, probability, rocket, slug, status, url, webcastLive, windowEnd, windowStart

//      case idString = "id"
      case failReason = "failreason"
      case holdReason = "holdreason"
      case inHold = "inhold"
      case launchLibraryID = "launchLibraryId"
      case tbdDate = "tbddate"
      case tbdTime = "tbdtime"
      case serviceProvider = "launchServiceProvider"
      case programs = "program"
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
   var programs: [ProgramJSON]?
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
      guard let launchEntity = entity else { return }

      if let fail: String = failReason?.trim()
      {
         if !fail.isEmpty
         {
            launchEntity.failReason = fail
         }
      }
      launchEntity.hashtag = hashtag
      launchEntity.holdReason = holdReason
      launchEntity.id = id
      launchEntity.image = image
      launchEntity.infographic = infographic
      launchEntity.inHold = inHold ?? false
      launchEntity.addServiceProviderFromJSON( provider: serviceProvider, context: context )
      launchEntity.addMissionFromJSON( mission: mission, context: context )
      launchEntity.name = name?.fixBadUTF()
      launchEntity.net = parseISODate( isoDate: net )
      launchEntity.addPadFromJSON( pad: pad, context: context )
      launchEntity.probability = probability ?? -1
      launchEntity.addProgramsFromJSON( programs: programs, context: context )
      launchEntity.addRocketFromJSON( rocket: rocket, context: context )
      launchEntity.slug = slug
      launchEntity.statusName = status?.name
      launchEntity.statusAbbreviation = status?.abbreviation
      launchEntity.statusDescription = status?.description
      launchEntity.tbdDate = tbdDate ?? false
      launchEntity.tbdTime = tbdTime ?? false
      launchEntity.webcastLive = webcastLive ?? false
      launchEntity.windowEnd = parseISODate( isoDate: windowEnd )
      launchEntity.windowStart = parseISODate( isoDate: windowStart )
      launchEntity.sortingDate = parseISODate( isoDate: windowStart )
   }
}
