// Copyright © 2021 Bradford Holcombe. All rights reserved.

import XCTest

// swiftlint:disable line_length
// swiftlint:disable file_length
// s wiftlint:disable comment_spacing
// s wiftlint:disable type_body_length
// s wiftlint:disable function_body_length

// found 1 bug
class SpacecraftJSONUnitTests: XCTestCase
{
   func testExample() throws
   {
      guard let spacecraft: SpacecraftJSON = SpacecraftJSON( parseJSON( jsonString: spacecraft40JSON ) ) else { XCTFail( "can't load test data" ); return }

      checkSpacecraft( spacecraft: spacecraft, id: 40, url: "https://ll.thespacedevs.com/2.2.0/spacecraft/40/", name: "Space Shuttle Endeavour", serialNumber: "OV-105",
                       description: "Space Shuttle Endeavour (Orbiter Vehicle Designation: OV-105) is a retired orbiter from NASA's Space Shuttle program and the fifth and final operational shuttle built. It embarked on its first mission, STS-49, in May 1992 and its 25th and final mission, STS-134, in May 2011. STS-134 was expected to be the final mission of the Space Shuttle program, but with the authorization of STS-135, Atlantis became the last shuttle to fly.  The United States Congress approved the construction of Endeavour in 1987 to replace Challenger, which was lost in 1986.  Structural spares built during the construction of Discovery and Atlantis were used in its assembly. NASA chose, on cost grounds, to build Endeavour from spares rather than refitting Enterprise." )
      checkIDName( json: spacecraft.status, id: 2, name: "Retired" )
      checkSpacecraftConfig( spacecraft: spacecraft.spacecraftConfig, spacecraftID: 14, url: "https://ll.thespacedevs.com/2.2.0/config/spacecraft/14/",
                             name: "Space Shuttle", type: "Unknown", inUse: false,
                             capability: "Carrying a crew of 7 astronauts along with cargo to Low Earth Orbit.",
                             history: "The Space shuttle was a United States space craft. Following the conclusion of the Apollo program the Space Shuttle intended to lower costs for reliable access to Low Earth Orbit. The program ran from 1981-2011.",
                             details: "The Space Shuttle was a partially reusable LEO spacecraft system operated by the U.S. National Aeronautics and Space Administration (NASA) as part of the Space Shuttle program. Its official program name was Space Transportation System (STS), taken from a 1969 plan for a system of reusable spacecraft of which it was the only item funded for development. The first of four orbital test flights occurred in 1981, leading to operational flights in 1982. In addition to the prototype whose completion was cancelled, five complete Shuttle systems were built and used on a total of 135 missions from 1981 to 2011, launched from the Kennedy Space Center (KSC) in Florida. Operational missions launched numerous satellites, interplanetary probes, and the Hubble Space Telescope (HST); conducted science experiments in orbit; and participated in construction and servicing of the International Space Station. The Shuttle fleet's total mission time was 1322 days, 19 hours, 21 minutes and 23 seconds.",
                             maidenFlight: "1981-04-12",
                             height: 56.1, diameter: 8.7, humanRated: true, crewCapacity: 7,
                             payloadCapacity: 27500, flightLife: "14 days",
                             imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/space2520shuttle_image_20190207032524.jpeg",
                             nationURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_nation/space2520shuttle_image_20181207003107.png",
                             wikiURL: "https://en.wikipedia.org/wiki/Space_Shuttle" )
      checkAgency( agency: spacecraft.spacecraftConfig?.agency, agencyID: 44, name: "National Aeronautics and Space Administration",
                   featured: true, type: "Government",
                   url: "https://ll.thespacedevs.com/2.2.0/agencies/44/",
                   countryCode: "USA", abbreviation: "NASA",
                   agencyDescription: "The National Aeronautics and Space Administration is an independent agency of the executive branch of the United States federal government responsible for the civilian space program, as well as aeronautics and aerospace research. NASA have many launch facilities but most are inactive. The most commonly used pad will be LC-39B at Kennedy Space Center in Florida.",
                   administrator: "Administrator: Jim Bridenstine", foundingYear: "1958", launchers: "Space Shuttle | SLS",
                   spacecraft: "Orion",
                   imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_images/national2520aeronautics2520and2520space2520administration_image_20190207032448.jpeg" )

      XCTAssertNotNil( spacecraft.flights )
      XCTAssertEqual( spacecraft.flights.count, 25 )
   }
}

let spacecraft40JSON: String =
#"""
{
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
      "featured": true,
      "type": "Government",
      "country_code": "USA",
      "abbrev": "NASA",
      "description": "The National Aeronautics and Space Administration is an independent agency of the executive branch of the United States federal government responsible for the civilian space program, as well as aeronautics and aerospace research. NASA have many launch facilities but most are inactive. The most commonly used pad will be LC-39B at Kennedy Space Center in Florida.",
      "administrator": "Administrator: Jim Bridenstine",
      "founding_year": "1958",
      "launchers": "Space Shuttle | SLS",
      "spacecraft": "Orion",
      "parent": null,
      "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_images/national2520aeronautics2520and2520space2520administration_image_20190207032448.jpeg"
    },
    "in_use": false,
    "capability": "Carrying a crew of 7 astronauts along with cargo to Low Earth Orbit.",
    "history": "The Space shuttle was a United States space craft. Following the conclusion of the Apollo program the Space Shuttle intended to lower costs for reliable access to Low Earth Orbit. The program ran from 1981-2011.",
    "details": "The Space Shuttle was a partially reusable LEO spacecraft system operated by the U.S. National Aeronautics and Space Administration (NASA) as part of the Space Shuttle program. Its official program name was Space Transportation System (STS), taken from a 1969 plan for a system of reusable spacecraft of which it was the only item funded for development. The first of four orbital test flights occurred in 1981, leading to operational flights in 1982. In addition to the prototype whose completion was cancelled, five complete Shuttle systems were built and used on a total of 135 missions from 1981 to 2011, launched from the Kennedy Space Center (KSC) in Florida. Operational missions launched numerous satellites, interplanetary probes, and the Hubble Space Telescope (HST); conducted science experiments in orbit; and participated in construction and servicing of the International Space Station. The Shuttle fleet's total mission time was 1322 days, 19 hours, 21 minutes and 23 seconds.",
    "maiden_flight": "1981-04-12",
    "height": 56.1,
    "diameter": 8.7,
    "human_rated": true,
    "crew_capacity": 7,
    "payload_capacity": 27500,
    "flight_life": "14 days",
    "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/space2520shuttle_image_20190207032524.jpeg",
    "nation_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_nation/space2520shuttle_image_20181207003107.png",
    "wiki_link": "https://en.wikipedia.org/wiki/Space_Shuttle",
    "info_link": ""
  },
  "flights": [
    {
      "id": 90,
      "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/90/",
      "destination": "Low Earth Orbit",
      "mission_end": "1992-05-16T22:57:00Z",
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
        "id": "446fccee-ef15-4c8e-9328-0af652a08aaf",
        "url": "https://ll.thespacedevs.com/2.2.0/launch/446fccee-ef15-4c8e-9328-0af652a08aaf/",
        "slug": "space-shuttle-endeavour-ov-105-sts-49",
        "name": "Space Shuttle Endeavour / OV-105 | STS-49",
        "status": {
          "id": 3,
          "name": "Launch Successful",
          "abbrev": "Success",
          "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
        },
        "last_updated": "2021-02-07T21:06:57Z",
        "net": "1992-05-07T23:40:00Z",
        "window_end": "1992-05-07T23:40:00Z",
        "window_start": "1992-05-07T23:40:00Z",
        "probability": -1,
        "holdreason": "",
        "failreason": "",
        "hashtag": null,
        "launch_service_provider": {
          "id": 192,
          "url": "https://ll.thespacedevs.com/2.2.0/agencies/192/",
          "name": "Lockheed Space Operations Company",
          "type": "Commercial"
        },
        "rocket": {
          "id": 353,
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
          "id": 727,
          "name": "STS-49",
          "description": "STS-49 was the maiden flight of the Space Shuttle Endeavour. The primary goal of its nine-day mission was to retrieve an Intelsat VI satellite (Intelsat 603, which failed to leave low earth orbit two years before), attach it to a new upper stage, and relaunch it to its intended geosynchronous orbit. After several attempts, the capture was completed with a three-person extra-vehicular activity (EVA).",
          "launch_designator": null,
          "type": "Communications",
          "orbit": {
            "id": 8,
            "name": "Low Earth Orbit",
            "abbrev": "LEO"
          }
        },
        "pad": {
          "id": 4,
          "url": "https://ll.thespacedevs.com/2.2.0/pad/4/",
          "agency_id": 44,
          "name": "Launch Complex 39B",
          "info_url": null,
          "wiki_url": "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39B",
          "map_url": "http://maps.google.com/maps?q=28.627+N,+80.621+W",
          "latitude": "28.62711233",
          "longitude": "-80.62101503",
          "location": {
            "id": 27,
            "url": "https://ll.thespacedevs.com/2.2.0/location/27/",
            "name": "Kennedy Space Center, FL, USA",
            "country_code": "USA",
            "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
            "total_launch_count": 184,
            "total_landing_count": 0
          },
          "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_4_20200803143518.jpg",
          "total_launch_count": 57
        },
        "webcast_live": false,
        "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/space2520shuttle2520endeavour2520ov-101_image_20190222030547.jpeg",
        "infographic": null,
        "program": []
      }
    },
    {
      "id": 93,
      "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/93/",
      "destination": "Low Earth Orbit",
      "mission_end": "1992-09-20T12:53:00Z",
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
        "id": "b0417d8a-0968-46eb-9963-d3bc4d19c4ad",
        "url": "https://ll.thespacedevs.com/2.2.0/launch/b0417d8a-0968-46eb-9963-d3bc4d19c4ad/",
        "slug": "space-shuttle-endeavour-ov-105-sts-47",
        "name": "Space Shuttle Endeavour / OV-105 | STS-47",
        "status": {
          "id": 3,
          "name": "Launch Successful",
          "abbrev": "Success",
          "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
        },
        "last_updated": "2021-02-07T21:07:01Z",
        "net": "1992-09-12T14:23:00Z",
        "window_end": "1992-09-12T14:23:00Z",
        "window_start": "1992-09-12T14:23:00Z",
        "probability": -1,
        "holdreason": "",
        "failreason": "",
        "hashtag": null,
        "launch_service_provider": {
          "id": 192,
          "url": "https://ll.thespacedevs.com/2.2.0/agencies/192/",
          "name": "Lockheed Space Operations Company",
          "type": "Commercial"
        },
        "rocket": {
          "id": 357,
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
          "id": 730,
          "name": "STS-47",
          "description": "STS-47 was the 50th Space Shuttle mission of the program, as well as the second mission of Space Shuttle Endeavour. The mission mainly involved conducting experiments in life and material sciences.",
          "launch_designator": null,
          "type": "",
          "orbit": {
            "id": 8,
            "name": "Low Earth Orbit",
            "abbrev": "LEO"
          }
        },
        "pad": {
          "id": 4,
          "url": "https://ll.thespacedevs.com/2.2.0/pad/4/",
          "agency_id": 44,
          "name": "Launch Complex 39B",
          "info_url": null,
          "wiki_url": "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39B",
          "map_url": "http://maps.google.com/maps?q=28.627+N,+80.621+W",
          "latitude": "28.62711233",
          "longitude": "-80.62101503",
          "location": {
            "id": 27,
            "url": "https://ll.thespacedevs.com/2.2.0/location/27/",
            "name": "Kennedy Space Center, FL, USA",
            "country_code": "USA",
            "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
            "total_launch_count": 184,
            "total_landing_count": 0
          },
          "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_4_20200803143518.jpg",
          "total_launch_count": 57
        },
        "webcast_live": false,
        "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/space2520shuttle2520endeavour2520ov-101_image_20190222030547.jpeg",
        "infographic": null,
        "program": []
      }
    },
    {
      "id": 96,
      "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/96/",
      "destination": "Low Earth Orbit",
      "mission_end": "1993-01-19T13:37:00Z",
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
        "id": "bec79cea-e31f-4ec5-9036-4bbb7ee8e303",
        "url": "https://ll.thespacedevs.com/2.2.0/launch/bec79cea-e31f-4ec5-9036-4bbb7ee8e303/",
        "slug": "space-shuttle-endeavour-ov-105-sts-54",
        "name": "Space Shuttle Endeavour / OV-105 | STS-54",
        "status": {
          "id": 3,
          "name": "Launch Successful",
          "abbrev": "Success",
          "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
        },
        "last_updated": "2021-02-07T21:07:07Z",
        "net": "1993-01-13T13:59:30Z",
        "window_end": "1993-01-13T13:59:30Z",
        "window_start": "1993-01-13T13:59:30Z",
        "probability": -1,
        "holdreason": "",
        "failreason": "",
        "hashtag": null,
        "launch_service_provider": {
          "id": 192,
          "url": "https://ll.thespacedevs.com/2.2.0/agencies/192/",
          "name": "Lockheed Space Operations Company",
          "type": "Commercial"
        },
        "rocket": {
          "id": 360,
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
          "id": 747,
          "name": "STS-54",
          "description": "STS-54 was a Space Transportation System (NASA Space Shuttle) mission using orbiter Endeavour. This was the third flight for Endeavour and was launched on 13 January 1993.",
          "launch_designator": null,
          "type": "Communications",
          "orbit": {
            "id": 8,
            "name": "Low Earth Orbit",
            "abbrev": "LEO"
          }
        },
        "pad": {
          "id": 4,
          "url": "https://ll.thespacedevs.com/2.2.0/pad/4/",
          "agency_id": 44,
          "name": "Launch Complex 39B",
          "info_url": null,
          "wiki_url": "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39B",
          "map_url": "http://maps.google.com/maps?q=28.627+N,+80.621+W",
          "latitude": "28.62711233",
          "longitude": "-80.62101503",
          "location": {
            "id": 27,
            "url": "https://ll.thespacedevs.com/2.2.0/location/27/",
            "name": "Kennedy Space Center, FL, USA",
            "country_code": "USA",
            "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
            "total_launch_count": 184,
            "total_landing_count": 0
          },
          "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_4_20200803143518.jpg",
          "total_launch_count": 57
        },
        "webcast_live": false,
        "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/space2520shuttle2520endeavour2520ov-101_image_20190222030547.jpeg",
        "infographic": null,
        "program": []
      }
    },
    {
      "id": 99,
      "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/99/",
      "destination": "Low Earth Orbit",
      "mission_end": "1993-07-01T13:07:00Z",
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
        "id": "21a8c666-b595-4472-9b1b-a7d76f9340f8",
        "url": "https://ll.thespacedevs.com/2.2.0/launch/21a8c666-b595-4472-9b1b-a7d76f9340f8/",
        "slug": "space-shuttle-endeavour-ov-105-sts-57",
        "name": "Space Shuttle Endeavour / OV-105 | STS-57",
        "status": {
          "id": 3,
          "name": "Launch Successful",
          "abbrev": "Success",
          "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
        },
        "last_updated": "2021-02-07T21:07:12Z",
        "net": "1993-06-21T13:07:00Z",
        "window_end": "1993-06-21T13:07:00Z",
        "window_start": "1993-06-21T13:07:00Z",
        "probability": -1,
        "holdreason": "",
        "failreason": "",
        "hashtag": null,
        "launch_service_provider": {
          "id": 192,
          "url": "https://ll.thespacedevs.com/2.2.0/agencies/192/",
          "name": "Lockheed Space Operations Company",
          "type": "Commercial"
        },
        "rocket": {
          "id": 366,
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
          "id": 751,
          "name": "STS-57",
          "description": "STS-57 was a Shuttle-Spacehab mission of Space Shuttle Endeavour that launched 21 June 1993 from Kennedy Space Center, Florida.",
          "launch_designator": null,
          "type": "",
          "orbit": {
            "id": 8,
            "name": "Low Earth Orbit",
            "abbrev": "LEO"
          }
        },
        "pad": {
          "id": 4,
          "url": "https://ll.thespacedevs.com/2.2.0/pad/4/",
          "agency_id": 44,
          "name": "Launch Complex 39B",
          "info_url": null,
          "wiki_url": "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39B",
          "map_url": "http://maps.google.com/maps?q=28.627+N,+80.621+W",
          "latitude": "28.62711233",
          "longitude": "-80.62101503",
          "location": {
            "id": 27,
            "url": "https://ll.thespacedevs.com/2.2.0/location/27/",
            "name": "Kennedy Space Center, FL, USA",
            "country_code": "USA",
            "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
            "total_launch_count": 184,
            "total_landing_count": 0
          },
          "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_4_20200803143518.jpg",
          "total_launch_count": 57
        },
        "webcast_live": false,
        "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/space2520shuttle2520endeavour2520ov-101_image_20190222030547.jpeg",
        "infographic": null,
        "program": []
      }
    },
    {
      "id": 104,
      "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/104/",
      "destination": "Low Earth Orbit",
      "mission_end": "1993-12-13T05:25:00Z",
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
        "id": "2709fce9-57db-419b-92dd-b9b47ff503ef",
        "url": "https://ll.thespacedevs.com/2.2.0/launch/2709fce9-57db-419b-92dd-b9b47ff503ef/",
        "slug": "space-shuttle-endeavour-ov-105-sts-61",
        "name": "Space Shuttle Endeavour / OV-105 | STS-61",
        "status": {
          "id": 3,
          "name": "Launch Successful",
          "abbrev": "Success",
          "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
        },
        "last_updated": "2021-02-07T21:07:16Z",
        "net": "1993-12-02T09:27:00Z",
        "window_end": "1993-12-02T09:27:00Z",
        "window_start": "1993-12-02T09:27:00Z",
        "probability": -1,
        "holdreason": "",
        "failreason": "",
        "hashtag": null,
        "launch_service_provider": {
          "id": 192,
          "url": "https://ll.thespacedevs.com/2.2.0/agencies/192/",
          "name": "Lockheed Space Operations Company",
          "type": "Commercial"
        },
        "rocket": {
          "id": 370,
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
          "id": 921,
          "name": "STS-61",
          "description": "STS-61 was the first Hubble Space Telescope servicing mission, and the fifth flight of the Space Shuttle Endeavour. The mission launched on 2 December 1993 from Kennedy Space Center in Florida. The mission restored the spaceborne observatory's vision, marred by spherical aberration, with the installation of a new main camera and a corrective optics package. This correction occurred more than three and a half years after the Hubble was launched aboard STS-31 in April 1990. The flight also brought instrument upgrades and new solar arrays to the telescope.",
          "launch_designator": null,
          "type": "Astrophysics",
          "orbit": {
            "id": 8,
            "name": "Low Earth Orbit",
            "abbrev": "LEO"
          }
        },
        "pad": {
          "id": 4,
          "url": "https://ll.thespacedevs.com/2.2.0/pad/4/",
          "agency_id": 44,
          "name": "Launch Complex 39B",
          "info_url": null,
          "wiki_url": "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39B",
          "map_url": "http://maps.google.com/maps?q=28.627+N,+80.621+W",
          "latitude": "28.62711233",
          "longitude": "-80.62101503",
          "location": {
            "id": 27,
            "url": "https://ll.thespacedevs.com/2.2.0/location/27/",
            "name": "Kennedy Space Center, FL, USA",
            "country_code": "USA",
            "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
            "total_launch_count": 184,
            "total_landing_count": 0
          },
          "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_4_20200803143518.jpg",
          "total_launch_count": 57
        },
        "webcast_live": false,
        "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/space2520shuttle2520endeavour2520ov-101_image_20190222030547.jpeg",
        "infographic": null,
        "program": []
      }
    },
    {
      "id": 107,
      "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/107/",
      "destination": "Low Earth Orbit",
      "mission_end": "1994-04-20T16:55:00Z",
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
        "id": "c188499e-3af4-4a76-b508-c447981d45fa",
        "url": "https://ll.thespacedevs.com/2.2.0/launch/c188499e-3af4-4a76-b508-c447981d45fa/",
        "slug": "space-shuttle-endeavour-ov-105-sts-59",
        "name": "Space Shuttle Endeavour / OV-105 | STS-59",
        "status": {
          "id": 3,
          "name": "Launch Successful",
          "abbrev": "Success",
          "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
        },
        "last_updated": "2021-02-07T21:07:22Z",
        "net": "1994-04-04T11:05:00Z",
        "window_end": "1994-04-04T11:05:00Z",
        "window_start": "1994-04-04T11:05:00Z",
        "probability": -1,
        "holdreason": "",
        "failreason": "",
        "hashtag": null,
        "launch_service_provider": {
          "id": 192,
          "url": "https://ll.thespacedevs.com/2.2.0/agencies/192/",
          "name": "Lockheed Space Operations Company",
          "type": "Commercial"
        },
        "rocket": {
          "id": 374,
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
          "id": 762,
          "name": "STS-59",
          "description": "STS-59 Shuttle mission was a Space Shuttle program mission that took place in 1994. The launch was chronicled by the 1994 Discovery Channel special about the Space Shuttle Program.",
          "launch_designator": null,
          "type": "Earth Science",
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
      "id": 110,
      "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/110/",
      "destination": "Low Earth Orbit",
      "mission_end": "1994-10-11T17:02:00Z",
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
        "id": "c58981cc-5df8-46e0-85e1-1f27ca7fd9e2",
        "url": "https://ll.thespacedevs.com/2.2.0/launch/c58981cc-5df8-46e0-85e1-1f27ca7fd9e2/",
        "slug": "space-shuttle-endeavour-ov-105-sts-68",
        "name": "Space Shuttle Endeavour / OV-105 | STS-68",
        "status": {
          "id": 3,
          "name": "Launch Successful",
          "abbrev": "Success",
          "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
        },
        "last_updated": "2021-02-07T21:07:27Z",
        "net": "1994-09-30T11:16:01Z",
        "window_end": "1994-09-30T11:16:01Z",
        "window_start": "1994-09-30T11:16:01Z",
        "probability": -1,
        "holdreason": "",
        "failreason": "",
        "hashtag": null,
        "launch_service_provider": {
          "id": 192,
          "url": "https://ll.thespacedevs.com/2.2.0/agencies/192/",
          "name": "Lockheed Space Operations Company",
          "type": "Commercial"
        },
        "rocket": {
          "id": 381,
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
          "id": 766,
          "name": "STS-68",
          "description": "STS-68 was a human spaceflight mission using Space Shuttle Endeavour that launched from Kennedy Space Center, Florida on 30 September 1994.",
          "launch_designator": null,
          "type": "Earth Science",
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
      "id": 113,
      "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/113/",
      "destination": "Low Earth Orbit",
      "mission_end": "1995-03-18T21:47:00Z",
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
        "id": "ec946d1f-6997-4bb9-991b-19f4885b44ac",
        "url": "https://ll.thespacedevs.com/2.2.0/launch/ec946d1f-6997-4bb9-991b-19f4885b44ac/",
        "slug": "space-shuttle-endeavour-ov-105-sts-67",
        "name": "Space Shuttle Endeavour / OV-105 | STS-67",
        "status": {
          "id": 3,
          "name": "Launch Successful",
          "abbrev": "Success",
          "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
        },
        "last_updated": "2021-02-07T21:07:32Z",
        "net": "1995-03-02T06:38:13Z",
        "window_end": "1995-03-02T06:38:13Z",
        "window_start": "1995-03-02T06:38:13Z",
        "probability": -1,
        "holdreason": "",
        "failreason": "",
        "hashtag": null,
        "launch_service_provider": {
          "id": 192,
          "url": "https://ll.thespacedevs.com/2.2.0/agencies/192/",
          "name": "Lockheed Space Operations Company",
          "type": "Commercial"
        },
        "rocket": {
          "id": 384,
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
          "id": 770,
          "name": "STS-67",
          "description": "STS-67 was a human spaceflight mission using Space Shuttle Endeavour that launched from Kennedy Space Center, Florida on 2 March 1995.",
          "launch_designator": null,
          "type": "Astrophysics",
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
      "id": 116,
      "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/116/",
      "destination": "Low Earth Orbit",
      "mission_end": "1995-09-18T11:38:00Z",
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
        "id": "1a8a3d70-9072-44e3-ac4a-1c246699b564",
        "url": "https://ll.thespacedevs.com/2.2.0/launch/1a8a3d70-9072-44e3-ac4a-1c246699b564/",
        "slug": "space-shuttle-endeavour-ov-105-sts-69",
        "name": "Space Shuttle Endeavour / OV-105 | STS-69",
        "status": {
          "id": 3,
          "name": "Launch Successful",
          "abbrev": "Success",
          "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
        },
        "last_updated": "2021-02-07T21:07:37Z",
        "net": "1995-09-07T15:09:00Z",
        "window_end": "1995-09-07T15:09:00Z",
        "window_start": "1995-09-07T15:09:00Z",
        "probability": -1,
        "holdreason": "",
        "failreason": "",
        "hashtag": null,
        "launch_service_provider": {
          "id": 197,
          "url": "https://ll.thespacedevs.com/2.2.0/agencies/197/",
          "name": "Lockheed Martin Space Operations",
          "type": "Commercial"
        },
        "rocket": {
          "id": 391,
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
          "id": 786,
          "name": "STS-69",
          "description": "STS-69 was a Space Shuttle Endeavour mission, and the second flight of the Wake Shield Facility (WSF). The mission launched from Kennedy Space Center, Florida on 7 September 1995. It was the 100th successful manned NASA spaceflight, not including X-15 flights.",
          "launch_designator": null,
          "type": "Astrophysics",
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
      "id": 119,
      "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/119/",
      "destination": "Low Earth Orbit",
      "mission_end": "1966-01-20T07:41:00Z",
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
        "id": "188496d3-f726-4678-aef4-44ae64aeb742",
        "url": "https://ll.thespacedevs.com/2.2.0/launch/188496d3-f726-4678-aef4-44ae64aeb742/",
        "slug": "space-shuttle-endeavour-ov-105-sts-72",
        "name": "Space Shuttle Endeavour / OV-105 | STS-72",
        "status": {
          "id": 3,
          "name": "Launch Successful",
          "abbrev": "Success",
          "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
        },
        "last_updated": "2021-02-07T21:07:42Z",
        "net": "1996-01-11T09:41:00Z",
        "window_end": "1996-01-11T09:41:00Z",
        "window_start": "1996-01-11T09:41:00Z",
        "probability": -1,
        "holdreason": "",
        "failreason": "",
        "hashtag": null,
        "launch_service_provider": {
          "id": 197,
          "url": "https://ll.thespacedevs.com/2.2.0/agencies/197/",
          "name": "Lockheed Martin Space Operations",
          "type": "Commercial"
        },
        "rocket": {
          "id": 395,
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
          "id": 922,
          "name": "STS-72",
          "description": "STS-72 was a Space Shuttle Endeavour mission to capture and return to Earth a Japanese 16 spacecraft known as Space Flyer Unit (SFU). The mission launched from Kennedy Space Center, Florida on 11 January 1996.",
          "launch_designator": null,
          "type": "",
          "orbit": {
            "id": 8,
            "name": "Low Earth Orbit",
            "abbrev": "LEO"
          }
        },
        "pad": {
          "id": 4,
          "url": "https://ll.thespacedevs.com/2.2.0/pad/4/",
          "agency_id": 44,
          "name": "Launch Complex 39B",
          "info_url": null,
          "wiki_url": "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39B",
          "map_url": "http://maps.google.com/maps?q=28.627+N,+80.621+W",
          "latitude": "28.62711233",
          "longitude": "-80.62101503",
          "location": {
            "id": 27,
            "url": "https://ll.thespacedevs.com/2.2.0/location/27/",
            "name": "Kennedy Space Center, FL, USA",
            "country_code": "USA",
            "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
            "total_launch_count": 184,
            "total_landing_count": 0
          },
          "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_4_20200803143518.jpg",
          "total_launch_count": 57
        },
        "webcast_live": false,
        "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/space2520shuttle2520endeavour2520ov-101_image_20190222030547.jpeg",
        "infographic": null,
        "program": []
      }
    },
    {
      "id": 122,
      "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/122/",
      "destination": "Low Earth Orbit",
      "mission_end": "1996-05-29T11:09:00Z",
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
        "id": "c79110c0-01b1-4b2d-8189-3eaae64e3887",
        "url": "https://ll.thespacedevs.com/2.2.0/launch/c79110c0-01b1-4b2d-8189-3eaae64e3887/",
        "slug": "space-shuttle-endeavour-ov-105-sts-77",
        "name": "Space Shuttle Endeavour / OV-105 | STS-77",
        "status": {
          "id": 3,
          "name": "Launch Successful",
          "abbrev": "Success",
          "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
        },
        "last_updated": "2021-02-07T21:08:56Z",
        "net": "1996-05-19T10:30:00Z",
        "window_end": "1996-05-19T10:30:00Z",
        "window_start": "1996-05-19T10:30:00Z",
        "probability": -1,
        "holdreason": "",
        "failreason": "",
        "hashtag": null,
        "launch_service_provider": {
          "id": 197,
          "url": "https://ll.thespacedevs.com/2.2.0/agencies/197/",
          "name": "Lockheed Martin Space Operations",
          "type": "Commercial"
        },
        "rocket": {
          "id": 401,
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
          "id": 807,
          "name": "STS-77",
          "description": "STS-77 was the 77th Space Shuttle mission and the 11th mission of the Space Shuttle Endeavour. The mission began from launch pad 39B from Kennedy Space Center, Florida on 19 May 1996 lasting 10 days and 40 minutes and completing 161 revolutions before landing on runway 33.",
          "launch_designator": null,
          "type": "",
          "orbit": {
            "id": 8,
            "name": "Low Earth Orbit",
            "abbrev": "LEO"
          }
        },
        "pad": {
          "id": 4,
          "url": "https://ll.thespacedevs.com/2.2.0/pad/4/",
          "agency_id": 44,
          "name": "Launch Complex 39B",
          "info_url": null,
          "wiki_url": "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39B",
          "map_url": "http://maps.google.com/maps?q=28.627+N,+80.621+W",
          "latitude": "28.62711233",
          "longitude": "-80.62101503",
          "location": {
            "id": 27,
            "url": "https://ll.thespacedevs.com/2.2.0/location/27/",
            "name": "Kennedy Space Center, FL, USA",
            "country_code": "USA",
            "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
            "total_launch_count": 184,
            "total_landing_count": 0
          },
          "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_4_20200803143518.jpg",
          "total_launch_count": 57
        },
        "webcast_live": false,
        "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/space2520shuttle2520endeavour2520ov-101_image_20190222030547.jpeg",
        "infographic": null,
        "program": []
      }
    },
    {
      "id": 134,
      "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/134/",
      "destination": "Mir Space Station",
      "mission_end": "1998-01-31T22:36:00Z",
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
        "id": "836daae0-6a72-4d44-9a7a-f6392e6c305c",
        "url": "https://ll.thespacedevs.com/2.2.0/launch/836daae0-6a72-4d44-9a7a-f6392e6c305c/",
        "slug": "space-shuttle-endeavour-ov-105-sts-89",
        "name": "Space Shuttle Endeavour / OV-105 | STS-89",
        "status": {
          "id": 3,
          "name": "Launch Successful",
          "abbrev": "Success",
          "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
        },
        "last_updated": "2021-02-07T21:09:01Z",
        "net": "1998-01-23T02:48:15Z",
        "window_end": "1998-01-23T02:48:15Z",
        "window_start": "1998-01-23T02:48:15Z",
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
          "id": 427,
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
          "id": 840,
          "name": "STS-89",
          "description": "STS-89 was a space shuttle mission to the Mir space station flown by Space Shuttle Endeavour, and launched from Kennedy Space Center, Florida on 22 January 1998.",
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
        "program": [
          {
            "id": 12,
            "url": "https://ll.thespacedevs.com/2.2.0/program/12/",
            "name": "Shuttle–Mir",
            "description": "The Shuttle–Mir program was a collaborative 11-mission space program between Russia and the United States that involved American Space Shuttles visiting the Russian space station Mir, Russian cosmonauts flying on the Shuttle, and an American astronaut flying aboard a Soyuz spacecraft to engage in long-duration expeditions aboard Mir.",
            "agencies": [
              {
                "id": 44,
                "url": "https://ll.thespacedevs.com/2.2.0/agencies/44/",
                "name": "National Aeronautics and Space Administration",
                "type": "Government"
              },
              {
                "id": 63,
                "url": "https://ll.thespacedevs.com/2.2.0/agencies/63/",
                "name": "Russian Federal Space Agency (ROSCOSMOS)",
                "type": "Government"
              }
            ],
            "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/program_images/shuttle25e225_program_20200821090507.png",
            "start_date": "1993-09-01T00:00:00Z",
            "end_date": "1998-06-12T18:00:18Z",
            "info_url": "https://www.nasa.gov/audience/formedia/factsheet/shuttle_mir_factsheet.html",
            "wiki_url": "https://en.wikipedia.org/wiki/Shuttle–Mir_program"
          }
        ]
      }
    },
    {
      "id": 138,
      "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/138/",
      "destination": "International Space Station",
      "mission_end": "1998-12-16T03:53:00Z",
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
        "id": "6ddd646c-18f8-43db-8171-11d5670cc1a6",
        "url": "https://ll.thespacedevs.com/2.2.0/launch/6ddd646c-18f8-43db-8171-11d5670cc1a6/",
        "slug": "space-shuttle-endeavour-ov-105-sts-88",
        "name": "Space Shuttle Endeavour / OV-105 | STS-88",
        "status": {
          "id": 3,
          "name": "Launch Successful",
          "abbrev": "Success",
          "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
        },
        "last_updated": "2021-02-07T21:09:04Z",
        "net": "1998-12-04T08:35:34Z",
        "window_end": "1998-12-04T08:35:34Z",
        "window_start": "1998-12-04T08:35:34Z",
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
          "id": 439,
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
          "id": 867,
          "name": "STS-88",
          "description": "STS-88 was the first Space Shuttle mission to the International Space Station (ISS). It was flown by Space Shuttle Endeavour, and took the first American module, the Unity node, to the station.",
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
      "id": 142,
      "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/142/",
      "destination": "Low Earth Orbit",
      "mission_end": "2000-02-22T23:23:00Z",
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
        "id": "b3b5fa61-990f-4e42-a6b8-9570d87a328c",
        "url": "https://ll.thespacedevs.com/2.2.0/launch/b3b5fa61-990f-4e42-a6b8-9570d87a328c/",
        "slug": "space-shuttle-endeavour-ov-105-sts-99",
        "name": "Space Shuttle Endeavour / OV-105 | STS-99",
        "status": {
          "id": 3,
          "name": "Launch Successful",
          "abbrev": "Success",
          "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
        },
        "last_updated": "2021-02-07T21:09:08Z",
        "net": "2000-02-11T17:43:00Z",
        "window_end": "2000-02-11T17:43:00Z",
        "window_start": "2000-02-11T17:43:00Z",
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
          "id": 450,
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
          "id": 851,
          "name": "STS-99",
          "description": "STS-99 was a Space Shuttle mission using Endeavour, that launched on 11 February 2000 from Kennedy Space Center, Florida. The primary objective of the mission was the Shuttle Radar Topography Mission (SRTM) project. This was also the last solo flight of Endeavour; all future flights for Endeavour became devoted to the International Space Station.",
          "launch_designator": null,
          "type": "Earth Science",
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
      "id": 146,
      "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/146/",
      "destination": "International Space Station",
      "mission_end": "2000-12-11T23:04:00Z",
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
        "id": "26b5d36f-bbdc-4ddc-ab87-7712b9f053c1",
        "url": "https://ll.thespacedevs.com/2.2.0/launch/26b5d36f-bbdc-4ddc-ab87-7712b9f053c1/",
        "slug": "space-shuttle-endeavour-ov-105-sts-97",
        "name": "Space Shuttle Endeavour / OV-105 | STS-97",
        "status": {
          "id": 3,
          "name": "Launch Successful",
          "abbrev": "Success",
          "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
        },
        "last_updated": "2021-02-07T21:09:13Z",
        "net": "2000-12-01T03:06:00Z",
        "window_end": "2000-12-01T03:06:00Z",
        "window_start": "2000-12-01T03:06:00Z",
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
          "id": 461,
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
          "id": 858,
          "name": "STS-97",
          "description": "STS-97 was a Space Shuttle mission to the International Space Station (ISS) flown by Space Shuttle Endeavour. The crew installed the first set of solar arrays to the ISS, prepared a docking port for arrival of the Destiny Laboratory Module, and delivered supplies for the station's crew.",
          "launch_designator": null,
          "type": "Human Exploration",
          "orbit": {
            "id": 8,
            "name": "Low Earth Orbit",
            "abbrev": "LEO"
          }
        },
        "pad": {
          "id": 4,
          "url": "https://ll.thespacedevs.com/2.2.0/pad/4/",
          "agency_id": 44,
          "name": "Launch Complex 39B",
          "info_url": null,
          "wiki_url": "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39B",
          "map_url": "http://maps.google.com/maps?q=28.627+N,+80.621+W",
          "latitude": "28.62711233",
          "longitude": "-80.62101503",
          "location": {
            "id": 27,
            "url": "https://ll.thespacedevs.com/2.2.0/location/27/",
            "name": "Kennedy Space Center, FL, USA",
            "country_code": "USA",
            "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
            "total_launch_count": 184,
            "total_landing_count": 0
          },
          "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_4_20200803143518.jpg",
          "total_launch_count": 57
        },
        "webcast_live": false,
        "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/space2520shuttle2520endeavour2520ov-101_image_20190222030547.jpeg",
        "infographic": null,
        "program": []
      }
    },
    {
      "id": 149,
      "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/149/",
      "destination": "International Space Station",
      "mission_end": "2001-05-01T16:11:00Z",
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
        "id": "b930fdc7-6124-4c7b-99b3-69d422d6a798",
        "url": "https://ll.thespacedevs.com/2.2.0/launch/b930fdc7-6124-4c7b-99b3-69d422d6a798/",
        "slug": "space-shuttle-endeavour-ov-105-sts-100",
        "name": "Space Shuttle Endeavour / OV-105 | STS-100",
        "status": {
          "id": 3,
          "name": "Launch Successful",
          "abbrev": "Success",
          "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
        },
        "last_updated": "2021-02-07T21:09:18Z",
        "net": "2001-04-19T18:40:42Z",
        "window_end": "2001-04-19T18:40:42Z",
        "window_start": "2001-04-19T18:40:42Z",
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
          "id": 468,
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
          "id": 861,
          "name": "STS-100",
          "description": "STS-100 was a Space Shuttle mission to the International Space Station (ISS) flown by Space Shuttle Endeavour. STS-100 installed the ISS Canadarm2 robotic arm.",
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
      "id": 152,
      "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/152/",
      "destination": "International Space Station",
      "mission_end": "2001-12-17T17:56:00Z",
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
        "id": "6bd826ab-d007-45dd-a722-6bdbb2720cc1",
        "url": "https://ll.thespacedevs.com/2.2.0/launch/6bd826ab-d007-45dd-a722-6bdbb2720cc1/",
        "slug": "space-shuttle-endeavour-ov-105-sts-108",
        "name": "Space Shuttle Endeavour / OV-105 | STS-108",
        "status": {
          "id": 3,
          "name": "Launch Successful",
          "abbrev": "Success",
          "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
        },
        "last_updated": "2021-02-07T21:09:22Z",
        "net": "2001-12-05T22:19:28Z",
        "window_end": "2001-12-05T22:19:28Z",
        "window_start": "2001-12-05T22:19:28Z",
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
          "id": 473,
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
          "id": 871,
          "name": "STS-108",
          "description": "STS-108 was a Space Shuttle mission to the International Space Station (ISS) flown by Space Shuttle Endeavour. Its primary objective was to deliver supplies to and help maintain the ISS. It was the 12th shuttle flight to visit the International Space Station and the first since the installation of the Russian airlock called Pirs on the station. Endeavour delivered the Expedition 4 crew to the orbital outpost. The Expedition 3 crew returned to Earth on Endeavour.",
          "launch_designator": null,
          "type": "Human Exploration",
          "orbit": {
            "id": 8,
            "name": "Low Earth Orbit",
            "abbrev": "LEO"
          }
        },
        "pad": {
          "id": 4,
          "url": "https://ll.thespacedevs.com/2.2.0/pad/4/",
          "agency_id": 44,
          "name": "Launch Complex 39B",
          "info_url": null,
          "wiki_url": "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39B",
          "map_url": "http://maps.google.com/maps?q=28.627+N,+80.621+W",
          "latitude": "28.62711233",
          "longitude": "-80.62101503",
          "location": {
            "id": 27,
            "url": "https://ll.thespacedevs.com/2.2.0/location/27/",
            "name": "Kennedy Space Center, FL, USA",
            "country_code": "USA",
            "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
            "total_launch_count": 184,
            "total_landing_count": 0
          },
          "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_4_20200803143518.jpg",
          "total_launch_count": 57
        },
        "webcast_live": false,
        "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/space2520shuttle2520endeavour2520ov-101_image_20190222030547.jpeg",
        "infographic": null,
        "program": []
      }
    },
    {
      "id": 155,
      "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/155/",
      "destination": "International Space Station",
      "mission_end": "2002-06-19T17:58:00Z",
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
        "id": "c265e94e-e0d7-4a2c-b051-356f325c00db",
        "url": "https://ll.thespacedevs.com/2.2.0/launch/c265e94e-e0d7-4a2c-b051-356f325c00db/",
        "slug": "space-shuttle-endeavour-ov-105-sts-111",
        "name": "Space Shuttle Endeavour / OV-105 | STS-111",
        "status": {
          "id": 3,
          "name": "Launch Successful",
          "abbrev": "Success",
          "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
        },
        "last_updated": "2021-02-07T21:09:26Z",
        "net": "2002-06-05T21:22:49Z",
        "window_end": "2002-06-05T21:22:49Z",
        "window_start": "2002-06-05T21:22:49Z",
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
          "id": 481,
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
          "id": 870,
          "name": "STS-111",
          "description": "STS-111 was a space shuttle mission to the International Space Station (ISS) flown by Space Shuttle Endeavour. STS-111 resupplied the station and replaced the Expedition 4 crew with the Expedition 5 crew. It was launched on 5 June 2002, from Kennedy Space Center, Florida.",
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
      "id": 157,
      "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/157/",
      "destination": "International Space Station",
      "mission_end": "2002-12-07T19:38:00Z",
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
        "id": "180d1c7c-81f7-4673-a1b7-7474805f1b97",
        "url": "https://ll.thespacedevs.com/2.2.0/launch/180d1c7c-81f7-4673-a1b7-7474805f1b97/",
        "slug": "space-shuttle-endeavour-ov-105-sts-113",
        "name": "Space Shuttle Endeavour / OV-105 | STS-113",
        "status": {
          "id": 3,
          "name": "Launch Successful",
          "abbrev": "Success",
          "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
        },
        "last_updated": "2021-02-07T21:09:30Z",
        "net": "2002-11-23T00:49:47Z",
        "window_end": "2002-11-23T00:49:47Z",
        "window_start": "2002-11-23T00:49:47Z",
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
          "id": 486,
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
          "id": 874,
          "name": "STS-113",
          "description": "STS-113 was a Space Shuttle mission to the International Space Station (ISS) flown by Space Shuttle Endeavour. During the 14-day mission in late 2002, Endeavour and its crew extended the ISS backbone with the P1 truss and exchanged the Expedition 5 and Expedition 6 crews aboard the station. With Commander Jim Wetherbee and Pilot Paul Lockhart at the controls, Endeavour docked with the station on 25 November 2002 to begin seven days of station assembly, spacewalks and crew and equipment transfers. This was Endeavourâ€™s last flight before entering its Orbiter Major Modification period until 2007, and also the last shuttle mission before the Columbia disaster.",
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
      "id": 183,
      "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/183/",
      "destination": "International Space Station",
      "mission_end": "2007-08-21T16:33:00Z",
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
        "id": "0252f181-b5d1-4346-9641-78c81af057df",
        "url": "https://ll.thespacedevs.com/2.2.0/launch/0252f181-b5d1-4346-9641-78c81af057df/",
        "slug": "space-shuttle-endeavour-ov-105-sts-118",
        "name": "Space Shuttle Endeavour / OV-105 | STS-118",
        "status": {
          "id": 3,
          "name": "Launch Successful",
          "abbrev": "Success",
          "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
        },
        "last_updated": "2021-02-07T21:09:36Z",
        "net": "2007-08-08T22:36:42Z",
        "window_end": "2007-08-08T22:36:42Z",
        "window_start": "2007-08-08T22:36:42Z",
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
          "id": 543,
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
          "id": 272,
          "name": "STS-118",
          "description": "STS-118 was a space shuttle mission to the International Space Station (ISS) flown by the orbiter Endeavour.",
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
      "id": 188,
      "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/188/",
      "destination": "International Space Station",
      "mission_end": "2008-11-30T21:25:00Z",
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
        "id": "2895738c-a7e0-421d-b0d8-86d347e899f3",
        "url": "https://ll.thespacedevs.com/2.2.0/launch/2895738c-a7e0-421d-b0d8-86d347e899f3/",
        "slug": "space-shuttle-endeavour-ov-105-sts-126",
        "name": "Space Shuttle Endeavour / OV-105 | STS-126",
        "status": {
          "id": 3,
          "name": "Launch Successful",
          "abbrev": "Success",
          "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
        },
        "last_updated": "2021-02-07T21:10:18Z",
        "net": "2008-11-15T00:55:00Z",
        "window_end": "2008-11-15T00:55:00Z",
        "window_start": "2008-11-15T00:55:00Z",
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
          "id": 1406,
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
          "id": 325,
          "name": "STS-126",
          "description": "STS-126 was a Space Shuttle mission to the International Space Station (ISS) flown by Space Shuttle Endeavour. The purpose of the mission, referred to as ULF2 by the ISS program, was to deliver equipment and supplies to the station, to service the Solar Alpha Rotary Joints (SARJ), and repair the problem in the starboard SARJ that had limited its use since STS-120.",
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
      "id": 191,
      "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/191/",
      "destination": "International Space Station",
      "mission_end": "2009-07-15T22:03:00Z",
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
        "id": "04f545af-568f-442c-8d19-db8a91f4d62b",
        "url": "https://ll.thespacedevs.com/2.2.0/launch/04f545af-568f-442c-8d19-db8a91f4d62b/",
        "slug": "space-shuttle-endeavour-ov-105-sts-127",
        "name": "Space Shuttle Endeavour / OV-105 | STS-127",
        "status": {
          "id": 3,
          "name": "Launch Successful",
          "abbrev": "Success",
          "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
        },
        "last_updated": "2021-02-07T21:10:22Z",
        "net": "2009-07-15T22:03:00Z",
        "window_end": "2009-07-15T22:03:00Z",
        "window_start": "2009-07-15T22:03:00Z",
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
          "id": 1422,
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
          "id": 457,
          "name": "STS-127",
          "description": "STS-127 (ISS assembly flight 2J/A) was a NASA Space Shuttle mission to the International Space Station (ISS). It was the twenty-third flight of Space Shuttle Endeavour. The primary purpose of the STS-127 mission was to deliver and install the final two components of the Japanese Experiment Module: the Exposed Facility (JEM EF), and the Exposed Section of the Experiment Logistics Module (ELM-ES). When Endeavour docked with the ISS on this mission in July 2009, it set a record for the most humans in space at the same time in the same vehicle, the first time thirteen people have been at the station at the same time. It also tied the record of thirteen people in space at any one time.",
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
      "id": 198,
      "url": "https://ll.thespacedevs.com/2.2.0/spacecraft/flight/198/",
      "destination": "International Space Station",
      "mission_end": "2011-06-01T06:35:00Z",
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
        "id": "e0cd4c35-ab04-411e-867f-2d79bb589d53",
        "url": "https://ll.thespacedevs.com/2.2.0/launch/e0cd4c35-ab04-411e-867f-2d79bb589d53/",
        "slug": "space-shuttle-endeavour-ov-105-sts-134",
        "name": "Space Shuttle Endeavour / OV-105 | STS-134",
        "status": {
          "id": 3,
          "name": "Launch Successful",
          "abbrev": "Success",
          "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
        },
        "last_updated": "2021-02-07T21:10:31Z",
        "net": "2011-05-16T12:56:28Z",
        "window_end": "2011-05-16T12:56:28Z",
        "window_start": "2011-05-16T12:56:28Z",
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
          "id": 1524,
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
          "id": 150,
          "name": "STS-134",
          "description": "ISS assembly flight ULF6. This flight delivered the Alpha Magnetic Spectrometer and an ExPRESS Logistics Carrier to the International Space Station.",
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
    }
  ]
}
"""#
