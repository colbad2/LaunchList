// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for `Launch`. */
public let LAUNCH_ENTITY_NAME: String = "Launch"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated `Launch` entity.
 */
extension Launch
{
   /** `Set< Event >` wrapper for the generated `NSSet` of `Event`s. */
   var eventsSet: Set< Event > { self.events as? Set< Event > ?? Set< Event >() }

   /** `Set< Program >` wrapper for the generated `NSSet` of `Program`s. */
   var programsSet: Set< Program > { self.programs as? Set< Program > ?? Set< Program >() }

   /** Array of `Program`s, sorted by name. */
   var sortedPrograms: [Program] { sortProgramsByName( programArray: Array( self.programsSet ) ) }

   /** True if the `Launch` has any `Program`s. */
   var hasPrograms: Bool { !programsSet.isEmpty }

   func getProviderName() -> String // DATABASE CHANGE
   {
      var providerName: String? = self.serviceProvider?.name
      if providerName == "National Aeronautics and Space Administration"
      {
         providerName = "NASA"
      }
      else if providerName == "United States Air Force"
      {
         providerName = "US Air Force"
      }
      else if providerName == "Russian Federal Space Agency (ROSCOSMOS)"
      {
         providerName = "ROSCOSMOS"
      }

      return providerName ?? ""
   }
}

/**
 Returns a sorted version of the given `Launch` array.

 - parameter launchArray - list of `Launch`s to sort
 - returns: sorted version of the given `Launch` list
 */
public func sortLaunchesByName( launchArray: [Launch]? ) -> [Launch]
{
   guard let launchArray = launchArray else { return [] }

   var launches: [Launch] = Array( launchArray )
   launches.sort
   {
      launch1, launch2 in

      if let name1: String = launch1.name,
         let name2: String = launch2.name
      {
         return name1 < name2
      }
      else
      {
         return false
      }
   }

   return launches
}

/**
 Gets the mission name from a launch, if any.

 - parameter launch: `Launch` launch to get the mission name from
 - returns: mission name, if available, "" otherwise
 */
public func missionName( _ launch: Launch? ) -> String
{
   guard let launch = launch else { return "" }
   if let missionName: String = launch.mission?.name { return missionName }
   let parts: [String]? = launch.name?.components( separatedBy: "|" )
   let missionPart: String? = parts?.last

   return missionPart?.trim() ?? launch.name ?? ""
}

/**
 Gets an `Launch` with the given ID in the given context.

 ### Example
     let launch: Launch = getLaunch( by: "aksjhdfabsdbcjk", context: context )

 NOTE: this is the only entity to use a `String` ID instead of an `Int64` ID. PITA

 - parameter entityID: `String` ID of the `Launch` to fetch
 - parameter context: `NSManagedObjectContext` context to get the `Launch` from
 - returns: `Launch?` launch with the given ID in the context, nil if not found
 */
public func getLaunch( by entityID: String, context: NSManagedObjectContext ) -> Launch?
{
   return getEntityByID( entityID: entityID, context: context, entityName: LAUNCH_ENTITY_NAME ) as? Launch
}

/**
 Fetches, updates, or creates a `Launch` from the context, given the data

 - parameter launch: `LaunchJSON` JSON data about the launch
 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: updated `Launch`
 */
public func fetchLaunch( launch: LaunchJSON, context: NSManagedObjectContext ) -> Launch
{
   if let launchEntity: Launch = getLaunch( by: launch.id, context: context )
   {
      launch.updateEntity( entity: launchEntity, context: context )
      return launchEntity
   }
   else
   {
      return launch.addToCoreData( context: context )
   }
}

/**
 Returns the number of `Launch` records in the given context.

 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `Int?` Number of `Launch` records in the context
 */
public func getLaunchCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: LAUNCH_ENTITY_NAME, context: context )
}

/**
 Delete all `Launch` entities in the given context.

 - parameter context: `NSManagedObjectContext` context to remove entities from
 */
func deleteAllLaunchEntities( context: NSManagedObjectContext )
{
   deleteAllEntities( entityType: LAUNCH_ENTITY_NAME, context: context )
}
