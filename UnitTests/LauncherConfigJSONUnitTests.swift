// Copyright © 2021 Bradford Holcombe. All rights reserved.

// swiftlint:disable line_length

import XCTest

class LauncherConfigJSONUnitTests: XCTestCase
{
   func testRocketConfig() throws
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
               LauncherConfigJSON( json: parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkLauncherConfig( launcher: rocketConfiguration, launcherID: 164, libraryID: 188,
                           url: "https://ll.thespacedevs.com/2.1.0/config/launcher/164/",
                           name: "Falcon 9 Block 5",
                           family: "Falcon", fullName: "Falcon 9 Block 5",
                           variant: "Block 5" )
   }

   // found 3 errors
   func testExample() throws
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

      guard let launcher: LauncherConfigJSON = LauncherConfigJSON( json: parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkLauncherConfig( launcher: launcher, launcherID: 126, libraryID: 158, url: "https://ll.thespacedevs.com/2.2.0/config/launcher/126/",
                           name: "Ares I-X",
                           description: "Ares I was the crew launch vehicle that was being developed by NASA as part of the Constellation program. Ares I-X was a design concept demonstrator, that had a dummy second stage and a partially functional first stage.",
                           family: "Ares", fullName: "Ares I-X", variant: "I-X",
                           alias: "", minStage: 1, maxStage: 1, length: 99.7,
                           diameter: 3.71, maidenFlight: "2009-10-28", launchMass: 816,
                           takeoffThrust: 12000,
                           imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/ares2520i-x_image_20190222030444.jpeg",
                           wikiURL: "https://en.wikipedia.org/wiki/Ares_I", consecutiveSuccessfulLaunches: 1,
                           successfulLaunches: 1, failedLaunches: 0, pendingLaunches: 0 )
   }
}

func checkLauncherConfig( launcher: LauncherConfigJSON?, launcherID: Int64, libraryID: Int64? = nil, url: String? = nil, name: String? = nil,
                          description: String? = nil, family: String? = nil, fullName: String? = nil, variant: String? = nil,
                          alias: String? = nil, minStage: Int64? = nil, maxStage: Int64? = nil, length: Double? = nil,
                          diameter: Double? = nil, maidenFlight: String? = nil, launchMass: Int64? = nil, leoCapacity: Int64? = nil,
                          gtoCapacity: Int64? = nil, takeoffThrust: Int64? = nil, apogee: Int64? = nil, vehicleRange: Int64? = nil,
                          imageURL: String? = nil, infoURL: String? = nil, wikiURL: String? = nil, consecutiveSuccessfulLaunches: Int64? = nil,
                          successfulLaunches: Int64? = nil, failedLaunches: Int64? = nil, pendingLaunches: Int64? = nil )
{
   XCTAssertNotNil( launcher )
   XCTAssertEqual( launcher?.id, launcherID )
   XCTAssertEqual( launcher?.launchLibraryID, libraryID )
   XCTAssertEqual( launcher?.url, url )
   XCTAssertEqual( launcher?.name, name )
   XCTAssertEqual( launcher?.launcherConfigDescription, description )
   XCTAssertEqual( launcher?.family, family )
   XCTAssertEqual( launcher?.fullName, fullName )
   XCTAssertEqual( launcher?.variant, variant )
   XCTAssertEqual( launcher?.alias, alias )
   XCTAssertEqual( launcher?.minStage, minStage )
   XCTAssertEqual( launcher?.maxStage, maxStage )
   XCTAssertEqual( launcher?.length, length )
   XCTAssertEqual( launcher?.diameter, diameter )
   XCTAssertEqual( launcher?.maidenFlight, maidenFlight )
   XCTAssertEqual( launcher?.launchMass, launchMass )
   XCTAssertEqual( launcher?.leoCapacity, leoCapacity )
   XCTAssertEqual( launcher?.gtoCapacity, gtoCapacity )
   XCTAssertEqual( launcher?.takeoffThrust, takeoffThrust )
   XCTAssertEqual( launcher?.apogee, apogee )
   XCTAssertEqual( launcher?.vehicleRange, vehicleRange )
   XCTAssertEqual( launcher?.imageURL, imageURL )
   XCTAssertEqual( launcher?.infoURL, infoURL )
   XCTAssertEqual( launcher?.wikiURL, wikiURL )
   XCTAssertEqual( launcher?.consecutiveSuccessfulLaunches, consecutiveSuccessfulLaunches )
   XCTAssertEqual( launcher?.successfulLaunches, successfulLaunches )
   XCTAssertEqual( launcher?.failedLaunches, failedLaunches )
   XCTAssertEqual( launcher?.pendingLaunches, pendingLaunches )
}
