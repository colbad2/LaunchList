// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable line_length

/**
 ### Example
 {
   "id": 2,
   "url": "https://ll.thespacedevs.com/2.1.0/expedition/2/",
   "name": "Skylab 2",
   "start": "1973-05-25T13:00:00Z",
   "end": "1973-06-22T13:49:48Z",
   "spacestation": {
     "id": 6,
     "url": "https://ll.thespacedevs.com/2.1.0/spacestation/6/",
     "name": "Skylab",
     "status": {
       "id": 2,
       "name": "De-Orbited"
     },
     "orbit": "Low Earth Orbit",
     "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/spacestation_images/skylab_image_20190215230143.jpeg"
   }
 }
 */
struct ExpeditionJSON: Decodable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, url, name, start, end

      case spaceStation = "spacestation"
   }

   let id: Int64
   let url: String? // unused
   let name: String?
   let start: String?
   let end: String?
   let spaceStation: SpaceStationJSON?

   func addToCoreData( context: NSManagedObjectContext ) -> Expedition
   {
      let newExpedition: Expedition = Expedition( context: context )
      updateEntity( entity: newExpedition, context: context )

      return newExpedition
   }

   func updateEntity( entity: Expedition?, context: NSManagedObjectContext )
   {
      guard let entity = entity else { return }

      entity.id = self.id
      entity.name = self.name
      entity.start = self.start
      entity.end = self.end

      if let station: SpaceStationJSON = self.spaceStation
      {
         let newSpaceStation: SpaceStation = fetchSpaceStation( spaceStation: station, context: context )
         entity.spaceStation = newSpaceStation
         newSpaceStation.addToExpeditions( entity )
      }
   }
}

// Core Data search/update TODO move these to CD extensions, along with all others

func getExpedition( by entityID: Int64, context: NSManagedObjectContext ) -> Expedition?
{
   return getEntityByID( entityID: entityID, context: context, entityName: "Expedition" ) as? Expedition
}

func fetchExpedition( expedition: ExpeditionJSON, context: NSManagedObjectContext ) -> Expedition
{
   let expeditionEntity: Expedition? = getExpedition( by: expedition.id, context: context )
   expedition.updateEntity( entity: expeditionEntity, context: context )
   return expeditionEntity ?? expedition.addToCoreData( context: context )
}

func getExpeditionCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "Expedition", context: context )
}

func getSampleExpedition() -> ExpeditionJSON?
{
   return parseJSONString( json: sampleExpeditionJSON )
}

private let sampleExpeditionJSON =
"""
 {
   "id": 81,
   "url": "https://ll.thespacedevs.com/2.1.0/expedition/81/",
   "name": "Expedition 47",
   "start": "2016-03-02T01:02:00Z",
   "end": "2016-06-18T05:52:00Z",
   "spacestation": {
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
 }
"""
