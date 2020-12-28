import Foundation
import CoreData

/**
 Part of a [LaunchJSON] object

example JSON:
 {
     "agencies": [
         {
             "id": 44,
             "name": "National Aeronautics and Space Administration",
             "type": "Government",
             "url": "https://ll.thespacedevs.com/2.1.0/agencies/44/"
         },
         {
             "id": 257,
             "name": "Northrop Grumman Innovation Systems",
             "type": "Commercial",
             "url": "https://ll.thespacedevs.com/2.1.0/agencies/257/"
         },
         {
             "id": 1020,
             "name": "Sierra Nevada Corporation",
             "type": "Commercial",
             "url": "https://ll.thespacedevs.com/2.1.0/agencies/1020/"
         },
         {
             "id": 121,
             "name": "SpaceX",
             "type": "Commercial",
             "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
         }
     ],
     "description": "Commercial Resupply Services (CRS) are a series of flights awarded by NASA for the delivery of cargo and supplies to the International Space Station.The first CRS contracts were signed in 2008 and awarded $1.6 billion to SpaceX for twelve cargo Dragon and $1.9 billion to Orbital Sciences for eight Cygnus flights, covering deliveries to 2016. The Falcon 9 and Antares rockets were also developed under the CRS program to deliver cargo spacecraft to the ISS.",
     "end_date": null,
     "id": 11,
     "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/program_images/commercial2520_program_20201129212219.png",
     "info_url": null,
     "name": "Commercial Resupply Services",
     "start_date": "2008-12-23T00:00:00Z",
     "url": "https://ll.thespacedevs.com/2.1.0/program/11/",
     "wiki_url": "https://en.wikipedia.org/wiki/Commercial_Resupply_Services#Commercial_Resupply_Services"
 }
 */
struct ProgramJSON: Decodable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, url, name, description, agencies

      case imageURL = "imageUrl"
      case startDate = "startDate"
      case endDate = "endDate"
      case infoURL = "infoUrl"
      case wikiURL = "wikiUrl"
   }

   var id: Int64
   var url: String?
   var name: String?
   var description: String?
   var agencies: [AgencyJSON] = []
   var imageURL: String?
   var startDate: String?
   var endDate: String?
   var infoURL: String?
   var wikiURL: String?

   func addToCoreData( context: NSManagedObjectContext ) -> Program
   {
      let newProgram: Program = Program( context: context )

      newProgram.id = self.id
      newProgram.url = wrapURL( self.url )
      newProgram.name = self.name
      newProgram.programDescription = self.description

      for agency in self.agencies
      {
         let agencyEntity: Agency = agency.addToCoreData( context: context )
         newProgram.addToAgencies( agencyEntity )
         agencyEntity.addToPrograms( newProgram )
      }
      
      newProgram.imageURL = wrapURL( self.imageURL )
      newProgram.startDate = parseISODate( isoDate: self.startDate )
      newProgram.endDate = parseISODate( isoDate: self.endDate )
      newProgram.infoURL = wrapURL( self.infoURL )
      newProgram.wikiURL = wrapURL( self.wikiURL )

      return newProgram
   }
}
