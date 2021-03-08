// Copyright © 2021 Bradford Holcombe. All rights reserved.

import XCTest

class PadJSONUnitTests: XCTestCase
{
   func testPadJSON() throws
   {
      let json: String =
      """
      {
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
      }
      """

      guard let pad: PadJSON = PadJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkPad( pad: pad, padID: 80, agencyID: 121, lat: "28.56194122", lon: "-80.57735736",
                mapImage: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_80_20200803143323.jpg",
                mapURL: "http://maps.google.com/maps?q=28.56194122,-80.57735736",
                name: "Space Launch Complex 40", totalLaunchCount: 63,
                url: "https://ll.thespacedevs.com/2.1.0/pad/80/",
                wikiURL: "https://en.wikipedia.org/wiki/Cape_Canaveral_Air_Force_Station_Space_Launch_Complex_40" )
      checkLocation( location: pad.location, locationID: 12, countryCode: "USA",
                     mapImage: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_12_20200803142519.jpg",
                     name: "Cape Canaveral, FL, USA", landingCount: 20, lauchCount: 208,
                     url: "https://ll.thespacedevs.com/2.1.0/location/12/" )
   }

   func testPadJSON2() throws
   {

      let json: String =
      """
      {
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
      }
      """

      guard let pad: PadJSON = PadJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkPad( pad: pad, padID: 54, lat: "0.0", lon: "0.0",
                mapImage: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_54_20200803143536.jpg",
                name: "Unknown Pad", totalLaunchCount: 0,
                url: "https://ll.thespacedevs.com/2.1.0/pad/54/" )
      checkLocation( location: pad.location, locationID: 22, countryCode: "UNK",
                     mapImage: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_22_20200803142419.jpg",
                     name: "Unknown Location", landingCount: 0, lauchCount: 0,
                     url: "https://ll.thespacedevs.com/2.1.0/location/22/" )
   }
}
