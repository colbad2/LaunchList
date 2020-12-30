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
   var url: String? // unused
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
      updateEntity( entity: newProgram, context: context )

      return newProgram
   }

   func updateEntity( entity: Program?, context: NSManagedObjectContext ) -> Void
   {
      if entity == nil { return }

      entity?.id = self.id
      entity?.name = self.name
      entity?.programDescription = self.description

      for agency in self.agencies
      {
         let agencyEntity: Agency = fetchAgency( agency: agency, context: context )
         entity?.addToAgencies( agencyEntity )
         agencyEntity.addToPrograms( entity! )
      }

      entity?.imageURL = self.imageURL
      entity?.startDate = parseISODate( isoDate: self.startDate )
      entity?.endDate = parseISODate( isoDate: self.endDate )
      entity?.infoURL = self.infoURL
      entity?.wikiURL = self.wikiURL
   }
}

// Core Data search/update

func getProgram( by id: Int64, context: NSManagedObjectContext ) -> Program?
{
   return getEntityByID( id: id, context: context, entityName: "Program" ) as? Program
}

func fetchProgram( program: ProgramJSON, context: NSManagedObjectContext ) -> Program
{
   let programEntity = getProgram( by: program.id, context: context )
   program.updateEntity( entity: programEntity, context: context )
   return programEntity ?? program.addToCoreData( context: context )
}
