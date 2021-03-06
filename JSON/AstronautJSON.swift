// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 Astronaut.

 ### Example JSON:
       {
         "id": 276,
         "url": "https://ll.thespacedevs.com/2.1.0/astronaut/276/",
         "name": "Franz Viehböck",
         "status": { "id": 2, "name": "Retired" },
         "type": { "id": 2, "name": "Government" },
         "date_of_birth": "1960-08-24",
         "date_of_death": null,
         "nationality": "Austrian",
         "bio": "Franz Artur Viehböck (born August 24, 1960 in Vienna) is an Austrian electrical engineer, …",
         "twitter": null,
         "instagram": null,
         "wiki": "https://en.wikipedia.org/wiki/Franz_Viehb%C3%B6ck",
         "agency": {
           "id": 8,
           "url": "https://ll.thespacedevs.com/2.1.0/agencies/8/",
           "name": "Austrian Space Agency",
           "featured": false,
           "type": "Government",
           "country_code": "AUT",
           "abbrev": "ALR",
           "description": "The Austrian Space Agency was founded in 1972 and joined the ESA as a member in 1987. …",
           "administrator": "Andreas Geisler",
           "founding_year": "1972",
           "launchers": "",
           "spacecraft": "Spacelab | GALILEO",
           "parent": null,
           "image_url": null
         },
         "profile_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/…/20181201223901.jpg",
         "profile_image_thumbnail": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/…/8196eb442e3f17b64.jpg",
         "last_flight": "1991-10-02T05:59:38Z",
         "first_flight": "1991-10-02T05:59:38Z"
       }

 ### Spec (API models: AstronautNormal, AstronautDetailed, AstronautDetailedSerializerNoFlights)
       id                        integer,       readOnly: true
       url                       string($uri),  readOnly: true
       name*                     string,        maxLength: 255, minLength: 1
       status                    AstronautStatus{...}
       type                      AstronautType{...}
       date_of_birth*            string($date)
       date_of_death             string($date), x-nullable: true
       nationality*              string,        maxLength: 255
       bio*                      string,        minLength: 1,   maxLength: 2048, minLength: 1
       twitter                   string,        maxLength: 255, x-nullable: true
       instagram                 string,        maxLength: 255, x-nullable: true
       wiki                      string,        maxLength: 255, x-nullable: true
       agency                    AgencySerializerMini{...}
       profile_image             string($uri),  readOnly: true, x-nullable: true
       profile_image_thumbnail   string($uri),  readOnly: true
       last_flight               string,        readOnly: true
       first_flight              string,        readOnly: true
       flights                   [LaunchSerializerCommon{...}]
       landings                  [SpacecraftFlight{...}]
 */
public class AstronautJSON: Decodable, Identifiable, JSONElement, AutoEquatable, AutoHashable
{
   /** ID of the astronaut within the API. */
   public var id: Int64
   /** URI of this data. Unused. */
   var url: String?
   /** astronaut name. */
   var name: String?
   /** Flight status, like "Retired". */
   var status: IDNameJSON?
   /** Astronaut type, like "Government". */
   var type: IDNameJSON?
   /** Data of birth, YYYY-MM-DD format, like "1960-08-24". */
   var dateOfBirth: String?
   /** Data of death, if any, YYYY-MM-DD format, like "1960-08-24". */
   var dateOfDeath: String?
   /** Astronaut nationality. */
   var nationality: String?
   /** Full text biography. */
   var bio: String?
   /** URL to astronaut Twitter account. */
   var twitter: String?
   /** URL to astronaut Instagram account. */
   var instagram: String?
   /** URL to astronaut Wikipedia account. */
   var wiki: String?
   /** Astronaut agency. */
   var agency: AgencyJSON?
   /** First flight date, ISO format, like "1991-10-02T05:59:38Z". */
   var firstFlight: String?
   /** Last flight date, ISO format, like "1991-10-02T05:59:38Z". May be same as firstFlight. */
   var lastFlight: String?
   /** URL to fill-size astronaut image. */
   var profileImage: String?
   /** URL to small astromnaut image, */
   var profileImageThumbnail: String?
   /** Flights manned by this astronaut. */
   var flights: [LaunchJSON] = []
   /** Landings by this astronaut. */
   var landings: [SpacecraftFlightJSON] = []

   /**
    Make a `AstronautJSON` from a JSON structure.

    - parameter json: `JSONStructure` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.url = json[ "url" ] as? String
      self.name = json[ "name" ] as? String
      self.status = IDNameJSON( json: json[ "status" ] as? JSONStructure )
      self.type = IDNameJSON( json: json[ "type" ] as? JSONStructure )
      self.dateOfBirth = json[ "date_of_birth" ] as? String
      self.dateOfDeath = json[ "date_of_death" ] as? String
      self.nationality = json[ "nationality" ] as? String
      self.bio = json[ "bio" ] as? String
      self.twitter = json[ "twitter" ] as? String
      self.instagram = json[ "instagram" ] as? String
      self.wiki = json[ "wiki" ] as? String
      self.agency = AgencyJSON( json: json[ "agency" ] as? JSONStructure )
      self.firstFlight = json[ "first_flight" ] as? String
      self.lastFlight = json[ "last_flight" ] as? String
      self.profileImage = json[ "profile_image" ] as? String
      self.profileImageThumbnail = json[ "profile_image_thumbnail" ] as? String
      self.flights = ( json[ "flights" ] as? [JSONStructure] )?.compactMap { LaunchJSON( json: $0 ) } ?? []
      self.landings = ( json[ "landings" ] as? [JSONStructure] )?.compactMap { SpacecraftFlightJSON( json: $0 ) } ?? []
   }
}
