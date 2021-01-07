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
   var type: EventTypeJSON? // TODO make a generic "Type"/"Status" JSON struct
   var agency: AgencyJSON?
   var inUse: Bool?
   var imageURL: String?

   func addToCoreData( context: NSManagedObjectContext ) -> SpacecraftConfig
   {
      let newSpacecraftConfig: SpacecraftConfig = SpacecraftConfig( context: context )
      updateEntity( entity: newSpacecraftConfig, context: context )

      return newSpacecraftConfig
   }

   func updateEntity( entity: SpacecraftConfig?, context: NSManagedObjectContext )
   {
      guard let entity = entity else { return }

      entity.id = self.id
      entity.url = self.url
      entity.type = self.type?.name

      if let agency = self.agency
      {
         let agencyEntity: Agency = fetchAgency( agency: agency, context: context )
         entity.agency = agencyEntity
         agencyEntity.addToSpacecraftConfigs( entity ) // TODO don't add if it already in flightVehicles!! All have this problem
      }
   }
}



// Core Data search/update

func getSpacecraftConfig( by id: Int64, context: NSManagedObjectContext ) -> SpacecraftConfig?
{
   return getEntityByID( id: id, context: context, entityName: "SpacecraftConfig" ) as? SpacecraftConfig
}

func fetchSpacecraftConfig( spacecraftConfig: SpacecraftConfigJSON, context: NSManagedObjectContext ) -> SpacecraftConfig
{
   let spacecraftConfigEntity = getSpacecraftConfig( by: spacecraftConfig.id, context: context )
   spacecraftConfig.updateEntity( entity: spacecraftConfigEntity, context: context )
   return spacecraftConfigEntity ?? spacecraftConfig.addToCoreData( context: context )
}

func getSpacecraftConfigCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "SpacecraftConfig", context: context )
}

func getSampleSpacecraftConfig() -> SpacecraftConfigJSON?
{
   return parseJSONString( json: sampleSpacecraftConfigJSON )
}

private let sampleSpacecraftConfigJSON =
"""
          {
            "id": 1,
            "url": "https://ll.thespacedevs.com/2.1.0/config/spacecraft/1/",
            "name": "Soyuz",
            "type": {
              "id": 1,
              "name": "Unknown"
            },
            "agency": {
              "id": 63,
              "url": "https://ll.thespacedevs.com/2.1.0/agencies/63/",
              "name": "Russian Federal Space Agency (ROSCOSMOS)",
              "type": "Government"
            },
            "in_use": true,
            "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/soyuz_image_20201015191152.jpg"
          }
"""
