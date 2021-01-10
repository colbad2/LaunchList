import CoreData

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

   func addToCoreData( context: NSManagedObjectContext ) -> Launch
   {
      let newLaunch: Launch = Launch( context: context )
      updateEntity( entity: newLaunch, context: context )

      return newLaunch
   }

   func updateEntity( entity: Launch?, context: NSManagedObjectContext ) -> Void
   {
      guard let entity = entity else { return }

      let fail = self.failReason?.trim()
      if fail != nil && fail!.count > 0
      {
         entity.failReason = self.failReason
      }
      entity.hashtag = self.hashtag
      entity.holdReason = self.holdReason
      entity.id = self.id
      entity.image = self.image
      entity.infographic = self.infographic
      entity.inHold = self.inHold ?? false

      if let provider = self.serviceProvider
      {
         entity.serviceProvider = fetchProvider( provider: provider, context: context )
         entity.serviceProvider?.addToLaunches( entity )
      }

      if let mission = self.mission
      {
         entity.mission = fetchMission( mission: mission, context: context )
         entity.mission?.launch = entity
      }

      entity.name = self.name?.fixBadUTF() // TODO fix Ã© -> é problems

      entity.net = parseISODate( isoDate: self.net )

      if let pad = self.pad
      {
         entity.pad = fetchPad( pad: pad, context: context )
         entity.pad?.addToLaunches( entity )
      }

      entity.probability = self.probability ?? -1

      if self.program != nil
      {
         for program in self.program!
         {
            let programEntity = fetchProgram( program: program, context: context )
            entity.addToPrograms( programEntity )
            programEntity.addToLaunches( entity )
         }
      }

      if let rocket = self.rocket
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



// Core Data search/update

func getLaunch( by id: String, context: NSManagedObjectContext ) -> Launch?
{
   return getEntityByID( id: id, context: context, entityName: "Launch" ) as? Launch
}

func fetchLaunch( launch: LaunchJSON, context: NSManagedObjectContext ) -> Launch
{
   let launchEntity = getLaunch( by: launch.id, context: context )
   launch.updateEntity( entity: launchEntity, context: context )
   return launchEntity ?? launch.addToCoreData( context: context )
}

func getLaunchCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "Launch", context: context )
}

func getSampleLaunch() -> LaunchJSON?
{
   return parseJSONString( json: sampleLaunchJSON )
}

private let sampleLaunchJSON =
"""
{
  "id": "724dd8ce-78ec-4dad-b17c-ff66c257fab7",
  "url": "https://ll.thespacedevs.com/2.1.0/launch/724dd8ce-78ec-4dad-b17c-ff66c257fab7/",
  "launch_library_id": 1943,
  "slug": "sls-block-1b-artemis-7",
  "name": "SLS Block 1B | Artemis-7",
  "status": {
    "id": 2,
    "name": "To Be Determined",
    "abbrev": "TBD",
    "description": "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources."
  },
  "net": "2028-01-01T00:00:00Z",
  "window_end": "2028-01-01T00:00:00Z",
  "window_start": "2028-01-01T00:00:00Z",
  "inhold": false,
  "tbdtime": false,
  "tbddate": false,
  "probability": -1,
  "holdreason": null,
  "failreason": null,
  "hashtag": null,
  "launch_service_provider": {
    "id": 44,
    "url": "https://ll.thespacedevs.com/2.1.0/agencies/44/",
    "name": "National Aeronautics and Space Administration",
    "type": "Government"
  },
  "rocket": {
    "id": 2548,
    "configuration": {
      "id": 205,
      "launch_library_id": 236,
      "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/205/",
      "name": "SLS Block 1B",
      "family": "",
      "full_name": "SLS Block 1B",
      "variant": ""
    }
  },
  "mission": null,
  "pad": {
    "id": 4,
    "url": "https://ll.thespacedevs.com/2.1.0/pad/4/",
    "agency_id": 44,
    "name": "Launch Complex 39B",
    "info_url": null,
    "wiki_url": "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39B",
    "map_url": "http://maps.google.com/maps?q=28.627+N,+80.621+W",
    "latitude": "28.62711233",
    "longitude": "-80.62101503",
    "location": {
      "id": 27,
      "url": "https://ll.thespacedevs.com/2.1.0/location/27/",
      "name": "Kennedy Space Center, FL, USA",
      "country_code": "USA",
      "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
      "total_launch_count": 182,
      "total_landing_count": 0
    },
    "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_4_20200803143518.jpg",
    "total_launch_count": 57
  },
  "webcast_live": false,
  "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/sls_block_1b_image_20200905100013.jpeg",
  "infographic": null,
  "program": [
    {
      "id": 15,
      "url": "https://ll.thespacedevs.com/2.1.0/program/15/",
      "name": "Artemis",
      "description": "The Artemis program is a US government-funded crewed spaceflight program that has the goal of landing \\"the first woman and the next man\\" on the Moon, specifically at the lunar south pole region by 2024.",
      "agencies": [
        {
          "id": 44,
          "url": "https://ll.thespacedevs.com/2.1.0/agencies/44/",
          "name": "National Aeronautics and Space Administration",
          "type": "Government"
        }
      ],
      "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/program_images/artemis_program_20200821091844.png",
      "start_date": "2017-12-11T00:00:00Z",
      "end_date": null,
      "info_url": "https://www.nasa.gov/specials/artemis/",
      "wiki_url": "https://en.wikipedia.org/wiki/Artemis_program"
    }
  ]
}
"""
