// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable line_length

/**
 JSON object representing a space program in the API. Results from a parse of JSON file.

 ### Example JSON
       {
           "agencies":
           [
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

 ### See
 [ProgramListJSON]
 */
public struct ProgramJSON: Decodable
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

   /**
    Creates a new `Program` entity and fills it with data from this `ProgramJSON`.

    - parameter context: `NSManagedObjectContext` Core Data context to add to
    - returns:           `Program` the added entity
    */
   public func addToCoreData( context: NSManagedObjectContext ) -> Program
   {
      let newProgram: Program = Program( context: context )
      updateEntity( entity: newProgram, context: context )

      return newProgram
   }

   /**
    Update an entity using the data from the [ProgramJSON] object.

    ### Example
        let context: NSManagedObjectContext = Persistence.shared.container.viewContext
        updateEntity( entity: newProgram, context: context )

    - parameter entity:  `Program` update or create a program entity
    - parameter context: `NSManagedObjectContext` Core Data context to add to
    */
   public func updateEntity( entity: Program?, context: NSManagedObjectContext )
   {
      guard let entity = entity else { return }

      entity.id = id
      entity.name = name
      entity.programDescription = description
      addAgencies( entity: entity, agencies: agencies, context: context )
      entity.imageURL = imageURL
      entity.startDate = parseISODate( isoDate: startDate )
      entity.endDate = parseISODate( isoDate: endDate )
      entity.infoURL = infoURL
      entity.wikiURL = wikiURL
   }
}
