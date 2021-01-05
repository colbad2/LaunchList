import CoreData

/**
 Astronaut.

 example JSON:
 {
   "id": 276,
   "url": "https://ll.thespacedevs.com/2.1.0/astronaut/276/",
   "name": "Franz Viehböck",
   "status": {
     "id": 2,
     "name": "Retired"
   },
   "type": {
     "id": 2,
     "name": "Government"
   },
   "date_of_birth": "1960-08-24",
   "date_of_death": null,
   "nationality": "Austrian",
   "bio": "Franz Artur Viehböck (born August 24, 1960 in Vienna) is an Austrian electrical engineer, and was Austria's first cosmonaut. He was titulated „Austronaut“ by his country's media. He visited the Mir space station in 1991 aboard Soyuz TM-13, returning aboard Soyuz TM-12 after spending just over a week in space.",
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
     "description": "The Austrian Space Agency was founded in 1972 and joined the ESA as a member in 1987. In 2005, control of the ALR was transferred to the Austrian Agency for Aerospace. They coordinated the first flight of an Austrian in space with a Soyuz launch in 1990.",
     "administrator": "Andreas Geisler",
     "founding_year": "1972",
     "launchers": "",
     "spacecraft": "Spacelab | GALILEO",
     "parent": null,
     "image_url": null
   },
   "profile_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/astronaut_images/franz2520viehb25c325b6ck_image_20181201223901.jpg",
   "profile_image_thumbnail": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/default/cache/54/57/5457ce75acb7b188196eb442e3f17b64.jpg",
   "last_flight": "1991-10-02T05:59:38Z",
   "first_flight": "1991-10-02T05:59:38Z"
 }
 */
struct AstronautJSON: Decodable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, url, name, status, type, dateOfBirth, dateOfDeath, nationality, bio, twitter,
           instagram, wiki, agency, profileImage, profileImageThumbnail, lastFlight, firstFlight
   }

   var id: Int64
   var url: String? // unused
   var name: String?
   var status: AstronautStatusJSON?
   var type: AstronautTypeJSON?
   var dateOfBirth: String?
   var dateOfDeath: String?
   var nationality: String?
   var bio: String?
   var twitter: String?
   var instagram: String?
   var wiki: String?
   var agency: AgencyJSON?
   var firstFlight: String?
   var lastFlight: String?
   var profileImage: String?
   var profileImageThumbnail: String?

   func addToCoreData( context: NSManagedObjectContext ) -> Astronaut
   {
      let newAstronaut: Astronaut = Astronaut( context: context )
      updateEntity( entity: newAstronaut, context: context )

      return newAstronaut
   }

   func updateEntity( entity: Astronaut?, context: NSManagedObjectContext ) -> Void
   {
      if entity == nil { return }

      entity?.id = self.id
      entity?.name = self.name
      entity?.status = self.status?.name
      entity?.type = self.type?.name
      entity?.dateOfBirth = self.dateOfBirth
      entity?.dateOfDeath = self.dateOfDeath
      entity?.nationality = self.nationality
      entity?.bio = self.bio
      entity?.twitter = self.twitter
      entity?.instagram = self.instagram
      entity?.wiki = self.wiki

      if let agency = self.agency
      {
         let agencyEntity: Agency = fetchAgency( agency: agency, context: context )
         entity?.agency = agencyEntity
         agencyEntity.addToAstronauts( entity! )
      }


      entity?.firstFlight = self.firstFlight
      entity?.lastFlight = self.lastFlight
      entity?.profileImage = self.profileImage
      entity?.profileImageThumbnail = self.profileImageThumbnail
   }
}


// Core Data search/update

func getAstronaut( by id: Int64, context: NSManagedObjectContext ) -> Astronaut?
{
   return getEntityByID( id: id, context: context, entityName: "Astronaut" ) as? Astronaut
}

func fetchAstronaut( astronaut: AstronautJSON, context: NSManagedObjectContext ) -> Astronaut
{
   let astronautEntity = getAstronaut( by: astronaut.id, context: context )
   astronaut.updateEntity( entity: astronautEntity, context: context )
   return astronautEntity ?? astronaut.addToCoreData( context: context )
}

func getAstronautCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "Astronaut", context: context )
}

func getSampleAstronaut() -> AstronautJSON?
{
   return parseJSONString( json: sampleAstronautJSON )
}

private let sampleAstronautJSON =
"""
 {
   "id": 276,
   "url": "https://ll.thespacedevs.com/2.1.0/astronaut/276/",
   "name": "Franz Viehböck",
   "status": {
     "id": 2,
     "name": "Retired"
   },
   "type": {
     "id": 2,
     "name": "Government"
   },
   "date_of_birth": "1960-08-24",
   "date_of_death": null,
   "nationality": "Austrian",
   "bio": "Franz Artur Viehböck (born August 24, 1960 in Vienna) is an Austrian electrical engineer, and was Austria's first cosmonaut. He was titulated „Austronaut“ by his country's media. He visited the Mir space station in 1991 aboard Soyuz TM-13, returning aboard Soyuz TM-12 after spending just over a week in space.",
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
     "description": "The Austrian Space Agency was founded in 1972 and joined the ESA as a member in 1987. In 2005, control of the ALR was transferred to the Austrian Agency for Aerospace. They coordinated the first flight of an Austrian in space with a Soyuz launch in 1990.",
     "administrator": "Andreas Geisler",
     "founding_year": "1972",
     "launchers": "",
     "spacecraft": "Spacelab | GALILEO",
     "parent": null,
     "image_url": null
   },
   "profile_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/astronaut_images/franz2520viehb25c325b6ck_image_20181201223901.jpg",
   "profile_image_thumbnail": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/default/cache/54/57/5457ce75acb7b188196eb442e3f17b64.jpg",
   "last_flight": "1991-10-02T05:59:38Z",
   "first_flight": "1991-10-02T05:59:38Z"
 }
"""
