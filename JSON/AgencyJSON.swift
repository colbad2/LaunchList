// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable line_length

/**
 Agency involved in the launch program.

 Part of a `Program` "agencies" list.

 ### Example JSON:
    {
      "id": 136,
      "url": "https://ll.thespacedevs.com/2.1.0/agencies/136/",
      "name": "Ad Astra Rocket Company",
      "featured": false,
      "type": "Commercial",
      "country_code": "USA",
      "abbrev": "AARC",
      "description": "Ad Astra Rocket Company is an American Space Company doing research and development in plasma propulsion technology. This involves using the technology of VASIMR developed in the late '70s, developed by the companies founder, Franklin Diaz. They have begun testing of their VF-200 model engine, built for interplanetary travel.",
      "administrator": "Dr. Franklin Chang Diaz",
      "founding_year": "2005",
      "launchers": "None",
      "spacecraft": "VX-200, VF-200",
      "parent": null,
      "image_url": null
    }
 */
public struct AgencyJSON: Decodable, Identifiable, JSONElement
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, url, name, featured, type, countryCode, administrator, foundingYear, launchers, spacecraft, parent

      case abbreviation = "abbrev"
      case agencyDescription = "description"
      case imageURL = "imageUrl"
   }

   public var id: Int64
   var url: String? // unused
   var name: String?
   var featured: Bool?
   var type: String?
   var countryCode: String?
   var abbreviation: String?
   var agencyDescription: String?
   var administrator: String?
   var foundingYear: String?
   var launchers: String?
   var spacecraft: String?
   var parent: String?
   var imageURL: String?

   public func addToCoreData( context: NSManagedObjectContext ) -> Agency
   {
      let newAgency: Agency = Agency( context: context )
      updateEntity( entity: newAgency )

      return newAgency
   }

   public func updateEntity( entity: Agency? )
   {
      guard let agencyEntity = entity else { return }

      agencyEntity.id = id
      agencyEntity.name = name
      agencyEntity.type = type
      agencyEntity.countryCodes = getCountryCodes( countryCode: countryCode )
      agencyEntity.abbreviation = abbreviation

      if var admin: String = administrator
      {
         admin = admin.removePrefix( "Administrator: " ) // DATABASE CORRECTION
         agencyEntity.administrator = admin
      }

      agencyEntity.agencyDescription = agencyDescription
      agencyEntity.foundingYear = foundingYear

      if launchers?.count ?? 0 > 0 && launchers != "None" // DATABASE CORRECTION
      {
         agencyEntity.launchers = self.launchers
      }

      if spacecraft?.count ?? 0 > 0 && spacecraft != "None" // DATABASE CORRECTION
      {
         agencyEntity.spacecraft = spacecraft
      }

      agencyEntity.parent = parent
      agencyEntity.imageURL = imageURL

      // add flags for holes in the API
      if let name: String = agencyEntity.name,
         let correction: String = countryCodeCorrections[ name ]
      {
         agencyEntity.countryCodes?.append( correction ) // DATABASE CORRECTION
      }

      agencyEntity.sortableName = name?.lowercased()
      agencyEntity.fetched = Date()
   }
}
