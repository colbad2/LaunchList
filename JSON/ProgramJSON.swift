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

 ### Spec
       id   integer
       url   string($uri)
       name*   string maxLength: 255 minLength: 1
       description   string maxLength: 40000 x-nullable: true
       agencies   [Agency{...}]
       image_url   string($uri) readOnly: true
       start_date string($date-time) x-nullable: true
       end_date   string($date-time) x-nullable: true
       info_url   string($uri)  maxLength: 200 x-nullable: true
       wiki_url   string($uri) maxLength: 200 x-nullable: true

 ### See
 [ProgramListJSON]
 */
public class ProgramJSON: Decodable, Identifiable, JSONElement
{
   // translate API attribute names into better var names
//   enum CodingKeys: String, CodingKey
//   {
//      case id, url, name, description, agencies
//
//      case imageURL = "image_url"
//      case startDate = "start_date"
//      case endDate = "end_date"
//      case infoURL = "info_url"
//      case wikiURL = "wiki_url"
//   }

   /** ID of the astronaut within the API. */
   public var id: Int64
   /** URI of this data. Unused. */
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
    Make a `ProgramJSON` from a JSON structure.

    - parameter json: `JSONStructure` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.url = json[ "url" ] as? String
      self.name = json[ "name" ] as? String
      self.description = json[ "description" ] as? String

      self.agencies = []
      if let agenciesArray: [JSONStructure] = json[ "agencies" ] as? [JSONStructure]
      {
         self.agencies = agenciesArray.compactMap { AgencyJSON( json: $0 ) }
      }

      self.imageURL = json[ "image_url" ] as? String
      self.startDate = json[ "start_date" ] as? String
      self.endDate = json[ "end_date" ] as? String
      self.infoURL = json[ "info_url" ] as? String
      self.wikiURL = json[ "wiki_url" ] as? String
   }

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
      guard let programEntity = entity else { return }

      programEntity.id = id
      programEntity.name = name
      programEntity.programDescription = description
      addAgencies( entity: programEntity, agencies: agencies, context: context )
      programEntity.imageURL = imageURL
      programEntity.startDate = parseISODate( isoDate: startDate )
      programEntity.endDate = parseISODate( isoDate: endDate )
      programEntity.infoURL = infoURL
      programEntity.wikiURL = wikiURL

      programEntity.fetched = Date()
   }
}
