// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable line_length

/**
 ### Example JSON
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
   var statusName: String?
   var statusAbbreviation: String?
   var statusDescription: String?
   var spacecraftDescription: String?
   var spacecraftConfig: SpacecraftConfigJSON?

   public func addToCoreData( context: NSManagedObjectContext ) -> Spacecraft
   {
      let newSpacecraft: Spacecraft = Spacecraft( context: context )
      updateEntity( entity: newSpacecraft, context: context )

      return newSpacecraft
   }

   public func updateEntity( entity: Spacecraft?, context: NSManagedObjectContext )
   {
      guard let spacecraftEntity = entity else { return }

      spacecraftEntity.id = id
      spacecraftEntity.url = url
      spacecraftEntity.name = name
      spacecraftEntity.serialNumber = serialNumber
      spacecraftEntity.status = status?.name
      spacecraftEntity.statusName = status?.name
      spacecraftEntity.statusAbbreviation = status?.abbreviation
      spacecraftEntity.statusDescription = status?.description
      spacecraftEntity.spacecraftDescription = spacecraftDescription
      spacecraftEntity.addSpacecraftConfigFromJSON( spacecraftConfig: spacecraftConfig, context: context )

      spacecraftEntity.fetched = Date()
   }
}
