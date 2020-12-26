import Foundation
import CoreData

/**

 example JSON:
 {
     "agency_id": 121,
     "id": 80,
     "info_url": null,
     "latitude": "28.56194122",
     "location": { .. },
     "longitude": "-80.57735736",
     "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_80_20200803143323.jpg",
     "map_url": "http://maps.google.com/maps?q=28.56194122,-80.57735736",
     "name": "Space Launch Complex 40",
     "total_launch_count": 63,
     "url": "https://ll.thespacedevs.com/2.1.0/pad/80/",
     "wiki_url": "https://en.wikipedia.org/wiki/Cape_Canaveral_Air_Force_Station_Space_Launch_Complex_40"
 }
 */
struct PadJSON: Decodable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, latitude, location, longitude, mapImage, name, totalLaunchCount, url

      case agencyID = "agencyId"
      case infoURL = "infoUrl"
      case mapURL = "mapUrl"
      case wikiURL = "wikiUrl"
   }

   var agencyID: Int64?
   var id: Int64
   var infoURL: URL?
   var latitude: String
   var longitude: String
   var location: LocationJSON?
   var mapImage: URL?
   var mapURL: URL?
   var name: String?
   var totalLaunchCount: Int64?
   var url: URL?
   var wikiURL: URL?

   func addToCoreData( context: NSManagedObjectContext ) -> Pad
   {
      let newPad: Pad = Pad( context: context )

      newPad.agencyID = self.agencyID ?? -1
      newPad.id = self.id
      newPad.infoURL = self.infoURL
      newPad.latitude = Double( self.latitude )!
      newPad.longitude = Double( self.longitude )!
      
      newPad.location = self.location?.addToCoreData( context: context )
      newPad.location?.pad = newPad

      newPad.mapImage = self.mapImage
      newPad.mapURL = self.mapURL
      newPad.name = self.name
      newPad.totalLaunchCount = self.totalLaunchCount ?? -1
      newPad.url = self.url
      newPad.wikiURL = self.wikiURL

      return newPad
   }
}
