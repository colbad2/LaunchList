import Foundation
import CoreData

/**

 example JSON:
 {
     "abbrev": "TBC",
     "description": "Awaiting official confirmation - current date is known with some certainty.",
     "id": 8,
     "name": "To Be Confirmed"
 }
 */
struct StatusJSON: Decodable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case description, id, name

      case abbreviation = "abbrev"
   }

   var abbreviation: String?
   var description: String?
   var id: Int64
   var name: String?

   func addToCoreData( context: NSManagedObjectContext ) -> Status
   {
      let newStatus: Status = Status( context: context )

      newStatus.statusAbbreviation = self.abbreviation
      newStatus.statusDescription = self.description
      newStatus.id = self.id
      newStatus.name = self.name

      return newStatus
   }
}
