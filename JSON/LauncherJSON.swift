// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**

 ### Example JSON
       {
         "id": 8,
         "url": "https://ll.thespacedevs.com/2.1.0/launcher/8/",
         "flight_proven": false,
         "serial_number": "B0003",
         "status": "expended",
         "details": "Core expended on flight, no recovery effort. First flight of Falcon 9",
         "launcher_config": {
           "id": 169,
           "launch_library_id": 90,
           "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/169/",
           "name": "Falcon 9 v1.0",
           "family": "Falcon",
           "full_name": "Falcon 9 v1.0",
           "variant": "v1.0"
         },
         "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_core_images/8_image_20191115082425.jpg",
         "flights": 1,
         "last_launch_date": "2010-06-04T18:45:00Z",
         "first_launch_date": "2010-06-04T18:45:00Z"
       }
 */
public struct LauncherJSON: Decodable, JSONElement
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, url, flightProven, serialNumber, status, details, launcherConfig, flights, lastLaunchDate, firstLaunchDate

      case imageURL = "imageUrl"
   }

   var id: Int64
   var url: String? // unused
   var flightProven: Bool?
   var serialNumber: String?
   var status: String?
   var details: String?
   var launcherConfig: LauncherConfigJSON?
   var imageURL: String?
   var flights: Int64
   var lastLaunchDate: String?
   var firstLaunchDate: String?

   public func addToCoreData( context: NSManagedObjectContext ) -> Launcher
   {
      let newLauncher: Launcher = Launcher( context: context )
      updateEntity( entity: newLauncher, context: context )

      return newLauncher
   }

   public func updateEntity( entity: Launcher?, context: NSManagedObjectContext )
   {
      guard let launcherEntity = entity else { return }

      launcherEntity.id = id
      launcherEntity.flightProven = flightProven ?? false
      launcherEntity.serialNumber = serialNumber
      launcherEntity.status = status
      launcherEntity.details = details
      launcherEntity.addLauncherConfigFromJSON( config: launcherConfig, context: context )
      launcherEntity.imageURL = imageURL
      launcherEntity.flights = flights
      launcherEntity.lastLaunchDate = lastLaunchDate
      launcherEntity.firstLaunchDate = firstLaunchDate

      launcherEntity.fetched = Date()
   }
}
