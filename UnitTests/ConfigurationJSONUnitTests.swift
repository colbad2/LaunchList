// Copyright © 2021 Bradford Holcombe. All rights reserved.

import XCTest

class ConfigurationJSONUnitTests: XCTestCase
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

      guard let rocketConfiguration: ConfigurationJSON =
               ConfigurationJSON( json: parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkConfiguration( config: rocketConfiguration, configID: 164, family: "Falcon", fullName: "Falcon 9 Block 5",
                          libraryID: 188, name: "Falcon 9 Block 5",
                          url: "https://ll.thespacedevs.com/2.1.0/config/launcher/164/",
                          variant: "Block 5" )
   }
}
