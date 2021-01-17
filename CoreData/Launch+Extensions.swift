// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 Extensions to the Core Data generated [Launch] entity.
 */
extension Launch
{
   /** Set< Event > wrapper for the generated NSSet of [Event]s. */
   var eventsSet: Set< Event > { self.events as? Set< Event > ?? Set< Event >() }

   /** Set< Program > wrapper for the generated NSSet of [Program]s. */
   var programsSet: Set< Program > { self.programs as? Set< Program > ?? Set< Program >() }

   // TODO instead of this, use the abbreviation, if available
   func getProviderName() -> String
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

   /** Array of [Program]s, sorted by name. */
   var sortedPrograms: [Program] { sortProgramsByName( programArray: Array( self.programsSet ) ) }

   /** True if the [Launch] has any [Program]s. */
   var hasPrograms: Bool { !programsSet.isEmpty }
}

/**
 Returns a sorted version of the given [Launch] array.

 - parameter launchArray - list of [Launch]s to sort
 - returns: sorted version of the given [Launch] list
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

 - parameter launch: {Launch} launch to get the mission name from
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

public func getLaunch( by entityID: String, context: NSManagedObjectContext ) -> Launch?
{
   return getEntityByID( entityID: entityID, context: context, entityName: "Launch" ) as? Launch
}

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

public func getLaunchCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "Launch", context: context )
}
