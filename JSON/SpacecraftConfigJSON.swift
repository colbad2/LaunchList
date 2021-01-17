// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 {
   "id": 1,
   "url": "https://ll.thespacedevs.com/2.1.0/config/spacecraft/1/",
   "name": "Soyuz",
   "type": { … },
   "agency": { … },
   "in_use": true,
   "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/soyuz_image_20201015191152.jpg"
 }
 */
public struct SpacecraftConfigJSON: Decodable, Identifiable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, url, name, type, agency, inUse, imageURL
   }

   public var id: Int64
   var url: String?
   var name: String?
   var type: EventTypeJSON?
   var agency: AgencyJSON?
   var inUse: Bool?
   var imageURL: String?

   public func addToCoreData( context: NSManagedObjectContext ) -> SpacecraftConfig
   {
      let newSpacecraftConfig: SpacecraftConfig = SpacecraftConfig( context: context )
      updateEntity( entity: newSpacecraftConfig, context: context )

      return newSpacecraftConfig
   }

   public func updateEntity( entity: SpacecraftConfig?, context: NSManagedObjectContext )
   {
      guard let entity = entity else { return }

      entity.id = self.id
      entity.url = self.url
      entity.type = self.type?.name

      if let agency: AgencyJSON = self.agency
      {
         let agencyEntity: Agency = fetchAgency( agency: agency, context: context )
         entity.agency = agencyEntity
         agencyEntity.addToSpacecraftConfigs( entity )
      }
   }
}