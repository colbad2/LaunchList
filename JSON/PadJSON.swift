// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**

 ### Example JSON:
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

 ### Example JSON 2:
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
public struct PadJSON: Decodable
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

   public func addToCoreData( context: NSManagedObjectContext ) -> Pad
   {
      let newPad: Pad = Pad( context: context )
      updateEntity( entity: newPad, context: context )

      return newPad
   }

   public func updateEntity( entity: Pad?, context: NSManagedObjectContext )
   {
      guard let entity = entity else { return }

      entity.agencyID = self.agencyID ?? -1
      entity.id = self.id
      entity.infoURL = self.infoURL
      entity.latitude = self.latitude ?? ""
      entity.longitude = self.longitude ?? ""

      // TODO all of these kinds of assignments should be extension funcs on the CD entity
      if let loc: LocationJSON = self.location
      {
         entity.location = fetchLocation( location: loc, context: context )
         entity.location?.pad = entity
      }

      entity.mapImage = self.mapImage

      if let mapURL: String = self.mapURL?.trim()
      {
         if !mapURL.isEmpty
         {
            entity.mapURL = mapURL.fixBadUTF()
            // TODO Pad at Guam International Airport has a map URL like "https://www.google.com/maps/place/35Â°03'34.0"N+118Â°09'06.0"W/"
            // I fix it to "https://www.google.com/maps/place/35°03'34.0"N+118°09'06.0"W/", which works in a browser, but URL() fails
            // to convert it to a URL. So, the pad doesn't have a map link it could have. Try to fix the link so it works.
            // A number of other map links have the issue
         }
      }

      if let padName: String = self.name
      {
         var name: String = padName
         if !name.isEmpty && name.first?.isNumber ?? false
         {
            name = "Pad " + name
         }
         entity.name = name
      }

      entity.totalLaunchCount = self.totalLaunchCount ?? -1

      if let wikiURL: String = self.wikiURL?.trim()
      {
         if !wikiURL.isEmpty
         {
            entity.wikiURL = wikiURL
         }
      }
   }
}
