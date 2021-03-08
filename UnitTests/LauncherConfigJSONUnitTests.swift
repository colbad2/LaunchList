// Copyright © 2021 Bradford Holcombe. All rights reserved.

import XCTest

// swiftlint:disable line_length
// swiftlint:disable type_body_length
// swiftlint:disable function_body_length

class LauncherConfigJSONUnitTests: XCTestCase
{
   func testSmalConfig() throws
   {
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

      guard let rocketConfiguration: LauncherConfigJSON =
               LauncherConfigJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkLauncherConfig( launcher: rocketConfiguration, launcherID: 164, libraryID: 188,
                           url: "https://ll.thespacedevs.com/2.1.0/config/launcher/164/",
                           name: "Falcon 9 Block 5",
                           family: "Falcon", fullName: "Falcon 9 Block 5",
                           variant: "Block 5" )
   }

   // found 3 errors
   func testLauncherConfig1() throws
   {
      let json: String =
      """
      {
         "id": 126,
         "launch_library_id": 158,
         "url": "https://ll.thespacedevs.com/2.2.0/config/launcher/126/",
         "name": "Ares I-X",
         "description": "Ares I was the crew launch vehicle that was being developed by NASA as part of the Constellation program. Ares I-X was a design concept demonstrator, that had a dummy second stage and a partially functional first stage.",
         "family": "Ares",
         "full_name": "Ares I-X",
         "variant": "I-X",
         "alias": "",
         "min_stage": 1,
         "max_stage": 1,
         "length": 99.7,
         "diameter": 3.71,
         "maiden_flight": "2009-10-28",
         "launch_mass": 816,
         "leo_capacity": null,
         "gto_capacity": null,
         "to_thrust": 12000,
         "apogee": null,
         "vehicle_range": null,
         "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/ares2520i-x_image_20190222030444.jpeg",
         "info_url": null,
         "wiki_url": "https://en.wikipedia.org/wiki/Ares_I",
         "consecutive_successful_launches": 1,
         "successful_launches": 1,
         "failed_launches": 0,
         "pending_launches": 0
      }
      """

      guard let launcher: LauncherConfigJSON = LauncherConfigJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkLauncherConfig( launcher: launcher, launcherID: 126, libraryID: 158, url: "https://ll.thespacedevs.com/2.2.0/config/launcher/126/",
                           name: "Ares I-X",
                           description: "Ares I was the crew launch vehicle that was being developed by NASA as part of the Constellation program. Ares I-X was a design concept demonstrator, that had a dummy second stage and a partially functional first stage.",
                           family: "Ares", fullName: "Ares I-X", variant: "I-X",
                           minStage: 1, maxStage: 1, length: 99.7,
                           diameter: 3.71, maidenFlight: "2009-10-28", launchMass: 816,
                           takeoffThrust: 12000,
                           imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/ares2520i-x_image_20190222030444.jpeg",
                           wikiURL: "https://en.wikipedia.org/wiki/Ares_I", consecutiveSuccessfulLaunches: 1,
                           successfulLaunches: 1, failedLaunches: 0, pendingLaunches: 0 )
   }

