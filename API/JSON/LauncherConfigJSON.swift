// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 Detailed version returned from ID-specific Agency API (/agencies/{id}).

 Very similar to `RocketJSON`, which is just an ID wrapping this structure.

 ### Example JSON
       {
           "id": 169,
           "launch_library_id": 90,
           "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/169/",
           "name": "Falcon 9 v1.0",
           "family": "Falcon",
           "full_name": "Falcon 9 v1.0",
           "variant": "v1.0"
         }
       }

 ### Spec (API models: LauncherConfigDetailSerializerForAgency, LauncherConfigList, LauncherConfig,
                         LauncherConfigDetail )
       id                  integer, readOnly: true
       url                 string($uri), readOnly: true
       name*               string, maxLength: 200, minLength: 1
       family              string, maxLength: 200
       full_name           string, maxLength: 200
       variant             string, maxLength: 200
       description         string, maxLength: 2048
       alias               string, maxLength: 200
       min_stage           integer, maximum: 2147483647, minimum: -2147483648, x-nullable: true
       max_stage           integer, maximum: 2147483647, minimum: -2147483648, x-nullable: true
       length              number, x-nullable: true // In meters
       diameter            number, x-nullable: true // in meters
       maiden_flight       string($date), x-nullable: true
       launch_mass         integer, maximum: 2147483647, minimum: -2147483648, x-nullable: true  // in tons
       leo_capacity        integer, title: LEO Capacity (kg), maximum: 2147483647, minimum: -2147483648, x-nullable: true
       gto_capacity        integer, title: GTO Capacity (kg) , maximum: 2147483647, minimum: -2147483648, x-nullable: true
       to_thrust           integer, title: Thrust at Liftoff (kN), maximum: 2147483647, minimum: -2147483648, x-nullable: true
       apogee              integer, title: Apogee - Sub-Orbital Only (km), maximum: 2147483647, minimum: -2147483648, x-nullable: true
       vehicle_range       integer, title: Vehicle Range - Legacy, maximum: 2147483647, minimum: -2147483648, x-nullable: true
       image_url           string($uri), readOnly: true, x-nullable: true
       info_url            string, maxLength: 200, x-nullable: true
       wiki_url            string, title: Wiki url, maxLength: 200, x-nullable: true
       consecutive_successful_launches   string, readOnly: true
       successful_launches string, readOnly: true
       failed_launches     string, readOnly: true
       pending_launches    string, readOnly: true
       manufacturer        AgencySerializerDetailedCommon{...}
       program             [Program{...}]
       reusable            boolean
       total_launch_count  string
       // launch_library_id   integer, maximum: 2147483647, minimum: -2147483648, x-nullable: true
       launch_cost         string maxLength: 200
 */
public class LauncherConfigJSON: Identifiable, JSONElement
{
   /** ID of the astronaut within the API. */
   public var id: Int64?
   /** URI of this data. Unused. */
   var url: String?
   /** ID of this data in the original API. Unused. */
   var launchLibraryID: Int64?
   /** Config name. */
   var name: String?
   /** Config family. */
   var family: String?
   /** Config name and family. */
   var fullName: String?
   let launcherConfigDescription: String?
   let variant: String?
   let alias: String?
   let minStage: Int64?
   let maxStage: Int64?
   let length: Double?
   let diameter: Double?
   let maidenFlight: String? // "2009-10-28"
   let launchMass: Int64?
   let leoCapacity: Int64?
   let gtoCapacity: Int64?
   let takeoffThrust: Int64?
   let apogee: Int64?
   let vehicleRange: Int64?
   let imageURL: String? // URL
   let infoURL: String? // URL
   let wikiURL: String? // URL
   let consecutiveSuccessfulLaunches: Int64?
   let successfulLaunches: Int64?
   let failedLaunches: Int64?
   let pendingLaunches: Int64?
   let manufacturer: AgencyJSON?
   var programs: [ProgramJSON] = []
   let reusable: Bool?
   let totalLaunchCount: String?
   /** Launch cost in dollars. */
   let launchCost: String?

   /**
    Make a `LauncherConfigJSON` from a JSON structure.

    - parameter json: `Any` JSON to parse
    */
   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      self.id = nonNegativeInt( json[ "id" ] )
      self.url = nonEmptyString( json[ "url" ] )
      self.launchLibraryID = nonNegativeInt( json[ "launch_library_id" ] )
      self.name = nonEmptyString( json[ "name" ] )
      self.family = nonEmptyString( json[ "family" ] )
      self.fullName = nonEmptyString( json[ "full_name" ] )
      self.launcherConfigDescription = nonEmptyString( json[ "description" ] )
      self.variant = nonEmptyString( json[ "variant" ] )
      self.alias = nonEmptyString( json[ "alias" ] )
      self.minStage = nonNegativeInt( json[ "min_stage" ] )
      self.maxStage = nonNegativeInt( json[ "max_stage" ] )
      self.length = nonNegativeDouble( json[ "length" ] )
      self.diameter = nonNegativeDouble( json[ "diameter" ] )
      self.maidenFlight = nonEmptyString( json[ "maiden_flight" ] )
      self.launchMass = nonNegativeInt( json[ "launch_mass" ] )
      self.leoCapacity = nonNegativeInt( json[ "leo_capacity" ] )
      self.gtoCapacity = nonNegativeInt( json[ "gto_capacity" ] )
      self.takeoffThrust = nonNegativeInt( json[ "to_thrust" ] )
      self.apogee = nonNegativeInt( json[ "apogee" ] )
      self.vehicleRange = nonNegativeInt( json[ "vehicle_range" ] )
      self.imageURL = nonEmptyString( json[ "image_url" ] )
      self.infoURL = nonEmptyString( json[ "info_url" ] )
      self.wikiURL = nonEmptyString( json[ "wiki_url" ] )
      self.consecutiveSuccessfulLaunches = nonNegativeInt( json[ "consecutive_successful_launches" ] )
      self.successfulLaunches = nonNegativeInt( json[ "successful_launches" ] )
      self.failedLaunches = nonNegativeInt( json[ "failed_launches" ] )
      self.pendingLaunches = nonNegativeInt( json[ "pending_launches" ] )
      self.manufacturer = AgencyJSON( json[ "manufacturer" ] )
      self.programs = parseArray( json[ "program" ] )
      self.reusable = json[ "reusable" ] as? Bool
      self.totalLaunchCount = nonEmptyString( json[ "total_launch_count" ] )
      self.launchCost = nonEmptyString( json[ "launch_cost" ] )
   }
}
