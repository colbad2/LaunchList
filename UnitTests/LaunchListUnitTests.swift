import XCTest

class JSONTests: XCTestCase
{
   func testParseJSON() throws
   {
      XCTSkip()

      let launchProvider: LaunchProvider = LaunchProvider()

      XCTAssertNotNil( launchProvider.launches )
      XCTAssertEqual( launchProvider.launches.totalLaunchCount, 35 )
      XCTAssertEqual( launchProvider.launches.nextLaunchGroupURL, "https://ll.thespacedevs.com/2.1.0/launch/upcoming/?limit=10&offset=10&search=SpaceX" )
      XCTAssertNil( launchProvider.launches.previousLaunchGroupURL )
      // TODO test launchSublist
   }

   func testPadJSON() throws
   {
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase

      let json: String =
      """
      {
          "agency_id": 121,
          "id": 80,
          "info_url": null,
          "latitude": "28.56194122",
          "location": {
              "country_code": "USA",
              "id": 12,
              "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_12_20200803142519.jpg",
              "name": "Cape Canaveral, FL, USA",
              "total_landing_count": 20,
              "total_launch_count": 208,
              "url": "https://ll.thespacedevs.com/2.1.0/location/12/"
          },
          "longitude": "-80.57735736",
          "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_80_20200803143323.jpg",
          "map_url": "http://maps.google.com/maps?q=28.56194122,-80.57735736",
          "name": "Space Launch Complex 40",
          "total_launch_count": 63,
          "url": "https://ll.thespacedevs.com/2.1.0/pad/80/",
          "wiki_url": "https://en.wikipedia.org/wiki/Cape_Canaveral_Air_Force_Station_Space_Launch_Complex_40"
      }
      """

      let jsonData = json.data( using: .utf8 )!
      let pad: PadJSON? = try! decoder.decode( PadJSON.self, from: jsonData )

      XCTAssertNotNil( pad )
      XCTAssertEqual( pad?.agencyID, 121 )
      XCTAssertEqual( pad?.id, 80 )
      XCTAssertNil( pad?.infoURL )
      XCTAssertEqual( pad?.latitude, "28.56194122" )

      XCTAssertNotNil( pad?.location )
      XCTAssertEqual( pad?.location?.countryCode, "USA" )
      XCTAssertEqual( pad?.location?.id, 12 )
      XCTAssertEqual( pad?.location?.mapImage,
                      URL( string: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_12_20200803142519.jpg" ) )
      XCTAssertEqual( pad?.location?.name, "Cape Canaveral, FL, USA" )
      XCTAssertEqual( pad?.location?.totalLandingCount, 20 )
      XCTAssertEqual( pad?.location?.totalLaunchCount, 208 )
      XCTAssertEqual( pad?.location?.url, "https://ll.thespacedevs.com/2.1.0/location/12/" )

      XCTAssertEqual( pad?.longitude, "-80.57735736" )
      XCTAssertEqual( pad?.mapImage,
                      URL( string: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_80_20200803143323.jpg" ) )
      XCTAssertEqual( pad?.mapURL,
                      URL( string: "http://maps.google.com/maps?q=28.56194122,-80.57735736" ) )
      XCTAssertEqual( pad?.name, "Space Launch Complex 40" )
      XCTAssertEqual( pad?.totalLaunchCount, 63 )
      XCTAssertEqual( pad?.url,
                      URL( string: "https://ll.thespacedevs.com/2.1.0/pad/80/" ) )
      XCTAssertEqual( pad?.wikiURL,
                      URL( string: "https://en.wikipedia.org/wiki/Cape_Canaveral_Air_Force_Station_Space_Launch_Complex_40" ) )
   }

   func testLocationJSON() throws
   {
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase

      let json: String =
      """
      {
          "country_code": "USA",
          "id": 12,
          "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_12_20200803142519.jpg",
          "name": "Cape Canaveral, FL, USA",
          "total_landing_count": 20,
          "total_launch_count": 208,
          "url": "https://ll.thespacedevs.com/2.1.0/location/12/"
      }
      """

      let jsonData = json.data( using: .utf8 )!
      let location: LocationJSON = try! decoder.decode( LocationJSON.self, from: jsonData )

      XCTAssertNotNil( location )
      XCTAssertEqual( location.countryCode, "USA" )
      XCTAssertEqual( location.id, 12 )
      XCTAssertEqual( location.mapImage,
                      URL( string: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_12_20200803142519.jpg" ) )
      XCTAssertEqual( location.name, "Cape Canaveral, FL, USA" )
      XCTAssertEqual( location.totalLandingCount, 20 )
      XCTAssertEqual( location.totalLaunchCount, 208 )
      XCTAssertEqual( location.url, "https://ll.thespacedevs.com/2.1.0/location/12/" )
   }

   func testRocketConfig() throws
   {
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase

      let json: String =
      """
       {
           "family": "Falcon",
           "full_name": "Falcon 9 Block 5",
           "id": 164,
           "launch_library_id": 188,
           "name": "Falcon 9 Block 5",
           "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/164/",
           "variant": "Block 5"
       }
      """

      let jsonData = json.data( using: .utf8 )!
      let rocketConfiguration: ConfigurationJSON = try! decoder.decode( ConfigurationJSON.self, from: jsonData )

      XCTAssertNotNil( rocketConfiguration )
      XCTAssertEqual( rocketConfiguration.family, "Falcon" )
      XCTAssertEqual( rocketConfiguration.fullName, "Falcon 9 Block 5" )
      XCTAssertEqual( rocketConfiguration.id, 164 )
      XCTAssertEqual( rocketConfiguration.launchLibraryID, 188 )
      XCTAssertEqual( rocketConfiguration.name, "Falcon 9 Block 5" )
      XCTAssertEqual( rocketConfiguration.url,
                      URL( string: "https://ll.thespacedevs.com/2.1.0/config/launcher/164/" ) )
      XCTAssertEqual( rocketConfiguration.variant, "Block 5" )
   }

   func testOrbitJSON() throws
   {
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase

      let json: String =
      """
        {
            "abbrev": "GTO",
            "id": 2,
            "name": "Geostationary Transfer Orbit"
        }
      """

      let jsonData = json.data( using: .utf8 )!
      let orbit: OrbitJSON = try! decoder.decode( OrbitJSON.self, from: jsonData )

      XCTAssertNotNil( orbit )
      XCTAssertEqual( orbit.abbreviation, "GTO" )
      XCTAssertEqual( orbit.id, 2 )
      XCTAssertEqual( orbit.name, "Geostationary Transfer Orbit" )
   }

   func testMissionJSON() throws
   {
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase

      let json: String =
      #"""
      {
          "description": "T\u00fcrksat 5A is the first of two Turkish next generation communications satellites, which will be operated by T\u00fcrksat for commercial and military purposes.",
          "id": 1222,
          "launch_designator": null,
          "launch_library_id": null,
          "name": "T\u00fcrksat 5A",
          "orbit": {
              "abbrev": "GTO",
              "id": 2,
              "name": "Geostationary Transfer Orbit"
          },
          "type": "Communications"
      }
      """#

      let jsonData = json.data( using: .utf8 )!
      let mission: MissionJSON = try! decoder.decode( MissionJSON.self, from: jsonData )

      XCTAssertNotNil( mission )
      XCTAssertEqual( mission.description, "T\u{00fc}rksat 5A is the first of two Turkish next generation communications satellites, which will be operated by T\u{00fc}rksat for commercial and military purposes." )
      XCTAssertEqual( mission.id, 1222 )
      XCTAssertNil( mission.launchDesignator )
      XCTAssertNil( mission.launchLibraryID )
      XCTAssertEqual( mission.name, "T\u{00fc}rksat 5A" )
      XCTAssertNotNil( mission.orbit )
      XCTAssertEqual( mission.orbit?.abbreviation, "GTO" )
      XCTAssertEqual( mission.orbit?.id, 2 )
      XCTAssertEqual( mission.orbit?.name, "Geostationary Transfer Orbit" )
      XCTAssertEqual( mission.type, "Communications" )
   }

   func testLaunchServiceProviderJSON() throws
   {
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase

      let json: String =
      """
       {
           "id": 121,
           "name": "SpaceX",
           "type": "Commercial",
           "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
       }
      """

      let jsonData = json.data( using: .utf8 )!
      let launchServiceProvider: ServiceProviderJSON = try! decoder.decode( ServiceProviderJSON.self, from: jsonData )

      XCTAssertNotNil( launchServiceProvider )
      XCTAssertEqual( launchServiceProvider.id, 121 )
      XCTAssertEqual( launchServiceProvider.name, "SpaceX" )
      XCTAssertEqual( launchServiceProvider.type, "Commercial" )
      XCTAssertEqual( launchServiceProvider.url,
                      URL( string: "https://ll.thespacedevs.com/2.1.0/agencies/121/" ) )
   }

   func testLaunchStatusJSON() throws
   {
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase

      let json: String =
      """
       {
           "abbrev": "TBC",
           "description": "Awaiting official confirmation - current date is known with some certainty.",
           "id": 8,
           "name": "To Be Confirmed"
       }
      """

      let jsonData = json.data( using: .utf8 )!
      let launchStatus: StatusJSON = try! decoder.decode( StatusJSON.self, from: jsonData )

      XCTAssertNotNil( launchStatus )
      XCTAssertEqual( launchStatus.abbreviation, "TBC" )
      XCTAssertEqual( launchStatus.description, "Awaiting official confirmation - current date is known with some certainty." )
      XCTAssertEqual( launchStatus.id, 8 )
      XCTAssertEqual( launchStatus.name, "To Be Confirmed" )
   }

   func testRocketJSON() throws
   {
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase

      let json: String =
      """
       {
           "configuration": {
               "family": "Falcon",
               "full_name": "Falcon 9 Block 5",
               "id": 164,
               "launch_library_id": 188,
               "name": "Falcon 9 Block 5",
               "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/164/",
               "variant": "Block 5"
           },
           "id": 136
       }
      """

      let jsonData = json.data( using: .utf8 )!
      let rocket: RocketJSON = try! decoder.decode( RocketJSON.self, from: jsonData )

      XCTAssertNotNil( rocket.configuration )
      XCTAssertEqual( rocket.configuration?.family, "Falcon" )
      XCTAssertEqual( rocket.configuration?.fullName, "Falcon 9 Block 5" )
      XCTAssertEqual( rocket.configuration?.id, 164 )
      XCTAssertEqual( rocket.configuration?.launchLibraryID, 188 )
      XCTAssertEqual( rocket.configuration?.name, "Falcon 9 Block 5" )
      XCTAssertEqual( rocket.configuration?.url,
                      URL( string: "https://ll.thespacedevs.com/2.1.0/config/launcher/164/" ) )
      XCTAssertEqual( rocket.configuration?.variant, "Block 5" )
      XCTAssertEqual( rocket.id, 136 )
   }

   func testLaunchJSON2() throws
   {
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase

      let json: String =
      #"""
      {
          "failreason": "",
          "hashtag": null,
          "holdreason": "",
          "id": "f213a5df-579a-4682-8143-df228e463049",
          "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon25209_image_20190224025007.jpeg",
          "infographic": null,
          "inhold": false,
          "launch_library_id": 1965,
          "launch_service_provider": {
              "id": 121,
              "name": "SpaceX",
              "type": "Commercial",
              "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
          },
          "mission": null,
          "name": "Falcon 9 Block 5 | Dedicated SSO Rideshare Mission 1",
          "net": "2021-01-14T00:00:00Z",
          "pad": {
              "agency_id": 121,
              "id": 80,
              "info_url": null,
              "latitude": "28.56194122",
              "location": {
                  "country_code": "USA",
                  "id": 12,
                  "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_12_20200803142519.jpg",
                  "name": "Cape Canaveral, FL, USA",
                  "total_landing_count": 20,
                  "total_launch_count": 208,
                  "url": "https://ll.thespacedevs.com/2.1.0/location/12/"
              },
              "longitude": "-80.57735736",
              "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_80_20200803143323.jpg",
              "map_url": "http://maps.google.com/maps?q=28.56194122,-80.57735736",
              "name": "Space Launch Complex 40",
              "total_launch_count": 63,
              "url": "https://ll.thespacedevs.com/2.1.0/pad/80/",
              "wiki_url": "https://en.wikipedia.org/wiki/Cape_Canaveral_Air_Force_Station_Space_Launch_Complex_40"
          },
          "probability": -1,
          "program": [],
          "rocket": {
              "configuration": {
                  "family": "Falcon",
                  "full_name": "Falcon 9 Block 5",
                  "id": 164,
                  "launch_library_id": 188,
                  "name": "Falcon 9 Block 5",
                  "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/164/",
                  "variant": "Block 5"
              },
              "id": 2518
          },
          "slug": "falcon-9-block-5-dedicated-sso-rideshare-mission-1",
          "status": {
              "abbrev": "TBD",
              "description": "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources.",
              "id": 2,
              "name": "To Be Determined"
          },
          "tbddate": true,
          "tbdtime": true,
          "url": "https://ll.thespacedevs.com/2.1.0/launch/f213a5df-579a-4682-8143-df228e463049/",
          "webcast_live": false,
          "window_end": "2021-01-14T00:00:00Z",
          "window_start": "2021-01-14T00:00:00Z"
      }
      """#

      let jsonData = json.data( using: .utf8 )!
      let launch: LaunchJSON = try! decoder.decode( LaunchJSON.self, from: jsonData )

      XCTAssertNotNil( launch )
      XCTAssertEqual( launch.failReason, "" )
      XCTAssertNil( launch.hashtag )
      XCTAssertEqual( launch.holdReason, "" )
      XCTAssertEqual( launch.id, "f213a5df-579a-4682-8143-df228e463049" )
      XCTAssertEqual( launch.image,
                      URL( string: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon25209_image_20190224025007.jpeg" ) )
      XCTAssertNil( launch.infographic )
      XCTAssertEqual( launch.inHold, false )
      XCTAssertEqual( launch.launchLibraryID, 1965 )

      XCTAssertNotNil( launch.serviceProvider )
      XCTAssertEqual( launch.serviceProvider?.id, 121 )
      XCTAssertEqual( launch.serviceProvider?.name, "SpaceX" )
      XCTAssertEqual( launch.serviceProvider?.type, "Commercial" )
      XCTAssertEqual( launch.serviceProvider?.url,
                      URL( string: "https://ll.thespacedevs.com/2.1.0/agencies/121/" ) )

      XCTAssertNil( launch.mission )

      XCTAssertEqual( launch.name, "Falcon 9 Block 5 | Dedicated SSO Rideshare Mission 1" )
      XCTAssertEqual( launch.net, "2021-01-14T00:00:00Z" )

      XCTAssertNotNil( launch.pad )
      XCTAssertEqual( launch.pad?.agencyID, 121 )
      XCTAssertEqual( launch.pad?.id, 80 )
      XCTAssertNil( launch.pad?.infoURL )
      XCTAssertEqual( launch.pad?.latitude, "28.56194122" )

      XCTAssertNotNil( launch.pad?.location )
      XCTAssertEqual( launch.pad?.location?.countryCode, "USA" )
      XCTAssertEqual( launch.pad?.location?.id, 12 )
      XCTAssertEqual( launch.pad?.location?.mapImage,
                      URL( string: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_12_20200803142519.jpg" ) )
      XCTAssertEqual( launch.pad?.location?.name, "Cape Canaveral, FL, USA" )
      XCTAssertEqual( launch.pad?.location?.totalLandingCount, 20 )
      XCTAssertEqual( launch.pad?.location?.totalLaunchCount, 208 )
      XCTAssertEqual( launch.pad?.location?.url, "https://ll.thespacedevs.com/2.1.0/location/12/" )

      XCTAssertEqual( launch.pad?.longitude, "-80.57735736" )
      XCTAssertEqual( launch.pad?.mapImage,
                      URL( string: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_80_20200803143323.jpg" ) )
      XCTAssertEqual( launch.pad?.mapURL,
                      URL( string: "http://maps.google.com/maps?q=28.56194122,-80.57735736" ) )
      XCTAssertEqual( launch.pad?.name, "Space Launch Complex 40" )
      XCTAssertEqual( launch.pad?.totalLaunchCount, 63 )
      XCTAssertEqual( launch.pad?.url,
                      URL( string: "https://ll.thespacedevs.com/2.1.0/pad/80/" ) )
      XCTAssertEqual( launch.pad?.wikiURL,
                      URL( string: "https://en.wikipedia.org/wiki/Cape_Canaveral_Air_Force_Station_Space_Launch_Complex_40" ) )

      XCTAssertEqual( launch.probability, -1 )
      // TODO XCTAssertEqual( launch.program, [] )

      XCTAssertNotNil( launch.rocket?.configuration )
      XCTAssertEqual( launch.rocket?.configuration?.family, "Falcon" )
      XCTAssertEqual( launch.rocket?.configuration?.fullName, "Falcon 9 Block 5" )
      XCTAssertEqual( launch.rocket?.configuration?.id, 164 )
      XCTAssertEqual( launch.rocket?.configuration?.launchLibraryID, 188 )
      XCTAssertEqual( launch.rocket?.configuration?.name, "Falcon 9 Block 5" )
      XCTAssertEqual( launch.rocket?.configuration?.url,
                      URL( string: "https://ll.thespacedevs.com/2.1.0/config/launcher/164/" ) )
      XCTAssertEqual( launch.rocket?.configuration?.variant, "Block 5" )
      XCTAssertEqual( launch.rocket?.id, 2518 )

      XCTAssertEqual( launch.slug, "falcon-9-block-5-dedicated-sso-rideshare-mission-1" )

      XCTAssertNotNil( launch.status )
      XCTAssertEqual( launch.status?.abbreviation, "TBD" )
      XCTAssertEqual( launch.status?.description, "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources." )
      XCTAssertEqual( launch.status?.id, 2 )
      XCTAssertEqual( launch.status?.name, "To Be Determined" )

      XCTAssertEqual( launch.tbdDate, true )
      XCTAssertEqual( launch.tbdTime, true )
      XCTAssertEqual( launch.url, URL( string: "https://ll.thespacedevs.com/2.1.0/launch/f213a5df-579a-4682-8143-df228e463049/" ) )
      XCTAssertEqual( launch.webcastLive, false )
      XCTAssertEqual( launch.windowEnd, "2021-01-14T00:00:00Z" )
      XCTAssertEqual( launch.windowStart, "2021-01-14T00:00:00Z" )
   }

   func testLaunchJSON1() throws
   {
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase

      let json: String =
      #"""
      {
          "failreason": "",
          "hashtag": null,
          "holdreason": "",
          "id": "d5d607b7-05ed-4142-8703-14b553c195e0",
          "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon25209_image_20190224025007.jpeg",
          "infographic": null,
          "inhold": false,
          "launch_library_id": 1412,
          "launch_service_provider": {
              "id": 121,
              "name": "SpaceX",
              "type": "Commercial",
              "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
          },
          "mission": {
              "description": "T\u00fcrksat 5A is the first of two Turkish next generation communications satellites, which will be operated by T\u00fcrksat for commercial and military purposes.",
              "id": 1222,
              "launch_designator": null,
              "launch_library_id": null,
              "name": "T\u00fcrksat 5A",
              "orbit": {
                  "abbrev": "GTO",
                  "id": 2,
                  "name": "Geostationary Transfer Orbit"
              },
              "type": "Communications"
          },
          "name": "Falcon 9 Block 5 | T\u00fcrksat 5A",
          "net": "2021-01-05T01:27:00Z",
          "pad": {
              "agency_id": 121,
              "id": 80,
              "info_url": null,
              "latitude": "28.56194122",
              "location": {
                  "country_code": "USA",
                  "id": 12,
                  "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_12_20200803142519.jpg",
                  "name": "Cape Canaveral, FL, USA",
                  "total_landing_count": 20,
                  "total_launch_count": 208,
                  "url": "https://ll.thespacedevs.com/2.1.0/location/12/"
              },
              "longitude": "-80.57735736",
              "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_80_20200803143323.jpg",
              "map_url": "http://maps.google.com/maps?q=28.56194122,-80.57735736",
              "name": "Space Launch Complex 40",
              "total_launch_count": 63,
              "url": "https://ll.thespacedevs.com/2.1.0/pad/80/",
              "wiki_url": "https://en.wikipedia.org/wiki/Cape_Canaveral_Air_Force_Station_Space_Launch_Complex_40"
          },
          "probability": -1,
          "program": [],
          "rocket": {
              "configuration": {
                  "family": "Falcon",
                  "full_name": "Falcon 9 Block 5",
                  "id": 164,
                  "launch_library_id": 188,
                  "name": "Falcon 9 Block 5",
                  "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/164/",
                  "variant": "Block 5"
              },
              "id": 136
          },
          "slug": "falcon-9-block-5-turksat-5a",
          "status": {
              "abbrev": "TBC",
              "description": "Awaiting official confirmation - current date is known with some certainty.",
              "id": 8,
              "name": "To Be Confirmed"
          },
          "tbddate": true,
          "tbdtime": true,
          "url": "https://ll.thespacedevs.com/2.1.0/launch/d5d607b7-05ed-4142-8703-14b553c195e0/",
          "webcast_live": false,
          "window_end": "2021-01-05T05:29:00Z",
          "window_start": "2021-01-05T01:27:00Z"
      }
      """#

      let jsonData = json.data( using: .utf8 )!
      let launch: LaunchJSON = try! decoder.decode( LaunchJSON.self, from: jsonData )

      XCTAssertNotNil( launch )
      XCTAssertEqual( launch.failReason, "" )
      XCTAssertNil( launch.hashtag )
      XCTAssertEqual( launch.holdReason, "" )
      XCTAssertEqual( launch.id, "d5d607b7-05ed-4142-8703-14b553c195e0" )
      XCTAssertEqual( launch.image,
                      URL( string: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon25209_image_20190224025007.jpeg" ) )
      XCTAssertNil( launch.infographic )
      XCTAssertEqual( launch.inHold, false )
      XCTAssertEqual( launch.launchLibraryID, 1412 )

      XCTAssertNotNil( launch.serviceProvider )
      XCTAssertEqual( launch.serviceProvider?.id, 121 )
      XCTAssertEqual( launch.serviceProvider?.name, "SpaceX" )
      XCTAssertEqual( launch.serviceProvider?.type, "Commercial" )
      XCTAssertEqual( launch.serviceProvider?.url,
                      URL( string: "https://ll.thespacedevs.com/2.1.0/agencies/121/" ) )

      XCTAssertNotNil( launch.mission )
      XCTAssertEqual( launch.mission?.description, "T\u{00fc}rksat 5A is the first of two Turkish next generation communications satellites, which will be operated by T\u{00fc}rksat for commercial and military purposes." )
      XCTAssertEqual( launch.mission?.id, 1222 )
      XCTAssertNil( launch.mission?.launchDesignator )
      XCTAssertNil( launch.mission?.launchLibraryID )
      XCTAssertEqual( launch.mission?.name, "T\u{00fc}rksat 5A" )
      XCTAssertNotNil( launch.mission?.orbit )
      XCTAssertEqual( launch.mission?.orbit?.abbreviation, "GTO" )
      XCTAssertEqual( launch.mission?.orbit?.id, 2 )
      XCTAssertEqual( launch.mission?.orbit?.name, "Geostationary Transfer Orbit" )

      XCTAssertEqual( launch.name, "Falcon 9 Block 5 | T\u{00fc}rksat 5A" )
      XCTAssertEqual( launch.net, "2021-01-05T01:27:00Z" )

      XCTAssertNotNil( launch.pad )
      XCTAssertEqual( launch.pad?.agencyID, 121 )
      XCTAssertEqual( launch.pad?.id, 80 )
      XCTAssertNil( launch.pad?.infoURL )
      XCTAssertEqual( launch.pad?.latitude, "28.56194122" )

      XCTAssertNotNil( launch.pad?.location )
      XCTAssertEqual( launch.pad?.location?.countryCode, "USA" )
      XCTAssertEqual( launch.pad?.location?.id, 12 )
      XCTAssertEqual( launch.pad?.location?.mapImage,
                      URL( string: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_12_20200803142519.jpg" ) )
      XCTAssertEqual( launch.pad?.location?.name, "Cape Canaveral, FL, USA" )
      XCTAssertEqual( launch.pad?.location?.totalLandingCount, 20 )
      XCTAssertEqual( launch.pad?.location?.totalLaunchCount, 208 )
      XCTAssertEqual( launch.pad?.location?.url, "https://ll.thespacedevs.com/2.1.0/location/12/" )

      XCTAssertEqual( launch.pad?.longitude, "-80.57735736" )
      XCTAssertEqual( launch.pad?.mapImage,
                      URL( string: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_80_20200803143323.jpg" ) )
      XCTAssertEqual( launch.pad?.mapURL,
                      URL( string: "http://maps.google.com/maps?q=28.56194122,-80.57735736" ) )
      XCTAssertEqual( launch.pad?.name, "Space Launch Complex 40" )
      XCTAssertEqual( launch.pad?.totalLaunchCount, 63 )
      XCTAssertEqual( launch.pad?.url,
                      URL( string: "https://ll.thespacedevs.com/2.1.0/pad/80/" ) )
      XCTAssertEqual( launch.pad?.wikiURL,
                      URL( string: "https://en.wikipedia.org/wiki/Cape_Canaveral_Air_Force_Station_Space_Launch_Complex_40" ) )

      XCTAssertEqual( launch.probability, -1 )
      // TODO XCTAssertEqual( launch.program, [] )

      XCTAssertNotNil( launch.rocket?.configuration )
      XCTAssertEqual( launch.rocket?.configuration?.family, "Falcon" )
      XCTAssertEqual( launch.rocket?.configuration?.fullName, "Falcon 9 Block 5" )
      XCTAssertEqual( launch.rocket?.configuration?.id, 164 )
      XCTAssertEqual( launch.rocket?.configuration?.launchLibraryID, 188 )
      XCTAssertEqual( launch.rocket?.configuration?.name, "Falcon 9 Block 5" )
      XCTAssertEqual( launch.rocket?.configuration?.url,
                      URL( string: "https://ll.thespacedevs.com/2.1.0/config/launcher/164/" ) )
      XCTAssertEqual( launch.rocket?.configuration?.variant, "Block 5" )
      XCTAssertEqual( launch.rocket?.id, 136 )

      XCTAssertEqual( launch.slug, "falcon-9-block-5-turksat-5a" )

      XCTAssertNotNil( launch.status )
      XCTAssertEqual( launch.status?.abbreviation, "TBC" )
      XCTAssertEqual( launch.status?.description, "Awaiting official confirmation - current date is known with some certainty." )
      XCTAssertEqual( launch.status?.id, 8 )
      XCTAssertEqual( launch.status?.name, "To Be Confirmed" )

      XCTAssertEqual( launch.tbdDate, true )
      XCTAssertEqual( launch.tbdTime, true )
      XCTAssertEqual( launch.url, URL( string: "https://ll.thespacedevs.com/2.1.0/launch/d5d607b7-05ed-4142-8703-14b553c195e0/" ) )
      XCTAssertEqual( launch.webcastLive, false )
      XCTAssertEqual( launch.windowEnd, "2021-01-05T05:29:00Z" )
      XCTAssertEqual( launch.windowStart, "2021-01-05T01:27:00Z" )
   }

   // TODO test LaunchProgram, Agency (I don't have any real JSON for it, yet)
}