   func testLauncherConfig2() throws
   {
      let json: String =
      """
      {
          "id": 162,
          "launch_library_id": 140,
          "url": "https://ll.thespacedevs.com/2.2.0/config/launcher/162/",
          "name": "Atlas",
          "description": "The Atlas LV-3B, Atlas D Mercury Launch Vehicle or Mercury-Atlas Launch Vehicle, was a human-rated expendable launch system used as part of the United States Project Mercury to send astronauts into low Earth orbit. Manufactured by American aircraft manufacturing company Convair, it was derived from the SM-65D Atlas missile, and was a member of the Atlas family of rockets.",
          "family": "Atlas",
          "full_name": "Atlas LV-3B",
          "variant": "LV-3B",
          "alias": "",
          "min_stage": 1,
          "max_stage": 1,
          "length": 28.7,
          "diameter": 3,
          "maiden_flight": "1960-07-29",
          "launch_mass": 120,
          "leo_capacity": 1360,
          "gto_capacity": null,
          "to_thrust": 1300,
          "apogee": null,
          "vehicle_range": null,
          "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/atlas_image_20190222030015.jpeg",
          "info_url": null,
          "wiki_url": "https://en.wikipedia.org/wiki/Atlas_LV-3B",
          "consecutive_successful_launches": 6,
          "successful_launches": 6,
          "failed_launches": 1,
          "pending_launches": 0
       }
      """

      guard let launcher: LauncherConfigJSON = LauncherConfigJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkLauncherConfig( launcher: launcher, launcherID: 162, libraryID: 140, url: "https://ll.thespacedevs.com/2.2.0/config/launcher/162/",
                           name: "Atlas",
                           description: "The Atlas LV-3B, Atlas D Mercury Launch Vehicle or Mercury-Atlas Launch Vehicle, was a human-rated expendable launch system used as part of the United States Project Mercury to send astronauts into low Earth orbit. Manufactured by American aircraft manufacturing company Convair, it was derived from the SM-65D Atlas missile, and was a member of the Atlas family of rockets.",
                           family: "Atlas", fullName: "Atlas LV-3B", variant: "LV-3B",
                           minStage: 1, maxStage: 1, length: 28.7,
                           diameter: 3, maidenFlight: "1960-07-29", launchMass: 120, leoCapacity: 1360,
                           takeoffThrust: 1300,
                           imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/atlas_image_20190222030015.jpeg",
                           wikiURL: "https://en.wikipedia.org/wiki/Atlas_LV-3B", consecutiveSuccessfulLaunches: 6,
                           successfulLaunches: 6, failedLaunches: 1, pendingLaunches: 0 )
   }

   func testLauncherConfig3() throws
   {
      let json: String =
      """
      {
         "id": 342,
         "launch_library_id": null,
         "url": "https://ll.thespacedevs.com/2.2.0/config/launcher/342/",
         "name": "Nike Cajun",
         "description": "The Nike-Cajun was a two-stage sounding rocket built by combining a Nike base stage with a Cajun upper stage. It was launched 714 times between 1956 and 1976 and was the most frequently used sounding rocket of the western world.",
         "family": "",
         "full_name": "Nike Cajun",
         "variant": "",
         "alias": "",
         "min_stage": 2,
         "max_stage": 2,
         "length": 7.7,
         "diameter": 0.42,
         "maiden_flight": "1956-07-06",
         "launch_mass": 0,
         "leo_capacity": null,
         "gto_capacity": null,
         "to_thrust": 246,
         "apogee": null,
         "vehicle_range": null,
         "image_url": null,
         "info_url": "",
         "wiki_url": "https://en.wikipedia.org/wiki/Nike-Cajun",
         "consecutive_successful_launches": 0,
         "successful_launches": 0,
         "failed_launches": 0,
         "pending_launches": 0
      }
      """

      guard let launcher: LauncherConfigJSON = LauncherConfigJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkLauncherConfig( launcher: launcher, launcherID: 342, url: "https://ll.thespacedevs.com/2.2.0/config/launcher/342/",
                           name: "Nike Cajun",
                           description: "The Nike-Cajun was a two-stage sounding rocket built by combining a Nike base stage with a Cajun upper stage. It was launched 714 times between 1956 and 1976 and was the most frequently used sounding rocket of the western world.",
                           fullName: "Nike Cajun",
                           minStage: 2, maxStage: 2, length: 7.7,
                           diameter: 0.42, maidenFlight: "1956-07-06", launchMass: 0,
                           takeoffThrust: 246,
                           wikiURL: "https://en.wikipedia.org/wiki/Nike-Cajun", consecutiveSuccessfulLaunches: 0,
                           successfulLaunches: 0, failedLaunches: 0, pendingLaunches: 0 )
   }

