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
public class AgencyJSON: Identifiable, JSONElement, AutoEquatable, AutoHashable
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

   /**
    Make a `AgencyJSON` from a JSON structure.

    - parameter json: `Any` JSON to parse
    */
   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      self.id = nonNegativeInt( json[ "id" ] )
      self.url = nonEmptyString( json[ "url" ] )
      self.name = nonEmptyString( json[ "name" ] )
      self.featured = json[ "featured" ] as? Bool
      self.type = nonEmptyString( json[ "type" ] )
      self.countryCode = nonEmptyString( json[ "country_code" ] )
      self.abbreviation = nonEmptyString( json[ "abbrev" ] )
      self.agencyDescription = nonEmptyString( json[ "description" ] )
      self.administrator = nonEmptyString( json[ "administrator" ] )
      self.foundingYear = nonEmptyString( json[ "founding_year" ] )
      self.launchers = nonEmptyString( json[ "launchers" ] )
      self.spacecraft = nonEmptyString( json[ "spacecraft" ] )
      self.parent = nonEmptyString( json[ "parent" ] )
      self.launchLibraryURL = nonEmptyString( json[ "launch_library_url" ] )
      self.totalLaunchCount = nonNegativeInt( json[ "total_launch_count" ] )
      self.successfulLaunches = nonNegativeInt( json[ "successful_launches" ] )
      self.consecutiveSuccessfulLaunches = nonNegativeInt( json[ "consecutive_successful_launches" ] )
      self.failedLaunches = nonNegativeInt( json[ "failed_launches" ] )
      self.pendingLaunches = nonNegativeInt( json[ "pending_launches" ] )
      self.successfulLandings = nonNegativeInt( json[ "successful_landings" ] )
      self.failedLandings = nonNegativeInt( json[ "failed_landings" ] )
      self.attemptedLandings = nonNegativeInt( json[ "attempted_landings" ] )
      self.consecutiveSuccessfulLandings = nonNegativeInt( json[ "consecutive_successful_landings" ] )
      self.infoURL = nonEmptyString( json[ "info_url" ] )
      self.wikiURL = nonEmptyString( json[ "wiki_url" ] )
      self.logoURL = nonEmptyString( json[ "logo_url" ] )
      self.imageURL = nonEmptyString( json[ "image_url" ] )
      self.nationURL = nonEmptyString( json[ "nation_url" ] )
      self.configurationList = parseArray( json[ "launcher_list" ] )
      self.spacecraftList = parseArray( json[ "spacecraft_list" ] )
   }
}
