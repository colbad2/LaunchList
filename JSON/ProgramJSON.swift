// Copyright © 2021 Bradford Holcombe. All rights reserved.

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
           "description": "Commercial Resupply Services (CRS) are a series of flights awarded by NASA …",
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
}