   func testLauncherConfig4() throws
   {
      let json: String =
      #"""
      {
         "id": 195,
         "launch_library_id": null,
         "url": "https://ll.thespacedevs.com/2.2.0/config/launcher/195/",
         "name": "Orion Abort Test Booster",
         "description": "The Orion Abort Test Booster is a small solid rocket launcher developed by Northropp Grumman.\r\n\r\nIt uses a single stage Peacekeeper missile first stage motor [SR118] inside an Aero-Shell to replicate the Orion Service Module 5.5 meter diameter.",
         "family": "",
         "full_name": "Orion Abort Test Booster",
         "variant": "",
         "alias": "",
         "min_stage": 1,
         "max_stage": 1,
         "length": null,
         "diameter": 5.5,
         "maiden_flight": "2019-07-02",
         "launch_mass": null,
         "leo_capacity": null,
         "gto_capacity": null,
         "to_thrust": 2200,
         "apogee": null,
         "vehicle_range": null,
         "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/orion2520abort2520test2520booster_image_20190701191116.jpeg",
         "info_url": "https://www.nasa.gov/sites/default/files/atoms/files/aa2_fact_sheet.pdf",
         "wiki_url": "https://en.wikipedia.org/wiki/Orion_Abort_Test_Booster",
         "consecutive_successful_launches": 1,
         "successful_launches": 1,
         "failed_launches": 0,
         "pending_launches": 0
      }
      """#

      guard let launcher: LauncherConfigJSON = LauncherConfigJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkLauncherConfig( launcher: launcher, launcherID: 195, url: "https://ll.thespacedevs.com/2.2.0/config/launcher/195/",
                           name: "Orion Abort Test Booster",
                           description: "The Orion Abort Test Booster is a small solid rocket launcher developed by Northropp Grumman.\r\n\r\nIt uses a single stage Peacekeeper missile first stage motor [SR118] inside an Aero-Shell to replicate the Orion Service Module 5.5 meter diameter.",
                           fullName: "Orion Abort Test Booster",
                           minStage: 1, maxStage: 1,
                           diameter: 5.5, maidenFlight: "2019-07-02",
                           takeoffThrust: 2200,
                           imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/orion2520abort2520test2520booster_image_20190701191116.jpeg",
                           infoURL: "https://www.nasa.gov/sites/default/files/atoms/files/aa2_fact_sheet.pdf",
                           wikiURL: "https://en.wikipedia.org/wiki/Orion_Abort_Test_Booster", consecutiveSuccessfulLaunches: 1,
                           successfulLaunches: 1, failedLaunches: 0, pendingLaunches: 0 )
   }

   func testLauncherConfig5() throws
   {
      let json: String =
         #"""
      {
         "id": 163,
         "launch_library_id": 135,
         "url": "https://ll.thespacedevs.com/2.2.0/config/launcher/163/",
         "name": "Saturn IB",
         "description": "The Saturn IB (pronounced \"one B\", also known as the Uprated Saturn I) was an American launch vehicle commissioned by the National Aeronautics and Space Administration (NASA) for the Apollo program. It replaced the S-IV second stage of the Saturn I with the much more powerful S-IVB, able to launch a partially fueled Apollo Command/Service Module (CSM) or a fully fueled Lunar Module (LM) into low Earth orbit for early flight tests before the larger Saturn V needed for lunar flight was ready.",
         "family": "Saturn",
         "full_name": "Saturn IB",
         "variant": "IB",
         "alias": "",
         "min_stage": 2,
         "max_stage": 2,
         "length": 43.2,
         "diameter": 6.61,
         "maiden_flight": "1966-02-26",
         "launch_mass": 590,
         "leo_capacity": 21000,
         "gto_capacity": null,
         "to_thrust": 7100,
         "apogee": null,
         "vehicle_range": null,
         "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/saturn2520ib_image_20190222030046.jpeg",
         "info_url": null,
         "wiki_url": "https://en.wikipedia.org/wiki/Saturn_IB",
         "consecutive_successful_launches": 6,
         "successful_launches": 6,
         "failed_launches": 0,
         "pending_launches": 0
      }
      """#

      guard let launcher: LauncherConfigJSON = LauncherConfigJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkLauncherConfig( launcher: launcher, launcherID: 163, libraryID: 135, url: "https://ll.thespacedevs.com/2.2.0/config/launcher/163/",
                           name: "Saturn IB",
                           description: "The Saturn IB (pronounced \"one B\", also known as the Uprated Saturn I) was an American launch vehicle commissioned by the National Aeronautics and Space Administration (NASA) for the Apollo program. It replaced the S-IV second stage of the Saturn I with the much more powerful S-IVB, able to launch a partially fueled Apollo Command/Service Module (CSM) or a fully fueled Lunar Module (LM) into low Earth orbit for early flight tests before the larger Saturn V needed for lunar flight was ready.",
                           family: "Saturn", fullName: "Saturn IB", variant: "IB",
                           minStage: 2, maxStage: 2,
                           length: 43.2, diameter: 6.61, maidenFlight: "1966-02-26", launchMass: 590, leoCapacity: 21000,
                           takeoffThrust: 7100,
                           imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/saturn2520ib_image_20190222030046.jpeg",
                           wikiURL: "https://en.wikipedia.org/wiki/Saturn_IB", consecutiveSuccessfulLaunches: 6,
                           successfulLaunches: 6, failedLaunches: 0, pendingLaunches: 0 )
   }

   func testLauncherConfig6() throws
   {
      let json: String =
      #"""
      {
         "id": 93,
         "launch_library_id": 136,
         "url": "https://ll.thespacedevs.com/2.2.0/config/launcher/93/",
         "name": "Saturn V",
         "description": "The Saturn V was a human-rated expendable rocket used by NASA between 1967 and 1973. Most notably, the Saturn V took the Apollo program to the Moon. It still remains the world's tallest, heaviest, and most powerful rocket ever brought to operational status and is the only launch vehicle to take humans beyond LEO.",
         "family": "Saturn",
         "full_name": "Saturn V",
         "variant": "V",
         "alias": "",
         "min_stage": 3,
         "max_stage": 3,
         "length": 110.6,
         "diameter": 10.1,
         "maiden_flight": "1967-11-09",
         "launch_mass": 2970,
         "leo_capacity": 140000,
         "gto_capacity": null,
         "to_thrust": 35100,
         "apogee": null,
         "vehicle_range": null,
         "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/saturn2520v_image_20190222030036.jpeg",
         "info_url": null,
         "wiki_url": "https://en.wikipedia.org/wiki/Saturn_V",
         "consecutive_successful_launches": 13,
         "successful_launches": 13,
         "failed_launches": 0,
         "pending_launches": 0
      }
      """#

      guard let launcher: LauncherConfigJSON = LauncherConfigJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkLauncherConfig( launcher: launcher, launcherID: 93, libraryID: 136, url: "https://ll.thespacedevs.com/2.2.0/config/launcher/93/",
                           name: "Saturn V",
                           description: "The Saturn V was a human-rated expendable rocket used by NASA between 1967 and 1973. Most notably, the Saturn V took the Apollo program to the Moon. It still remains the world's tallest, heaviest, and most powerful rocket ever brought to operational status and is the only launch vehicle to take humans beyond LEO.",
                           family: "Saturn", fullName: "Saturn V", variant: "V",
                           minStage: 3, maxStage: 3,
                           length: 110.6, diameter: 10.1, maidenFlight: "1967-11-09", launchMass: 2970, leoCapacity: 140000,
                           takeoffThrust: 35100,
                           imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/saturn2520v_image_20190222030036.jpeg",
                           wikiURL: "https://en.wikipedia.org/wiki/Saturn_V", consecutiveSuccessfulLaunches: 13,
                           successfulLaunches: 13, failedLaunches: 0, pendingLaunches: 0 )
   }

   func testLauncherConfig7() throws
   {
      let json: String =
         #"""
      {
         "id": 185,
          "launch_library_id": 208,
          "url": "https://ll.thespacedevs.com/2.2.0/config/launcher/185/",
          "name": "Scout X-1",
          "description": "Scout X-1 was an American expendable launch system and sounding rocket which was flown seven times between August 1960 and October 1961.",
          "family": "Scout",
          "full_name": "Scout X-1",
          "variant": "X-1",
          "alias": "",
          "min_stage": 4,
          "max_stage": 4,
          "length": 25,
          "diameter": 1.01,
          "maiden_flight": "1960-07-02",
          "launch_mass": 16,
          "leo_capacity": 59,
          "gto_capacity": null,
          "to_thrust": 471,
          "apogee": 185,
          "vehicle_range": null,
          "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/scout2520x-1_image_20190324192636.jpeg",
          "info_url": null,
          "wiki_url": "https://en.wikipedia.org/wiki/Scout_X-1",
          "consecutive_successful_launches": 0,
          "successful_launches": 1,
          "failed_launches": 2,
          "pending_launches": 0
      }
      """#

      guard let launcher: LauncherConfigJSON = LauncherConfigJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkLauncherConfig( launcher: launcher, launcherID: 185, libraryID: 208, url: "https://ll.thespacedevs.com/2.2.0/config/launcher/185/",
                           name: "Scout X-1",
                           description: "Scout X-1 was an American expendable launch system and sounding rocket which was flown seven times between August 1960 and October 1961.",
                           family: "Scout", fullName: "Scout X-1", variant: "X-1",
                           minStage: 4, maxStage: 4,
                           length: 25, diameter: 1.01, maidenFlight: "1960-07-02", launchMass: 16, leoCapacity: 59,
                           takeoffThrust: 471, apogee: 185,
                           imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/scout2520x-1_image_20190324192636.jpeg",
                           wikiURL: "https://en.wikipedia.org/wiki/Scout_X-1", consecutiveSuccessfulLaunches: 0,
                           successfulLaunches: 1, failedLaunches: 2, pendingLaunches: 0 )
   }

   func testLauncherConfig8() throws
   {
      let json: String =
         #"""
      {
          "id": 205,
          "launch_library_id": 236,
          "url": "https://ll.thespacedevs.com/2.2.0/config/launcher/205/",
          "name": "SLS Block 1B",
          "description": "",
          "family": "",
          "full_name": "SLS Block 1B",
          "variant": "",
          "alias": "",
          "min_stage": null,
          "max_stage": null,
          "length": null,
          "diameter": null,
          "maiden_flight": null,
          "launch_mass": null,
          "leo_capacity": null,
          "gto_capacity": null,
          "to_thrust": null,
          "apogee": null,
          "vehicle_range": null,
          "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/sls_block_1b_image_20200905100013.jpeg",
          "info_url": null,
          "wiki_url": null,
          "consecutive_successful_launches": 0,
          "successful_launches": 0,
          "failed_launches": 0,
          "pending_launches": 4
      }
      """#

      guard let launcher: LauncherConfigJSON = LauncherConfigJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkLauncherConfig( launcher: launcher, launcherID: 205, libraryID: 236, url: "https://ll.thespacedevs.com/2.2.0/config/launcher/205/",
                           name: "SLS Block 1B",
                           fullName: "SLS Block 1B",
                           imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/sls_block_1b_image_20200905100013.jpeg",
                           consecutiveSuccessfulLaunches: 0,
                           successfulLaunches: 0, failedLaunches: 0, pendingLaunches: 4 )
   }

   func testLauncherConfig9() throws
   {
      let json: String =
         #"""
      {
          "id": 143,
          "launch_library_id": 144,
          "url": "https://ll.thespacedevs.com/2.2.0/config/launcher/143/",
          "name": "Space Launch System (SLS)",
          "description": "The Space Launch System (SLS) is an American Space Shuttle-derived heavy expendable launch vehicle. It is part of NASA's deep space exploration plans including a manned mission to Mars. SLS follows the cancellation of the Constellation program, and is to replace the retired Space Shuttle.",
          "family": "SLS",
          "full_name": "Space Launch System (SLS)",
          "variant": "",
          "alias": "",
          "min_stage": 2,
          "max_stage": 3,
          "length": 111,
          "diameter": 8.4,
          "maiden_flight": null,
          "launch_mass": null,
          "leo_capacity": 130000,
          "gto_capacity": null,
          "to_thrust": null,
          "apogee": null,
          "vehicle_range": null,
          "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/space2520launch2520system25202528sls2529_image_20190224012338.jpeg",
          "info_url": null,
          "wiki_url": "https://en.wikipedia.org/wiki/Space_Launch_System",
          "consecutive_successful_launches": 0,
          "successful_launches": 0,
          "failed_launches": 0,
          "pending_launches": 4
      }
      """#

      guard let launcher: LauncherConfigJSON = LauncherConfigJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkLauncherConfig( launcher: launcher, launcherID: 143, libraryID: 144, url: "https://ll.thespacedevs.com/2.2.0/config/launcher/143/",
                           name: "Space Launch System (SLS)",
                           description: "The Space Launch System (SLS) is an American Space Shuttle-derived heavy expendable launch vehicle. It is part of NASA's deep space exploration plans including a manned mission to Mars. SLS follows the cancellation of the Constellation program, and is to replace the retired Space Shuttle.",
                           family: "SLS", fullName: "Space Launch System (SLS)",
                           minStage: 2, maxStage: 3,
                           length: 111, diameter: 8.4, leoCapacity: 130000,
                           imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/space2520launch2520system25202528sls2529_image_20190224012338.jpeg",
                           wikiURL: "https://en.wikipedia.org/wiki/Space_Launch_System",
                           consecutiveSuccessfulLaunches: 0,
                           successfulLaunches: 0, failedLaunches: 0, pendingLaunches: 4 )
   }

   func testLauncherConfig10() throws
   {
      let json: String =
      #"""
      {
          "id": 98,
          "launch_library_id": 137,
          "url": "https://ll.thespacedevs.com/2.2.0/config/launcher/98/",
          "name": "Titan II",
          "description": "The Titan II GLV (Gemini Launch Vehicle) or Gemini-Titan II was an American expendable launch system derived from the Titan II missile, which was used to launch twelve Gemini missions for NASA between 1964 and 1966. Two unmanned launches followed by ten manned ones were conducted from Launch Complex 19 at the Cape Canaveral Air Force Station, starting with Gemini 1 on April 8, 1964.",
          "family": "Titan",
          "full_name": "Titan II GLV",
          "variant": "GLV",
          "alias": "",
          "min_stage": 2,
          "max_stage": 2,
          "length": 33.2,
          "diameter": 3.05,
          "maiden_flight": "1964-04-08",
          "launch_mass": 154,
          "leo_capacity": 3850,
          "gto_capacity": null,
          "to_thrust": 1913,
          "apogee": null,
          "vehicle_range": null,
          "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/titan2520ii_image_20190222030027.jpeg",
          "info_url": null,
          "wiki_url": "https://en.wikipedia.org/wiki/Titan_II_GLV",
          "consecutive_successful_launches": 10,
          "successful_launches": 10,
          "failed_launches": 0,
          "pending_launches": 0
      }
      """#

      guard let launcher: LauncherConfigJSON = LauncherConfigJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkLauncherConfig( launcher: launcher, launcherID: 98, libraryID: 137, url: "https://ll.thespacedevs.com/2.2.0/config/launcher/98/",
                           name: "Titan II",
                           description: "The Titan II GLV (Gemini Launch Vehicle) or Gemini-Titan II was an American expendable launch system derived from the Titan II missile, which was used to launch twelve Gemini missions for NASA between 1964 and 1966. Two unmanned launches followed by ten manned ones were conducted from Launch Complex 19 at the Cape Canaveral Air Force Station, starting with Gemini 1 on April 8, 1964.",
                           family: "Titan", fullName: "Titan II GLV", variant: "GLV",
                           minStage: 2, maxStage: 2,
                           length: 33.2, diameter: 3.05, maidenFlight: "1964-04-08",
                           launchMass: 154, leoCapacity: 3850, takeoffThrust: 1913,
                           imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/titan2520ii_image_20190222030027.jpeg",
                           wikiURL: "https://en.wikipedia.org/wiki/Titan_II_GLV",
                           consecutiveSuccessfulLaunches: 10,
                           successfulLaunches: 10, failedLaunches: 0, pendingLaunches: 0 )
   }

   func testLauncherConfig11() throws
   {
      let json: String =
      #"""
      {
          "id": 441,
          "launch_library_id": null,
          "url": "https://ll.thespacedevs.com/2.2.0/config/launcher/441/",
          "name": "Trailblazer 1",
          "description": "American test vehicle. The rocket's first three stages would take the upper stage package to a 260 km apogee. The upper stage package was mounted upside-down in relation to the other stages. When it had reached the peak, the three upper stages fired in sequence, ramming the payload, a 13 cm sphere, into the atmosphere at orbital re-entry speeds.",
          "family": "Trailblazer",
          "full_name": "Trailblazer 1",
          "variant": "1",
          "alias": "",
          "min_stage": 4,
          "max_stage": 4,
          "length": 17.1,
          "diameter": 0.58,
          "maiden_flight": "1959-03-03",
          "launch_mass": 3,
          "leo_capacity": null,
          "gto_capacity": null,
          "to_thrust": 365,
          "apogee": null,
          "vehicle_range": null,
          "image_url": null,
          "info_url": "",
          "wiki_url": null,
          "consecutive_successful_launches": 0,
          "successful_launches": 0,
          "failed_launches": 0,
          "pending_launches": 0
      }
      """#

      guard let launcher: LauncherConfigJSON = LauncherConfigJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkLauncherConfig( launcher: launcher, launcherID: 441, url: "https://ll.thespacedevs.com/2.2.0/config/launcher/441/",
                           name: "Trailblazer 1",
                           description: "American test vehicle. The rocket's first three stages would take the upper stage package to a 260 km apogee. The upper stage package was mounted upside-down in relation to the other stages. When it had reached the peak, the three upper stages fired in sequence, ramming the payload, a 13 cm sphere, into the atmosphere at orbital re-entry speeds.",
                           family: "Trailblazer", fullName: "Trailblazer 1", variant: "1",
                           minStage: 4, maxStage: 4,
                           length: 17.1, diameter: 0.58, maidenFlight: "1959-03-03",
                           launchMass: 3, takeoffThrust: 365,
                           consecutiveSuccessfulLaunches: 0,
                           successfulLaunches: 0, failedLaunches: 0, pendingLaunches: 0 )
   }

   func testLauncherConfig12() throws
   {
      let json: String =
      #"""
      {
          "id": 442,
          "launch_library_id": null,
          "url": "https://ll.thespacedevs.com/2.2.0/config/launcher/442/",
          "name": "Trailblazer 2",
          "description": "American test vehicle. NASA rocket designed for high-speed re-entry tests.",
          "family": "Trailblazer",
          "full_name": "Trailblazer 2",
          "variant": "2",
          "alias": "",
          "min_stage": 4,
          "max_stage": 4,
          "length": 15.7,
          "diameter": 0.79,
          "maiden_flight": "1961-12-14",
          "launch_mass": 6,
          "leo_capacity": null,
          "gto_capacity": null,
          "to_thrust": 547,
          "apogee": null,
          "vehicle_range": null,
          "image_url": null,
          "info_url": "",
          "wiki_url": null,
          "consecutive_successful_launches": 0,
          "successful_launches": 0,
          "failed_launches": 0,
          "pending_launches": 0
      }
      """#

      guard let launcher: LauncherConfigJSON = LauncherConfigJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkLauncherConfig( launcher: launcher, launcherID: 442, url: "https://ll.thespacedevs.com/2.2.0/config/launcher/442/",
                           name: "Trailblazer 2",
                           description: "American test vehicle. NASA rocket designed for high-speed re-entry tests.",
                           family: "Trailblazer", fullName: "Trailblazer 2", variant: "2",
                           minStage: 4, maxStage: 4,
                           length: 15.7, diameter: 0.79, maidenFlight: "1961-12-14",
                           launchMass: 6, takeoffThrust: 547,
                           consecutiveSuccessfulLaunches: 0,
                           successfulLaunches: 0, failedLaunches: 0, pendingLaunches: 0 )
   }
}
