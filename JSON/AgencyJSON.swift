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
       id              integer,      readOnly: true
       url             string($uri), readOnly: true
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

       launch_library_url                string,       readOnly: true
       total_launch_count                string,       readOnly: true
       successful_launches               string,       readOnly: true
       consecutive_successful_launches   string,       readOnly: true
       failed_launches                   string,       readOnly: true
       pending_launches                  string,       readOnly: true
       successful_landings               string,       readOnly: true
       failed_landings                   string,       readOnly: true
       attempted_landings                string,       readOnly: true
       consecutive_successful_landings   string,       readOnly: true
       info_url                          string($uri), maxLength: 200, x-nullable: true
       wiki_url                          string($uri), maxLength: 200, x-nullable: true
       logo_url                          string($uri), readOnly: true, x-nullable: true
       nation_url                        string($uri), readOnly: true, x-nullable: true
       launcher_list                     [LauncherConfig]
       spacecraft_list                   [SpacecraftConfig]

 */
public class AgencyJSON: Decodable, Identifiable, JSONElement, AutoEquatable, AutoHashable
{
   /** ID of the astronaut within the API. */
   public var id: Int64
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

    - parameter json: `JSONStructure` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.url = json[ "url" ] as? String
      self.name = json[ "name" ] as? String
      self.featured = json[ "featured" ] as? Bool
      self.type = json[ "type" ] as? String
      self.countryCode = json[ "country_code" ] as? String
      self.abbreviation = json[ "abbrev" ] as? String
      self.agencyDescription = json[ "description" ] as? String
      self.administrator = json[ "administrator" ] as? String
      self.foundingYear = json[ "founding_year" ] as? String
      self.launchers = json[ "launchers" ] as? String
      self.spacecraft = json[ "spacecraft" ] as? String
      self.parent = json[ "parent" ] as? String
      self.launchLibraryURL = json[ "launch_library_url" ] as? String
      self.totalLaunchCount = json[ "total_launch_count" ] as? Int64
      self.successfulLaunches = json[ "successful_launches" ] as? Int64
      self.consecutiveSuccessfulLaunches = json[ "consecutive_successful_launches" ] as? Int64
      self.failedLaunches = json[ "failed_launches" ] as? Int64
      self.pendingLaunches = json[ "pending_launches" ] as? Int64
      self.successfulLandings = json[ "successful_landings" ] as? Int64
      self.failedLandings = json[ "failed_landings" ] as? Int64
      self.attemptedLandings = json[ "attempted_landings" ] as? Int64
      self.consecutiveSuccessfulLandings = json[ "consecutive_successful_landings" ] as? Int64
      self.infoURL = json[ "info_url" ] as? String
      self.wikiURL = json[ "wiki_url" ] as? String
      self.logoURL = json[ "logo_url" ] as? String
      self.imageURL = json[ "image_url" ] as? String
      self.nationURL = json[ "nation_url" ] as? String

      self.configurationList = []
      if let configurationArray: [JSONStructure] = json[ "launcher_list" ] as? [JSONStructure]
      {
         self.configurationList = configurationArray.compactMap { LauncherConfigJSON( json: $0 ) }
      }

      self.spacecraftList = []
      if let spacecraftArray: [JSONStructure] = json[ "spacecraft_list" ] as? [JSONStructure]
      {
         self.spacecraftList = spacecraftArray.compactMap { SpacecraftConfigJSON( json: $0 ) }
      }
   }
}
