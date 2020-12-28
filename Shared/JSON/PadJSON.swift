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

 example JSON 2:
 {
     "agency_id": null,
     "id": 54,
     "info_url": null,
     "latitude": "0.0",
     "location": {
         "country_code": "UNK",
         "id": 22,
         "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_22_20200803142419.jpg",
         "name": "Unknown Location",
         "total_landing_count": 0,
         "total_launch_count": 0,
         "url": "https://ll.thespacedevs.com/2.1.0/location/22/"
     },
     "longitude": "0.0",
     "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_54_20200803143536.jpg",
     "map_url": "",
     "name": "Unknown Pad",
     "total_launch_count": 0,
     "url": "https://ll.thespacedevs.com/2.1.0/pad/54/",
     "wiki_url": ""
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
   var infoURL: String?
   var latitude: String?
   var longitude: String?
   var location: LocationJSON?
   var mapImage: String?
   var mapURL: String?
   var name: String?
   var totalLaunchCount: Int64?
   var url: String?
   var wikiURL: String?

   func addToCoreData( context: NSManagedObjectContext ) -> Pad
   {
      let newPad: Pad = Pad( context: context )

      newPad.agencyID = self.agencyID ?? -1
      newPad.id = self.id
      newPad.infoURL = wrapURL( self.infoURL )
      newPad.latitude = Double( self.latitude ?? "0.0" )!
      newPad.longitude = Double( self.longitude ?? "0.0" )!
      
      newPad.location = self.location?.addToCoreData( context: context )
      newPad.location?.pad = newPad

      newPad.mapImage = wrapURL( self.mapImage )
      newPad.mapURL = wrapURL( self.mapURL )
      newPad.name = self.name
      newPad.totalLaunchCount = self.totalLaunchCount ?? -1
      newPad.url = wrapURL( self.url )
      newPad.wikiURL = wrapURL( self.wikiURL )

      return newPad
   }
}
