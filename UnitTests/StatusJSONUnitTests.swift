// Copyright © 2021 Bradford Holcombe. All rights reserved.

import XCTest

class StatusJSONUnitTests: XCTestCase
{
   func testStatusJSON() throws
   {
      let json: String =
         """
       {
           "abbrev": "TBC",
           "description": "Awaiting official confirmation - current date is known with some certainty.",
           "id": 8,
           "name": "To Be Confirmed"
       }
      """

      guard let jsonData: Data = json.data( using: .utf8 ) else { XCTFail( "can't load test data" ); return }
      let status: StatusJSON? = StatusJSON( json: parseJSON( data: jsonData ) )
      checkStatus( status: status, abbreviation: "TBC",
                   description: "Awaiting official confirmation - current date is known with some certainty.",
                   statusID: 8, name: "To Be Confirmed" )
   }
}
