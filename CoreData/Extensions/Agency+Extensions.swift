// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for `Agency`. */
public let AGENCY_ENTITY_NAME: String = "Agency"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated `Agency` entity.
 */
extension Agency
{
   /** `Set< Astronaut >` wrapper for the generated `NSSet` of `Astronaut`s. */
   var astronautsSet: Set< Astronaut > { self.astronauts as? Set< Astronaut > ?? Set< Astronaut >() }

   /** `Set< Program >` wrapper for the generated `NSSet` of `Program`s. */
   var programsSet: Set< Program > { self.programs as? Set< Program > ?? Set< Program >() }

   /** `Set< SpacecraftConfig >` wrapper for the generated `NSSet` of `SpacecraftConfig`s. */
   var spacecraftConfigsSet: Set< SpacecraftConfig > { self.spacecraftConfigs as? Set< SpacecraftConfig > ?? Set< SpacecraftConfig >() }

   /** Array of `Astronaut`s, sorted by name. */
   var sortedAstronauts: [Astronaut] { sortAstronautsByName( astronautArray: Array( self.astronautsSet ) ) }

   /** True if the `Agency` has any `Astronaut`s. */
   var hasAstronauts: Bool { !astronautsSet.isEmpty }

   /** Array of `Program`s, sorted by name. */
   var sortedPrograms: [Program] { sortProgramsByName( programArray: Array( self.programsSet ) ) }

   /** True if the `Agency` has any `Program`s. */
   var hasPrograms: Bool { !programsSet.isEmpty }

   /** Array of `SpacecraftConfig`s, sorted by name. */
   var sortedSpacecraftConfigs: [SpacecraftConfig] { sortSpacecraftConfigsByName( spacecraftConfigArray: Array( self.spacecraftConfigsSet ) ) }

   /** True if the `Agency` has any `SpacecraftConfig`s. */
   var hasSpacecraftConfigs: Bool { !spacecraftConfigsSet.isEmpty }

   func addConfigurationsFromJSON( configurations: [LauncherConfigJSON]?, context: NSManagedObjectContext )
   {
      for configuration: LauncherConfigJSON in configurations ?? []
      {
         let configurationEntity: LauncherConfig = fetchLauncherConfig( launcherConfig: configuration, context: context )
         self.addToConfigurations( configurationEntity )
         configurationEntity.addToAgencies( self )
      }
   }

   func addSpacecraftsFromJSON( spacecraftList: [SpacecraftJSON]?, context: NSManagedObjectContext )
   {
      for spacecraft: SpacecraftJSON in spacecraftList ?? []
      {
         let spacecraftEntity: Spacecraft = fetchSpacecraft( spacecraft: spacecraft, context: context )
         self.addToSpacecraftList( spacecraftEntity )
         spacecraftEntity.addToAgencies( self )
      }
   }
}

/**
 Add this data to Core Data as a `Agency` entity. The context still needs to be saved after the add.

 - parameter json:    JSON to parse
 - parameter context: Core Data context to add the entity to.
 - returns: `Agency` the added entity
 */
public func addToCoreData( json: AgencyJSON, context: NSManagedObjectContext ) -> Agency
{
   let newAgency: Agency = Agency( context: context )
   updateEntity( json: json, entity: newAgency, context: context  )

   return newAgency
}

/**
 Set or update the values of the `Agency` entity,

 - parameter json:    JSON to parse
 - parameter entity: `Agency?` entity to fill/update
 - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
 */
public func updateEntity( json: AgencyJSON, entity: Agency?, context: NSManagedObjectContext )
{
   guard let agencyEntity: Agency = entity else { return }

   agencyEntity.id = json.id
   agencyEntity.url = json.url
   agencyEntity.name = json.name
   agencyEntity.type = json.type
   agencyEntity.countryCodes = getCountryCodes( countryCode: json.countryCode )
   agencyEntity.abbreviation = json.abbreviation

   if var admin: String = json.administrator
   {
      admin = admin.removePrefix( "Administrator: " ) // DATABASE CORRECTION
      agencyEntity.administrator = admin
   }

   agencyEntity.agencyDescription = json.agencyDescription
   agencyEntity.foundingYear = json.foundingYear

   if json.launchers?.count ?? 0 > 0 && json.launchers != "None" // DATABASE CORRECTION
   {
      agencyEntity.launchers = json.launchers
   }

   if json.spacecraft?.count ?? 0 > 0 && json.spacecraft != "None" // DATABASE CORRECTION
   {
      agencyEntity.spacecraft = json.spacecraft
   }

   agencyEntity.parent = json.parent
   agencyEntity.imageURL = json.imageURL

   // add flags for holes in the API
   if let name: String = json.name,
      let correction: String = countryCodeCorrections[ name ]
   {
      agencyEntity.countryCodes?.append( correction ) // DATABASE CORRECTION
   }

   agencyEntity.launchLibraryURL = json.launchLibraryURL
   agencyEntity.totalLaunchCount = guaranteedInt64( json.totalLaunchCount )
   agencyEntity.successfulLaunches = guaranteedInt64( json.successfulLaunches )
   agencyEntity.consecutiveSuccessfulLaunches = guaranteedInt64( json.consecutiveSuccessfulLaunches )
   agencyEntity.failedLaunches = guaranteedInt64( json.failedLaunches )
   agencyEntity.pendingLaunches = guaranteedInt64( json.pendingLaunches )
   agencyEntity.successfulLandings = guaranteedInt64( json.successfulLandings )
   agencyEntity.failedLandings = guaranteedInt64( json.failedLandings )
   agencyEntity.attemptedLandings = guaranteedInt64( json.attemptedLandings )
   agencyEntity.consecutiveSuccessfulLandings = guaranteedInt64( json.consecutiveSuccessfulLandings )
   agencyEntity.infoURL = json.infoURL
   agencyEntity.wikiURL = json.wikiURL
   agencyEntity.logoURL = json.logoURL
   agencyEntity.imageURL = json.imageURL
   agencyEntity.nationURL = json.nationURL
   agencyEntity.addConfigurationsFromJSON( configurations: json.configurationList, context: context )
   agencyEntity.addSpacecraftsFromJSON( spacecraftList: json.spacecraftList, context: context )

   // additional generated info, not in the JSON
   agencyEntity.sortableName = json.name?.lowercased()
   agencyEntity.fetched = Date()
}

