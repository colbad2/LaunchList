import CoreData

/**
 ### Example
 {
   "id": 82,
   "title": "Secondary Date",
   "status": {
     "id": 1,
     "name": "Scheduled"
   },
   "window_start": "2020-12-30T14:00:00Z",
   "window_end": "2020-12-30T23:00:00Z"
 }
 */
struct RoadClosureJSON: Decodable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, title, status, windowStart, windowEnd
   }

   let id: Int64
   let title: String?
   let status: StatusJSON?
   var statusName: String?
   var statusAbbreviation: String?
   var statusDescription: String?
   let windowStart: String?
   let windowEnd: String?

   // TODO not used
//   func addToCoreData( context: NSManagedObjectContext ) -> RoadClosure
//   {
//      let newRoadClosure: RoadClosure = RoadClosure( context: context )
//      updateEntity( entity: newRoadClosure, context: context )
//
//      return newRoadClosure
//   }
//
//   func updateEntity( entity: RoadClosure?, context: NSManagedObjectContext ) -> Void
//   {
//      if entity == nil { return }
//
//      entity?.statusName = self.status?.name
//      entity?.statusAbbreviation = self.status?.abbreviation
//      entity?.statusDescription = self.status?.description
//   }
}
