// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
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
struct LauncherJSON: Decodable
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

   func addToCoreData( context: NSManagedObjectContext ) -> Launcher
   {
      let newLauncher: Launcher = Launcher( context: context )
      updateEntity( entity: newLauncher, context: context )

      return newLauncher
   }

   func updateEntity( entity: Launcher?, context: NSManagedObjectContext ) -> Void
   {
      guard let entity = entity else { return }

      entity.id = self.id
      entity.flightProven = self.flightProven ?? false
      entity.serialNumber = self.serialNumber
      entity.status = self.status
      entity.details = self.details

      if let config = self.launcherConfig
      {
         entity.launcherConfig = fetchLauncherConfig( launcherConfig: config, context: context )
         entity.launcherConfig?.launcher = entity
      }

      entity.imageURL = self.imageURL
      entity.flights = self.flights
      entity.lastLaunchDate = self.lastLaunchDate
      entity.firstLaunchDate = self.firstLaunchDate
   }
}

// Core Data search/update

func getLauncher( by id: Int64, context: NSManagedObjectContext ) -> Launcher?
{
   return getEntityByID( id: id, context: context, entityName: "Launcher" ) as? Launcher
}

func fetchLauncher( launcher: LauncherJSON, context: NSManagedObjectContext ) -> Launcher
{
   let launcherEntity = getLauncher( by: launcher.id, context: context )
   launcher.updateEntity( entity: launcherEntity, context: context )
   return launcherEntity ?? launcher.addToCoreData( context: context )
}

func getLauncherCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "Launcher", context: context )
}

func getSampleLauncher() -> LauncherJSON?
{
   return parseJSONString( json: sampleLauncherJSON )
}

private let sampleLauncherJSON =
"""
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
"""
