// Copyright © 2021 Bradford Holcombe. All rights reserved.

import XCTest

// swiftlint:disable line_length
// swiftlint:disable function_body_length

class SpacecraftConfigJSONUnitTests: XCTestCase
{
   // found 6 bugs
   func testSpacecraftConfig1() throws
   {
      let json: String =
      #"""
      {
         "id": 10,
         "url": "https://ll.thespacedevs.com/2.2.0/config/spacecraft/10/",
         "name": "Apollo Command/Service Module",
         "type": { "id": 1, "name": "Unknown" },
         "agency":
         {
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
         "capability": "Cargo and Human Transportation to Lunar Orbit",
         "history": "The Apollo Command/Service Module (CSM) was one of two principal components of the United States Apollo spacecraft, used for the Apollo program which landed astronauts on the Moon between 1969 and 1972.",
         "details": "The Apollo Command/Service Module (CSM) was one of two principal components of the United States Apollo spacecraft, used for the Apollo program which landed astronauts on the Moon between 1969 and 1972. The CSM functioned as a mother ship which carried a crew of three astronauts and the second Apollo spacecraft, the Lunar Module, to lunar orbit, and brought the astronauts back to Earth. It consisted of two parts: the conical Command Module, a cabin that housed the crew and carried equipment needed for atmospheric reentry and splashdown; and the cylindrical Service Module which provided propulsion, electrical power and storage for various consumables required during a mission. An umbilical connection transferred power and consumables between the two modules. Just before reentry of the Command Module on the return home, the umbilical connection was severed and the Service Module was cast off and allowed to burn up in the atmosphere.",
         "maiden_flight": "1966-02-26",
         "height": 11,
         "diameter": 3.9,
         "human_rated": true,
         "crew_capacity": 3,
         "payload_capacity": 1050,
         "flight_life": "14 days",
         "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/apollo2520command2fservice2520module_image_20190207032507.jpeg",
         "nation_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_nation/apollo2520command2fservice2520module_image_20190207032507.png",
         "wiki_link": "https://en.wikipedia.org/wiki/Apollo_Command/Service_Module",
         "info_link": ""
      }
      """#

      guard let spacecraftConfig: SpacecraftConfigJSON = SpacecraftConfigJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkSpacecraftConfig( spacecraft: spacecraftConfig, spacecraftID: 10, url: "https://ll.thespacedevs.com/2.2.0/config/spacecraft/10/",
                             name: "Apollo Command/Service Module",
                             type: "Unknown", inUse: false, capability: "Cargo and Human Transportation to Lunar Orbit",
                             history: "The Apollo Command/Service Module (CSM) was one of two principal components of the United States Apollo spacecraft, used for the Apollo program which landed astronauts on the Moon between 1969 and 1972.",
                             details: "The Apollo Command/Service Module (CSM) was one of two principal components of the United States Apollo spacecraft, used for the Apollo program which landed astronauts on the Moon between 1969 and 1972. The CSM functioned as a mother ship which carried a crew of three astronauts and the second Apollo spacecraft, the Lunar Module, to lunar orbit, and brought the astronauts back to Earth. It consisted of two parts: the conical Command Module, a cabin that housed the crew and carried equipment needed for atmospheric reentry and splashdown; and the cylindrical Service Module which provided propulsion, electrical power and storage for various consumables required during a mission. An umbilical connection transferred power and consumables between the two modules. Just before reentry of the Command Module on the return home, the umbilical connection was severed and the Service Module was cast off and allowed to burn up in the atmosphere.",
                             maidenFlight: "1966-02-26",
                             height: 11, diameter: 3.9, humanRated: true, crewCapacity: 3,
                             payloadCapacity: 1050, flightLife: "14 days",
                             imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/apollo2520command2fservice2520module_image_20190207032507.jpeg",
                             nationURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_nation/apollo2520command2fservice2520module_image_20190207032507.png",
                             wikiURL: "https://en.wikipedia.org/wiki/Apollo_Command/Service_Module" )
      checkAgency( agency: spacecraftConfig.agency, agencyID: 44, name: "National Aeronautics and Space Administration",
                   featured: true, type: "Government", url: "https://ll.thespacedevs.com/2.2.0/agencies/44/",
                   countryCode: "USA", abbreviation: "NASA",
                   agencyDescription: "The National Aeronautics and Space Administration is an independent agency of the executive branch of the United States federal government responsible for the civilian space program, as well as aeronautics and aerospace research. NASA have many launch facilities but most are inactive. The most commonly used pad will be LC-39B at Kennedy Space Center in Florida.",
                   administrator: "Administrator: Jim Bridenstine", foundingYear: "1958", launchers: "Space Shuttle | SLS",
                   spacecraft: "Orion",
                   imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_images/national2520aeronautics2520and2520space2520administration_image_20190207032448.jpeg" )
   }

   func testSpacecraftConfig2() throws
   {
      let json: String =
      #"""
      {
         "id": 12,
         "url": "https://ll.thespacedevs.com/2.2.0/config/spacecraft/12/",
         "name": "Gemini",
         "type": { "id": 1, "name": "Unknown" },
         "agency":
         {
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
         "capability": "Human transportation to low Earth orbit.",
         "history": "The Gemini crew capsule (referred to as the Reentry Module) was essentially an enlarged version of the Mercury capsule. Unlike Mercury, the retrorockets, electrical power, propulsion systems, oxygen, and water were located in a detachable Adapter Module behind the Reentry Module. A major design improvement in Gemini was to locate all internal spacecraft systems in modular components, which could be independently tested and replaced when necessary, without removing or disturbing other already tested components.",
         "details": "The spacecraft was 18 feet 5 inches (5.61 m) long and 10 feet (3.0 m) wide, with a launch weight varying from 7,100 to 8,350 pounds (3,220 to 3,790 kg).",
         "maiden_flight": "1964-04-08",
         "height": 5.61,
         "diameter": 3,
         "human_rated": true,
         "crew_capacity": 2,
         "payload_capacity": null,
         "flight_life": "Between a few hours and multiple days (14 day is the maximum achieved).",
         "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/gemini_image_20190207032517.jpeg",
         "nation_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_nation/gemini_image_20190207032517.png",
         "wiki_link": "https://en.wikipedia.org/wiki/Project_Gemini#Spacecraft",
         "info_link": ""
      }
      """#

      guard let spacecraftConfig: SpacecraftConfigJSON = SpacecraftConfigJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkSpacecraftConfig( spacecraft: spacecraftConfig, spacecraftID: 12, url: "https://ll.thespacedevs.com/2.2.0/config/spacecraft/12/",
                             name: "Gemini",
                             type: "Unknown", inUse: false, capability: "Human transportation to low Earth orbit.",
                             history: "The Gemini crew capsule (referred to as the Reentry Module) was essentially an enlarged version of the Mercury capsule. Unlike Mercury, the retrorockets, electrical power, propulsion systems, oxygen, and water were located in a detachable Adapter Module behind the Reentry Module. A major design improvement in Gemini was to locate all internal spacecraft systems in modular components, which could be independently tested and replaced when necessary, without removing or disturbing other already tested components.",
                             details: "The spacecraft was 18 feet 5 inches (5.61 m) long and 10 feet (3.0 m) wide, with a launch weight varying from 7,100 to 8,350 pounds (3,220 to 3,790 kg).",
                             maidenFlight: "1964-04-08",
                             height: 5.61, diameter: 3, humanRated: true, crewCapacity: 2,
                             flightLife: "Between a few hours and multiple days (14 day is the maximum achieved).",
                             imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/gemini_image_20190207032517.jpeg",
                             nationURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_nation/gemini_image_20190207032517.png",
                             wikiURL: "https://en.wikipedia.org/wiki/Project_Gemini#Spacecraft" )
      checkAgency( agency: spacecraftConfig.agency, agencyID: 44, name: "National Aeronautics and Space Administration",
                   featured: true, type: "Government", url: "https://ll.thespacedevs.com/2.2.0/agencies/44/",
                   countryCode: "USA", abbreviation: "NASA",
                   agencyDescription: "The National Aeronautics and Space Administration is an independent agency of the executive branch of the United States federal government responsible for the civilian space program, as well as aeronautics and aerospace research. NASA have many launch facilities but most are inactive. The most commonly used pad will be LC-39B at Kennedy Space Center in Florida.",
                   administrator: "Administrator: Jim Bridenstine", foundingYear: "1958", launchers: "Space Shuttle | SLS",
                   spacecraft: "Orion",
                   imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_images/national2520aeronautics2520and2520space2520administration_image_20190207032448.jpeg" )
   }

   func testSpacecraftConfig3() throws
   {
      let json: String =
      #"""
      {
         "id": 11,
         "url": "https://ll.thespacedevs.com/2.2.0/config/spacecraft/11/",
         "name": "Mercury",
         "type": { "id": 1, "name": "Unknown" },
         "agency":
         {
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
         "capability": "Human transportation to upper Earth atmosphere and low Earth orbit.",
         "history": "The Mercury spacecraft was the manned capsule used for suborbital and orbital launches during the Project Mercury, the first human spaceflight program of the United States, from 1958 through 1963.",
         "details": "The Mercury spacecraft's principal designer was Maxime Faget, who started research for manned spaceflight during the time of the NACA. With 100 cubic feet (2.8 m3) of habitable volume, the capsule was just large enough for a single crew member. Inside were 120 controls: 55 electrical switches, 30 fuses and 35 mechanical levers. The heaviest spacecraft, Mercury-Atlas 9, weighed 3,000 pounds (1,400 kg) fully loaded. Its outer skin was made of René 41, a nickel alloy able to withstand high temperatures.",
         "maiden_flight": "1961-05-05",
         "height": 3.3,
         "diameter": 1.8,
         "human_rated": true,
         "crew_capacity": 1,
         "payload_capacity": null,
         "flight_life": "Between 15 minutes and 3 days.",
         "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/mercury_image_20190207032519.jpeg",
         "nation_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_nation/mercury_image_20190207032519.png",
         "wiki_link": "https://en.wikipedia.org/wiki/Project_Mercury#Spacecraft",
         "info_link": ""
      }
      """#

      guard let spacecraftConfig: SpacecraftConfigJSON = SpacecraftConfigJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkSpacecraftConfig( spacecraft: spacecraftConfig, spacecraftID: 11, url: "https://ll.thespacedevs.com/2.2.0/config/spacecraft/11/",
                             name: "Mercury",
                             type: "Unknown", inUse: false, capability: "Human transportation to upper Earth atmosphere and low Earth orbit.",
                             history: "The Mercury spacecraft was the manned capsule used for suborbital and orbital launches during the Project Mercury, the first human spaceflight program of the United States, from 1958 through 1963.",
                             details: "The Mercury spacecraft's principal designer was Maxime Faget, who started research for manned spaceflight during the time of the NACA. With 100 cubic feet (2.8 m3) of habitable volume, the capsule was just large enough for a single crew member. Inside were 120 controls: 55 electrical switches, 30 fuses and 35 mechanical levers. The heaviest spacecraft, Mercury-Atlas 9, weighed 3,000 pounds (1,400 kg) fully loaded. Its outer skin was made of René 41, a nickel alloy able to withstand high temperatures.",
                             maidenFlight: "1961-05-05",
                             height: 3.3, diameter: 1.8, humanRated: true, crewCapacity: 1,
                             flightLife: "Between 15 minutes and 3 days.",
                             imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/mercury_image_20190207032519.jpeg",
                             nationURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_nation/mercury_image_20190207032519.png",
                             wikiURL: "https://en.wikipedia.org/wiki/Project_Mercury#Spacecraft" )
      checkAgency( agency: spacecraftConfig.agency, agencyID: 44, name: "National Aeronautics and Space Administration",
                   featured: true, type: "Government", url: "https://ll.thespacedevs.com/2.2.0/agencies/44/",
                   countryCode: "USA", abbreviation: "NASA",
                   agencyDescription: "The National Aeronautics and Space Administration is an independent agency of the executive branch of the United States federal government responsible for the civilian space program, as well as aeronautics and aerospace research. NASA have many launch facilities but most are inactive. The most commonly used pad will be LC-39B at Kennedy Space Center in Florida.",
                   administrator: "Administrator: Jim Bridenstine", foundingYear: "1958", launchers: "Space Shuttle | SLS",
                   spacecraft: "Orion",
                   imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_images/national2520aeronautics2520and2520space2520administration_image_20190207032448.jpeg" )
   }

   func testSpacecraftConfig4() throws
   {
      let json: String =
      #"""
      {
         "id": 13,
         "url": "https://ll.thespacedevs.com/2.2.0/config/spacecraft/13/",
         "name": "North American X-15",
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
         "capability": "Experimental aircraft used for Aircraft and Spacecraft design",
         "history": "The North American X-15 currently holds the record for the highest speed in a manned, powered aircraft.\r\n\r\nThe three variants of the X-15 flew nearly 200 times, with 13 of them going over 80km high.",
         "details": "The North American X-15 was a hypersonic rocket-powered aircraft operated by the United States Air Force and the National Aeronautics and Space Administration. The X-15 reached altitudes of over 80km and speeds of over 6000 km/h.\r\n\r\nThe X-15 had a wingspan of 6.8 meters, and length of 15.4",
         "maiden_flight": "1959-06-08",
         "height": 15.45,
         "diameter": 6.8,
         "human_rated": true,
         "crew_capacity": 1,
         "payload_capacity": null,
         "flight_life": "~10 minute flights",
         "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/north2520american2520x-15_image_20190207032520.jpeg",
         "nation_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_nation/north2520american2520x-15_image_20190207032520.png",
         "wiki_link": "https://en.wikipedia.org/wiki/North_American_X-15",
         "info_link": "https://airandspace.si.edu/collection-objects/north-american-x-15"
      }
      """#

      guard let spacecraftConfig: SpacecraftConfigJSON = SpacecraftConfigJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkSpacecraftConfig( spacecraft: spacecraftConfig, spacecraftID: 13, url: "https://ll.thespacedevs.com/2.2.0/config/spacecraft/13/",
                             name: "North American X-15",
                             type: "Unknown", inUse: false, capability: "Experimental aircraft used for Aircraft and Spacecraft design",
                             history: "The North American X-15 currently holds the record for the highest speed in a manned, powered aircraft.\r\n\r\nThe three variants of the X-15 flew nearly 200 times, with 13 of them going over 80km high.",
                             details: "The North American X-15 was a hypersonic rocket-powered aircraft operated by the United States Air Force and the National Aeronautics and Space Administration. The X-15 reached altitudes of over 80km and speeds of over 6000 km/h.\r\n\r\nThe X-15 had a wingspan of 6.8 meters, and length of 15.4",
                             maidenFlight: "1959-06-08",
                             height: 15.45, diameter: 6.8, humanRated: true, crewCapacity: 1,
                             flightLife: "~10 minute flights",
                             imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/north2520american2520x-15_image_20190207032520.jpeg",
                             nationURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_nation/north2520american2520x-15_image_20190207032520.png",
                             wikiURL: "https://en.wikipedia.org/wiki/North_American_X-15",
                             infoURL: "https://airandspace.si.edu/collection-objects/north-american-x-15" )
      checkAgency( agency: spacecraftConfig.agency, agencyID: 44, name: "National Aeronautics and Space Administration",
                   featured: true, type: "Government", url: "https://ll.thespacedevs.com/2.2.0/agencies/44/",
                   countryCode: "USA", abbreviation: "NASA",
                   agencyDescription: "The National Aeronautics and Space Administration is an independent agency of the executive branch of the United States federal government responsible for the civilian space program, as well as aeronautics and aerospace research. NASA have many launch facilities but most are inactive. The most commonly used pad will be LC-39B at Kennedy Space Center in Florida.",
                   administrator: "Administrator: Jim Bridenstine", foundingYear: "1958", launchers: "Space Shuttle | SLS",
                   spacecraft: "Orion",
                   imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_images/national2520aeronautics2520and2520space2520administration_image_20190207032448.jpeg" )
   }

   func testSpacecraftConfig5() throws
   {
      let json: String =
         #"""
      {
         "id": 4,
         "url": "https://ll.thespacedevs.com/2.2.0/config/spacecraft/4/",
         "name": "Orion",
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
         "in_use": true,
         "capability": "",
         "history": "The Orion Multi-Purpose Crew Vehicle (Orion MPCV) is an American spacecraft intended to carry a crew of four astronauts to destinations at or beyond low Earth orbit (LEO). Currently under development by NASA for launch on the Space Launch System, Orion is intended to facilitate human exploration of asteroids and of Mars, as well as to provide a means of delivering or retrieving crew or supplies from the ISS if needed.",
         "details": "The Orion MPCV takes basic design elements from the Apollo Command Module that took astronauts to the moon, but its technology and capability are more advanced. It is designed to support long-duration deep space missions, with up to 21 days active crew time plus 6 months quiescent. During the quiescent period crew life support would be provided by another module such as a Deep Space Habitat. The spacecraft's life support, propulsion, thermal protection and avionics systems are designed to be upgradeable as new technologies become available. nn The MPCV spacecraft includes both crew and service modules, and a spacecraft adaptor. The MPCV's crew module is larger than Apollo's and can support more crew members for short or long-duration missions. The service module fuels and propels the spacecraft as well as storing oxygen and water for astronauts. The service module's structure is also being designed to provide locations to mount scientific experiments and cargo.",
         "maiden_flight": null,
         "height": null,
         "diameter": null,
         "human_rated": false,
         "crew_capacity": null,
         "payload_capacity": null,
         "flight_life": null,
         "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/orion_image_20190207032521.jpeg",
         "nation_url": null,
         "wiki_link": "https://en.wikipedia.org/wiki/Orion_(spacecraft)",
         "info_link": ""
      }
      """#

      guard let spacecraftConfig: SpacecraftConfigJSON = SpacecraftConfigJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkSpacecraftConfig( spacecraft: spacecraftConfig, spacecraftID: 4, url: "https://ll.thespacedevs.com/2.2.0/config/spacecraft/4/",
                             name: "Orion",
                             type: "Unknown", inUse: true,
                             history: "The Orion Multi-Purpose Crew Vehicle (Orion MPCV) is an American spacecraft intended to carry a crew of four astronauts to destinations at or beyond low Earth orbit (LEO). Currently under development by NASA for launch on the Space Launch System, Orion is intended to facilitate human exploration of asteroids and of Mars, as well as to provide a means of delivering or retrieving crew or supplies from the ISS if needed.",
                             details: "The Orion MPCV takes basic design elements from the Apollo Command Module that took astronauts to the moon, but its technology and capability are more advanced. It is designed to support long-duration deep space missions, with up to 21 days active crew time plus 6 months quiescent. During the quiescent period crew life support would be provided by another module such as a Deep Space Habitat. The spacecraft's life support, propulsion, thermal protection and avionics systems are designed to be upgradeable as new technologies become available. nn The MPCV spacecraft includes both crew and service modules, and a spacecraft adaptor. The MPCV's crew module is larger than Apollo's and can support more crew members for short or long-duration missions. The service module fuels and propels the spacecraft as well as storing oxygen and water for astronauts. The service module's structure is also being designed to provide locations to mount scientific experiments and cargo.",
                             humanRated: false,
                             imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/orion_image_20190207032521.jpeg",
                             wikiURL: "https://en.wikipedia.org/wiki/Orion_(spacecraft)" )
      checkAgency( agency: spacecraftConfig.agency, agencyID: 44, name: "National Aeronautics and Space Administration",
                   featured: true, type: "Government", url: "https://ll.thespacedevs.com/2.2.0/agencies/44/",
                   countryCode: "USA", abbreviation: "NASA",
                   agencyDescription: "The National Aeronautics and Space Administration is an independent agency of the executive branch of the United States federal government responsible for the civilian space program, as well as aeronautics and aerospace research. NASA have many launch facilities but most are inactive. The most commonly used pad will be LC-39B at Kennedy Space Center in Florida.",
                   administrator: "Administrator: Jim Bridenstine", foundingYear: "1958", launchers: "Space Shuttle | SLS",
                   spacecraft: "Orion",
                   imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_images/national2520aeronautics2520and2520space2520administration_image_20190207032448.jpeg" )
   }

   func testSpacecraftConfig6() throws
   {
      let json: String =
      #"""
      {
         "id": 14,
         "url": "https://ll.thespacedevs.com/2.2.0/config/spacecraft/14/",
         "name": "Space Shuttle",
         "type": { "id": 1, "name": "Unknown" },
         "agency":
         {
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
      }
      """#

      guard let spacecraftConfig: SpacecraftConfigJSON = SpacecraftConfigJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkSpacecraftConfig( spacecraft: spacecraftConfig, spacecraftID: 14, url: "https://ll.thespacedevs.com/2.2.0/config/spacecraft/14/",
                             name: "Space Shuttle",
                             type: "Unknown", inUse: false, capability: "Carrying a crew of 7 astronauts along with cargo to Low Earth Orbit.",
                             history: "The Space shuttle was a United States space craft. Following the conclusion of the Apollo program the Space Shuttle intended to lower costs for reliable access to Low Earth Orbit. The program ran from 1981-2011.",
                             details: "The Space Shuttle was a partially reusable LEO spacecraft system operated by the U.S. National Aeronautics and Space Administration (NASA) as part of the Space Shuttle program. Its official program name was Space Transportation System (STS), taken from a 1969 plan for a system of reusable spacecraft of which it was the only item funded for development. The first of four orbital test flights occurred in 1981, leading to operational flights in 1982. In addition to the prototype whose completion was cancelled, five complete Shuttle systems were built and used on a total of 135 missions from 1981 to 2011, launched from the Kennedy Space Center (KSC) in Florida. Operational missions launched numerous satellites, interplanetary probes, and the Hubble Space Telescope (HST); conducted science experiments in orbit; and participated in construction and servicing of the International Space Station. The Shuttle fleet's total mission time was 1322 days, 19 hours, 21 minutes and 23 seconds.",
                             maidenFlight: "1981-04-12",
                             height: 56.1, diameter: 8.7, humanRated: true, crewCapacity: 7,
                             payloadCapacity: 27500, flightLife: "14 days",
                             imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/space2520shuttle_image_20190207032524.jpeg",
                             nationURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_nation/space2520shuttle_image_20181207003107.png",
                             wikiURL: "https://en.wikipedia.org/wiki/Space_Shuttle" )
      checkAgency( agency: spacecraftConfig.agency, agencyID: 44, name: "National Aeronautics and Space Administration",
                   featured: true, type: "Government", url: "https://ll.thespacedevs.com/2.2.0/agencies/44/",
                   countryCode: "USA", abbreviation: "NASA",
                   agencyDescription: "The National Aeronautics and Space Administration is an independent agency of the executive branch of the United States federal government responsible for the civilian space program, as well as aeronautics and aerospace research. NASA have many launch facilities but most are inactive. The most commonly used pad will be LC-39B at Kennedy Space Center in Florida.",
                   administrator: "Administrator: Jim Bridenstine", foundingYear: "1958", launchers: "Space Shuttle | SLS",
                   spacecraft: "Orion",
                   imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_images/national2520aeronautics2520and2520space2520administration_image_20190207032448.jpeg" )
   }
}
