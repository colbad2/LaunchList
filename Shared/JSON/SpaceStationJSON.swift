import CoreData

/**
 ### Example
 {
   "id": 6,
   "url": "https://ll.thespacedevs.com/2.1.0/spacestation/6/",
   "name": "Skylab",
   "status": {
     "id": 2,
     "name": "De-Orbited"
   }
 */
struct SpaceStationJSON: Decodable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, url, name, status
   }

   let id: Int64
   let url: String? // unused
   let name: String?
   let status: StatusJSON?

   func addToCoreData( context: NSManagedObjectContext ) -> SpaceStation
   {
      let newSpaceStation: SpaceStation = SpaceStation( context: context )
      updateEntity( entity: newSpaceStation, context: context )

      return newSpaceStation
   }

   func updateEntity( entity: SpaceStation?, context: NSManagedObjectContext ) -> Void
   {
      guard let entity = entity else { return }

      entity.id = self.id
      entity.name = self.name
      entity.status = self.status?.name
   }
}

// Core Data search/update

func getSpaceStation( by id: Int64, context: NSManagedObjectContext ) -> SpaceStation?
{
   return getEntityByID( id: id, context: context, entityName: "SpaceStation" ) as? SpaceStation
}

func fetchSpaceStation( spaceStation: SpaceStationJSON, context: NSManagedObjectContext ) -> SpaceStation
{
   let spaceStationEntity = getSpaceStation( by: spaceStation.id, context: context )
   spaceStation.updateEntity( entity: spaceStationEntity, context: context )
   return spaceStationEntity ?? spaceStation.addToCoreData( context: context )
}

func getSpaceStationCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "SpaceStation", context: context )
}

func getSampleSpaceStation() -> SpaceStationJSON
{
   let decoder = JSONDecoder()
   decoder.keyDecodingStrategy = .convertFromSnakeCase
   let jsonData = sampleSpaceStationJSON.data( using: .utf8 )!
   return try! decoder.decode( SpaceStationJSON.self, from: jsonData )
}

let sampleSpaceStationJSON =
"""
 {
   "id": 6,
   "url": "https://ll.thespacedevs.com/2.1.0/spacestation/6/",
   "name": "Skylab",
   "status": {
     "id": 2,
     "name": "De-Orbited"
   }
"""

