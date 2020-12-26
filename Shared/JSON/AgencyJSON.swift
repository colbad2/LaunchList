import Foundation
import CoreData

struct AgencyJSON: Decodable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, url, name, title
   }

   var id: Int64
   var url: URL?
   var name: String?
   var title: String?

   func addToCoreData( context: NSManagedObjectContext ) -> Agency
   {
      let newAgency: Agency = Agency( context: context )

      newAgency.id = self.id
      newAgency.url = self.url
      newAgency.name = self.name
      newAgency.title = self.title

      return newAgency
   }
}
