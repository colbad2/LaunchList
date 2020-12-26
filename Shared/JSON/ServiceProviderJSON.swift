import Foundation
import CoreData

/**

 Part of a [LaunchJSON] object

 example JSON:
 {
     "id": 121,
     "name": "SpaceX",
     "type": "Commercial",
     "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
 }
 */
struct ServiceProviderJSON: Decodable
{
   var id: Int64
   var name: String?
   var type: String?
   var url: URL?

   func addToCoreData( context: NSManagedObjectContext ) -> ServiceProvider
   {
      let newServiceProvider: ServiceProvider = ServiceProvider( context: context )

      newServiceProvider.id = self.id
      newServiceProvider.name = self.name
      newServiceProvider.type = self.type
      newServiceProvider.url = self.url

      return newServiceProvider
   }
}
