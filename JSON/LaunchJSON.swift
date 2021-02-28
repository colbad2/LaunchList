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

 ### Spec
       id                        string($uuid)
       url                       string($uri)
       launch_library_id         integer, maximum: 2147483647, minimum: -2147483648, x-nullable: true
       slug*                     string($slug),pattern: ^[-a-zA-Z0-9_]+$,minLength: 1
       name                      string, maxLength: 2048
       status                    LaunchStatus{...}
       net                       string($date-time), x-nullable: true
       window_end                string($date-time), x-nullable: true
       window_start              string($date-time), x-nullable: true
       inhold                    boolean, x-nullable: true
       tbdtime                   boolean, x-nullable: true
       tbddate                   boolean, x-nullable: true
       probability               integer, maximum: 2147483647, minimum: -2147483648, x-nullable: true
       holdreason                string, maxLength: 2048, x-nullable: true
       failreason                string, maxLength: 2048, x-nullable: true
       hashtag                   string, maxLength: 2048, x-nullable: true
       launch_service_provider   AgencySerializerMini{...}
       rocket                    RocketSerializerCommon{...}
       mission                   Mission{...}
       pad                       Pad{...}
       infoURLs                  [URLJSON]
       vidURLs                   [URLJSON]
       webcast_live              boolean
       image                     string
       infographic               string
       program                   [Program{...}]
       orbital_launch_attempt_count        string
       location_launch_attempt_count       string
       pad_launch_attempt_count            string
       agency_launch_attempt_count         string
       orbital_launch_attempt_count_year   string
       location_launch_attempt_count_year  string
       pad_launch_attempt_count_year       string
       agency_launch_attempt_count_year    string
 */
public class LaunchJSON: Decodable, Identifiable, JSONElement
{
   // translate API attribute names into better var names
//   enum CodingKeys: String, CodingKey
//   {
//      case hashtag, id, image, infographic, mission, name,
//         net, pad, probability, rocket, slug, status, url,
//         infoURLs, vidURLs
//
//      case failReason = "failreason"
//      case holdReason = "holdreason"
//      case inHold = "inhold"
//      case launchLibraryID = "launch_library_id"
//      case tbdDate = "tbddate"
//      case tbdTime = "tbdtime"
//      case serviceProvider = "launchServiceProvider"
//      case programs = "program"
//      case windowEnd = "window_end"
//      case windowStart = "window_start"
//      case webcastLive = "webcast_live"
//   }

   /** ID of the astronaut within the API. */
   public var id: String
   /** URI of this data. Unused. */
   var url: String?
   var launchLibraryID: Int64? // unused
   var failReason: String?
   var hashtag: String?
   var holdReason: String?
   var image: String?
   var infographic: String?
   var inHold: Bool?
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
   var webcastLive: Bool?
   var windowEnd: String?
   var windowStart: String?
   var infoURLs: [LinkJSON] = []
   var vidURLs: [LinkJSON] = []
   var orbitalLaunchAttemptCount: String?
   var locationLaunchAttemptCount: String?
   var padLaunchAttemptCount: String?
   var agencyLaunchAttemptCount: String?
   var orbitalLaunchAttemptCountYear: String?
   var locationLaunchAttemptCountYear: String?
   var padLaunchAttemptCountYear: String?
   var agencyLaunchAttemptCountYear: String?

