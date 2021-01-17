// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for [Program]. */
public let PROGRAM_ENTITY_NAME: String = "Program"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated [Program] entity.
 */
extension Program
{
   /** Set< Agency > wrapper for the generated NSSet of {Agency}s. */
   var agenciesSet: Set< Agency > { self.agencies as? Set< Agency > ?? Set< Agency >() }

   /** Set< Event > wrapper for the generated NSSet of {Event}s. */
   var eventsSet: Set< Event > { self.events as? Set< Event > ?? Set< Event >() }

   /** Set< Launch > wrapper for the generated NSSet of {Launch}s. */
   var launchesSet: Set< Launch > { self.launches as? Set< Launch > ?? Set< Launch >() }

   /** Array of {Agency}s, sorted by name. */
   var sortedAgencies: [Agency] { sortAgenciesByName( agencyArray: Array( self.agenciesSet ) ) }

   /** True if the {Program} has any {Agency}s. */
   var hasAgencies: Bool { !agenciesSet.isEmpty }

   /** Array of {Event}s, sorted by name. */
   var sortedEvent: [Event] { sortEventsByName( eventArray: Array( self.eventsSet ) ) }

   /** True if the {Program} has any {Event}s. */
   var hasEvents: Bool { !eventsSet.isEmpty }

   /** Array of {Launch}s, sorted by name. */
   var sortedLaunches: [Launch] { sortLaunchesByName( launchArray: Array( self.launchesSet ) ) }

   /** True if the {Program} has any {Launch}s. */
   var hasLaunches: Bool { !launchesSet.isEmpty }
}

/**
 Returns a sorted version of the given {Program} array.

 - parameter programArray - list of {Program}s to sort
 - returns: sorted version of the given {Program} list
 */
public func sortProgramsByName( programArray: [Program]? ) -> [Program]
{
   guard let programArray = programArray else { return [] }

   var programs: [Program] = Array( programArray )
   programs.sort
   {
      program1, program2 in

      if let name1: String = program1.name,
         let name2: String = program2.name
      {
         return name1 < name2
      }
      else
      {
         return false
      }
   }

   return programs
}

/**
 Add the given agencies to the given program, and link them back to the program.

 ### Example
 ````
 addAgencies( entity: entity, agencies: self.agencies, context: context )
 ````

 - parameter entity - [Program] program to add the agencies to
 - parameter agencies - [AgencyJSON] list of agencies to add
 - parameter context - [NSManagedObjectContext] contenxt in which the linking takes place
 */
public func addAgencies( entity: Program, agencies: [AgencyJSON], context: NSManagedObjectContext )
{
   for agency in agencies
   {
      let agencyEntity: Agency = fetchAgency( agency: agency, context: context )
      entity.addToAgencies( agencyEntity )
      agencyEntity.addToPrograms( entity )
   }
}

/**
 Gets all the agency country codes for all the agencies in this [Program].

 ### Example
 ```
 let agencyCountries: [String] = getAllAgencyFlags( program: program )
 ```

 - parameter program - [Program] program to search for agencies and countries in those agencies
 - returns: [String] list of countries in a program's agency list
 */
public func getAllAgencyFlags( program: Program? ) -> [String]
{
   guard let program = program else { return [] }

   var codes: Set< String > = Set< String >()
   for agency in program.agencies as? Set<Agency> ?? Set()
   {
      for countryCode in agency.countryCodes ?? []
      {
         codes.insert( countryCode )
      }
   }

   return Array( codes )
}

/**
 Gets a [Program] with the given ID in the given context.

 ### Example
 ````
 let program: Program = getProgram( by: 2345, context: context )
 ````

 - parameter entityID - ID of the [Program] to fetch
 - parameter context - context to get the [Program] from
 - returns: [Program] with the given ID in the context, nil if not found
 */
public func getProgram( by programID: Int64, context: NSManagedObjectContext ) -> Program?
{
   return getEntityByID( entityID: programID, context: context, entityName: PROGRAM_ENTITY_NAME ) as? Program
}

/**
 Fetches, updates, or creates a [Program] from the context, given the data

 - parameter program: JSON data about the program
 - parameter context: Core Data object context
 - returns: updated [Program]
 */
public func fetchProgram( program: ProgramJSON, context: NSManagedObjectContext ) -> Program
{
   let programEntity: Program? = getProgram( by: program.id, context: context )
   program.updateEntity( entity: programEntity, context: context )
   return programEntity ?? program.addToCoreData( context: context )
}

/**
 Returns the number of [Program] records in the given context.

 - parameter context: Core Data object context
 - returns: [Int?] Number of [Program] records in the context
 */
public func getProgramCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: PROGRAM_ENTITY_NAME, context: context )
}

/*
 Generated

extension Program: Identifiable
{
   public class func fetchRequest() -> NSFetchRequest< Program >
   {
      return NSFetchRequest< Program >( entityName: "Program" )
   }

   public var endDate: Date?
   public var id: Int64
   public var imageURL: String?
   public var infoURL: String?
   public var name: String?
   public var programDescription: String?
   public var startDate: Date?
   public var wikiURL: String?
   public var agencies: NSSet?
   public var events: NSSet?
   public var launches: NSSet?

   public func addToAgencies( _ value: Agency )
   public func removeFromAgencies( _ value: Agency )
   public func addToAgencies( _ values: NSSet )
   public func removeFromAgencies( _ values: NSSet )

   public func addToEvents( _ value: Event )
   public func removeFromEvents( _ value: Event )
   public func addToEvents( _ values: NSSet )
   public func removeFromEvents( _ values: NSSet )

   public func addToLaunches( _ value: Launch )
   public func removeFromLaunches( _ value: Launch )
   public func addToLaunches( _ values: NSSet )
   public func removeFromLaunches( _ values: NSSet )
}
 */
