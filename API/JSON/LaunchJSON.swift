// Copyright © 2021 Bradford Holcombe. All rights reserved.

// s wiftlint:disable function_body_length

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
       launch_library_id         long x-nullable: true
       slug*                     string($slug),pattern: ^[-a-zA-Z0-9_]+$,minLength: 1
       name                      string, maxLength: 2048
       status                    LaunchStatus{...}
       net                       string($date-time), x-nullable: true
       window_end                string($date-time), x-nullable: true
       window_start              string($date-time), x-nullable: true
       //inhold                    boolean, x-nullable: true
       //tbdtime                   boolean, x-nullable: true
       //tbddate                   boolean, x-nullable: true
       probability               long x-nullable: true
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
public class LaunchJSON: Identifiable, JSONElement
{
   /** ID of the launch within the API. */
   public var id: String?
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
   /** Launch "No Earlier Than". */
   var net: String?
   var pad: PadJSON?
   var probability: Int64?
   var programs: [ProgramJSON] = []
   var rocket: RocketJSON?
   var slug: String?
   var status: StatusJSON?
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

    - parameter json: `Any` JSON to parse
    */
   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      id = nonEmptyString( json[ "id" ] )
      url = nonEmptyString( json[ "url" ] )
      failReason = nonEmptyString( json[ "failreason" ] )
      hashtag = nonEmptyString( json[ "hashtag" ] )
      holdReason = nonEmptyString( json[ "holdreason" ] )
      image = nonEmptyString( json[ "image" ] )
      infographic = nonEmptyString( json[ "infographic" ] )
      inHold = json[ "inhold" ] as? Bool
      launchLibraryID = nonNegativeInt( json[ "launch_library_id" ] )
      serviceProvider = AgencyJSON( json[ "launch_service_provider" ] )
      mission = MissionJSON( json[ "mission" ] )
      name = nonEmptyString( json[ "name" ] )
      net = nonEmptyString( json[ "net" ] )
      pad = PadJSON( json[ "pad" ] )
      probability = nonNegativeInt( json[ "probability" ] )
      programs = parseArray( json[ "program" ] )
      rocket = RocketJSON( json[ "rocket" ] )
      slug = nonEmptyString( json[ "slug" ] )
      status = StatusJSON( json[ "status" ] )
      tbdDate = json[ "tbddate" ] as? Bool
      tbdTime = json[ "tbdtime" ] as? Bool
      webcastLive = json[ "webcast_live" ] as? Bool
      windowEnd = nonEmptyString( json[ "window_end" ] )
      windowStart = nonEmptyString( json[ "window_start" ] )
      infoURLs = parseArray( json[ "infoURLs" ] )
      vidURLs = parseArray( json[ "vidURLs" ] )
      orbitalLaunchAttemptCount = nonEmptyString( json[ "orbital_launch_attempt_count" ] )
      locationLaunchAttemptCount = nonEmptyString( json[ "location_launch_attempt_count" ] )
      padLaunchAttemptCount = nonEmptyString( json[ "pad_launch_attempt_count" ] )
      agencyLaunchAttemptCount = nonEmptyString( json[ "agency_launch_attempt_count" ] )
      orbitalLaunchAttemptCountYear = nonEmptyString( json[ "orbital_launch_attempt_count_year" ] )
      locationLaunchAttemptCountYear = nonEmptyString( json[ "location_launch_attempt_count_year" ] )
      padLaunchAttemptCountYear = nonEmptyString( json[ "pad_launch_attempt_count_year" ] )
      agencyLaunchAttemptCountYear = nonEmptyString( json[ "agency_launch_attempt_count_year" ] )
      lastUpdated = nonEmptyString( json[ "last_updated" ] )
      flightclubURL = nonEmptyString( json[ "flightclub_url" ] )
      rSpacexAPIID = nonEmptyString( json[ "r_spacex_api_id" ] )
      updates = parseArray( json[ "updates" ] )
      notificationsEnabled = json[ "notifications_enabled" ] as? Bool
   }
}
