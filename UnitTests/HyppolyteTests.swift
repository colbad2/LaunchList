// Copyright © 2021 Bradford Holcombe. All rights reserved.

import XCTest

class HippolyteTests: XCTestCase
{
   func testStub()
   {
      guard let gitUrl = URL( string: "http://www.apple.com" ) else { return }
      let response: StubResponse = StubResponse.Builder()
                                 .stubResponse( withStatusCode: 204 )
                                 .addHeader( withKey: "X-Foo", value: "Bar" )
                                 .build()
      let request: StubRequest = StubRequest.Builder()
                               .stubRequest( withMethod: .GET, url: gitUrl )
                               .addResponse( response )
                               .build()
      Hippolyte.shared.add( stubbedRequest: request )
      Hippolyte.shared.start()

      // make the request
   }

   func test2()
   {
      guard let gitUrl = URL( string: "https://api.github.com/users/shashikant86" ) else { return }
      var stub: StubRequest = StubRequest( method: .GET, url: gitUrl )
      var response: StubResponse = StubResponse()
      guard let path: Bundle = Bundle( for: type( of: self ) ).path( forResource: "Feed", ofType: "json" ) else { return }
      guard let data: NSData = NSData( contentsOfFile: path ) else { return }
      let body: NSData = data
      response.body = body as Data
      stub.response = response
      Hippolyte.shared.add( stubbedRequest: stub )
      Hippolyte.shared.start()
   }

   override func tearDown()
   {
      Hippolyte.shared.stop()
      super.tearDown()
   }
}
