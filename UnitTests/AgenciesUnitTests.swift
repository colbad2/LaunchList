// Copyright © 2021 Bradford Holcombe. All rights reserved.

import XCTest

public class AgenciesUnitTests: XCTestCase
{
   private var decoder: JSONDecoder

   override public func setUp()
   {
      super.setUp()
      decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase
   }

   //   func testParseJSON() throws
   //   {
   //      let agenciesProvider: AgenciesProvider = AgenciesProvider()
   //
   //      XCTAssertNotNil( agenciesProvider.agencies )
   //      XCTAssertEqual( agenciesProvider.agencies.totalCount, 268 )
   //      XCTAssertEqual( agenciesProvider.agencies.nextGroupURL,
   //             "https://ll.thespacedevs.com/2.1.0/agencies/?limit=100&offset=100" )
   //      XCTAssertNil( agenciesProvider.agencies.previousGroupURL )
   //      XCTAssertEqual( agenciesProvider.agencies.agenciesSublist?.count, 100 )
   //   }
}
