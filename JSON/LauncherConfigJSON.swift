// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

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

 ### Spec (base and detailed)
       id                  integer, readOnly: true
       launch_library_id   integer, maximum: 2147483647, minimum: -2147483648, x-nullable: true
       url                 string($uri), readOnly: true
       name*               string, maxLength: 200, minLength: 1
       description         string, maxLength: 2048
       family              string, maxLength: 200
       full_name           string, maxLength: 200
       variant             string, maxLength: 200
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
       manufacturer        Agency{...}
       program             [Program{...}]
       reusable            boolean
       total_launch_count  string
 */
public class LauncherConfigJSON: Decodable, Identifiable, JSONElement
{
   // translate API attribute names into better var names
//   enum CodingKeys: String, CodingKey
//   {
//      case id, url, name, family, variant, alias, length, diameter, apogee
//
//      case fullName = "full_name"
//      case launchLibraryID = "launch_library_id"
//      case launcherConfigDescription = "description"
//      case minStage = "min_stage"
//      case maxStage = "max_stage"
//      case maidenFlight = "maiden_flight"
//      case launchMass = "launch_mass"
//      case leoCapacity = "leo_capacity"
//      case gtoCapacity = "gto_capacity"
//      case takeoffThrust = "to_thrust"
//      case vehicleRange = " vehicle_range"
//      case imageURL = "image_url"
//      case infoURL = "info_url"
//      case wikiURL = "wiki_url"
//      case consecutiveSuccessfulLaunches = "consecutive_successful_launches"
//      case successfulLaunches = "successful_launches"
//      case failedLaunches = "failed_launches"
//      case pendingLaunches = "pending_launches"
//   }

   /** ID of the astronaut within the API. */
   public var id: Int64
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
   let length: Int64?
   let diameter: Int64?
   let maidenFlight: String? // ISO format?
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

   /**
    Make a `LauncherConfigJSON` from a JSON structure.

    - parameter json: `JSONStructure` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.url = json[ "url" ] as? String
      self.launchLibraryID = json[ "launchLibraryId" ] as? Int64
      self.name = json[ "name" ] as? String
      self.family = json[ "family" ] as? String
      self.fullName = json[ "full_name" ] as? String
      self.launcherConfigDescription = json[ "description" ] as? String
      self.variant = json[ "variant" ] as? String
      self.alias = json[ "alias" ] as? String
      self.minStage = json[ "min_stage" ] as? Int64
      self.maxStage = json[ "max_stage" ] as? Int64
      self.length = json[ "length" ] as? Int64
      self.diameter = json[ "diameter" ] as? Int64
      self.maidenFlight = json[ "maiden_flight" ] as? String
      self.launchMass = json[ "launch_mass" ] as? Int64
      self.leoCapacity = json[ "leo_capacity" ] as? Int64
      self.gtoCapacity = json[ "gto_capacity" ] as? Int64
      self.takeoffThrust = json[ "to_thrust" ] as? Int64
      self.apogee = json[ "apogee" ] as? Int64
      self.vehicleRange = json[ "vehicle_range" ] as? Int64
      self.imageURL = json[ "image_url" ] as? String
      self.infoURL = json[ "info_url" ] as? String
      self.wikiURL = json[ "wiki_url" ] as? String
      self.consecutiveSuccessfulLaunches = json[ "consecutive_successful_launches" ] as? Int64
      self.successfulLaunches = json[ "successful_launches" ] as? Int64
      self.failedLaunches = json[ "failed_launches" ] as? Int64
      self.pendingLaunches = json[ "pending_launches" ] as? Int64
      self.manufacturer = AgencyJSON( json: json[ "manufacturer" ] as? JSONStructure )
      self.programs = ( json[ "program" ] as? [JSONStructure] ?? [] ).compactMap { return ProgramJSON( json: $0 ) }
      self.reusable = json[ "reusable" ] as? Bool
      self.totalLaunchCount = json[ "total_launch_count" ] as? String
   }

   /**
    Add this data to Core Data as a `LauncherConfig`. The context still needs to be saved after the add.

    - parameter context: Core Data context to add the entity to.
    - returns: `LauncherConfig` the added entity
    */
   public func addToCoreData( context: NSManagedObjectContext ) -> LauncherConfig
   {
      let newLauncherConfig: LauncherConfig = LauncherConfig( context: context )
      updateEntity( entity: newLauncherConfig, context: context )

      return newLauncherConfig
   }

   /**
    Set or update the values of the `LauncherConfig` entity,

    - parameter entity:  `LauncherConfig?` entity to fill/update
    - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
    */
   public func updateEntity( entity: LauncherConfig?, context: NSManagedObjectContext )
   {
      guard let launcherConfigEntity = entity else { return }

      launcherConfigEntity.id = id
      launcherConfigEntity.name = name
      launcherConfigEntity.family = family
      launcherConfigEntity.fullName = fullName
      launcherConfigEntity.launcherConfigDescription = launcherConfigDescription
      launcherConfigEntity.variant = variant
      launcherConfigEntity.alias = alias
      launcherConfigEntity.minStage = guaranteedInt64( minStage )
      launcherConfigEntity.maxStage = guaranteedInt64( maxStage )
      launcherConfigEntity.length = guaranteedInt64( length )
      launcherConfigEntity.diameter = guaranteedInt64( diameter )
      launcherConfigEntity.maidenFlight = maidenFlight
      launcherConfigEntity.launchMass = guaranteedInt64( launchMass )
      launcherConfigEntity.leoCapacity = guaranteedInt64( leoCapacity )
      launcherConfigEntity.gtoCapacity = guaranteedInt64( gtoCapacity )
      launcherConfigEntity.takeoffThrust = guaranteedInt64( takeoffThrust )
      launcherConfigEntity.apogee = guaranteedInt64( apogee )
      launcherConfigEntity.vehicleRange = guaranteedInt64( vehicleRange )
      launcherConfigEntity.imageURL = imageURL
      launcherConfigEntity.infoURL = infoURL
      launcherConfigEntity.wikiURL = wikiURL
      launcherConfigEntity.consecutiveSuccessfulLaunches = guaranteedInt64( consecutiveSuccessfulLaunches )
      launcherConfigEntity.successfulLaunches = guaranteedInt64( successfulLaunches )
      launcherConfigEntity.failedLaunches = guaranteedInt64( failedLaunches )
      launcherConfigEntity.pendingLaunches = guaranteedInt64( pendingLaunches )
      launcherConfigEntity.addManufacturerFromJSON( manufacturer: manufacturer, context: context )
      launcherConfigEntity.addProgramsFromJSON( programs: programs, context: context )
      launcherConfigEntity.reusable = guaranteedBool( reusable )
      launcherConfigEntity.totalLaunchCount = totalLaunchCount

      // additional generated info, not in the JSON
      launcherConfigEntity.fetched = Date()
   }
}
