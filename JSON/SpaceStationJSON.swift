// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 ### Example JSON
       {
         "id": 14,
         "url": "https://ll.thespacedevs.com/2.1.0/spacestation/14/",
         "name": "Salyut 6",
         "status": {
           "id": 2,
           "name": "De-Orbited"
         },
         "orbit": "Low Earth Orbit",
         "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/spacestation_images/salyut25206_image_20190318095930.jpg"
       }
 */
public struct SpaceStationJSON: Decodable, JSONElement
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, url, name, status, orbit

      case imageURL = "imageUrl"
   }

   let id: Int64
   let url: String? // unused
   let name: String?
   let status: StatusJSON?
   var statusName: String?
   var statusAbbreviation: String?
   var statusDescription: String?
   let orbit: String?
   let imageURL: String?

   public func addToCoreData( context: NSManagedObjectContext ) -> SpaceStation
   {
      let newSpaceStation: SpaceStation = SpaceStation( context: context )
      updateEntity( entity: newSpaceStation, context: context )

      return newSpaceStation
   }

   public func updateEntity( entity: SpaceStation?, context: NSManagedObjectContext )
   {
      guard let spaceStationEntity = entity else { return }

      spaceStationEntity.id = id
      spaceStationEntity.name = name
      spaceStationEntity.status = status?.name
      spaceStationEntity.statusName = status?.name
      spaceStationEntity.statusAbbreviation = status?.abbreviation
      spaceStationEntity.statusDescription = status?.description
      spaceStationEntity.orbit = orbit
      spaceStationEntity.imageURL = imageURL

      spaceStationEntity.fetched = Date()
   }
}
