import Foundation
import CoreData

/**

 Example JSON:
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
struct AgencyJSON: Decodable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, url, name, featured, type, countryCode, administrator, foundingYear, launchers, spacecraft, parent

      case abbreviation = "abbrev"
      case agencyDescription = "description"
      case imageURL = "imageUrl"
   }

   var id: Int64
   var url: String?
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

   func addToCoreData( context: NSManagedObjectContext ) -> Agency
   {
      let newAgency: Agency = Agency( context: context )

      newAgency.id = self.id
      newAgency.url = wrapURL( self.url )
      newAgency.name = self.name
      newAgency.featured = self.featured ?? false
      newAgency.type = self.type
      newAgency.countryCode = self.countryCode
      newAgency.abbreviation = self.abbreviation
      newAgency.agencyDescription = self.agencyDescription
      newAgency.administrator = self.administrator
      newAgency.foundingYear = self.foundingYear
      newAgency.launchers = self.launchers
      newAgency.spacecraft = self.spacecraft
      newAgency.parent = self.parent
      newAgency.imageURL = self.imageURL

      return newAgency
   }
}
