// Copyright © 2021 Bradford Holcombe. All rights reserved.

extension Launch
{
   // TODO events, missions, pads, rockets, sevice providers
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

   func sortedProgramsArray() -> [Program]
   {
      return sortProgramsByName( programArray: Array( self.programsSet ) )
   }

   func hasPrograms() -> Bool
   {
      return !programsSet.isEmpty
   }
}

func sortLaunchesByName( launchArray: [Launch]? ) -> [Launch]
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

 - Parameter launch: {Launch} launch to get the mission name from
 - Returns: mission name, if available, "" otherwise
 */
public func missionName( _ launch: Launch? ) -> String
{
   guard let launch = launch else { return "" }
   if let missionName: String = launch.mission?.name { return missionName }
   let parts: [String]? = launch.name?.components( separatedBy: "|" )
   let missionPart: String? = parts?.last

   return missionPart?.trim() ?? launch.name ?? ""
}
