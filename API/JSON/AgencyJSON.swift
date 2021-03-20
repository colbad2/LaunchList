// Copyright © 2021 Bradford Holcombe. All rights reserved.

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

 ### Spec (API models: Agency, AgencyList, AgencySerializerDetailed, AgencySerializerMini, AgencySerializerDetailedCommon)
       id              integer
       url             string($uri)
       name*           string,       maxLength: 200,  minLength: 1
       type            string,       maxLength: 255,  x-nullable: true

       featured        boolean
       country_code    string,       maxLength: 1048
       abbrev          string,       maxLength: 255
       description     string,       maxLength: 2048, x-nullable: true
       administrator   string,       maxLength: 200,  x-nullable: true
       founding_year   string,       maxLength: 20,   x-nullable: true
       launchers       string,       maxLength: 500
       spacecraft      string,       maxLength: 500
       parent          string,       readOnly: true
       image_url       string($uri), readOnly: true,  x-nullable: true

       launch_library_url                string
       total_launch_count                string
       successful_launches               string
       consecutive_successful_launches   string
       failed_launches                   string
       pending_launches                  string
       successful_landings               string
       failed_landings                   string
       attempted_landings                string
       consecutive_successful_landings   string
       info_url                          string($uri), maxLength: 200, x-nullable: true
       wiki_url                          string($uri), maxLength: 200, x-nullable: true
       logo_url                          string($uri), readOnly: true, x-nullable: true
       nation_url                        string($uri), readOnly: true, x-nullable: true
       launcher_list                     [LauncherConfig]
       spacecraft_list                   [SpacecraftConfig]

 */
public class AgencyJSON: Identifiable, JSONElement, AutoEquatable, AutoHashable, CustomDebugStringConvertible // , Hashable
{
   /** ID of the astronaut within the API. */
   public var id: Int64?
   /** URI of this data. Unused. */
   var url: String?
   /** Agency name. */
   var name: String?
   /** True if this agency is featured on the API website(?). */
   var featured: Bool?
   /** Governmental, commerical, etc. */
   var type: String?
   /** Comma-separated string of three char country codes. */
   var countryCode: String?
   /** Abbreviation of the agency name, like NASA.  */
   var abbreviation: String?
   /** Agency description. Not 'description' so it doesn't collide with Swift defaults. */
   var agencyDescription: String?
   /** Current administrator name. */
   var administrator: String?
   /** Year agency founded, YYYY format. */
   var foundingYear: String?
   /** List of launchers used by the agency. */
   var launchers: String?
   /** Comma-separated list of spacecraft used by the agency. */
   var spacecraft: String?
   /** Parent agency. */
   var parent: String?
   /** URL to an image associated with the agency. */
   var imageURL: String?
   /** ID originally associated with the agency in a previous version of the API. */
   var launchLibraryURL: String?
   /** Number of launches attempted by this agency. */
   var totalLaunchCount: Int64?
   /** Number of successful launches attempted by this agency. */
   var successfulLaunches: Int64?
   /** Number of consecutive successful launches attempted by this agency. */
   var consecutiveSuccessfulLaunches: Int64?
   /** Number of failed launches by this agency. */
   var failedLaunches: Int64?
   /** Number of future launches planned by this agency. */
   var pendingLaunches: Int64?
   /** Number of successful landings attempted by this agency. */
   var successfulLandings: Int64?
   /** Number of failed landings by this agency. */
   var failedLandings: Int64?
   /** Number of landings attempted by this agency. */
   var attemptedLandings: Int64?
   /** Number of consecutive successful landings attempted by this agency. */
   var consecutiveSuccessfulLandings: Int64?
   /** URL to information about this agency. */
   var infoURL: String?
   /** URL to the Wikipedia page for this agency. */
   var wikiURL: String?
   /** URL to an image of the agency's logo. */
   var logoURL: String?
   /** URL to a website for the agency's country. */
   var nationURL: String?
   /** List of launcher configurations used by the agency. */
   var configurationList: [LauncherConfigJSON] = []
   /** List of spacecraft used by the agency. */
   var spacecraftList: [SpacecraftConfigJSON] = []

