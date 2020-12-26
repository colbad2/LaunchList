import Foundation
import CoreData

/**

 example JSON:
 {
     "configuration": { … },
     "id": 136
 }
 */
struct RocketJSON: Decodable
{
   var configuration: ConfigurationJSON?
   var id: Int64

   func addToCoreData( context: NSManagedObjectContext ) -> Rocket
   {
      let newRocket: Rocket = Rocket( context: context )

      newRocket.configuration = self.configuration?.addToCoreData( context: context )
      newRocket.configuration?.rocket = newRocket
      
      newRocket.id = self.id

      return newRocket
   }
}

