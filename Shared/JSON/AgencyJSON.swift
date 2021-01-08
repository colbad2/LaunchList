import CoreData

/**
 Agency involved in the launch program.

 Part of a [Program] "agencies" list.

 Example JSON:
 {
   "id": 136,
   "url": "https://ll.thespacedevs.com/2.1.0/agencies/136/",
   "name": "Ad Astra Rocket Company",
   "featured": false,
   "type": "Commercial",
   "country_code": "USA",
   "abbrev": "AARC",
   "description": "Ad Astra Rocket Company is an American Space Company doing research and development in plasma propulsion technology. This involves using the technology of VASIMR developed in the late '70s, developed by the companies founder, Franklin Diaz. They have begun testing of their VF-200 model engine, built for interplanetary travel.",
   "administrator": "Dr. Franklin Chang Diaz",
   "founding_year": "2005",
   "launchers": "None",
   "spacecraft": "VX-200, VF-200",
   "parent": null,
   "image_url": null
 }
 */
struct AgencyJSON: Decodable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, url, name, featured, type, countryCode, administrator, foundingYear, launchers, spacecraft, parent

      case abbreviation = "abbrev"
      case agencyDescription = "description"
      case imageURL = "imageUrl"
   }

   var id: Int64
   var url: String? // unused
   var name: String?
   var featured: Bool?
   var type: String?
   var countryCode: String?
   var abbreviation: String?
   var agencyDescription: String?
   var administrator: String?
   var foundingYear: String?
   var launchers: String?
   var spacecraft: String?
   var parent: String?
   var imageURL: String?

   func addToCoreData( context: NSManagedObjectContext ) -> Agency
   {
      let newAgency: Agency = Agency( context: context )
      updateEntity( entity: newAgency, context: context )

      return newAgency
   }

   func updateEntity( entity: Agency?, context: NSManagedObjectContext ) -> Void
   {
      guard let entity = entity else { return }

      entity.id = self.id
      entity.name = self.name
      entity.type = self.type

      entity.countryCodes = getCountryCodes( countryCode: self.countryCode )

      entity.abbreviation = self.abbreviation
      if var admin = self.administrator
      {
         admin = admin.removePrefix( "Administrator: " )
         entity.administrator = admin
      }
      entity.agencyDescription = self.agencyDescription
      entity.foundingYear = self.foundingYear
      if self.launchers?.count ?? 0 > 0 && self.launchers != "None"
      {
         entity.launchers = self.launchers
      }
      if self.spacecraft?.count ?? 0 > 0 && self.spacecraft != "None"
      {
         entity.spacecraft = self.spacecraft
      }
      entity.parent = self.parent
      entity.imageURL = self.imageURL

      // add flags for holes in the API
      if entity.name == "Canadian Space Agency" { entity.countryCodes?.append( "CAN" ) }
      if entity.name == "National Aeronautics and Space Administration" { entity.countryCodes?.append( "USA" ) }
      if entity.name == "China National Space Administration" { entity.countryCodes?.append( "CHN" ) }
      // TODO go through the agency list and fill in holes
      // TODO do this with a dictionary

      // TODO same for programs
   }
}

func isBasic( agency: Agency ) -> Bool
{
   return agency.name != nil &&
      agency.agencyDescription == nil &&
      agency.administrator == nil &&
      agency.foundingYear == nil &&
      agency.launchers == nil &&
      agency.spacecraft == nil &&
      agency.imageURL == nil
}

func getCountryCodes( countryCode: String? ) -> [String]
{
   if countryCode == nil { return [] }
   
   var codes: [String] = []
   if let agencyCodes = countryCode
   {
      let codeList = agencyCodes.split( separator: "," )
      for code in codeList
      {
         let country = String( code ).trimmingCharacters( in: .whitespacesAndNewlines )
         if country.count == 6
         {
            codes.append( String( country.prefix( 3 ) ) )
            codes.append( String( country.suffix( 3 ) ) )
         }
         else if country.contains( "/" )
         {
            let c = country.split( separator: "/" )
            codes.append( String( c[ 0 ] ) )
            codes.append( String( c[ 1 ] ) )
         }
         else
         {
            codes.append( country )
         }
      }
   }

   if codes.count == 0 { return [] }

   return codes
}

// Core Data search/update

func getAgency( by id: Int64, context: NSManagedObjectContext ) -> Agency?
{
   return getEntityByID( id: id, context: context, entityName: "Agency" ) as? Agency
}

func fetchAgency( agency: AgencyJSON, context: NSManagedObjectContext ) -> Agency
{
   let agencyEntity = getAgency( by: agency.id, context: context )
   agency.updateEntity( entity: agencyEntity, context: context )
   return agencyEntity ?? agency.addToCoreData( context: context )
}

func getAgencyCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "Agency", context: context )
}

func getSampleAgency() -> AgencyJSON?
{
   return parseJSONString( json: sampleAgencyJSON )
}

private let sampleAgencyJSON =
"""
     {
       "id": 63,
       "url": "https://ll.thespacedevs.com/2.1.0/agencies/63/",
       "name": "Russian Federal Space Agency (ROSCOSMOS)",
       "featured": true,
       "type": "Government",
       "country_code": "RUS",
       "abbrev": "RFSA",
       "description": "The Roscosmos State Corporation for Space Activities, commonly known as Roscosmos, is the governmental body responsible for the space science program of the Russian Federation and general aerospace research. Soyuz has many launch locations the Russian sites are Baikonur, Plesetsk and Vostochny however Ariane also purchases the vehicle and launches it from French Guiana.",
       "administrator": "Administrator: Dmitry Rogozin",
       "founding_year": "1992",
       "launchers": "Soyuz",
       "spacecraft": "Soyuz",
       "parent": null,
       "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_images/russian2520federal2520space2520agency25202528roscosmos2529_image_20190207032459.jpeg"
     }
"""