   public var debugDescription: String
   {
      """
      AgencyJSON( id: \(id ?? -1),
                  url: \(url ?? ""),
                  name: \(name ?? ""),
                  featured: \(String(describing: featured)),
                  type: \(type ?? ""),
                  countryCode: \(countryCode ?? ""),
                  abbreviation: \(abbreviation ?? ""),
                  agencyDescription: \(agencyDescription ?? ""),
                  administrator: \(administrator ?? ""),
                  foundingYear: \(foundingYear ?? ""),
                  launchers: \(launchers ?? ""),
                  spacecraft: \(spacecraft ?? ""),
                  parent: \(parent ?? ""),
                  imageURL: \(imageURL ?? ""),
                  launchLibraryURL: \(launchLibraryURL ?? ""),
                  totalLaunchCount: \(totalLaunchCount ?? -1),
                  successfulLaunches: \(successfulLaunches ?? -1),
                  consecutiveSuccessfulLaunches: \(consecutiveSuccessfulLaunches ?? -1),
                  failedLaunches: \(failedLaunches ?? -1),
                  pendingLaunches: \(pendingLaunches ?? -1),
                  successfulLandings: \(successfulLandings ?? -1),
                  failedLandings: \(failedLandings ?? -1),
                  attemptedLandings: \(attemptedLandings ?? -1),
                  consecutiveSuccessfulLandings: \(consecutiveSuccessfulLandings ?? -1),
                  infoURL: \(infoURL ?? ""),
                  wikiURL: \(wikiURL ?? ""),
                  logoURL: \(logoURL ?? ""),
                  nationURL: \(nationURL ?? ""),
                  configurationList: \(configurationList),
                  spacecraftList: \(spacecraftList))
      """
   }

//   public static func == ( lhs: AgencyJSON, rhs: AgencyJSON ) -> Bool
//   {
//      if lhs === rhs { return true }
//      if type( of: lhs ) != type( of: rhs ) { return false }
//
//      if lhs.id != rhs.id || lhs.url != rhs.url || lhs.name != rhs.name || lhs.featured != rhs.featured || lhs.type != rhs.type { return false }
//      if lhs.countryCode != rhs.countryCode || lhs.abbreviation != rhs.abbreviation || lhs.agencyDescription != rhs.agencyDescription ||
//         lhs.administrator != rhs.administrator || lhs.foundingYear != rhs.foundingYear || lhs.launchers != rhs.launchers { return false }
//      if lhs.spacecraft != rhs.spacecraft || lhs.parent != rhs.parent || lhs.imageURL != rhs.imageURL { return false }
//      if lhs.launchLibraryURL != rhs.launchLibraryURL || lhs.totalLaunchCount != rhs.totalLaunchCount { return false }
//      if lhs.successfulLaunches != rhs.successfulLaunches || lhs.consecutiveSuccessfulLaunches != rhs.consecutiveSuccessfulLaunches { return false }
//      if lhs.failedLaunches != rhs.failedLaunches || lhs.pendingLaunches != rhs.pendingLaunches { return false }
//      if lhs.successfulLandings != rhs.successfulLandings || lhs.failedLandings != rhs.failedLandings { return false }
//      if lhs.attemptedLandings != rhs.attemptedLandings || lhs.consecutiveSuccessfulLandings != rhs.consecutiveSuccessfulLandings { return false }
//      if lhs.infoURL != rhs.infoURL || lhs.wikiURL != rhs.wikiURL || lhs.logoURL != rhs.logoURL || lhs.nationURL != rhs.nationURL { return false }
//      return true
//   }

   /**
    Make an `AgencyJSON` from a JSON structure.

    - parameter json: `Any` JSON to parse
    */
   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      id = nonNegativeInt( json[ "id" ] )
      url = nonEmptyString( json[ "url" ] )
      name = nonEmptyString( json[ "name" ] )
      featured = json[ "featured" ] as? Bool
      type = nonEmptyString( json[ "type" ] )
      countryCode = nonEmptyString( json[ "country_code" ] )
      abbreviation = nonEmptyString( json[ "abbrev" ] )
      agencyDescription = nonEmptyString( json[ "description" ] )
      administrator = nonEmptyString( json[ "administrator" ] )
      foundingYear = nonEmptyString( json[ "founding_year" ] )
      launchers = nonEmptyString( json[ "launchers" ] )
      spacecraft = nonEmptyString( json[ "spacecraft" ] )
      parent = nonEmptyString( json[ "parent" ] )
      launchLibraryURL = nonEmptyString( json[ "launch_library_url" ] )
      totalLaunchCount = nonNegativeInt( json[ "total_launch_count" ] )
      successfulLaunches = nonNegativeInt( json[ "successful_launches" ] )
      consecutiveSuccessfulLaunches = nonNegativeInt( json[ "consecutive_successful_launches" ] )
      failedLaunches = nonNegativeInt( json[ "failed_launches" ] )
      pendingLaunches = nonNegativeInt( json[ "pending_launches" ] )
      successfulLandings = nonNegativeInt( json[ "successful_landings" ] )
      failedLandings = nonNegativeInt( json[ "failed_landings" ] )
      attemptedLandings = nonNegativeInt( json[ "attempted_landings" ] )
      consecutiveSuccessfulLandings = nonNegativeInt( json[ "consecutive_successful_landings" ] )
      infoURL = nonEmptyString( json[ "info_url" ] )
      wikiURL = nonEmptyString( json[ "wiki_url" ] )
      logoURL = nonEmptyString( json[ "logo_url" ] )
      imageURL = nonEmptyString( json[ "image_url" ] )
      nationURL = nonEmptyString( json[ "nation_url" ] )
      configurationList = parseArray( json[ "launcher_list" ] )
      spacecraftList = parseArray( json[ "spacecraft_list" ] )
   }

   public func hash( into hasher: inout Hasher )
   {
      hasher.combine( id )
      hasher.combine( url )
      hasher.combine( name )
      hasher.combine( featured )
      hasher.combine( type )
      hasher.combine( countryCode )
      hasher.combine( abbreviation )
      hasher.combine( agencyDescription )
      hasher.combine( administrator )
      hasher.combine( foundingYear )
      hasher.combine( launchers )
      hasher.combine( spacecraft )
      hasher.combine( parent )
      hasher.combine( imageURL )
      hasher.combine( launchLibraryURL )
      hasher.combine( totalLaunchCount )
      hasher.combine( successfulLaunches )
      hasher.combine( consecutiveSuccessfulLaunches )
      hasher.combine( failedLaunches )
      hasher.combine( pendingLaunches )
      hasher.combine( successfulLandings )
      hasher.combine( failedLandings )
      hasher.combine( attemptedLandings )
      hasher.combine( consecutiveSuccessfulLandings )
      hasher.combine( infoURL )
      hasher.combine( wikiURL )
      hasher.combine( logoURL )
      hasher.combine( nationURL )
   }
}
