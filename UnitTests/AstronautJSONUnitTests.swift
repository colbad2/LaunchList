// Copyright © 2021 Bradford Holcombe. All rights reserved.

import XCTest

// swiftlint:disable line_length
// swiftlint:disable file_length
// s wiftlint:disable type_body_length
// swiftlint:disable function_body_length

class AstronautJSONUnitTests: XCTestCase
{
   func testAstronaut545() throws
   {
      let json: JSONStructure? = parseJSON( jsonString: json545 )
      guard let astronaut: AstronautJSON = AstronautJSON( json ) else { XCTFail( "can't load test data" ); return }

      checkAstronaut( astronaut: astronaut, id: 545, url: "https://ll.thespacedevs.com/2.2.0/astronaut/545/", name: "Robert L. Behnken",
                      statusID: 1, statusName: "Active", typeID: 2, typeName: "Government", dateOfBirth: "1970-07-28",
                      nationality: "American", twitter: "https://twitter.com/AstroBehnken",
                      bio: "Robert Louis \"Bob\" Behnken is a United States Air Force officer, NASA astronaut and former Chief of the Astronaut Office. Behnken holds a Ph.D in Mechanical Engineering and holds the rank of Colonel in the U.S. Air Force. Col. Behnken has logged over 1,000 flight hours in 25 different aircraft. He flew aboard Space Shuttle missions STS-123 and STS-130 as a Mission Specialist, accumulating over 378 hours in space, including 19 hours of spacewalk time. Behnken was also assigned as Mission Specialist 1 to the STS-400 rescue mission. He is married to fellow astronaut K. Megan McArthur.",
                      profileImage: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/astronaut_images/robert_l._behnk_image_20200421075919.jpeg",
                      profileImageThumbnail: "https://ll.thespacedevs.com/2.2.0/astronaut/545/cache/ed/fa/edfadc07445e2440e82a6af36807f3e0.jpg",
                      wiki: "https://en.wikipedia.org/wiki/Robert_L._Behnken", lastFlight: "2020-05-30T19:22:45Z", firstFlight: "2008-03-11T06:28:14Z" )

      checkAgency( agency: astronaut.agency, agencyID: 44, name: "National Aeronautics and Space Administration",
                   type: "Government", url: "https://ll.thespacedevs.com/2.2.0/agencies/44/" )

      let flights: [LaunchJSON] = astronaut.flights
      XCTAssertEqual( flights.count, 3 )

      let launch: LaunchJSON = flights[ 0 ]
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

      XCTAssertNotNil( astronaut.landings )
      XCTAssertEqual( astronaut.landings.count, 3 )
      let spacecraftFlight: SpacecraftFlightJSON = astronaut.landings[ 0 ]
      checkSpacecraftFlight( spacecraftFlight: spacecraftFlight, id: 186, url: "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/186/",
                             destination: "International Space Station", missionEnd: "2008-03-27T00:40:00Z" )
      checkSpacecraft( spacecraft: spacecraftFlight.spacecraft, id: 40, url: "https://ll.thespacedevs.com/2.2.0/spacecraft/40/", name: "Space Shuttle Endeavour", serialNumber: "OV-105",
                       description: "Space Shuttle Endeavour (Orbiter Vehicle Designation: OV-105) is a retired orbiter from NASA's Space Shuttle program and the fifth and final operational shuttle built. It embarked on its first mission, STS-49, in May 1992 and its 25th and final mission, STS-134, in May 2011. STS-134 was expected to be the final mission of the Space Shuttle program, but with the authorization of STS-135, Atlantis became the last shuttle to fly.  The United States Congress approved the construction of Endeavour in 1987 to replace Challenger, which was lost in 1986.  Structural spares built during the construction of Discovery and Atlantis were used in its assembly. NASA chose, on cost grounds, to build Endeavour from spares rather than refitting Enterprise." )
      checkIDName( json: spacecraftFlight.spacecraft?.status, id: 2, name: "Retired" )
      checkSpacecraftConfig( spacecraft: spacecraftFlight.spacecraft?.spacecraftConfig, spacecraftID: 14, url: "https://ll.thespacedevs.com/2.2.0/config/spacecraft/14/",
                             name: "Space Shuttle", type: "Unknown", inUse: false,
                             imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/space2520shuttle_image_20190207032524.jpeg" )
      checkAgency( agency: spacecraftFlight.spacecraft?.spacecraftConfig?.agency, agencyID: 44, name: "National Aeronautics and Space Administration", type: "Government",
                   url: "https://ll.thespacedevs.com/2.2.0/agencies/44/" )
      checkLaunch( launch: spacecraftFlight.launch, launchID: "e1664280-6e39-4de8-8875-e4d3ca72338b",
                   image: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/space2520shuttle2520endeavour2520ov-101_image_20190222030547.jpeg",
                   name: "Space Shuttle Endeavour / OV-105 | STS-123", net: "2008-03-11T06:28:14Z",
                   slug: "space-shuttle-endeavour-ov-105-sts-123",
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

let json545: String =
#"""
{
  "id": 545,
  "url": "https://ll.thespacedevs.com/2.2.0/astronaut/545/",
  "name": "Robert L. Behnken",
  "status": {
    "id": 1,
    "name": "Active"
  },
  "type": {
    "id": 2,
    "name": "Government"
  },
  "agency": {
    "id": 44,
    "url": "https://ll.thespacedevs.com/2.2.0/agencies/44/",
    "name": "National Aeronautics and Space Administration",
    "type": "Government"
  },
  "date_of_birth": "1970-07-28",
  "date_of_death": null,
  "nationality": "American",
  "twitter": "https://twitter.com/AstroBehnken",
  "instagram": null,
  "bio": "Robert Louis \"Bob\" Behnken is a United States Air Force officer, NASA astronaut and former Chief of the Astronaut Office. Behnken holds a Ph.D in Mechanical Engineering and holds the rank of Colonel in the U.S. Air Force. Col. Behnken has logged over 1,000 flight hours in 25 different aircraft. He flew aboard Space Shuttle missions STS-123 and STS-130 as a Mission Specialist, accumulating over 378 hours in space, including 19 hours of spacewalk time. Behnken was also assigned as Mission Specialist 1 to the STS-400 rescue mission. He is married to fellow astronaut K. Megan McArthur.",
  "profile_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/astronaut_images/robert_l._behnk_image_20200421075919.jpeg",
  "profile_image_thumbnail": "https://ll.thespacedevs.com/2.2.0/astronaut/545/cache/ed/fa/edfadc07445e2440e82a6af36807f3e0.jpg",
  "wiki": "https://en.wikipedia.org/wiki/Robert_L._Behnken",
  "flights": [
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
    },
    {
      "id": "80db2215-04bd-4d16-b998-311fb73db4fe",
      "url": "https://ll.thespacedevs.com/2.2.0/launch/80db2215-04bd-4d16-b998-311fb73db4fe/",
      "slug": "space-shuttle-endeavour-ov-105-sts-130",
      "name": "Space Shuttle Endeavour / OV-105 | STS-130",
      "status": {
        "id": 3,
        "name": "Launch Successful",
        "abbrev": "Success",
        "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
      },
      "last_updated": "2021-02-07T21:10:26Z",
      "net": "2010-02-08T09:14:00Z",
      "window_end": "2010-02-08T09:14:00Z",
      "window_start": "2010-02-08T09:14:00Z",
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
        "id": 1441,
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
        "id": 340,
        "name": "STS-130",
        "description": "STS-130 was an ISS assembly flight with the primary payloads being the Tranquility module and the Cupola observatory. The mission began on February 8th 2010 at 09:14 UTC launching Commander George D. Zamka, Pilot Terry Virts, Mission Specialist 1 Kathryn P. Hire, Mission Specialist 2 Stephen K. Robinson, Mission Specialist 3 Nicholas Patrick & Mission Specialist 4 Robert L. Behnken to orbit. They docked with the ISS 2 days after launch. During the mission 3 spacewalks were conducted to install the Tranquility module. On day 6, the wake-up song played to the ISS crew was \"The Ballad of Serenity\" by Sonny Rhodes, the theme for science fiction show Firefly, and was played for Robert Behnken. The mission concluded after 13 days & 18 hours on February 22nd 2010 at 03:22:10 UTC.",
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
    },
    {
      "id": "e71d3b58-dede-43f3-ac73-cc2de9a307ad",
      "url": "https://ll.thespacedevs.com/2.2.0/launch/e71d3b58-dede-43f3-ac73-cc2de9a307ad/",
      "slug": "falcon-9-block-5-spx-dm2-demonstration-mission-2",
      "name": "Falcon 9 Block 5 | SpX-DM2 (Demonstration Mission 2)",
      "status": {
        "id": 3,
        "name": "Launch Successful",
        "abbrev": "Success",
        "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
      },
      "last_updated": "2020-11-28T18:25:15Z",
      "net": "2020-05-30T19:22:45Z",
      "window_end": "2020-05-30T19:22:45Z",
      "window_start": "2020-05-30T19:22:45Z",
      "probability": 70,
      "holdreason": "",
      "failreason": "",
      "hashtag": "#LaunchAmerica",
      "launch_service_provider": {
        "id": 121,
        "url": "https://ll.thespacedevs.com/2.2.0/agencies/121/",
        "name": "SpaceX",
        "type": "Commercial"
      },
      "rocket": {
        "id": 96,
        "configuration": {
          "id": 164,
          "url": "https://ll.thespacedevs.com/2.2.0/config/launcher/164/",
          "name": "Falcon 9 Block 5",
          "family": "Falcon",
          "full_name": "Falcon 9 Block 5",
          "variant": "Block 5"
        }
      },
      "mission": {
        "id": 1051,
        "name": "SpX-DM2 (Demonstration Mission 2)",
        "description": "A new era of human spaceflight is set to begin as American astronauts once again launch on an American rocket from American soil. The Demo-2 mission is the second test flight of Crew Dragon, and the first flight with crew onboard. It will carry NASA astronauts Robert Behnken and Douglas Hurley to the International Space Station for an extended stay (the specific mission duration will be determined once on station based on the readiness of the next commercial crew launch). They will perform tests on Crew Dragon in addition to conducting research and other tasks with the space station crew. \n\nAs the final flight test for SpaceX, this mission will validate the company’s crew transportation system, including the launch pad, rocket, spacecraft, and operational capabilities. This also will be the first time NASA astronauts will test the spacecraft systems in orbit. The Demo-2 mission will be the final major step before NASA’s Commercial Crew Program certifies Crew Dragon for operational, long-duration missions to the space station.\n\nCurrent Mission Status:\nAfter a successful ride to orbit and stay at the International Space Station, the Dragon Spacecraft successfully made its way back to Earth. Capsule successfully landed in the Gulf of Mexico waters on 3rd August 2020 at 18:48 UTC.",
        "launch_designator": null,
        "type": "Test Flight",
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
      "webcast_live": true,
      "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/falcon2520925_image_20200806041959.jpeg",
      "infographic": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/falcon2520925_infographic_20200417201403.png",
      "program": [
        {
          "id": 5,
          "url": "https://ll.thespacedevs.com/2.2.0/program/5/",
          "name": "Commercial Crew Program",
          "description": "The Commercial Crew Program (CCP) is a human spaceflight program operated by NASA, in association with American aerospace manufacturers Boeing and SpaceX. The program conducts rotations between the expeditions of the International Space Station program, transporting crews to and from the International Space Station (ISS) aboard Boeing Starliner and SpaceX Crew Dragon capsules, in the first crewed orbital spaceflights operated by private companies.",
          "agencies": [
            {
              "id": 80,
              "url": "https://ll.thespacedevs.com/2.2.0/agencies/80/",
              "name": "Boeing",
              "type": "Commercial"
            },
            {
              "id": 44,
              "url": "https://ll.thespacedevs.com/2.2.0/agencies/44/",
              "name": "National Aeronautics and Space Administration",
              "type": "Government"
            },
            {
              "id": 121,
              "url": "https://ll.thespacedevs.com/2.2.0/agencies/121/",
              "name": "SpaceX",
              "type": "Commercial"
            }
          ],
          "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/program_images/commercial2520_program_20200820201209.png",
          "start_date": "2011-04-18T00:00:00Z",
          "end_date": null,
          "info_url": "https://www.nasa.gov/exploration/commercial/crew/index.html",
          "wiki_url": "https://en.wikipedia.org/wiki/Commercial_Crew_Program"
        }
      ]
    }
  ],
  "landings": [
    {
      "id": 186,
      "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/186/",
      "destination": "International Space Station",
      "mission_end": "2008-03-27T00:40:00Z",
      "spacecraft": {
        "id": 40,
        "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/40/",
        "name": "Space Shuttle Endeavour",
        "serial_number": "OV-105",
        "status": {
          "id": 2,
          "name": "Retired"
        },
        "description": "Space Shuttle Endeavour (Orbiter Vehicle Designation: OV-105) is a retired orbiter from NASA's Space Shuttle program and the fifth and final operational shuttle built. It embarked on its first mission, STS-49, in May 1992 and its 25th and final mission, STS-134, in May 2011. STS-134 was expected to be the final mission of the Space Shuttle program, but with the authorization of STS-135, Atlantis became the last shuttle to fly.  The United States Congress approved the construction of Endeavour in 1987 to replace Challenger, which was lost in 1986.  Structural spares built during the construction of Discovery and Atlantis were used in its assembly. NASA chose, on cost grounds, to build Endeavour from spares rather than refitting Enterprise.",
        "spacecraft_config": {
          "id": 14,
          "url": "https://ll.thespacedevs.com/2.2.0/config/spacecraft/14/",
          "name": "Space Shuttle",
          "type": {
            "id": 1,
            "name": "Unknown"
          },
          "agency": {
            "id": 44,
            "url": "https://ll.thespacedevs.com/2.2.0/agencies/44/",
            "name": "National Aeronautics and Space Administration",
            "type": "Government"
          },
          "in_use": false,
          "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/space2520shuttle_image_20190207032524.jpeg"
        }
      },
      "launch": {
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
    },
    {
      "id": 194,
      "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/194/",
      "destination": "International Space Station",
      "mission_end": "2010-02-22T03:22:00Z",
      "spacecraft": {
        "id": 40,
        "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/40/",
        "name": "Space Shuttle Endeavour",
        "serial_number": "OV-105",
        "status": {
          "id": 2,
          "name": "Retired"
        },
        "description": "Space Shuttle Endeavour (Orbiter Vehicle Designation: OV-105) is a retired orbiter from NASA's Space Shuttle program and the fifth and final operational shuttle built. It embarked on its first mission, STS-49, in May 1992 and its 25th and final mission, STS-134, in May 2011. STS-134 was expected to be the final mission of the Space Shuttle program, but with the authorization of STS-135, Atlantis became the last shuttle to fly.  The United States Congress approved the construction of Endeavour in 1987 to replace Challenger, which was lost in 1986.  Structural spares built during the construction of Discovery and Atlantis were used in its assembly. NASA chose, on cost grounds, to build Endeavour from spares rather than refitting Enterprise.",
        "spacecraft_config": {
          "id": 14,
          "url": "https://ll.thespacedevs.com/2.2.0/config/spacecraft/14/",
          "name": "Space Shuttle",
          "type": {
            "id": 1,
            "name": "Unknown"
          },
          "agency": {
            "id": 44,
            "url": "https://ll.thespacedevs.com/2.2.0/agencies/44/",
            "name": "National Aeronautics and Space Administration",
            "type": "Government"
          },
          "in_use": false,
          "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/space2520shuttle_image_20190207032524.jpeg"
        }
      },
      "launch": {
        "id": "80db2215-04bd-4d16-b998-311fb73db4fe",
        "url": "https://ll.thespacedevs.com/2.2.0/launch/80db2215-04bd-4d16-b998-311fb73db4fe/",
        "slug": "space-shuttle-endeavour-ov-105-sts-130",
        "name": "Space Shuttle Endeavour / OV-105 | STS-130",
        "status": {
          "id": 3,
          "name": "Launch Successful",
          "abbrev": "Success",
          "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
        },
        "last_updated": "2021-02-07T21:10:26Z",
        "net": "2010-02-08T09:14:00Z",
        "window_end": "2010-02-08T09:14:00Z",
        "window_start": "2010-02-08T09:14:00Z",
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
          "id": 1441,
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
          "id": 340,
          "name": "STS-130",
          "description": "STS-130 was an ISS assembly flight with the primary payloads being the Tranquility module and the Cupola observatory. The mission began on February 8th 2010 at 09:14 UTC launching Commander George D. Zamka, Pilot Terry Virts, Mission Specialist 1 Kathryn P. Hire, Mission Specialist 2 Stephen K. Robinson, Mission Specialist 3 Nicholas Patrick & Mission Specialist 4 Robert L. Behnken to orbit. They docked with the ISS 2 days after launch. During the mission 3 spacewalks were conducted to install the Tranquility module. On day 6, the wake-up song played to the ISS crew was \"The Ballad of Serenity\" by Sonny Rhodes, the theme for science fiction show Firefly, and was played for Robert Behnken. The mission concluded after 13 days & 18 hours on February 22nd 2010 at 03:22:10 UTC.",
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
    },
    {
      "id": 415,
      "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/415/",
      "destination": "International Space Station",
      "mission_end": "2020-08-02T18:48:00Z",
      "spacecraft": {
        "id": 289,
        "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/289/",
        "name": "Crew Dragon Endeavour",
        "serial_number": "C206",
        "status": {
          "id": 1,
          "name": "Active"
        },
        "description": "Crew Dragon 6 is the Crew Dragon spacecraft launched on the SpaceX DM-2 demonstration mission to the ISS.",
        "spacecraft_config": {
          "id": 6,
          "url": "https://ll.thespacedevs.com/2.2.0/config/spacecraft/6/",
          "name": "Crew Dragon 2",
          "type": {
            "id": 1,
            "name": "Unknown"
          },
          "agency": {
            "id": 121,
            "url": "https://ll.thespacedevs.com/2.2.0/agencies/121/",
            "name": "SpaceX",
            "type": "Commercial"
          },
          "in_use": true,
          "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/crew2520dragon25202_image_20200117151409.jpeg"
        }
      },
      "launch": {
        "id": "e71d3b58-dede-43f3-ac73-cc2de9a307ad",
        "url": "https://ll.thespacedevs.com/2.2.0/launch/e71d3b58-dede-43f3-ac73-cc2de9a307ad/",
        "slug": "falcon-9-block-5-spx-dm2-demonstration-mission-2",
        "name": "Falcon 9 Block 5 | SpX-DM2 (Demonstration Mission 2)",
        "status": {
          "id": 3,
          "name": "Launch Successful",
          "abbrev": "Success",
          "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
        },
        "last_updated": "2020-11-28T18:25:15Z",
        "net": "2020-05-30T19:22:45Z",
        "window_end": "2020-05-30T19:22:45Z",
        "window_start": "2020-05-30T19:22:45Z",
        "probability": 70,
        "holdreason": "",
        "failreason": "",
        "hashtag": "#LaunchAmerica",
        "launch_service_provider": {
          "id": 121,
          "url": "https://ll.thespacedevs.com/2.2.0/agencies/121/",
          "name": "SpaceX",
          "type": "Commercial"
        },
        "rocket": {
          "id": 96,
          "configuration": {
            "id": 164,
            "url": "https://ll.thespacedevs.com/2.2.0/config/launcher/164/",
            "name": "Falcon 9 Block 5",
            "family": "Falcon",
            "full_name": "Falcon 9 Block 5",
            "variant": "Block 5"
          }
        },
        "mission": {
          "id": 1051,
          "name": "SpX-DM2 (Demonstration Mission 2)",
          "description": "A new era of human spaceflight is set to begin as American astronauts once again launch on an American rocket from American soil. The Demo-2 mission is the second test flight of Crew Dragon, and the first flight with crew onboard. It will carry NASA astronauts Robert Behnken and Douglas Hurley to the International Space Station for an extended stay (the specific mission duration will be determined once on station based on the readiness of the next commercial crew launch). They will perform tests on Crew Dragon in addition to conducting research and other tasks with the space station crew. \n\nAs the final flight test for SpaceX, this mission will validate the company’s crew transportation system, including the launch pad, rocket, spacecraft, and operational capabilities. This also will be the first time NASA astronauts will test the spacecraft systems in orbit. The Demo-2 mission will be the final major step before NASA’s Commercial Crew Program certifies Crew Dragon for operational, long-duration missions to the space station.\n\nCurrent Mission Status:\nAfter a successful ride to orbit and stay at the International Space Station, the Dragon Spacecraft successfully made its way back to Earth. Capsule successfully landed in the Gulf of Mexico waters on 3rd August 2020 at 18:48 UTC.",
          "launch_designator": null,
          "type": "Test Flight",
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
        "webcast_live": true,
        "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/falcon2520925_image_20200806041959.jpeg",
        "infographic": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/falcon2520925_infographic_20200417201403.png",
        "program": [
          {
            "id": 5,
            "url": "https://ll.thespacedevs.com/2.2.0/program/5/",
            "name": "Commercial Crew Program",
            "description": "The Commercial Crew Program (CCP) is a human spaceflight program operated by NASA, in association with American aerospace manufacturers Boeing and SpaceX. The program conducts rotations between the expeditions of the International Space Station program, transporting crews to and from the International Space Station (ISS) aboard Boeing Starliner and SpaceX Crew Dragon capsules, in the first crewed orbital spaceflights operated by private companies.",
            "agencies": [
              {
                "id": 80,
                "url": "https://ll.thespacedevs.com/2.2.0/agencies/80/",
                "name": "Boeing",
                "type": "Commercial"
              },
              {
                "id": 44,
                "url": "https://ll.thespacedevs.com/2.2.0/agencies/44/",
                "name": "National Aeronautics and Space Administration",
                "type": "Government"
              },
              {
                "id": 121,
                "url": "https://ll.thespacedevs.com/2.2.0/agencies/121/",
                "name": "SpaceX",
                "type": "Commercial"
              }
            ],
            "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/program_images/commercial2520_program_20200820201209.png",
            "start_date": "2011-04-18T00:00:00Z",
            "end_date": null,
            "info_url": "https://www.nasa.gov/exploration/commercial/crew/index.html",
            "wiki_url": "https://en.wikipedia.org/wiki/Commercial_Crew_Program"
          }
        ]
      }
    }
  ],
  "last_flight": "2020-05-30T19:22:45Z",
  "first_flight": "2008-03-11T06:28:14Z"
}
"""#
