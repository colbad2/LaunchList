// Copyright © 2021 Bradford Holcombe. All rights reserved.

import XCTest

// swiftlint:disable line_length
// swiftlint:disable file_length
// swiftlint:disable type_body_length
// swiftlint:disable function_body_length

// TODO need a flight that has crew
class SpacecraftFlightJSONUnitTests: XCTestCase
{
   func testSpacecraftFlight186() throws
   {
      guard let spacecraftFlight: SpacecraftFlightJSON = SpacecraftFlightJSON( json: parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkLanding( spacecraftFlight: spacecraftFlight, id: 186, url: "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/186/",
                    destination: "International Space Station", missionEnd: "2008-03-27T00:40:00Z" )
         // TODO check spacecraft
      checkLaunch( launch: spacecraftFlight.launch, launchID: "e1664280-6e39-4de8-8875-e4d3ca72338b",
                   image: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/space2520shuttle2520endeavour2520ov-101_image_20190222030547.jpeg",
                   name: "Space Shuttle Endeavour / OV-105 | STS-123", net: "2008-03-11T06:28:14Z",
                   probability: -1, slug: "space-shuttle-endeavour-ov-105-sts-123",
                   url: "https://ll.thespacedevs.com/2.2.0/launch/e1664280-6e39-4de8-8875-e4d3ca72338b/",
                   webcastLive: false, windowEnd: "2008-03-11T06:28:14Z", windowStart: "2008-03-11T06:28:14Z", lastUpdated: "2021-02-07T21:10:13Z" )
      checkStatus( status: spacecraftFlight.launch?.status, abbreviation: "Success",
                   description: "The launch vehicle successfully inserted its payload(s) into the target orbit(s).", statusID: 3, name: "Launch Successful" )
      checkAgency( agency: spacecraftFlight.launch?.serviceProvider, agencyID: 191, name: "United Space Alliance", type: "Commercial",
                   url: "https://ll.thespacedevs.com/2.2.0/agencies/191/" )
      XCTAssertEqual( spacecraftFlight.launch?.rocket?.id, 1389 )
      checkLauncherConfig( launcher: spacecraftFlight.launch?.rocket?.configuration, launcherID: 41, url: "https://ll.thespacedevs.com/2.2.0/config/launcher/41/",
                           name: "Space Shuttle Endeavour OV-105",
                           family: "Space Shuttle", fullName: "Space Shuttle Endeavour OV-105", variant: "OV-105" )
      checkMission( mission: spacecraftFlight.launch?.mission, missionID: 127,
                    description: "STS-123 was a Space Shuttle mission to the International Space Station (ISS) which was flown by Space Shuttle Endeavour. STS-123 was the 1J/A ISS assembly mission. The original launch target date was 14 February 2008 but after the delay of STS-122, the shuttle was launched on 11 March 2008. It was the twenty-fifth shuttle mission to visit the ISS, and delivered the first module of the Japanese laboratory, Japanese Experiment Module (KibÅ), and the Canadian Special Purpose Dexterous Manipulator, (SPDM) Dextre robotics system to the station.",
                    name: "STS-123", type: "Human Exploration" )
      checkOrbit( orbit: spacecraftFlight.launch?.mission?.orbit, id: 8, name: "Low Earth Orbit", abbreviation: "LEO" )
      checkPad( pad: spacecraftFlight.launch?.pad, padID: 87, lat: "28.60822681", lon: "-80.60428186",
                mapImage: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_87_20200803143537.jpg",
                mapURL: "http://maps.google.com/maps?q=28.608+N,+80.604+W", name: "Launch Complex 39A", totalLaunchCount: 127,
                url: "https://ll.thespacedevs.com/2.2.0/pad/87/", wikiURL: "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39A" )
      checkLocation( location: spacecraftFlight.launch?.pad?.location, locationID: 27, countryCode: "USA",
                     mapImage: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
                     name: "Kennedy Space Center, FL, USA", landingCount: 0, lauchCount: 184, url: "https://ll.thespacedevs.com/2.2.0/location/27/" )
      XCTAssertNotNil( spacecraftFlight.launch?.programs )
      XCTAssertEqual( spacecraftFlight.launch?.programs.count, 0 )
   }
}

let json: String =
#"""
{
   "id": 186,
   "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/186/",
   "destination": "International Space Station",
   "mission_end": "2008-03-27T00:40:00Z",
   "spacecraft":
   {
      "id": 40,
      "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/40/",
      "name": "Space Shuttle Endeavour",
      "serial_number": "OV-105",
      "status":
      {
         "id": 2,
         "name": "Retired"
      },
      "description": "Space Shuttle Endeavour (Orbiter Vehicle Designation: OV-105) is a retired orbiter from NASA's Space Shuttle program and the fifth and final operational shuttle built. It embarked on its first mission, STS-49, in May 1992 and its 25th and final mission, STS-134, in May 2011. STS-134 was expected to be the final mission of the Space Shuttle program, but with the authorization of STS-135, Atlantis became the last shuttle to fly.  The United States Congress approved the construction of Endeavour in 1987 to replace Challenger, which was lost in 1986.  Structural spares built during the construction of Discovery and Atlantis were used in its assembly. NASA chose, on cost grounds, to build Endeavour from spares rather than refitting Enterprise.",
      "spacecraft_config":
      {
         "id": 14,
         "url": "https://ll.thespacedevs.com/2.2.0/config/spacecraft/14/",
         "name": "Space Shuttle",
         "type":
         {
            "id": 1,
            "name": "Unknown"
         },
         "agency":
         {
            "id": 44,
            "url": "https://ll.thespacedevs.com/2.2.0/agencies/44/",
            "name": "National Aeronautics and Space Administration",
            "type": "Government"
         },
         "in_use": false,
         "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/space2520shuttle_image_20190207032524.jpeg"
      }
   },
   "launch":
   {
      "id": "e1664280-6e39-4de8-8875-e4d3ca72338b",
      "url": "https://ll.thespacedevs.com/2.2.0/launch/e1664280-6e39-4de8-8875-e4d3ca72338b/",
      "slug": "space-shuttle-endeavour-ov-105-sts-123",
      "name": "Space Shuttle Endeavour / OV-105 | STS-123",
      "status":
      {
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
      "launch_service_provider":
      {
         "id": 191,
         "url": "https://ll.thespacedevs.com/2.2.0/agencies/191/",
         "name": "United Space Alliance",
         "type": "Commercial"
      },
      "rocket":
      {
         "id": 1389,
         "configuration":
         {
            "id": 41,
            "url": "https://ll.thespacedevs.com/2.2.0/config/launcher/41/",
            "name": "Space Shuttle Endeavour OV-105",
            "family": "Space Shuttle",
            "full_name": "Space Shuttle Endeavour OV-105",
            "variant": "OV-105"
         }
      },
      "mission":
      {
         "id": 127,
         "name": "STS-123",
         "description": "STS-123 was a Space Shuttle mission to the International Space Station (ISS) which was flown by Space Shuttle Endeavour. STS-123 was the 1J/A ISS assembly mission. The original launch target date was 14 February 2008 but after the delay of STS-122, the shuttle was launched on 11 March 2008. It was the twenty-fifth shuttle mission to visit the ISS, and delivered the first module of the Japanese laboratory, Japanese Experiment Module (KibÅ), and the Canadian Special Purpose Dexterous Manipulator, (SPDM) Dextre robotics system to the station.",
         "launch_designator": null,
         "type": "Human Exploration",
         "orbit":
         {
            "id": 8,
            "name": "Low Earth Orbit",
            "abbrev": "LEO"
         }
      },
      "pad":
      {
         "id": 87,
         "url": "https://ll.thespacedevs.com/2.2.0/pad/87/",
         "agency_id": null,
         "name": "Launch Complex 39A",
         "info_url": null,
         "wiki_url": "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39A",
         "map_url": "http://maps.google.com/maps?q=28.608+N,+80.604+W",
         "latitude": "28.60822681",
         "longitude": "-80.60428186",
         "location":
         {
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
}
"""#
