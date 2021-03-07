// Copyright © 2021 Bradford Holcombe. All rights reserved.

// wiftlint:disable function_body_length

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

 ### Spec (API model: LaunchSerializerCommon, LaunchSerializerMini, LaunchDetailed)
       id                        string($uuid)
       url                       string($uri)
       aunch_library_id         integer, maximum: 2147483647, minimum: -2147483648, x-nullable: true
       slug*                     string($slug),pattern: ^[-a-zA-Z0-9_]+$,minLength: 1
       name                      string, maxLength: 2048
       status                    LaunchStatus{...}
       net                       string($date-time), x-nullable: true
       window_end                string($date-time), x-nullable: true
       window_start              string($date-time), x-nullable: true
       //inhold                    boolean, x-nullable: true
       //tbdtime                   boolean, x-nullable: true
       //tbddate                   boolean, x-nullable: true
       probability               integer, maximum: 2147483647, minimum: -2147483648, x-nullable: true
       holdreason                string, maxLength: 2048, x-nullable: true
       failreason                string, maxLength: 2048, x-nullable: true
       hashtag                   string, maxLength: 2048, x-nullable: true
       launch_service_provider   AgencySerializerMini{...} or AgenctSerializerDetailedCommon{}
       rocket                    RocketSerializerCommon{...} or RocketDetailed{}
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
       flightclub_url          string($uri) title: Flightclub url minLength: 1
       r_spacex_api_id         string title: R spacex api id minLength: 1
       last_updated            string($date-time)
       updates                 [Update{...}]
       notifications_enabled   boolean
 */
public class LaunchJSON: Decodable, Identifiable, JSONElement
{
   /** ID of the launch within the API. */
   public var id: String
   /** URI of this data. */
   var url: String?
   var launchLibraryID: Int64?
   var failReason: String?
   var hashtag: String?
   var holdReason: String?
   var image: String?
   var infographic: String?
   var inHold: Bool?
   var serviceProvider: AgencyJSON?
   var mission: MissionJSON?
   var name: String?
   var net: String?
   var pad: PadJSON?
   var probability: Int16?
   var programs: [ProgramJSON] = []
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
   var infoURLs: [URLLinkJSON] = []
   var vidURLs: [URLLinkJSON] = []
   var orbitalLaunchAttemptCount: String?
   var locationLaunchAttemptCount: String?
   var padLaunchAttemptCount: String?
   var agencyLaunchAttemptCount: String?
   var orbitalLaunchAttemptCountYear: String?
   var locationLaunchAttemptCountYear: String?
   var padLaunchAttemptCountYear: String?
   var agencyLaunchAttemptCountYear: String?
   var flightclubURL: String? //   string($uri) title: Flightclub url minLength: 1
   var rSpacexAPIID: String? //  string title: R spacex api id minLength: 1
   var lastUpdated: String? //   string($date-time)
   var updates: [UpdateJSON] = [] //   [Update{...}]
   var notificationsEnabled: Bool?

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
      self.failReason = nonEmptyString( json[ "failreason" ] )
      self.hashtag = json[ "hashtag" ] as? String
      self.holdReason = nonEmptyString( json[ "holdreason" ] )
      self.image = json[ "image" ] as? String
      self.infographic = json[ "infographic" ] as? String
      self.inHold = json[ "inhold" ] as? Bool
      self.launchLibraryID = json[ "launch_library_id" ] as? Int64
      self.serviceProvider = AgencyJSON( json: json[ "launch_service_provider" ] as? JSONStructure )
      self.mission = MissionJSON( json: json[ "mission" ] as? JSONStructure )
      self.name = json[ "name" ] as? String
      self.net = json[ "net" ] as? String
      self.pad = PadJSON( json: json[ "pad" ] as? JSONStructure )
      self.probability = json[ "probability" ] as? Int16

      self.programs = []
      if let programsArray: [JSONStructure] = json[ "program" ] as? [JSONStructure]
      {
         self.programs = programsArray.compactMap { ProgramJSON( json: $0 ) }
      }

      self.rocket = RocketJSON( json: json[ "rocket" ] as? JSONStructure )
      self.slug = json[ "slug" ] as? String
      self.status = StatusJSON( json: json[ "status" ] as? JSONStructure )
      self.statusName = self.status?.name
      self.statusAbbreviation = self.status?.abbreviation
      self.statusDescription = self.status?.description
      self.tbdDate = json[ "tbddate" ] as? Bool
      self.tbdTime = json[ "tbdtime" ] as? Bool
      self.webcastLive = json[ "webcast_live" ] as? Bool
      self.windowEnd = json[ "window_end" ] as? String
      self.windowStart = json[ "window_start" ] as? String
      self.infoURLs = ( json[ "infoURLs" ] as? [JSONStructure] ?? [] ).compactMap { return URLLinkJSON( json: $0 ) }
      self.vidURLs = ( json[ "vidURLs" ] as? [JSONStructure] ?? [] ).compactMap { return URLLinkJSON( json: $0 ) }

      self.orbitalLaunchAttemptCount = json[ "orbital_launch_attempt_count" ] as? String
      self.locationLaunchAttemptCount = json[ "location_launch_attempt_count" ] as? String
      self.padLaunchAttemptCount = json[ "pad_launch_attempt_count" ] as? String
      self.agencyLaunchAttemptCount = json[ "agency_launch_attempt_count" ] as? String
      self.orbitalLaunchAttemptCountYear = json[ "orbital_launch_attempt_count_year" ] as? String
      self.locationLaunchAttemptCountYear = json[ "location_launch_attempt_count_year" ] as? String
      self.padLaunchAttemptCountYear = json[ "pad_launch_attempt_count_year" ] as? String
      self.agencyLaunchAttemptCountYear = json[ "agency_launch_attempt_count_year" ] as? String

      self.lastUpdated = json[ "last_updated" ] as? String
      self.flightclubURL = json[ "flightclub_url" ] as? String
      self.rSpacexAPIID = json[ "r_spacex_api_id" ] as? String
      self.updates = ( json[ "updates" ] as? [JSONStructure] ?? [] ).compactMap { return UpdateJSON( json: $0 ) }
      self.notificationsEnabled = json[ "notifications_enabled" ] as? Bool
   }
}
