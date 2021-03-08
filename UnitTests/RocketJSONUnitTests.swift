// Copyright © 2021 Bradford Holcombe. All rights reserved.

import XCTest

class RocketJSONUnitTests: XCTestCase
{
   func testRocketJSON() throws
   {
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

      guard let rocket: RocketJSON = RocketJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      XCTAssertNotNil( rocket )
      checkLauncherConfig( launcher: rocket.configuration, launcherID: 164, libraryID: 188,
                           url: "https://ll.thespacedevs.com/2.1.0/config/launcher/164/",
                           name: "Falcon 9 Block 5",
                           family: "Falcon", fullName: "Falcon 9 Block 5",
                           variant: "Block 5" )
      XCTAssertEqual( rocket.id, 136 )
   }
}
