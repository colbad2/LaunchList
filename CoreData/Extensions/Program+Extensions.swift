// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for `Program`. */
public let PROGRAM_ENTITY_NAME: String = "Program"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated `Program` entity.
 */
extension Program
{
   /** `Set< Agency >` wrapper for the generated `NSSet` of `Agency`s. */
   var agenciesSet: Set< Agency > { self.agencies as? Set< Agency > ?? Set< Agency >() }

   /** `Set< Event >` wrapper for the generated `NSSet` of `Event`s. */
   var eventsSet: Set< Event > { self.events as? Set< Event > ?? Set< Event >() }

   /** `Set< Launch >` wrapper for the generated `NSSet` of `Launch`s. */
   var launchesSet: Set< Launch > { self.launches as? Set< Launch > ?? Set< Launch >() }

   /** Array of `Agency`s, sorted by name. */
   var sortedAgencies: [Agency] { sortAgenciesByName( agencyArray: Array( self.agenciesSet ) ) }

   /** True if the `Program` has any `Agency`s. */
   var hasAgencies: Bool { !agenciesSet.isEmpty }

   /** Array of `Event`s, sorted by name. */
   var sortedEvent: [Event] { sortEventsByName( eventArray: Array( self.eventsSet ) ) }

   /** True if the `Program` has any `Event`s. */
   var hasEvents: Bool { !eventsSet.isEmpty }

   /** Array of `Launch`s, sorted by name. */
   var sortedLaunches: [Launch] { sortLaunchesByName( launchArray: Array( self.launchesSet ) ) }

   /** True if the `Program` has any `Launch`s. */
   var hasLaunches: Bool { !launchesSet.isEmpty }
}

/**
 Creates a new `Program` entity and fills it with data from this `ProgramJSON`.

 - parameter json:    JSON to parse
 - parameter context: `NSManagedObjectContext` Core Data context to add to
 - returns:           `Program` the added entity
 */
public func addToCoreData( json: ProgramJSON, context: NSManagedObjectContext ) -> Program
{
   let newProgram: Program = Program( context: context )
   updateEntity( json: json, entity: newProgram, context: context )

   return newProgram
}

/**
 Update an entity using the data from the [ProgramJSON] object.

 ### Example
       let context: NSManagedObjectContext = Persistence.shared.container.viewContext
       updateEntity( entity: newProgram, context: context )

 - parameter json:    JSON to parse
 - parameter entity:  `Program` update or create a program entity
 - parameter context: `NSManagedObjectContext` Core Data context to add to
 */
public func updateEntity( json: ProgramJSON, entity: Program?, context: NSManagedObjectContext )
{
   guard let programEntity = entity else { return }

   programEntity.id = json.id ?? -1
   programEntity.name = json.name
   programEntity.programDescription = json.description
   addAgencies( entity: programEntity, agencies: json.agencies, context: context )
   programEntity.imageURL = json.imageURL
   programEntity.startDate = parseISODate( isoDate: json.startDate )
   programEntity.endDate = parseISODate( isoDate: json.endDate )
   programEntity.infoURL = json.infoURL
   programEntity.wikiURL = json.wikiURL

   programEntity.fetched = Date()
}

/**
 Gets all the `Program` entities in the context

 - parameter context:  `NSManagedObjectContext` context to get the `Program`s from
 - returns: `[Program]?` list of programs, nil if not possible
 */
public func fetchAllPrograms( context: NSManagedObjectContext ) -> [Program]?
{
   return fetchAllEntities( entityName: PROGRAM_ENTITY_NAME, context: context ) as? [Program]
}

/**
 Returns a sorted version of the given `Program` array.

 - parameter programArray: `[Program]?` list of `Program`s to sort
 - returns: `[Program] sorted version of the given `Program` list
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
     addAgencies( entity: entity, agencies: self.agencies, context: context )

 - parameter entity: `Program` program to add the agencies to
 - parameter agencies: `[AgencyJSON]` list of agencies to add
 - parameter context: `NSManagedObjectContext` contenxt in which the linking takes place
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
 Gets all the agency country codes for all the agencies in this `Program`.

 ### Example
 ```
 let agencyCountries: [String] = getAllAgencyFlags( program: program )
 ```

 - parameter program: `Program` program to search for agencies and countries in those agencies
 - returns: `[String]` list of countries in a program's agency list
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
 Gets a `Program` with the given ID in the given context.

 ### Example
 ````
 let program: Program = getProgram( by: 2345, context: context )
 ````

 - parameter programID: `Int64` ID of the `Program` to fetch
 - parameter context: `NSManagedObjectContext context to get the `Program` from
 - returns: `Program?` with the given ID in the context, nil if not found
 */
public func getProgram( by programID: Int64, context: NSManagedObjectContext ) -> Program?
{
   return getEntityByID( entityID: programID, context: context, entityName: PROGRAM_ENTITY_NAME ) as? Program
}

/**
 Fetches, updates, or creates a `Program` from the context, given the data.

 - parameter program: `ProgramJSON` JSON data about the program
 - parameter context: `NSManagedObjectContext Core Data object context
 - returns: updated `Program`
 */
public func fetchProgram( program: ProgramJSON, context: NSManagedObjectContext ) -> Program
{
   let programEntity: Program? = getProgram( by: program.id ?? -1, context: context )
   updateEntity( json: program, entity: programEntity, context: context )
   return programEntity ?? addToCoreData( json: program, context: context )
}

/**
 Returns the number of `Program` records in the given context.

 - parameter context: `NSManagedObjectContext Core Data object context
 - returns: `Int?` Number of `Program` records in the context
 */
public func getProgramCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: PROGRAM_ENTITY_NAME, context: context )
}

/**
 Delete all `Program` entities in the given context.

 - parameter context: `NSManagedObjectContext` context to remove entities from
 */
func deleteAllProgramEntities( context: NSManagedObjectContext )
{
   deleteAllEntities( entityType: PROGRAM_ENTITY_NAME, context: context )
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
