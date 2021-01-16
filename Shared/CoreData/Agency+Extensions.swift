// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 Extensions to the Core Data generated {Agency} entity.
 */
extension Agency
{
   /** Set< Astronaut > wrapper for the generated NSSet of {Astronaut}s. */
   var astronautsSet: Set< Astronaut > { self.astronauts as? Set< Astronaut > ?? Set< Astronaut >() }

   /** Set< Program > wrapper for the generated NSSet of {Program}s. */
   var programsSet: Set< Program > { self.programs as? Set< Program > ?? Set< Program >() }

   /** Set< SpacecraftConfig > wrapper for the generated NSSet of {SpacecraftConfig}s. */
   var spacecraftConfigsSet: Set< SpacecraftConfig > { self.spacecraftConfigs as? Set< SpacecraftConfig > ?? Set< SpacecraftConfig >() }

   /** Array of {Astronaut}s, sorted by name. */
   var sortedAstronauts: [Astronaut] { sortAstronautsByName( astronautArray: Array( self.astronautsSet ) ) }

   /** True if the {Agency} has any {Astronaut}s. */
   var hasAstronauts: Bool { !astronautsSet.isEmpty }

   /** Array of {Program}s, sorted by name. */
   var sortedPrograms: [Program] { sortProgramsByName( programArray: Array( self.programsSet ) ) }

   /** True if the {Agency} has any {Program}s. */
   var hasPrograms: Bool { !programsSet.isEmpty }

   /** Array of {SpacecraftConfig}s, sorted by name. */
   var sortedSpacecraftConfigs: [SpacecraftConfig] { sortSpacecraftConfigsByName( spacecraftConfigArray: Array( self.spacecraftConfigsSet ) ) }

   /** True if the {Agency} has any {SpacecraftConfig}s. */
   var hasSpacecraftConfigs: Bool { !spacecraftConfigsSet.isEmpty }
}

/**
 Returns a sorted version of the given {Agency} array.

 - Parameter agencyArray - list of {Agency}s to sort
 - Returns: sorted version of the given {Agency} list
 */
func sortAgenciesByName( agencyArray: [Agency]? ) -> [Agency]
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
 Returns true if the {Agency} is a minimal Agency record. Used to determine if an {Agency} needs a
 details view.

 ### Example
 ````
 let agencyIsBasic: Bool = isBasic( agency: agency )
 ````

 - Parameter agency - {Agency} agency to check for details
 - Returns: true if an {Agency} only has a name
 */
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

/**
 Gets a {Agency} with the given ID in the given context.

 ### Example
 ````
 let agency: Agency = getAgency( by: 2345, context: context )
 ````

 - Parameter entityID - ID of the {Agency} to fetch
 - Parameter context - context to get the {Agency} from
 - Returns: agency with the given ID in the context, nil if not found
 */
func getAgency( by entityID: Int64, context: NSManagedObjectContext ) -> Agency?
{
   return getEntityByID( entityID: entityID, context: context, entityName: "Agency" ) as? Agency
}

func fetchAgency( agency: AgencyJSON, context: NSManagedObjectContext ) -> Agency
{
   let agencyEntity: Agency? = getAgency( by: agency.id, context: context )
   agency.updateEntity( entity: agencyEntity, context: context )
   return agencyEntity ?? agency.addToCoreData( context: context )
}

func getAgencyCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "Agency", context: context )
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
