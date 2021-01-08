import CoreData

/**
 Part of [LaunchJSON], [SpacecraftJSON], and [SpaceStationJSON] objects

 example JSON:
 {
     "abbrev": "TBC",
     "description": "Awaiting official confirmation - current date is known with some certainty.",
     "id": 8,
     "name": "To Be Confirmed"
 }
 */
struct StatusJSON: Decodable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case description, id, name

      case abbreviation = "abbrev"
   }

   var abbreviation: String?
   var description: String?
   var id: Int64
   var name: String?

//   func addToCoreData( context: NSManagedObjectContext ) -> Status
//   {
//      let newStatus: Status = Status( context: context )
//      updateEntity( entity: newStatus, context: context )
//
//      return newStatus
//   }
//
//   func updateEntity( entity: Status?, context: NSManagedObjectContext ) -> Void
//   {
//      if entity == nil { return }
//
//      entity?.statusAbbreviation = self.abbreviation
//      entity?.statusDescription = self.description
//      entity?.id = self.id
//      entity?.name = self.name
//   }
}


// Core Data search/update

//func getStatus( by id: Int64, context: NSManagedObjectContext ) -> Status?
//{
//   return getEntityByID( id: id, context: context, entityName: "Status" ) as? Status
//}
//
//func fetchStatus( status: StatusJSON, context: NSManagedObjectContext ) -> Status
//{
//   let statusEntity = getStatus( by: status.id, context: context )
//   status.updateEntity( entity: statusEntity, context: context )
//   return statusEntity ?? status.addToCoreData( context: context )
//}
//
//func getStatusCount( context: NSManagedObjectContext ) -> Int?
//{
//   return getRecordsCount( entityName: "Status", context: context )
//}
