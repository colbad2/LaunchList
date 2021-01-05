import CoreData

/**
 The larger location of the launch, that contains the launch pad itself. For example, the Kennedy
 Space Center would be the locaton for Launch Complex 39A.

 Part of a [PadJSON].

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
   /** Three-letter country code containing the location. */
   var countryCode: String?
   /** ID of the location within the API. */
   var id: Int64
   /** URL to a map of the location. */
   var mapImage: String?
   /** Human-readable name for the location. */
   var name: String?
   /** Number of landings that have occurred at the location. */
   var totalLandingCount: Int64?
   /** Number of launches that have occurred at the location. */
   var totalLaunchCount: Int64?
   /** API URI for this location. */
   var url: String?

   /**
    Add this location to Core Data as a [Location] entity. The context still needs to be saved after the add.

    - Parameter context: Core Data context to add the entity to.
    - Returns: the added entity
    */
   func addToCoreData( context: NSManagedObjectContext ) -> Location
   {
      let newLocation: Location = Location( context: context )
      updateEntity( entity: newLocation, context: context )

      return newLocation
   }

   func updateEntity( entity: Location?, context: NSManagedObjectContext ) -> Void
   {
      if entity == nil { return }

      entity?.countryCode = self.countryCode
      entity?.id = self.id
      entity?.mapImage = self.mapImage
      entity?.name = self.name
      entity?.totalLandingCount = self.totalLandingCount ?? -1
      entity?.totalLaunchCount = self.totalLaunchCount ?? -1
   }
}


// Core Data search/update

func getLocation( by id: Int64, context: NSManagedObjectContext ) -> Location?
{
   return getEntityByID( id: id, context: context, entityName: "Location" ) as? Location
}

func fetchLocation( location: LocationJSON, context: NSManagedObjectContext ) -> Location
{
   let locationEntity = getLocation( by: location.id, context: context )
   location.updateEntity( entity: locationEntity, context: context )
   return locationEntity ?? location.addToCoreData( context: context )
}

func getLocationCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "Location", context: context )
}

func getSampleLocation() -> LocationJSON?
{
   let decoder = JSONDecoder()
   decoder.keyDecodingStrategy = .convertFromSnakeCase

   do
   {
      let jsonData = sampleLocationJSON.data( using: .utf8 )!
      return try decoder.decode( LocationJSON.self, from: jsonData )
   }
   catch { print("error: ", error) }

   return nil
}

let sampleLocationJSON =
"""
         {
           "id": 10,
           "url": "https://ll.thespacedevs.com/2.1.0/location/10/",
           "name": "Onenui Station, Mahia Peninsula, New Zealand",
           "country_code": "NZL",
           "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_10_20200803142509.jpg",
           "total_launch_count": 17,
           "total_landing_count": 1
         }
"""
