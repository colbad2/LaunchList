// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 ### Example JSON
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
public struct LauncherConfigJSON: Decodable, JSONElement
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

   public func addToCoreData( context: NSManagedObjectContext ) -> LauncherConfig
   {
      let newLauncherConfig: LauncherConfig = LauncherConfig( context: context )
      updateEntity( entity: newLauncherConfig, context: context )

      return newLauncherConfig
   }

   public func updateEntity( entity: LauncherConfig?, context: NSManagedObjectContext )
   {
      guard let launcherConfigEntity = entity else { return }

      launcherConfigEntity.id = id
      launcherConfigEntity.name = name
      launcherConfigEntity.family = family
      launcherConfigEntity.fullName = fullName

      launcherConfigEntity.fetched = Date()
   }
}
