import Foundation
import CoreData

/**

 example JSON:
 {
     "country_code": "USA",
     "id": 12,
     "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_12_20200803142519.jpg",
     "name": "Cape Canaveral, FL, USA",
     "total_landing_count": 20,
     "total_launch_count": 208,
     "url": "https://ll.thespacedevs.com/2.1.0/location/12/"
 }
 */
struct LocationJSON: Decodable
{
   var countryCode: String?
   var id: Int64?
   var mapImage: String?
   var name: String?
   var totalLandingCount: Int64?
   var totalLaunchCount: Int64?
   var url: String?

   func addToCoreData( context: NSManagedObjectContext ) -> Location
   {
      let newLocation: Location = Location( context: context )

      newLocation.countryCode = self.countryCode
      newLocation.id = self.id ?? -1
      newLocation.mapImage = self.mapImage
      newLocation.name = self.name
      newLocation.totalLandingCount = self.totalLandingCount ?? -1
      newLocation.totalLaunchCount = self.totalLaunchCount ?? -1
      newLocation.url = self.url

      return newLocation
   }
}
