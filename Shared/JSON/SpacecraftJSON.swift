// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData


/**
 {
   "id": 77,
   "url": "https://ll.thespacedevs.com/2.1.0/spacecraft/77/",
   "name": "Soyuz TMA-16",
   "serial_number": "Soyuz TMA 11F732A17 #226",
   "status": { … },
   "description": "Soyuz TMA-16 was a Soyuz spacecraft which launched on September 30 2009 07:14 UTC. It transported two members of the Expedition 21 crew and one participant to the International Space Station. The Expedition 21 crew consisted of Maksim Surayev and Jeffrey Williams. The spaceflight participant was tourist Guy Laliberté.",
   "spacecraft_config": { … }
 }
 */
public struct SpacecraftJSON: Decodable, Identifiable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, url, name, serialNumber, status, spacecraftConfig

      case spacecraftDescription = "description"
   }

   public var id: Int64
   var url: String?
   var name: String?
   var serialNumber: String?
   var status: StatusJSON?
   var spacecraftDescription: String?
   var spacecraftConfig: SpacecraftConfigJSON?

   func addToCoreData( context: NSManagedObjectContext ) -> Spacecraft
   {
      let newSpacecraft: Spacecraft = Spacecraft( context: context )
      updateEntity( entity: newSpacecraft, context: context )

      return newSpacecraft
   }

   func updateEntity( entity: Spacecraft?, context: NSManagedObjectContext )
   {
      guard let entity = entity else { return }

      entity.id = self.id
      entity.url = self.url
      entity.name = self.name
      entity.serialNumber = self.serialNumber
      entity.status = self.status?.name
      entity.spacecraftDescription = self.spacecraftDescription

      if let spacecraftConfig = self.spacecraftConfig
      {
         let spacecraftConfigEntity: SpacecraftConfig = fetchSpacecraftConfig( spacecraftConfig: spacecraftConfig, context: context )
         entity.spacecraftConfig = spacecraftConfigEntity
         spacecraftConfigEntity.spacecraft = entity
      }
   }
}


// Core Data search/update

func getSpacecraft( by id: Int64, context: NSManagedObjectContext ) -> Spacecraft?
{
   return getEntityByID( id: id, context: context, entityName: "Spacecraft" ) as? Spacecraft
}

func fetchSpacecraft( spacecraft: SpacecraftJSON, context: NSManagedObjectContext ) -> Spacecraft
{
   let spacecraftEntity = getSpacecraft( by: spacecraft.id, context: context )
   spacecraft.updateEntity( entity: spacecraftEntity, context: context )
   return spacecraftEntity ?? spacecraft.addToCoreData( context: context )
}

func getSpacecraftCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "Spacecraft", context: context )
}

func getSampleSpacecraft() -> SpacecraftJSON
{
   let decoder = JSONDecoder()
   decoder.keyDecodingStrategy = .convertFromSnakeCase
   let jsonData = sampleSpacecraftJSON.data( using: .utf8 )!
   return try! decoder.decode( SpacecraftJSON.self, from: jsonData )
}

let sampleSpacecraftJSON =
"""
 {
   "id": 77,
   "url": "https://ll.thespacedevs.com/2.1.0/spacecraft/77/",
   "name": "Soyuz TMA-16",
   "serial_number": "Soyuz TMA 11F732A17 #226",
   "status": { … },
   "description": "Soyuz TMA-16 was a Soyuz spacecraft which launched on September 30 2009 07:14 UTC. It transported two members of the Expedition 21 crew and one participant to the International Space Station. The Expedition 21 crew consisted of Maksim Surayev and Jeffrey Williams. The spaceflight participant was tourist Guy Laliberté.",
   "spacecraft_config": { … }
 }
"""
