// Copyright © 2021 Bradford Holcombe. All rights reserved.

import XCTest

class OrbitJSONUnitTests: XCTestCase
{
   func testOrbitJSON() throws
   {
      let json: String =
         """
        {
            "abbrev": "GTO",
            "id": 2,
            "name": "Geostationary Transfer Orbit"
        }
      """

      guard let orbit: OrbitJSON = OrbitJSON( json: parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkOrbit( orbit: orbit, id: 2, name: "Geostationary Transfer Orbit", abbreviation: "GTO" )
   }
}
