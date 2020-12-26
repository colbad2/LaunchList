import Foundation
import CoreData

/**

 example JSON:
 {
     "abbrev": "GTO",
     "id": 2,
     "name": "Geostationary Transfer Orbit"
 }
 */
struct OrbitJSON: Decodable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, name

      case abbreviation = "abbrev"
   }

   var abbreviation: String?
   var id: Int64
   var name: String?

   func addToCoreData( context: NSManagedObjectContext ) -> Orbit
   {
      let newOrbit: Orbit = Orbit( context: context )

      newOrbit.abbreviation = self.abbreviation
      newOrbit.id = self.id
      newOrbit.name = self.name

      return newOrbit
   }
}
