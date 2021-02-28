// Copyright © 2021 Bradford Holcombe. All rights reserved.

import XCTest

public class AgenciesUnitTests: XCTestCase
{
   func testAgencyJSON() throws
   {
      let json: String =
         """
        {
            "id": 44,
            "name": "National Aeronautics and Space Administration",
            "type": "Government",
            "url": "https://ll.thespacedevs.com/2.1.0/agencies/44/"
        }
      """

      let agency: AgencyJSON? = AgencyJSON( json: parseJSON( jsonString: json ) )
      checkAgency( agency: agency, agencyID: 44, name: "National Aeronautics and Space Administration",
                   type: "Government", url: "https://ll.thespacedevs.com/2.1.0/agencies/44/" )
   }
}
