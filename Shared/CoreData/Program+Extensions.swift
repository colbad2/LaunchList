// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// TODO do this for all other entity types
/**
 Extensions to the Core Data generated {Program} entity.
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

 - Parameter programArray - list of {Program}s to sort
 - Returns: sorted version of the given {Program} list
 */
func sortProgramsByName( programArray: [Program]? ) -> [Program]
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

func getProgram( by programID: Int64, context: NSManagedObjectContext ) -> Program?
{
   return getEntityByID( entityID: programID, context: context, entityName: "Program" ) as? Program
}

func fetchProgram( program: ProgramJSON, context: NSManagedObjectContext ) -> Program
{
   let programEntity: Program? = getProgram( by: program.id, context: context )
   program.updateEntity( entity: programEntity, context: context )
   return programEntity ?? program.addToCoreData( context: context )
}

func getProgramCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "Program", context: context )
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
