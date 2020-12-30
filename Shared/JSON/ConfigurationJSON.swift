import Foundation
import CoreData

/**
 Specific configuration of a rocket.

 Part of a [RocketJSON]. Merged with a [RocketJSON] to make a [Rocket] entity.

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

   /** Broad name of the rocket family, like "Falcon 9". */
   var family: String?
   /** Merged string of the "family" and "type" attributes. */
   var fullName: String?
   /** ID of the location within the API. */
   var id: Int64
   /** TODO unkown */
   var launchLibraryID: Int64?
   /** TODO Same as "fullName"? */
   var name: String?
   /** API URI for this location. */
   var url: String?
   /** Specific type of the family, like "Block 5". */
   var variant: String?
}
