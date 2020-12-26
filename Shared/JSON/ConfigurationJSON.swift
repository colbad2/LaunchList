import Foundation
import CoreData

/**

 example JSON:
 {
     "family": "Falcon",
     "full_name": "Falcon 9 Block 5",
     "id": 164,
     "launch_library_id": 188,
     "name": "Falcon 9 Block 5",
     "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/164/",
     "variant": "Block 5"
 }
 */
struct ConfigurationJSON: Decodable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case family, fullName, id, name, url, variant

      case launchLibraryID = "launchLibraryId"
   }

   var family: String?
   var fullName: String?
   var id: Int64
   var launchLibraryID: Int64?
   var name: String?
   var url: URL?
   var variant: String?

   func addToCoreData( context: NSManagedObjectContext ) -> Configuration
   {
      let newConfiguration: Configuration = Configuration( context: context )

      newConfiguration.family = self.family
      newConfiguration.fullName = self.fullName
      newConfiguration.id = self.id
      newConfiguration.launchLibraryID = self.launchLibraryID ?? -1
      newConfiguration.name = self.name
      newConfiguration.url = self.url
      newConfiguration.variant = self.variant

      return newConfiguration
   }
}
