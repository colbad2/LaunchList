// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 Agency involved in a space program.

 ### Example JSON:
    {
      "id": 136,
      "url": "https://ll.thespacedevs.com/2.1.0/agencies/136/",
      "name": "Ad Astra Rocket Company",
      "featured": false,
      "type": "Commercial",
      "country_code": "USA",
      "abbrev": "AARC",
      "description": "Ad Astra Rocket Company is an American Space Company doing research and development ...",
      "administrator": "Dr. Franklin Chang Diaz",
      "founding_year": "2005",
      "launchers": "None",
      "spacecraft": "VX-200, VF-200",
      "parent": null,
      "image_url": null
    }
 */
public struct AgencyJSON: Decodable, Identifiable, JSONElement
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, url, name, featured, type, countryCode, administrator, launchers, spacecraft, parent

      case abbreviation = "abbrev"
      case agencyDescription = "description"
      case foundingYear = "founding_year"
      case launchLibraryURL = "launch_library_url"
      case totalLaunchCount = "total_launch_count"
      case successfulLaunches = "successful_launches"
      case consecutiveSuccessfulLaunches = "consecutive_successful_launches"
      case failedLaunches = "failed_launches"
      case pendingLaunches = "pending_launches"
      case successfulLandings = "successful_landings"
      case failedLandings = "failed_landings"
      case attemptedLandings = "attempted_landings"
      case consecutiveSuccessfulLandings = "consecutive_successful_landings"
      case infoURL = "info_url"
      case wikiURL = "wiki_url"
      case logoURL = "logo_url"
      case imageURL = "image_url"
      case nationURL = "nation_url"
      case launcherList = "launcher_list"
      case spacecraftList = "spacecraft_list"
   }

   public var id: Int64
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
   var launchLibraryURL: String?
   var totalLaunchCount: Int64
   var successfulLaunches: Int64
   var consecutiveSuccessfulLaunches: Int64
   var failedLaunches: Int64
   var pendingLaunches: Int64
   var successfulLandings: Int64
   var failedLandings: Int64
   var attemptedLandings: Int64
   var consecutiveSuccessfulLandings: Int64
   var infoURL: String?
   var wikiURL: String?
   var logoURL: String?
   var nationURL: String?
   var launcherList: [LauncherJSON]?
   var spacecraftList: [SpacecraftJSON]?

   public func addToCoreData( context: NSManagedObjectContext ) -> Agency
   {
      let newAgency: Agency = Agency( context: context )
      updateEntity( entity: newAgency, context: context  )

      return newAgency
   }

   public func updateEntity( entity: Agency?, context: NSManagedObjectContext )
   {
      guard let agencyEntity: Agency = entity else { return }

      agencyEntity.id = id
      agencyEntity.url = url
      agencyEntity.name = name
      agencyEntity.type = type
      agencyEntity.countryCodes = getCountryCodes( countryCode: countryCode )
      agencyEntity.abbreviation = abbreviation

      if var admin: String = administrator
      {
         admin = admin.removePrefix( "Administrator: " ) // DATABASE CORRECTION
         agencyEntity.administrator = admin
      }

      agencyEntity.agencyDescription = agencyDescription
      agencyEntity.foundingYear = foundingYear

      if launchers?.count ?? 0 > 0 && launchers != "None" // DATABASE CORRECTION
      {
         agencyEntity.launchers = launchers
      }

      if spacecraft?.count ?? 0 > 0 && spacecraft != "None" // DATABASE CORRECTION
      {
         agencyEntity.spacecraft = spacecraft
      }

      agencyEntity.parent = parent
      agencyEntity.imageURL = imageURL

      // add flags for holes in the API
      if let name: String = agencyEntity.name,
         let correction: String = countryCodeCorrections[ name ]
      {
         agencyEntity.countryCodes?.append( correction ) // DATABASE CORRECTION
      }

      agencyEntity.launchLibraryURL = launchLibraryURL
      agencyEntity.totalLaunchCount = totalLaunchCount
      agencyEntity.successfulLaunches = successfulLaunches
      agencyEntity.consecutiveSuccessfulLaunches = consecutiveSuccessfulLaunches
      agencyEntity.failedLaunches = failedLaunches
      agencyEntity.pendingLaunches = pendingLaunches
      agencyEntity.successfulLandings = successfulLandings
      agencyEntity.failedLandings = failedLandings
      agencyEntity.attemptedLandings = attemptedLandings
      agencyEntity.consecutiveSuccessfulLandings = consecutiveSuccessfulLandings
      agencyEntity.infoURL = infoURL
      agencyEntity.wikiURL = wikiURL
      agencyEntity.logoURL = logoURL
      agencyEntity.imageURL = imageURL
      agencyEntity.nationURL = nationURL
      agencyEntity.addLaunchersFromJSON( launchers: launcherList, context: context )
      agencyEntity.addSpacecraftsFromJSON( spacecraftList: spacecraftList, context: context )

      agencyEntity.sortableName = name?.lowercased()
      agencyEntity.fetched = Date()
   }
}
