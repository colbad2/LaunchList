// Copyright © 2021 Bradford Holcombe. All rights reserved.

import XCTest

class LocationJSONUnitTests: XCTestCase
{
   func testLocationJSON1() throws
   {
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

      guard let location: LocationJSON = LocationJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkLocation( location: location, locationID: 12, countryCode: "USA",
                     mapImage: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_12_20200803142519.jpg",
                     name: "Cape Canaveral, FL, USA", landingCount: 20, lauchCount: 208,
                     url: "https://ll.thespacedevs.com/2.1.0/location/12/" )
   }

   func testLocationJSON2() throws
   {
      let json: String =
         """
      {
          "country_code": "UNK",
          "id": 22,
          "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_22_20200803142419.jpg",
          "name": "Unknown Location",
          "total_landing_count": 0,
          "total_launch_count": 0,
          "url": "https://ll.thespacedevs.com/2.1.0/location/22/"
      }
      """

      guard let location: LocationJSON = LocationJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkLocation( location: location, locationID: 22, countryCode: "UNK",
                     mapImage: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_22_20200803142419.jpg",
                     name: "Unknown Location", landingCount: 0, lauchCount: 0,
                     url: "https://ll.thespacedevs.com/2.1.0/location/22/" )
   }
}
