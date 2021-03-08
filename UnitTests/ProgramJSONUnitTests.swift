// Copyright © 2021 Bradford Holcombe. All rights reserved.

// swiftlint:disable line_length
// swiftlint:disable function_body_length

import XCTest

class ProgramJSONUnitTests: XCTestCase
{
   func testProgramJSON() throws
   {
      let json: String =
      """
      {
          "agencies": [
              {
                  "id": 44,
                  "name": "National Aeronautics and Space Administration",
                  "type": "Government",
                  "url": "https://ll.thespacedevs.com/2.1.0/agencies/44/"
              },
              {
                  "id": 257,
                  "name": "Northrop Grumman Innovation Systems",
                  "type": "Commercial",
                  "url": "https://ll.thespacedevs.com/2.1.0/agencies/257/"
              },
              {
                  "id": 1020,
                  "name": "Sierra Nevada Corporation",
                  "type": "Commercial",
                  "url": "https://ll.thespacedevs.com/2.1.0/agencies/1020/"
              },
              {
                  "id": 121,
                  "name": "SpaceX",
                  "type": "Commercial",
                  "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
              }
          ],
          "description": "Commercial Resupply Services (CRS) are a series of flights awarded by NASA for the delivery of cargo and supplies to the International Space Station.The first CRS contracts were signed in 2008 and awarded $1.6 billion to SpaceX for twelve cargo Dragon and $1.9 billion to Orbital Sciences for eight Cygnus flights, covering deliveries to 2016. The Falcon 9 and Antares rockets were also developed under the CRS program to deliver cargo spacecraft to the ISS.",
          "end_date": null,
          "id": 11,
          "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/program_images/commercial2520_program_20201129212219.png",
          "info_url": null,
          "name": "Commercial Resupply Services",
          "start_date": "2008-12-23T00:00:00Z",
          "url": "https://ll.thespacedevs.com/2.1.0/program/11/",
          "wiki_url": "https://en.wikipedia.org/wiki/Commercial_Resupply_Services#Commercial_Resupply_Services"
      }
      """

      guard let program: ProgramJSON = ProgramJSON( parseJSON( jsonString: json ) ) else { XCTFail( "can't load test data" ); return }

      checkProgram( program: program, programID: 11,
                    description: "Commercial Resupply Services (CRS) are a series of flights awarded by NASA for the delivery of cargo and supplies to the International Space Station.The first CRS contracts were signed in 2008 and awarded $1.6 billion to SpaceX for twelve cargo Dragon and $1.9 billion to Orbital Sciences for eight Cygnus flights, covering deliveries to 2016. The Falcon 9 and Antares rockets were also developed under the CRS program to deliver cargo spacecraft to the ISS.",
                    endDate: nil,
                    imageURL: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/program_images/commercial2520_program_20201129212219.png",
                    infoURL: nil, name: "Commercial Resupply Services",
                    startDate: "2008-12-23T00:00:00Z",
                    url: "https://ll.thespacedevs.com/2.1.0/program/11/",
                    wikiURL: "https://en.wikipedia.org/wiki/Commercial_Resupply_Services#Commercial_Resupply_Services" )
      XCTAssertNotNil( program.agencies )
      XCTAssertEqual( program.agencies.count, 4 )
      XCTAssertNotNil( program.agencies[ 0 ] )
      checkAgency( agency: program.agencies[ 0 ], agencyID: 44, name: "National Aeronautics and Space Administration",
                   type: "Government", url: "https://ll.thespacedevs.com/2.1.0/agencies/44/" )
      XCTAssertNotNil( program.agencies[ 1 ] )
      checkAgency( agency: program.agencies[ 1 ], agencyID: 257, name: "Northrop Grumman Innovation Systems",
                   type: "Commercial", url: "https://ll.thespacedevs.com/2.1.0/agencies/257/" )
      XCTAssertNotNil( program.agencies[ 2 ] )
      checkAgency( agency: program.agencies[ 2 ], agencyID: 1020, name: "Sierra Nevada Corporation",
                   type: "Commercial", url: "https://ll.thespacedevs.com/2.1.0/agencies/1020/" )
      XCTAssertNotNil( program.agencies[ 3 ] )
      checkAgency( agency: program.agencies[ 3 ], agencyID: 121, name: "SpaceX",
                   type: "Commercial", url: "https://ll.thespacedevs.com/2.1.0/agencies/121/" )
   }
}
