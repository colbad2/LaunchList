// Copyright © 2021 Bradford Holcombe. All rights reserved.

import XCTest

// swiftlint:disable line_length
// swiftlint:disable file_length
// swiftlint:disable type_body_length
// swiftlint:disable function_body_length

class LaunchJSONUnitTests: XCTestCase
{
   func testLaunchJSON1() throws
   {
      let launchJSON1: String =
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

      guard let launch: LaunchJSON = LaunchJSON( parseJSON( jsonString: launchJSON1 ) ) else { XCTFail( "can't load test data" ); return }

      checkLaunch( launch: launch, launchID: "d5d607b7-05ed-4142-8703-14b553c195e0",
                   image: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon25209_image_20190224025007.jpeg",
                   inHold: false, libraryID: 1412, name: "Falcon 9 Block 5 | T\u{00fc}rksat 5A",
                   net: "2021-01-05T01:27:00Z",
                   slug: "falcon-9-block-5-turksat-5a", tbdDate: true, tbdTime: true,
                   url: "https://ll.thespacedevs.com/2.1.0/launch/d5d607b7-05ed-4142-8703-14b553c195e0/",
                   webcastLive: false, windowEnd: "2021-01-05T05:29:00Z",
                   windowStart: "2021-01-05T01:27:00Z" )
      checkAgency( agency: launch.serviceProvider, agencyID: 121, name: "SpaceX", type: "Commercial",
                   url: "https://ll.thespacedevs.com/2.1.0/agencies/121/" )
      checkMission( mission: launch.mission, missionID: 1222,
                    description: "T\u{00fc}rksat 5A is the first of two Turkish next generation communications satellites, which will be operated by T\u{00fc}rksat for commercial and military purposes.",
                    name: "T\u{00fc}rksat 5A", type: "Communications" )
      checkOrbit( orbit: launch.mission?.orbit, id: 2, name: "Geostationary Transfer Orbit", abbreviation: "GTO" )
      checkPad( pad: launch.pad, padID: 80, agencyID: 121, lat: "28.56194122", lon: "-80.57735736",
                mapImage: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_80_20200803143323.jpg",
                mapURL: "http://maps.google.com/maps?q=28.56194122,-80.57735736",
                name: "Space Launch Complex 40", totalLaunchCount: 63,
                url: "https://ll.thespacedevs.com/2.1.0/pad/80/",
                wikiURL: "https://en.wikipedia.org/wiki/Cape_Canaveral_Air_Force_Station_Space_Launch_Complex_40" )
      checkLocation( location: launch.pad?.location, locationID: 12, countryCode: "USA",
                     mapImage: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_12_20200803142519.jpg",
                     name: "Cape Canaveral, FL, USA", landingCount: 20, lauchCount: 208,
                     url: "https://ll.thespacedevs.com/2.1.0/location/12/" )
      XCTAssertNotNil( launch.programs )
      XCTAssertEqual( launch.programs.count, 0 )
      checkLauncherConfig( launcher: launch.rocket?.configuration, launcherID: 164, libraryID: 188,
                           url: "https://ll.thespacedevs.com/2.1.0/config/launcher/164/",
                           name: "Falcon 9 Block 5",
                           family: "Falcon", fullName: "Falcon 9 Block 5",
                           variant: "Block 5" )
      XCTAssertEqual( launch.rocket?.id, 136 )
      checkStatus( status: launch.status, abbreviation: "TBC",
                   description: "Awaiting official confirmation - current date is known with some certainty.",
                   statusID: 8, name: "To Be Confirmed" )
   }