   /**
    Make a `LaunchJSON` from a JSON structure.

    - parameter json: `JSONStructure` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? String else { return nil }

      self.id = id
      self.url = json[ "url" ] as? String
      self.failReason = json[ "failreason" ] as? String
      self.hashtag = json[ "hashtag" ] as? String
      self.holdReason = json[ "holdreason" ] as? String
      self.image = json[ "image" ] as? String
      self.infographic = json[ "infographic" ] as? String
      self.inHold = json[ "inhold" ] as? Bool
      self.launchLibraryID = json[ "launch_library_id" ] as? Int64
      self.serviceProvider = ServiceProviderJSON( json: json[ "launchServiceProvider" ] as? JSONStructure )
      self.mission = MissionJSON( json: json[ "mission" ] as? JSONStructure )
      self.name = json[ "name" ] as? String
      self.net = json[ "net" ] as? String
      self.pad = PadJSON( json: json[ "pad" ] as? JSONStructure )
      self.probability = json[ "probability" ] as? Int16

      self.programs = nil
      if let programsArray: [JSONStructure] = json[ "program" ] as? [JSONStructure]
      {
         self.programs = programsArray.compactMap { ProgramJSON( json: $0 ) }
      }

      self.rocket = RocketJSON( json: json[ "rocket" ] as? JSONStructure )
      self.slug = json[ "slug" ] as? String
      self.status = StatusJSON( json: json[ "status" ] as? JSONStructure )
      self.statusName = json[ "statusName" ] as? String
      self.statusAbbreviation = json[ "statusAbbreviation" ] as? String
      self.statusDescription = json[ "statusDescription" ] as? String
      self.tbdDate = json[ "tbddate" ] as? Bool
      self.tbdTime = json[ "tbdtime" ] as? Bool
      self.webcastLive = json[ "webcastLive" ] as? Bool
      self.windowEnd = json[ "windowEnd" ] as? String
      self.windowStart = json[ "windowStart" ] as? String
      self.infoURLs = ( json[ "infoURLs" ] as? [JSONStructure] ?? [] ).compactMap { return LinkJSON( json: $0 ) }
      self.vidURLs = ( json[ "vidURLs" ] as? [JSONStructure] ?? [] ).compactMap { return LinkJSON( json: $0 ) }

      self.orbitalLaunchAttemptCount = json[ "orbital_launch_attempt_count" ] as? String
      self.locationLaunchAttemptCount = json[ "location_launch_attempt_count" ] as? String
      self.padLaunchAttemptCount = json[ "pad_launch_attempt_count" ] as? String
      self.agencyLaunchAttemptCount = json[ "agency_launch_attempt_count" ] as? String
      self.orbitalLaunchAttemptCountYear = json[ "orbital_launch_attempt_count_year" ] as? String
      self.locationLaunchAttemptCountYear = json[ "location_launch_attempt_count_year" ] as? String
      self.padLaunchAttemptCountYear = json[ "pad_launch_attempt_count_year" ] as? String
      self.agencyLaunchAttemptCountYear = json[ "agency_launch_attempt_count_year" ] as? String
   }

   /**
    Add this data to Core Data as a `Launch` entity. The context still needs to be saved after the add.

    - parameter context: Core Data context to add the entity to.
    - returns: `Launch` the added entity
    */
   public func addToCoreData( context: NSManagedObjectContext ) -> Launch
   {
      let newLaunch: Launch = Launch( context: context )
      updateEntity( entity: newLaunch, context: context )

      return newLaunch
   }

   /**
    Set or update the values of the `Launch` entity,

    - parameter entity:  `Launch?` entity to fill/update
    - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
    */
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
      launchEntity.inHold = guaranteedBool( inHold )

      // launchEntity.addServiceProviderFromJSON( provider: serviceProvider, context: context )
      launchEntity.addAgencyFromJSON( provider: serviceProvider, context: context )

      launchEntity.addMissionFromJSON( mission: mission, context: context )
      launchEntity.name = name?.fixBadUTF()
      launchEntity.net = parseISODate( isoDate: net )
      launchEntity.addPadFromJSON( pad: pad, context: context )
      launchEntity.probability = guaranteedInt16( probability )
      launchEntity.addProgramsFromJSON( programs: programs, context: context )
      launchEntity.addRocketFromJSON( rocket: rocket, context: context )
      launchEntity.slug = slug
      launchEntity.statusName = status?.name
      launchEntity.statusAbbreviation = status?.abbreviation
      launchEntity.statusDescription = status?.description
      launchEntity.tbdDate = guaranteedBool( tbdDate )
      launchEntity.tbdTime = guaranteedBool( tbdTime )
      launchEntity.webcastLive = guaranteedBool( webcastLive )
      launchEntity.windowEnd = parseISODate( isoDate: windowEnd )
      launchEntity.windowStart = parseISODate( isoDate: windowStart )
      launchEntity.sortingDate = parseISODate( isoDate: windowStart )

      launchEntity.addInfoLinksFromJSON( links: infoURLs, context: context )
      launchEntity.addVideoLinksFromJSON( links: vidURLs, context: context )

      launchEntity.orbitalLaunchAttemptCount = orbitalLaunchAttemptCount
      launchEntity.locationLaunchAttemptCount = locationLaunchAttemptCount
      launchEntity.padLaunchAttemptCount = padLaunchAttemptCount
      launchEntity.agencyLaunchAttemptCount = agencyLaunchAttemptCount
      launchEntity.orbitalLaunchAttemptCountYear = orbitalLaunchAttemptCountYear
      launchEntity.locationLaunchAttemptCountYear = locationLaunchAttemptCountYear
      launchEntity.padLaunchAttemptCountYear = padLaunchAttemptCountYear
      launchEntity.agencyLaunchAttemptCountYear = agencyLaunchAttemptCountYear

      launchEntity.fetched = Date()
   }
}
