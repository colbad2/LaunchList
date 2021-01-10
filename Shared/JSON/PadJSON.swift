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
      updateEntity( entity: newPad, context: context )

      return newPad
   }

   func updateEntity( entity: Pad?, context: NSManagedObjectContext ) -> Void
   {
      guard let entity = entity else { return }

      entity.agencyID = self.agencyID ?? -1
      entity.id = self.id
      entity.infoURL = self.infoURL
      entity.latitude = self.latitude ?? ""
      entity.longitude = self.longitude ?? ""

      // TODO all of these kinds of assignments should be extension funcs on the CD entity
      if let loc = self.location
      {
         entity.location = fetchLocation( location: loc, context: context )
         entity.location?.pad = entity
      }

      entity.mapImage = self.mapImage

      let mapURL = self.mapURL?.trim()
      if mapURL != nil && mapURL!.count > 0
      {
         entity.mapURL = mapURL!.fixBadUTF()
         // TODO Pad at Guam International Airport has a map URL like "https://www.google.com/maps/place/35Â°03'34.0"N+118Â°09'06.0"W/"
         // I fix it to "https://www.google.com/maps/place/35°03'34.0"N+118°09'06.0"W/", which works in a browser, but URL() fails
         // to convert it to a URL. So, the pad doesn't have a map link it could have. Try to fix the link to it works.
         // A number of other map links have the issue
      }
      
      entity.name = self.name
      entity.totalLaunchCount = self.totalLaunchCount ?? -1

      let wikiURL = self.wikiURL?.trim()
      if wikiURL != nil && wikiURL!.count > 0
      {
         entity.wikiURL = wikiURL
      }
   }
}

// Core Data search/update

func getPad( by id: Int64, context: NSManagedObjectContext ) -> Pad?
{
   return getEntityByID( id: id, context: context, entityName: "Pad" ) as? Pad
}

func fetchPad( pad: PadJSON, context: NSManagedObjectContext ) -> Pad
{
   let padEntity = getPad( by: pad.id, context: context )
   pad.updateEntity( entity: padEntity, context: context )
   return padEntity ?? pad.addToCoreData( context: context )
}

func getPadCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "Pad", context: context )
}

func getSamplePadEntity() -> Pad
{
   let context = PersistenceController.preview.container.viewContext
   let pad = getEntityByID( id: 87,
                            context: context,
                            entityName: "Pad" ) as! Pad

   return pad
}

func getSamplePad() -> PadJSON?
{
   return parseJSONString( json: samplePadJSON )
}

private let samplePadJSON =
"""
    {
      "id": 87,
      "url": "https://ll.thespacedevs.com/2.1.0/pad/87/",
      "agency_id": null,
      "name": "Launch Complex 39A",
      "info_url": null,
      "wiki_url": "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39A",
      "map_url": "http://maps.google.com/maps?q=28.608+N,+80.604+W",
      "latitude": "28.60822681",
      "longitude": "-80.60428186",
      "location": {
        "id": 27,
        "url": "https://ll.thespacedevs.com/2.1.0/location/27/",
        "name": "Kennedy Space Center, FL, USA",
        "country_code": "USA",
        "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
        "total_launch_count": 182,
        "total_landing_count": 0
      },
      "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_87_20200803143537.jpg",
      "total_launch_count": 125
    }
"""