/**
 Gets all the `Agency` entities in the context

 - parameter context:  `NSManagedObjectContext` context to get the `Agency`s from
 - returns: `[Agency]?` list of agencies, nil if not possible
 */
public func fetchAllAgencies( context: NSManagedObjectContext ) -> [Agency]?
{
   return fetchAllEntities( entityName: AGENCY_ENTITY_NAME, context: context ) as? [Agency]
}

/**
 Returns a sorted version of the given `Agency` array.

 - parameter agencyArray: `[Agency]?` list of `Agency`s to sort
 - returns: `[Agency]` sorted version of the given `Agency` list, never nil
 */
public func sortAgenciesByName( agencyArray: [Agency]? ) -> [Agency]
{
   guard let agencyArray = agencyArray else { return [] }

   var agencys: [Agency] = Array( agencyArray )
   agencys.sort
   {
      agency1, agency2 in

      if let name1: String = agency1.name,
         let name2: String = agency2.name
      {
         return name1 < name2
      }
      else
      {
         return false
      }
   }

   return agencys
}

/**
 Returns true if the `Agency` is a minimal Agency record. Used to determine if an `Agency` needs a
 details view.

 ### Example
     let agencyIsBasic: Bool = isBasic( agency: agency )

 - parameter agency: `Agency` agency to check for details
 - returns: true if an `Agency` only has a name
 */
public func isBasic( agency: Agency ) -> Bool
{
   return agency.name != nil &&
      agency.agencyDescription == nil &&
      agency.administrator == nil &&
      agency.foundingYear == nil &&
      agency.launchers == nil &&
      agency.spacecraft == nil &&
      agency.imageURL == nil
}

/**
 Gets an `Agency` with the given ID in the given context.

 ### Example
     let agency: Agency = getAgency( by: 2345, context: context )

 - parameter entityID: `Int64` ID of the `Agency` to fetch
 - parameter context: `NSManagedObjectContext` context to get the `Agency` from
 - returns: `Agency?` agency with the given ID in the context, nil if not found
 */
public func getAgency( by entityID: Int64, context: NSManagedObjectContext ) -> Agency?
{
   return getEntityByID( entityID: entityID, context: context, entityName: AGENCY_ENTITY_NAME ) as? Agency
}

/**
 Fetches, updates, or creates a `Agency` from the context, given `AgencyJSON` data

 - parameter agency: `AgencyJSON` JSON data about the agency
 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: updated `Agency`
 */
public func fetchAgency( agency: AgencyJSON, context: NSManagedObjectContext ) -> Agency
{
   let agencyEntity: Agency? = getAgency( by: agency.id, context: context )
   updateEntity( json: agency, entity: agencyEntity, context: context )
   return agencyEntity ?? addToCoreData( json: agency, context: context )
}

/**
 Returns the number of `Agency` records in the given context.

 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `Int?` Number of `Agency` records in the context
 */
public func getAgencyCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: AGENCY_ENTITY_NAME, context: context )
}

/**
 Delete all `Agency` entities in the given context.

 - parameter context: `NSManagedObjectContext` context to remove entities from
 */
func deleteAllAgencyEntities( context: NSManagedObjectContext )
{
   deleteAllEntities( entityType: AGENCY_ENTITY_NAME, context: context )
}

/*
extension Agency: Identifiable
{
   class func fetchRequest() -> NSFetchRequest< Agency >
   {
      return NSFetchRequest< Agency >( entityName: "Agency" )
   }

   @NSManaged public var abbreviation: String?
   @NSManaged public var administrator: String?
   @NSManaged public var agencyDescription: String?
   @NSManaged public var countryCodes: [String]?
   @NSManaged public var featured: Bool
   @NSManaged public var foundingYear: String?
   @NSManaged public var id: Int64
   @NSManaged public var imageURL: String?
   @NSManaged public var launchers: String?
   @NSManaged public var name: String?
   @NSManaged public var parent: String?
   @NSManaged public var spacecraft: String?
   @NSManaged public var type: String?
   @NSManaged public var astronauts: NSSet?
   @NSManaged public var programs: NSSet?
   @NSManaged public var spacecraftConfigs: NSSet?

   public func addToAstronauts( _ value: Astronaut )
   public func removeFromAstronauts( _ value: Astronaut )
   public func addToAstronauts( _ values: NSSet )
   public func removeFromAstronauts( _ values: NSSet )

   public func addToPrograms( _ value: Program )
   public func removeFromPrograms( _ value: Program )
   public func addToPrograms( _ values: NSSet )
   public func removeFromPrograms( _ values: NSSet )

   public func addToSpacecraftConfigs( _ value: SpacecraftConfig )
   public func removeFromSpacecraftConfigs( _ value: SpacecraftConfig )
   public func addToSpacecraftConfigs( _ values: NSSet )
   public func removeFromSpacecraftConfigs( _ values: NSSet )
}
 */
