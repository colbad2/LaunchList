import Foundation
import CoreData

struct ProgramJSON: Decodable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, url, name, description

      case imageURL = "imageUrl"
      case startDate = "startDate"
      case endDate = "endDate"
      case infoURL = "infoUrl"
      case wikiURL = "wikiUrl"
   }

   var id: Int64
   var url: URL?
   var name: String?
   var description: String?
   var agencies: [AgencyJSON] = []
   var imageURL: URL?
   var startDate: String?
   var endDate: String?
   var infoURL: URL?
   var wikiURL: URL?

   func addToCoreData( context: NSManagedObjectContext ) -> Program
   {
      let newProgram: Program = Program( context: context )

      newProgram.id = self.id
      newProgram.url = self.url
      newProgram.name = self.name
      newProgram.programDescription = self.description
      for agency in self.agencies
      {
         let agencyEntity: Agency = agency.addToCoreData( context: context )
         newProgram.addToAgencies( agencyEntity )
         agencyEntity.addToPrograms( newProgram )
      }
      newProgram.imageURL = self.imageURL
      newProgram.startDate = parseISODate( isoDate: self.startDate )
      newProgram.endDate = parseISODate( isoDate: self.endDate )
      newProgram.infoURL = self.infoURL
      newProgram.wikiURL = self.wikiURL

      return newProgram
   }
}
