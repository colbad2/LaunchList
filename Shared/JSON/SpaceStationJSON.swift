// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable line_length
/**
 ### Example
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
struct SpaceStationJSON: Decodable
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

   func addToCoreData( context: NSManagedObjectContext ) -> SpaceStation
   {
      let newSpaceStation: SpaceStation = SpaceStation( context: context )
      updateEntity( entity: newSpaceStation, context: context )

      return newSpaceStation
   }

   func updateEntity( entity: SpaceStation?, context: NSManagedObjectContext )
   {
      guard let entity = entity else { return }

      entity.id = self.id
      entity.name = self.name

      entity.status = self.status?.name
      entity.statusName = self.status?.name
      entity.statusAbbreviation = self.status?.abbreviation
      entity.statusDescription = self.status?.description

      entity.orbit = self.orbit
      entity.imageURL = self.imageURL
   }
}

// Core Data search/update

func getSpaceStation( by entityID: Int64, context: NSManagedObjectContext ) -> SpaceStation?
{
   return getEntityByID( entityID: entityID, context: context, entityName: "SpaceStation" ) as? SpaceStation
}

func fetchSpaceStation( spaceStation: SpaceStationJSON, context: NSManagedObjectContext ) -> SpaceStation
{
   let spaceStationEntity: SpaceStation? = getSpaceStation( by: spaceStation.id, context: context )
   spaceStation.updateEntity( entity: spaceStationEntity, context: context )
   return spaceStationEntity ?? spaceStation.addToCoreData( context: context )
}

func getSpaceStationCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "SpaceStation", context: context )
}

func getSampleSpaceStation() -> SpaceStationJSON?
{
   return parseJSONString( json: sampleSpaceStationJSON )
}

private let sampleSpaceStationJSON =
"""
{
  "id": 4,
  "url": "https://ll.thespacedevs.com/2.1.0/spacestation/4/",
  "name": "International Space Station",
  "status": {
    "id": 1,
    "name": "Active"
  },
  "orbit": "Low Earth Orbit",
  "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/spacestation_images/international2520space2520station_image_20190220215716.jpeg"
}
"""