   func testLaunchParse()
   {
      let json: String =
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

      guard let launch: LaunchJSON = LaunchJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }
      XCTAssertNotNil( launch )
   }

   func testLaunchJSON2() throws
   {
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

      guard let launch: LaunchJSON = LaunchJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkLaunch( launch: launch, launchID: "f213a5df-579a-4682-8143-df228e463049",
                   image: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon25209_image_20190224025007.jpeg",
                   inHold: false, libraryID: 1965, name: "Falcon 9 Block 5 | Dedicated SSO Rideshare Mission 1",
                   net: "2021-01-14T00:00:00Z",
                   slug: "falcon-9-block-5-dedicated-sso-rideshare-mission-1", tbdDate: true,
                   tbdTime: true,
                   url: "https://ll.thespacedevs.com/2.1.0/launch/f213a5df-579a-4682-8143-df228e463049/",
                   webcastLive: false, windowEnd: "2021-01-14T00:00:00Z",
                   windowStart: "2021-01-14T00:00:00Z" )
      checkAgency( agency: launch.serviceProvider, agencyID: 121, name: "SpaceX", type: "Commercial",
                   url: "https://ll.thespacedevs.com/2.1.0/agencies/121/" )
      XCTAssertNil( launch.mission )
      checkPad( pad: launch.pad, padID: 80, agencyID: 121, lat: "28.56194122", lon: "-80.57735736",
                mapImage: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_80_20200803143323.jpg",
                mapURL: "http://maps.google.com/maps?q=28.56194122,-80.57735736",
                name: "Space Launch Complex 40", totalLaunchCount: 63,
                url: "https://ll.thespacedevs.com/2.1.0/pad/80/",
                wikiURL: "https://en.wikipedia.org/wiki/Cape_Canaveral_Air_Force_Station_Space_Launch_Complex_40" )
      checkLocation( location: launch.pad?.location, locationID: 12, countryCode: "USA",
                     mapImage: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_12_20200803142519.jpg",
                     name: "Cape Canaveral, FL, USA", landingCount: 20, lauchCount: 208,
                     url: "https://ll.thespacedevs.com/2.1.0/location/12/" )
      XCTAssertNotNil( launch.programs )
      XCTAssertEqual( launch.programs.count, 0 )
      checkLauncherConfig( launcher: launch.rocket?.configuration, launcherID: 164, libraryID: 188,
                           url: "https://ll.thespacedevs.com/2.1.0/config/launcher/164/",
                           name: "Falcon 9 Block 5",
                           family: "Falcon", fullName: "Falcon 9 Block 5",
                           variant: "Block 5" )
      XCTAssertEqual( launch.rocket?.id, 2518 )
      checkStatus( status: launch.status, abbreviation: "TBD",
                   description: "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources.",
                   statusID: 2, name: "To Be Determined" )
   }

   func testLaunchJSON3() throws
   {
      let json: String =
      #"""
       {
           "failreason": "",
           "hashtag": null,
           "holdreason": "",
           "id": "edaf9a8d-d67c-4e0e-8452-a37b111581d5",
           "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon25209_image_20190224025007.jpeg",
           "infographic": null,
           "inhold": false,
           "launch_library_id": 1417,
           "launch_service_provider": {
               "id": 121,
               "name": "SpaceX",
               "type": "Commercial",
               "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
           },
           "mission": {
               "description": "SXM-8 is a large high power broadcasting satellite for SiriusXM's digital audio radio service (DARS).\n\nSpace Systems/Loral (SS/L) got in July 2016 the contract to build the two satellites based on their SSL-1300 bus - SXM-7 and SXM-8. Both operate in the S-band spectrum. Each satellite will generate more than 20-kW of power and will have a large unfurlable antenna reflector, which enables broadcast to radios without the need for large dish-type antennas on the ground.\n\nSXM-8 is meant to replace the XM-4 satellite.",
               "id": 1045,
               "launch_designator": null,
               "launch_library_id": 1245,
               "name": "SXM-8",
               "orbit": null,
               "type": "Communications"
           },
           "name": "Falcon 9 Block 5 | Sirius SXM-8",
           "net": "2021-01-31T00:00:00Z",
           "pad": {
               "agency_id": null,
               "id": 54,
               "info_url": null,
               "latitude": "0.0",
               "location": {
                   "country_code": "UNK",
                   "id": 22,
                   "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_22_20200803142419.jpg",
                   "name": "Unknown Location",
                   "total_landing_count": 0,
                   "total_launch_count": 0,
                   "url": "https://ll.thespacedevs.com/2.1.0/location/22/"
               },
               "longitude": "0.0",
               "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_54_20200803143536.jpg",
               "map_url": "",
               "name": "Unknown Pad",
               "total_launch_count": 0,
               "url": "https://ll.thespacedevs.com/2.1.0/pad/54/",
               "wiki_url": ""
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
               "id": 139
           },
           "slug": "falcon-9-block-5-sirius-sxm-8",
           "status": {
               "abbrev": "TBD",
               "description": "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources.",
               "id": 2,
               "name": "To Be Determined"
           },
           "tbddate": true,
           "tbdtime": true,
           "url": "https://ll.thespacedevs.com/2.1.0/launch/edaf9a8d-d67c-4e0e-8452-a37b111581d5/",
           "webcast_live": false,
           "window_end": "2021-01-31T00:00:00Z",
           "window_start": "2021-01-31T00:00:00Z"
       }
      """#

      guard let launch: LaunchJSON = LaunchJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkLaunch( launch: launch, launchID: "edaf9a8d-d67c-4e0e-8452-a37b111581d5",
                   image: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon25209_image_20190224025007.jpeg",
                   inHold: false, libraryID: 1417, name: "Falcon 9 Block 5 | Sirius SXM-8",
                   net: "2021-01-31T00:00:00Z",
                   slug: "falcon-9-block-5-sirius-sxm-8", tbdDate: true, tbdTime: true,
                   url: "https://ll.thespacedevs.com/2.1.0/launch/edaf9a8d-d67c-4e0e-8452-a37b111581d5/",
                   webcastLive: false, windowEnd: "2021-01-31T00:00:00Z",
                   windowStart: "2021-01-31T00:00:00Z" )
      checkAgency( agency: launch.serviceProvider, agencyID: 121, name: "SpaceX", type: "Commercial",
                   url: "https://ll.thespacedevs.com/2.1.0/agencies/121/" )
      checkMission( mission: launch.mission, missionID: 1045,
                    description: "SXM-8 is a large high power broadcasting satellite for SiriusXM's digital audio radio service (DARS).\n\nSpace Systems/Loral (SS/L) got in July 2016 the contract to build the two satellites based on their SSL-1300 bus - SXM-7 and SXM-8. Both operate in the S-band spectrum. Each satellite will generate more than 20-kW of power and will have a large unfurlable antenna reflector, which enables broadcast to radios without the need for large dish-type antennas on the ground.\n\nSXM-8 is meant to replace the XM-4 satellite.",
                    designator: nil, libraryID: 1245, name: "SXM-8", type: "Communications" )
      XCTAssertNil( launch.mission?.orbit )
      checkPad( pad: launch.pad, padID: 54, lat: "0.0", lon: "0.0",
                mapImage: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_54_20200803143536.jpg",
                name: "Unknown Pad", totalLaunchCount: 0,
                url: "https://ll.thespacedevs.com/2.1.0/pad/54/" )
      checkLocation( location: launch.pad?.location, locationID: 22, countryCode: "UNK",
                     mapImage: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_22_20200803142419.jpg",
                     name: "Unknown Location", landingCount: 0, lauchCount: 0,
                     url: "https://ll.thespacedevs.com/2.1.0/location/22/" )
      XCTAssertNotNil( launch.programs )
      XCTAssertEqual( launch.programs.count, 0 )
      checkLauncherConfig( launcher: launch.rocket?.configuration, launcherID: 164, libraryID: 188,
                           url: "https://ll.thespacedevs.com/2.1.0/config/launcher/164/",
                           name: "Falcon 9 Block 5",
                           family: "Falcon", fullName: "Falcon 9 Block 5",
                           variant: "Block 5" )
      XCTAssertEqual( launch.rocket?.id, 139 )
      checkStatus( status: launch.status, abbreviation: "TBD",
                   description: "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources.",
                   statusID: 2, name: "To Be Determined" )
   }

   func testLaunchJSON4() throws
   {
      let json: String =
      #"""
          {
              "failreason": null,
              "hashtag": null,
              "holdreason": null,
              "id": "0098c032-73de-4c6f-8d73-5d68b9a12fdf",
              "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon2520heavy_image_20190224025007.jpeg",
              "infographic": null,
              "inhold": false,
              "launch_library_id": 1585,
              "launch_service_provider": {
                  "id": 121,
                  "name": "SpaceX",
                  "type": "Commercial",
                  "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
              },
              "mission": null,
              "name": "Falcon Heavy | USSF-52",
              "net": "2021-03-01T00:00:00Z",
              "pad": {
                  "agency_id": null,
                  "id": 87,
                  "info_url": null,
                  "latitude": "28.60822681",
                  "location": {
                      "country_code": "USA",
                      "id": 27,
                      "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
                      "name": "Kennedy Space Center, FL, USA",
                      "total_landing_count": 0,
                      "total_launch_count": 182,
                      "url": "https://ll.thespacedevs.com/2.1.0/location/27/"
                  },
                  "longitude": "-80.60428186",
                  "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_87_20200803143537.jpg",
                  "map_url": "http://maps.google.com/maps?q=28.608+N,+80.604+W",
                  "name": "Launch Complex 39A",
                  "total_launch_count": 125,
                  "url": "https://ll.thespacedevs.com/2.1.0/pad/87/",
                  "wiki_url": "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39A"
              },
              "probability": -1,
              "program": [],
              "rocket": {
                  "configuration": {
                      "family": "Falcon",
                      "full_name": "Falcon Heavy",
                      "id": 161,
                      "launch_library_id": 58,
                      "name": "Falcon Heavy",
                      "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/161/",
                      "variant": "Heavy"
                  },
                  "id": 162
              },
              "slug": "falcon-heavy-ussf-52",
              "status": {
                  "abbrev": "TBD",
                  "description": "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources.",
                  "id": 2,
                  "name": "To Be Determined"
              },
              "tbddate": false,
              "tbdtime": false,
              "url": "https://ll.thespacedevs.com/2.1.0/launch/0098c032-73de-4c6f-8d73-5d68b9a12fdf/",
              "webcast_live": false,
              "window_end": "2021-03-01T00:00:00Z",
              "window_start": "2021-03-01T00:00:00Z"
          }
      """#

      guard let launch: LaunchJSON = LaunchJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkLaunch( launch: launch, launchID: "0098c032-73de-4c6f-8d73-5d68b9a12fdf",
                   image: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon2520heavy_image_20190224025007.jpeg",
                   inHold: false, libraryID: 1585, name: "Falcon Heavy | USSF-52",
                   net: "2021-03-01T00:00:00Z",
                   slug: "falcon-heavy-ussf-52", tbdDate: false, tbdTime: false,
                   url: "https://ll.thespacedevs.com/2.1.0/launch/0098c032-73de-4c6f-8d73-5d68b9a12fdf/",
                   webcastLive: false, windowEnd: "2021-03-01T00:00:00Z",
                   windowStart: "2021-03-01T00:00:00Z" )
      checkAgency( agency: launch.serviceProvider, agencyID: 121, name: "SpaceX", type: "Commercial",
                   url: "https://ll.thespacedevs.com/2.1.0/agencies/121/" )
      XCTAssertNil( launch.mission )
      checkPad( pad: launch.pad, padID: 87, lat: "28.60822681", lon: "-80.60428186",
                mapImage: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_87_20200803143537.jpg",
                mapURL: "http://maps.google.com/maps?q=28.608+N,+80.604+W", name: "Launch Complex 39A",
                totalLaunchCount: 125,
                url: "https://ll.thespacedevs.com/2.1.0/pad/87/",
                wikiURL: "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39A" )
      checkLocation( location: launch.pad?.location, locationID: 27, countryCode: "USA",
                     mapImage: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
                     name: "Kennedy Space Center, FL, USA", landingCount: 0, lauchCount: 182,
                     url: "https://ll.thespacedevs.com/2.1.0/location/27/" )
      XCTAssertNotNil( launch.programs )
      XCTAssertEqual( launch.programs.count, 0 )
      checkLauncherConfig( launcher: launch.rocket?.configuration, launcherID: 161, libraryID: 58,
                           url: "https://ll.thespacedevs.com/2.1.0/config/launcher/161/",
                           name: "Falcon Heavy",
                           family: "Falcon", fullName: "Falcon Heavy",
                           variant: "Heavy" )
      XCTAssertEqual( launch.rocket?.id, 162 )
      checkStatus( status: launch.status, abbreviation: "TBD",
                   description: "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources.",
                   statusID: 2, name: "To Be Determined" )
   }

   func testLaunchJSON5() throws
   {
      let json: String =
      #"""
       {
           "failreason": null,
           "hashtag": null,
           "holdreason": null,
           "id": "89a150ea-6e4b-489f-853c-3603ae684611",
           "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon25209_image_20190224025007.jpeg",
           "infographic": null,
           "inhold": false,
           "launch_library_id": 2090,
           "launch_service_provider": {
               "id": 121,
               "name": "SpaceX",
               "type": "Commercial",
               "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
           },
           "mission": null,
           "name": "Falcon 9 Block 5 | Dragon CRS-2 SpX-22",
           "net": "2021-03-12T00:00:00Z",
           "pad": {
               "agency_id": null,
               "id": 87,
               "info_url": null,
               "latitude": "28.60822681",
               "location": {
                   "country_code": "USA",
                   "id": 27,
                   "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
                   "name": "Kennedy Space Center, FL, USA",
                   "total_landing_count": 0,
                   "total_launch_count": 182,
                   "url": "https://ll.thespacedevs.com/2.1.0/location/27/"
               },
               "longitude": "-80.60428186",
               "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_87_20200803143537.jpg",
               "map_url": "http://maps.google.com/maps?q=28.608+N,+80.604+W",
               "name": "Launch Complex 39A",
               "total_launch_count": 125,
               "url": "https://ll.thespacedevs.com/2.1.0/pad/87/",
               "wiki_url": "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39A"
           },
           "probability": -1,
           "program": [
               {
                   "agencies": [
                       {
                           "id": 44,
                           "name": "National Aeronautics and Space Administration",
                           "type": "Government",
                           "url": "https://ll.thespacedevs.com/2.1.0/agencies/44/"
                       },
                       {
                           "id": 257,
                           "name": "Northrop Grumman Innovation Systems",
                           "type": "Commercial",
                           "url": "https://ll.thespacedevs.com/2.1.0/agencies/257/"
                       },
                       {
                           "id": 1020,
                           "name": "Sierra Nevada Corporation",
                           "type": "Commercial",
                           "url": "https://ll.thespacedevs.com/2.1.0/agencies/1020/"
                       },
                       {
                           "id": 121,
                           "name": "SpaceX",
                           "type": "Commercial",
                           "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
                       }
                   ],
                   "description": "Commercial Resupply Services (CRS) are a series of flights awarded by NASA for the delivery of cargo and supplies to the International Space Station.The first CRS contracts were signed in 2008 and awarded $1.6 billion to SpaceX for twelve cargo Dragon and $1.9 billion to Orbital Sciences for eight Cygnus flights, covering deliveries to 2016. The Falcon 9 and Antares rockets were also developed under the CRS program to deliver cargo spacecraft to the ISS.",
                   "end_date": null,
                   "id": 11,
                   "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/program_images/commercial2520_program_20201129212219.png",
                   "info_url": null,
                   "name": "Commercial Resupply Services",
                   "start_date": "2008-12-23T00:00:00Z",
                   "url": "https://ll.thespacedevs.com/2.1.0/program/11/",
                   "wiki_url": "https://en.wikipedia.org/wiki/Commercial_Resupply_Services#Commercial_Resupply_Services"
               }
           ],
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
               "id": 2746
           },
           "slug": "falcon-9-block-5-dragon-crs-2-spx-22",
           "status": {
               "abbrev": "TBD",
               "description": "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources.",
               "id": 2,
               "name": "To Be Determined"
           },
           "tbddate": true,
           "tbdtime": true,
           "url": "https://ll.thespacedevs.com/2.1.0/launch/89a150ea-6e4b-489f-853c-3603ae684611/",
           "webcast_live": false,
           "window_end": "2021-03-12T00:00:00Z",
           "window_start": "2021-03-12T00:00:00Z"
       }
      """#

      guard let launch: LaunchJSON = LaunchJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkLaunch( launch: launch, launchID: "89a150ea-6e4b-489f-853c-3603ae684611",
                   image: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon25209_image_20190224025007.jpeg",
                   inHold: false, libraryID: 2090, name: "Falcon 9 Block 5 | Dragon CRS-2 SpX-22",
                   net: "2021-03-12T00:00:00Z",
                   slug: "falcon-9-block-5-dragon-crs-2-spx-22", tbdDate: true, tbdTime: true,
                   url: "https://ll.thespacedevs.com/2.1.0/launch/89a150ea-6e4b-489f-853c-3603ae684611/",
                   webcastLive: false, windowEnd: "2021-03-12T00:00:00Z",
                   windowStart: "2021-03-12T00:00:00Z" )
      checkAgency( agency: launch.serviceProvider, agencyID: 121, name: "SpaceX", type: "Commercial",
                   url: "https://ll.thespacedevs.com/2.1.0/agencies/121/" )
      XCTAssertNil( launch.mission )
      checkPad( pad: launch.pad, padID: 87, lat: "28.60822681", lon: "-80.60428186",
                mapImage: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_87_20200803143537.jpg",
                mapURL: "http://maps.google.com/maps?q=28.608+N,+80.604+W", name: "Launch Complex 39A",
                totalLaunchCount: 125,
                url: "https://ll.thespacedevs.com/2.1.0/pad/87/",
                wikiURL: "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39A" )
      checkLocation( location: launch.pad?.location, locationID: 27, countryCode: "USA",
                     mapImage: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
                     name: "Kennedy Space Center, FL, USA", landingCount: 0, lauchCount: 182,
                     url: "https://ll.thespacedevs.com/2.1.0/location/27/" )

      XCTAssertNotNil( launch.programs )
      XCTAssertEqual( launch.programs.count, 1 )
      checkProgram( program: launch.programs[ 0 ], programID: 11,
                    description: "Commercial Resupply Services (CRS) are a series of flights awarded by NASA for the delivery of cargo and supplies to the International Space Station.The first CRS contracts were signed in 2008 and awarded $1.6 billion to SpaceX for twelve cargo Dragon and $1.9 billion to Orbital Sciences for eight Cygnus flights, covering deliveries to 2016. The Falcon 9 and Antares rockets were also developed under the CRS program to deliver cargo spacecraft to the ISS.",
                    imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/program_images/commercial2520_program_20201129212219.png",
                    name: "Commercial Resupply Services",
                    startDate: "2008-12-23T00:00:00Z",
                    url: "https://ll.thespacedevs.com/2.1.0/program/11/",
                    wikiURL: "https://en.wikipedia.org/wiki/Commercial_Resupply_Services#Commercial_Resupply_Services" )
      XCTAssertNotNil( launch.programs[ 0 ].agencies )
      XCTAssertEqual( launch.programs[ 0 ].agencies.count, 4 )
      XCTAssertNotNil( launch.programs[ 0 ].agencies[ 0 ] )
      checkAgency( agency: launch.programs[ 0 ].agencies[ 0 ], agencyID: 44, name: "National Aeronautics and Space Administration",
                   type: "Government", url: "https://ll.thespacedevs.com/2.1.0/agencies/44/" )
      XCTAssertNotNil( launch.programs[ 0 ].agencies[ 1 ] )
      checkAgency( agency: launch.programs[ 0 ].agencies[ 1 ], agencyID: 257, name: "Northrop Grumman Innovation Systems",
                   type: "Commercial", url: "https://ll.thespacedevs.com/2.1.0/agencies/257/" )
      XCTAssertNotNil( launch.programs[ 0 ].agencies[ 2 ] )
      checkAgency( agency: launch.programs[ 0 ].agencies[ 2 ], agencyID: 1020, name: "Sierra Nevada Corporation",
                   type: "Commercial", url: "https://ll.thespacedevs.com/2.1.0/agencies/1020/" )
      XCTAssertNotNil( launch.programs[ 0 ].agencies[ 3 ] )
      checkAgency( agency: launch.programs[ 0 ].agencies[ 3 ], agencyID: 121, name: "SpaceX",
                   type: "Commercial", url: "https://ll.thespacedevs.com/2.1.0/agencies/121/" )

      checkLauncherConfig( launcher: launch.rocket?.configuration, launcherID: 164, libraryID: 188,
                           url: "https://ll.thespacedevs.com/2.1.0/config/launcher/164/",
                           name: "Falcon 9 Block 5",
                           family: "Falcon", fullName: "Falcon 9 Block 5",
                           variant: "Block 5" )
      XCTAssertEqual( launch.rocket?.id, 2746 )
      checkStatus( status: launch.status, abbreviation: "TBD",
                   description: "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources.",
                   statusID: 2, name: "To Be Determined" )
   }

   func testLaunchJSON6() throws
   {
      let json: String =
      #"""
          {
              "failreason": "",
              "hashtag": null,
              "holdreason": "",
              "id": "32dcb5ad-7609-4fc0-8094-768ee5c2ebe0",
              "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon25209_image_20190224025007.jpeg",
              "infographic": null,
              "inhold": false,
              "launch_library_id": 2077,
              "launch_service_provider": {
                  "id": 121,
                  "name": "SpaceX",
                  "type": "Commercial",
                  "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
              },
              "mission": {
                  "description": "SpaceX Crew-2 will be the second crewed operational flight of a Crew Dragon spacecraft, and the third overall crewed orbital flight. It will use the same Falcon 9 first stage as the Crew-1 mission and the same Crew Dragon capsule as the Demo-2 mission (Endeavour).",
                  "id": 1137,
                  "launch_designator": null,
                  "launch_library_id": 1330,
                  "name": "SpX USCV-2 (NASA Crew Flight 2)",
                  "orbit": {
                      "abbrev": "LEO",
                      "id": 8,
                      "name": "Low Earth Orbit"
                  },
                  "type": "Human Exploration"
              },
              "name": "Falcon 9 Block 5 | SpX USCV-2 (NASA Crew Flight 2)",
              "net": "2021-03-30T00:00:00Z",
              "pad": {
                  "agency_id": null,
                  "id": 87,
                  "info_url": null,
                  "latitude": "28.60822681",
                  "location": {
                      "country_code": "USA",
                      "id": 27,
                      "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
                      "name": "Kennedy Space Center, FL, USA",
                      "total_landing_count": 0,
                      "total_launch_count": 182,
                      "url": "https://ll.thespacedevs.com/2.1.0/location/27/"
                  },
                  "longitude": "-80.60428186",
                  "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_87_20200803143537.jpg",
                  "map_url": "http://maps.google.com/maps?q=28.608+N,+80.604+W",
                  "name": "Launch Complex 39A",
                  "total_launch_count": 125,
                  "url": "https://ll.thespacedevs.com/2.1.0/pad/87/",
                  "wiki_url": "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39A"
              },
              "probability": -1,
              "program": [
                  {
                      "agencies": [
                          {
                              "id": 80,
                              "name": "Boeing",
                              "type": "Commercial",
                              "url": "https://ll.thespacedevs.com/2.1.0/agencies/80/"
                          },
                          {
                              "id": 44,
                              "name": "National Aeronautics and Space Administration",
                              "type": "Government",
                              "url": "https://ll.thespacedevs.com/2.1.0/agencies/44/"
                          },
                          {
                              "id": 121,
                              "name": "SpaceX",
                              "type": "Commercial",
                              "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
                          }
                      ],
                      "description": "The Commercial Crew Program (CCP) is a human spaceflight program operated by NASA, in association with American aerospace manufacturers Boeing and SpaceX. The program conducts rotations between the expeditions of the International Space Station program, transporting crews to and from the International Space Station (ISS) aboard Boeing Starliner and SpaceX Crew Dragon capsules, in the first crewed orbital spaceflights operated by private companies.",
                      "end_date": null,
                      "id": 5,
                      "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/program_images/commercial2520_program_20200820201209.png",
                      "info_url": "https://www.nasa.gov/exploration/commercial/crew/index.html",
                      "name": "Commercial Crew Program",
                      "start_date": "2011-04-18T00:00:00Z",
                      "url": "https://ll.thespacedevs.com/2.1.0/program/5/",
                      "wiki_url": "https://en.wikipedia.org/wiki/Commercial_Crew_Program"
                  },
                  {
                      "agencies": [
                          {
                              "id": 16,
                              "name": "Canadian Space Agency",
                              "type": "Government",
                              "url": "https://ll.thespacedevs.com/2.1.0/agencies/16/"
                          },
                          {
                              "id": 27,
                              "name": "European Space Agency",
                              "type": "Multinational",
                              "url": "https://ll.thespacedevs.com/2.1.0/agencies/27/"
                          },
                          {
                              "id": 37,
                              "name": "Japan Aerospace Exploration Agency",
                              "type": "Government",
                              "url": "https://ll.thespacedevs.com/2.1.0/agencies/37/"
                          },
                          {
                              "id": 44,
                              "name": "National Aeronautics and Space Administration",
                              "type": "Government",
                              "url": "https://ll.thespacedevs.com/2.1.0/agencies/44/"
                          },
                          {
                              "id": 63,
                              "name": "Russian Federal Space Agency (ROSCOSMOS)",
                              "type": "Government",
                              "url": "https://ll.thespacedevs.com/2.1.0/agencies/63/"
                          }
                      ],
                      "description": "The International Space Station programme is tied together by a complex set of legal, political and financial agreements between the sixteen nations involved in the project, governing ownership of the various components, rights to crewing and utilization, and responsibilities for crew rotation and resupply of the International Space Station. It was conceived in 1984 by President Ronald Reagan, during the Space Station Freedom project as it was originally called.",
                      "end_date": null,
                      "id": 17,
                      "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/program_images/international2_program_20201129184745.png",
                      "info_url": "https://www.nasa.gov/mission_pages/station/main/index.html",
                      "name": "International Space Station",
                      "start_date": "1998-11-20T06:40:00Z",
                      "url": "https://ll.thespacedevs.com/2.1.0/program/17/",
                      "wiki_url": "https://en.wikipedia.org/wiki/International_Space_Station_programme"
                  }
              ],
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
                  "id": 2732
              },
              "slug": "falcon-9-block-5-spx-uscv-2-nasa-crew-flight-2",
              "status": {
                  "abbrev": "TBD",
                  "description": "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources.",
                  "id": 2,
                  "name": "To Be Determined"
              },
              "tbddate": true,
              "tbdtime": true,
              "url": "https://ll.thespacedevs.com/2.1.0/launch/32dcb5ad-7609-4fc0-8094-768ee5c2ebe0/",
              "webcast_live": false,
              "window_end": "2021-03-30T00:00:00Z",
              "window_start": "2021-03-30T00:00:00Z"
          }
      """#

      guard let launch: LaunchJSON = LaunchJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkLaunch( launch: launch, launchID: "32dcb5ad-7609-4fc0-8094-768ee5c2ebe0",
                   image: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon25209_image_20190224025007.jpeg",
                   inHold: false, libraryID: 2077, name: "Falcon 9 Block 5 | SpX USCV-2 (NASA Crew Flight 2)",
                   net: "2021-03-30T00:00:00Z",
                   slug: "falcon-9-block-5-spx-uscv-2-nasa-crew-flight-2", tbdDate: true, tbdTime: true,
                   url: "https://ll.thespacedevs.com/2.1.0/launch/32dcb5ad-7609-4fc0-8094-768ee5c2ebe0/",
                   webcastLive: false, windowEnd: "2021-03-30T00:00:00Z",
                   windowStart: "2021-03-30T00:00:00Z" )
      checkAgency( agency: launch.serviceProvider, agencyID: 121, name: "SpaceX", type: "Commercial",
                   url: "https://ll.thespacedevs.com/2.1.0/agencies/121/" )
      checkMission( mission: launch.mission, missionID: 1137,
                    description: "SpaceX Crew-2 will be the second crewed operational flight of a Crew Dragon spacecraft, and the third overall crewed orbital flight. It will use the same Falcon 9 first stage as the Crew-1 mission and the same Crew Dragon capsule as the Demo-2 mission (Endeavour).",
                    libraryID: 1330, name: "SpX USCV-2 (NASA Crew Flight 2)", type: "Human Exploration" )
      checkOrbit( orbit: launch.mission?.orbit, id: 8, name: "Low Earth Orbit", abbreviation: "LEO" )
      checkPad( pad: launch.pad, padID: 87, lat: "28.60822681", lon: "-80.60428186",
                mapImage: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_87_20200803143537.jpg",
                mapURL: "http://maps.google.com/maps?q=28.608+N,+80.604+W", name: "Launch Complex 39A",
                totalLaunchCount: 125,
                url: "https://ll.thespacedevs.com/2.1.0/pad/87/",
                wikiURL: "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39A" )
      checkLocation( location: launch.pad?.location, locationID: 27, countryCode: "USA",
                     mapImage: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
                     name: "Kennedy Space Center, FL, USA", landingCount: 0, lauchCount: 182,
                     url: "https://ll.thespacedevs.com/2.1.0/location/27/" )

      XCTAssertNotNil( launch.programs )
      XCTAssertEqual( launch.programs.count, 2 )

      checkProgram( program: launch.programs[ 0 ], programID: 5,
                    description: "The Commercial Crew Program (CCP) is a human spaceflight program operated by NASA, in association with American aerospace manufacturers Boeing and SpaceX. The program conducts rotations between the expeditions of the International Space Station program, transporting crews to and from the International Space Station (ISS) aboard Boeing Starliner and SpaceX Crew Dragon capsules, in the first crewed orbital spaceflights operated by private companies.",
                    imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/program_images/commercial2520_program_20200820201209.png",
                    infoURL: "https://www.nasa.gov/exploration/commercial/crew/index.html",
                    name: "Commercial Crew Program",
                    startDate: "2011-04-18T00:00:00Z",
                    url: "https://ll.thespacedevs.com/2.1.0/program/5/",
                    wikiURL: "https://en.wikipedia.org/wiki/Commercial_Crew_Program" )
      XCTAssertNotNil( launch.programs[ 0 ].agencies )
      XCTAssertEqual( launch.programs[ 0 ].agencies.count, 3 )
      XCTAssertNotNil( launch.programs[ 0 ].agencies[ 0 ] )
      checkAgency( agency: launch.programs[ 0 ].agencies[ 0 ], agencyID: 80, name: "Boeing",
                   type: "Commercial", url: "https://ll.thespacedevs.com/2.1.0/agencies/80/" )
      XCTAssertNotNil( launch.programs[ 0 ].agencies[ 1 ] )
      checkAgency( agency: launch.programs[ 0 ].agencies[ 1 ], agencyID: 44, name: "National Aeronautics and Space Administration",
                   type: "Government", url: "https://ll.thespacedevs.com/2.1.0/agencies/44/" )
      XCTAssertNotNil( launch.programs[ 0 ].agencies[ 2 ] )
      checkAgency( agency: launch.programs[ 0 ].agencies[ 2 ], agencyID: 121, name: "SpaceX",
                   type: "Commercial", url: "https://ll.thespacedevs.com/2.1.0/agencies/121/" )

      checkProgram( program: launch.programs[ 1 ], programID: 17,
                    description: "The International Space Station programme is tied together by a complex set of legal, political and financial agreements between the sixteen nations involved in the project, governing ownership of the various components, rights to crewing and utilization, and responsibilities for crew rotation and resupply of the International Space Station. It was conceived in 1984 by President Ronald Reagan, during the Space Station Freedom project as it was originally called.",
                    imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/program_images/international2_program_20201129184745.png",
                    infoURL: "https://www.nasa.gov/mission_pages/station/main/index.html",
                    name: "International Space Station",
                    startDate: "1998-11-20T06:40:00Z",
                    url: "https://ll.thespacedevs.com/2.1.0/program/17/",
                    wikiURL: "https://en.wikipedia.org/wiki/International_Space_Station_programme" )
      XCTAssertNotNil( launch.programs[ 1 ].agencies )
      XCTAssertEqual( launch.programs[ 1 ].agencies.count, 5 )
      XCTAssertNotNil( launch.programs[ 1 ].agencies[ 0 ] )
      checkAgency( agency: launch.programs[ 1 ].agencies[ 0 ], agencyID: 16, name: "Canadian Space Agency",
                   type: "Government", url: "https://ll.thespacedevs.com/2.1.0/agencies/16/" )
      XCTAssertNotNil( launch.programs[ 1 ].agencies[ 1 ] )
      checkAgency( agency: launch.programs[ 1 ].agencies[ 1 ], agencyID: 27, name: "European Space Agency",
                   type: "Multinational", url: "https://ll.thespacedevs.com/2.1.0/agencies/27/" )
      XCTAssertNotNil( launch.programs[ 1 ].agencies[ 2 ] )
      checkAgency( agency: launch.programs[ 1 ].agencies[ 2 ], agencyID: 37, name: "Japan Aerospace Exploration Agency",
                   type: "Government", url: "https://ll.thespacedevs.com/2.1.0/agencies/37/" )
      XCTAssertNotNil( launch.programs[ 1 ].agencies[ 3 ] )
      checkAgency( agency: launch.programs[ 1 ].agencies[ 3 ], agencyID: 44, name: "National Aeronautics and Space Administration",
                   type: "Government", url: "https://ll.thespacedevs.com/2.1.0/agencies/44/" )
      XCTAssertNotNil( launch.programs[ 1 ].agencies[ 4 ] )
      checkAgency( agency: launch.programs[ 1 ].agencies[ 4 ], agencyID: 63, name: "Russian Federal Space Agency (ROSCOSMOS)",
                   type: "Government", url: "https://ll.thespacedevs.com/2.1.0/agencies/63/" )

      checkLauncherConfig( launcher: launch.rocket?.configuration, launcherID: 164, libraryID: 188,
                           url: "https://ll.thespacedevs.com/2.1.0/config/launcher/164/",
                           name: "Falcon 9 Block 5",
                           family: "Falcon", fullName: "Falcon 9 Block 5",
                           variant: "Block 5" )
      XCTAssertEqual( launch.rocket?.id, 2732 )
      checkStatus( status: launch.status, abbreviation: "TBD",
                   description: "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources.",
                   statusID: 2, name: "To Be Determined" )
   }

   func testLaunchJSON7() throws
   {
      let json: String =
      #"""
           {
               "failreason": null,
               "hashtag": null,
               "holdreason": null,
               "id": "572dbb78-06f5-47dd-be8c-593967333d81",
               "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon25209_image_20190224025007.jpeg",
               "infographic": null,
               "inhold": false,
               "launch_library_id": 1527,
               "launch_service_provider": {
                   "id": 121,
                   "name": "SpaceX",
                   "type": "Commercial",
                   "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
               },
               "mission": null,
               "name": "Falcon 9 Block 5 | GPS III SV06",
               "net": "2021-04-01T00:00:00Z",
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
                   "id": 174
               },
               "slug": "falcon-9-block-5-gps-iii-sv06",
               "status": {
                   "abbrev": "TBD",
                   "description": "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources.",
                   "id": 2,
                   "name": "To Be Determined"
               },
               "tbddate": true,
               "tbdtime": true,
               "url": "https://ll.thespacedevs.com/2.1.0/launch/572dbb78-06f5-47dd-be8c-593967333d81/",
               "webcast_live": false,
               "window_end": "2021-04-01T00:00:00Z",
               "window_start": "2021-04-01T00:00:00Z"
           }
      """#

      guard let launch: LaunchJSON = LaunchJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkLaunch( launch: launch, launchID: "572dbb78-06f5-47dd-be8c-593967333d81",
                   image: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon25209_image_20190224025007.jpeg",
                   inHold: false, libraryID: 1527, name: "Falcon 9 Block 5 | GPS III SV06",
                   net: "2021-04-01T00:00:00Z",
                   slug: "falcon-9-block-5-gps-iii-sv06", tbdDate: true, tbdTime: true,
                   url: "https://ll.thespacedevs.com/2.1.0/launch/572dbb78-06f5-47dd-be8c-593967333d81/",
                   webcastLive: false, windowEnd: "2021-04-01T00:00:00Z",
                   windowStart: "2021-04-01T00:00:00Z" )
      checkAgency( agency: launch.serviceProvider, agencyID: 121, name: "SpaceX", type: "Commercial",
                   url: "https://ll.thespacedevs.com/2.1.0/agencies/121/" )
      XCTAssertNil( launch.mission )
      checkPad( pad: launch.pad, padID: 80, agencyID: 121, lat: "28.56194122", lon: "-80.57735736",
                mapImage: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_80_20200803143323.jpg",
                mapURL: "http://maps.google.com/maps?q=28.56194122,-80.57735736", name: "Space Launch Complex 40",
                totalLaunchCount: 63,
                url: "https://ll.thespacedevs.com/2.1.0/pad/80/",
                wikiURL: "https://en.wikipedia.org/wiki/Cape_Canaveral_Air_Force_Station_Space_Launch_Complex_40" )
      checkLocation( location: launch.pad?.location, locationID: 12, countryCode: "USA",
                     mapImage: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_12_20200803142519.jpg",
                     name: "Cape Canaveral, FL, USA", landingCount: 20, lauchCount: 208,
                     url: "https://ll.thespacedevs.com/2.1.0/location/12/" )

      XCTAssertNotNil( launch.programs )
      XCTAssertEqual( launch.programs.count, 0 )

      checkLauncherConfig( launcher: launch.rocket?.configuration, launcherID: 164, libraryID: 188,
                           url: "https://ll.thespacedevs.com/2.1.0/config/launcher/164/",
                           name: "Falcon 9 Block 5",
                           family: "Falcon", fullName: "Falcon 9 Block 5",
                           variant: "Block 5" )
      XCTAssertEqual( launch.rocket?.id, 174 )
      checkStatus( status: launch.status, abbreviation: "TBD",
                   description: "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources.",
                   statusID: 2, name: "To Be Determined" )
   }

   func testLaunche16642806e394de88875e4d3ca72338b()
   {
      let json: String =
      #"""
      {
         "id": "e1664280-6e39-4de8-8875-e4d3ca72338b",
         "url": "https://ll.thespacedevs.com/2.2.0/launch/e1664280-6e39-4de8-8875-e4d3ca72338b/",
         "slug": "space-shuttle-endeavour-ov-105-sts-123",
         "name": "Space Shuttle Endeavour / OV-105 | STS-123",
         "status": {
           "id": 3,
           "name": "Launch Successful",
           "abbrev": "Success",
           "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
         },
         "last_updated": "2021-02-07T21:10:13Z",
         "net": "2008-03-11T06:28:14Z",
         "window_end": "2008-03-11T06:28:14Z",
         "window_start": "2008-03-11T06:28:14Z",
         "probability": -1,
         "holdreason": "",
         "failreason": "",
         "hashtag": null,
         "launch_service_provider": {
           "id": 191,
           "url": "https://ll.thespacedevs.com/2.2.0/agencies/191/",
           "name": "United Space Alliance",
           "type": "Commercial"
         },
         "rocket": {
           "id": 1389,
           "configuration": {
             "id": 41,
             "url": "https://ll.thespacedevs.com/2.2.0/config/launcher/41/",
             "name": "Space Shuttle Endeavour OV-105",
             "family": "Space Shuttle",
             "full_name": "Space Shuttle Endeavour OV-105",
             "variant": "OV-105"
           }
         },
         "mission": {
           "id": 127,
           "name": "STS-123",
           "description": "STS-123 was a Space Shuttle mission to the International Space Station (ISS) which was flown by Space Shuttle Endeavour. STS-123 was the 1J/A ISS assembly mission. The original launch target date was 14 February 2008 but after the delay of STS-122, the shuttle was launched on 11 March 2008. It was the twenty-fifth shuttle mission to visit the ISS, and delivered the first module of the Japanese laboratory, Japanese Experiment Module (KibÅ), and the Canadian Special Purpose Dexterous Manipulator, (SPDM) Dextre robotics system to the station.",
           "launch_designator": null,
           "type": "Human Exploration",
           "orbit": {
             "id": 8,
             "name": "Low Earth Orbit",
             "abbrev": "LEO"
           }
         },
         "pad": {
           "id": 87,
           "url": "https://ll.thespacedevs.com/2.2.0/pad/87/",
           "agency_id": null,
           "name": "Launch Complex 39A",
           "info_url": null,
           "wiki_url": "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39A",
           "map_url": "http://maps.google.com/maps?q=28.608+N,+80.604+W",
           "latitude": "28.60822681",
           "longitude": "-80.60428186",
           "location": {
             "id": 27,
             "url": "https://ll.thespacedevs.com/2.2.0/location/27/",
             "name": "Kennedy Space Center, FL, USA",
             "country_code": "USA",
             "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
             "total_launch_count": 184,
             "total_landing_count": 0
           },
           "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_87_20200803143537.jpg",
           "total_launch_count": 127
         },
         "webcast_live": false,
         "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/space2520shuttle2520endeavour2520ov-101_image_20190222030547.jpeg",
         "infographic": null,
         "program": []
      }
      """#

      guard let launch: LaunchJSON = LaunchJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkLaunch( launch: launch, launchID: "e1664280-6e39-4de8-8875-e4d3ca72338b",
                   image: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/space2520shuttle2520endeavour2520ov-101_image_20190222030547.jpeg",
                   name: "Space Shuttle Endeavour / OV-105 | STS-123",
                   net: "2008-03-11T06:28:14Z",
                   slug: "space-shuttle-endeavour-ov-105-sts-123",
                   url: "https://ll.thespacedevs.com/2.2.0/launch/e1664280-6e39-4de8-8875-e4d3ca72338b/",
                   webcastLive: false, windowEnd: "2008-03-11T06:28:14Z",
                   windowStart: "2008-03-11T06:28:14Z", lastUpdated: "2021-02-07T21:10:13Z" )
      checkStatus( status: launch.status, abbreviation: "Success",
                   description: "The launch vehicle successfully inserted its payload(s) into the target orbit(s).",
                   statusID: 3, name: "Launch Successful" )
      checkAgency( agency: launch.serviceProvider, agencyID: 191, name: "United Space Alliance", type: "Commercial",
                   url: "https://ll.thespacedevs.com/2.2.0/agencies/191/" )
      checkLauncherConfig( launcher: launch.rocket?.configuration, launcherID: 41,
                           url: "https://ll.thespacedevs.com/2.2.0/config/launcher/41/",
                           name: "Space Shuttle Endeavour OV-105",
                           family: "Space Shuttle", fullName: "Space Shuttle Endeavour OV-105",
                           variant: "OV-105" )
      XCTAssertEqual( launch.rocket?.id, 1389 )

      checkMission( mission: launch.mission, missionID: 127,
                    description: "STS-123 was a Space Shuttle mission to the International Space Station (ISS) which was flown by Space Shuttle Endeavour. STS-123 was the 1J/A ISS assembly mission. The original launch target date was 14 February 2008 but after the delay of STS-122, the shuttle was launched on 11 March 2008. It was the twenty-fifth shuttle mission to visit the ISS, and delivered the first module of the Japanese laboratory, Japanese Experiment Module (KibÅ), and the Canadian Special Purpose Dexterous Manipulator, (SPDM) Dextre robotics system to the station.",
                    name: "STS-123", type: "Human Exploration" )
      checkOrbit( orbit: launch.mission?.orbit, id: 8, name: "Low Earth Orbit", abbreviation: "LEO" )

      checkPad( pad: launch.pad, padID: 87, lat: "28.60822681", lon: "-80.60428186",
                mapImage: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_87_20200803143537.jpg",
                mapURL: "http://maps.google.com/maps?q=28.608+N,+80.604+W", name: "Launch Complex 39A",
                totalLaunchCount: 127,
                url: "https://ll.thespacedevs.com/2.2.0/pad/87/",
                wikiURL: "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39A" )
      checkLocation( location: launch.pad?.location, locationID: 27, countryCode: "USA",
                     mapImage: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
                     name: "Kennedy Space Center, FL, USA", landingCount: 0, lauchCount: 184,
                     url: "https://ll.thespacedevs.com/2.2.0/location/27/" )

      XCTAssertNotNil( launch.programs )
      XCTAssertEqual( launch.programs.count, 0 )
   }
}
