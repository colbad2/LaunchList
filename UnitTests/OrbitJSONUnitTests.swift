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

      guard let jsonData: Data = json.data( using: .utf8 ) else { XCTFail( "can't load test data" ); return }
      let orbit: OrbitJSON? = OrbitJSON( json: parseJSON( data: jsonData ) )

      XCTAssertNotNil( orbit )
      XCTAssertEqual( orbit?.abbreviation, "GTO" )
      XCTAssertEqual( orbit?.id, 2 )
      XCTAssertEqual( orbit?.name, "Geostationary Transfer Orbit" )
   }
}
