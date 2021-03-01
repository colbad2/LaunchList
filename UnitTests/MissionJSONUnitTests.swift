// Copyright © 2021 Bradford Holcombe. All rights reserved.

// swiftlint:disable line_length

import XCTest

class MissionJSONUnitTests: XCTestCase
{
   func testMissionJSON1() throws
   {
      let json: String =
      #"""
      {
          "description": "T\u00fcrksat 5A is the first of two Turkish next generation communications satellites, which will be operated by T\u00fcrksat for commercial and military purposes.",
          "id": 1222,
          "launch_designator": null,
          "launch_library_id": null,
          "name": "T\u00fcrksat 5A",
          "orbit": {
              "abbrev": "GTO",
              "id": 2,
              "name": "Geostationary Transfer Orbit"
          },
          "type": "Communications"
      }
      """#

      guard let mission: MissionJSON = MissionJSON( json: parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkMission( mission: mission, missionID: 1222,
                    description: "T\u{00fc}rksat 5A is the first of two Turkish next generation communications satellites, which will be operated by T\u{00fc}rksat for commercial and military purposes.",
                    name: "T\u{00fc}rksat 5A", type: "Communications",
                    orbitAbbreviation: "GTO", orbitLibraryID: 2, orbitName: "Geostationary Transfer Orbit" )
   }

   func testMissionJSON2() throws
   {
      let json: String =
      #"""
      {
         "description": "SXM-8 is a large high power broadcasting satellite for SiriusXM's digital audio radio service (DARS).\n\nSpace Systems/Loral (SS/L) got in July 2016 the contract to build the two satellites based on their SSL-1300 bus - SXM-7 and SXM-8. Both operate in the S-band spectrum. Each satellite will generate more than 20-kW of power and will have a large unfurlable antenna reflector, which enables broadcast to radios without the need for large dish-type antennas on the ground.\n\nSXM-8 is meant to replace the XM-4 satellite.",
         "id": 1045,
         "launch_designator": null,
         "launch_library_id": 1245,
         "name": "SXM-8",
         "orbit": null,
         "type": "Communications"
      }
      """#

      guard let mission: MissionJSON = MissionJSON( json: parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkMission( mission: mission, missionID: 1045,
                    description: "SXM-8 is a large high power broadcasting satellite for SiriusXM's digital audio radio service (DARS).\n\nSpace Systems/Loral (SS/L) got in July 2016 the contract to build the two satellites based on their SSL-1300 bus - SXM-7 and SXM-8. Both operate in the S-band spectrum. Each satellite will generate more than 20-kW of power and will have a large unfurlable antenna reflector, which enables broadcast to radios without the need for large dish-type antennas on the ground.\n\nSXM-8 is meant to replace the XM-4 satellite.",
                    libraryID: 1245, name: "SXM-8", type: "Communications" )
   }
}
