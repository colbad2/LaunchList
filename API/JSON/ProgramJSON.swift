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

 ### Spec (API model: Program)
       id   integer
       url   string($uri)
       name*   string maxLength: 255 minLength: 1
       description   string maxLength: 40000 x-nullable: true
       agencies   [AgencySerializerMini{...}]
       image_url   string($uri) readOnly: true
       start_date string($date-time) x-nullable: true
       end_date   string($date-time) x-nullable: true
       info_url   string($uri)  maxLength: 200 x-nullable: true
       wiki_url   string($uri) maxLength: 200 x-nullable: true

 ### See
 [ProgramListJSON]
 */
public class ProgramJSON: Identifiable, JSONElement
{
   /** ID of the program within the API. */
   public var id: Int64?
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

    - parameter json: `Any` JSON to parse
    */
   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      id = nonNegativeInt( json[ "id" ] )
      url = nonEmptyString( json[ "url" ] )
      name = nonEmptyString( json[ "name" ] )
      description = nonEmptyString( json[ "description" ] )
      agencies = parseArray( json[ "agencies" ] )
      imageURL = nonEmptyString( json[ "image_url" ] )
      startDate = nonEmptyString( json[ "start_date" ] )
      endDate = nonEmptyString( json[ "end_date" ] )
      infoURL = nonEmptyString( json[ "info_url" ] )
      wikiURL = nonEmptyString( json[ "wiki_url" ] )
   }
}
