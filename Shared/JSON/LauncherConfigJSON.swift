// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 {
     "id": 169,
     "launch_library_id": 90,
     "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/169/",
     "name": "Falcon 9 v1.0",
     "family": "Falcon",
     "full_name": "Falcon 9 v1.0",
     "variant": "v1.0"
   }
 }
 */
struct LauncherConfigJSON: Decodable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, url, name, family, fullName

      case launchLibraryID = "launchLibraryId"
   }

   var id: Int64
   var url: String? // unused
   var launchLibraryID: Int64? // unused
   var name: String?
   var family: String?
   var fullName: String?

   func addToCoreData( context: NSManagedObjectContext ) -> LauncherConfig
   {
      let newLauncherConfig: LauncherConfig = LauncherConfig( context: context )
      updateEntity( entity: newLauncherConfig, context: context )

      return newLauncherConfig
   }

   func updateEntity( entity: LauncherConfig?, context: NSManagedObjectContext ) -> Void
   {
      // TODO all other JSON objects use guard like this
      guard let entity = entity else { return }

      entity.id = self.id
      entity.name = self.name
      entity.family = self.family
      entity.fullName = self.fullName
   }
}

// Core Data search/update

func getLauncherConfig( by id: Int64, context: NSManagedObjectContext ) -> LauncherConfig?
{
   return getEntityByID( id: id, context: context, entityName: "LauncherConfig" ) as? LauncherConfig
}

func fetchLauncherConfig( launcherConfig: LauncherConfigJSON, context: NSManagedObjectContext ) -> LauncherConfig
{
   let launcherConfigEntity = getLauncherConfig( by: launcherConfig.id, context: context )
   launcherConfig.updateEntity( entity: launcherConfigEntity, context: context )
   return launcherConfigEntity ?? launcherConfig.addToCoreData( context: context )
}

func getLauncherConfigCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "LauncherConfig", context: context )
}

func getSampleLauncherConfig() -> LauncherConfigJSON?
{
   return parseJSONString( json: sampleLauncherConfigJSON )
}

private let sampleLauncherConfigJSON =
"""
 {
     "id": 169,
     "launch_library_id": 90,
     "url": "https://ll.thespacedevs.com/2.1.0/config/launcherConfig/169/",
     "name": "Falcon 9 v1.0",
     "family": "Falcon",
     "full_name": "Falcon 9 v1.0",
     "variant": "v1.0"
   }
"""