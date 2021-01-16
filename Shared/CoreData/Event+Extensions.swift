// Copyright © 2021 Bradford Holcombe. All rights reserved.

extension Event
{
   var launchesSet: Set< Launch > { self.launches as? Set< Launch > ?? Set< Launch >() }

   var expeditionsSet: Set< Expedition > { self.expeditions as? Set< Expedition > ?? Set< Expedition >() }

   var programsSet: Set< Program > { self.programs as? Set< Program > ?? Set< Program >() }

   var spaceStationsSet: Set< SpaceStation > { self.spaceStations as? Set< SpaceStation > ?? Set< SpaceStation >() }

   func sortedLaunchesArray() -> [Launch]
   {
      return sortLaunchesByName( launchArray: Array( self.launchesSet ) )
   }

   func hasLaunches() -> Bool
   {
      return !launchesSet.isEmpty
   }

   func sortedExpeditionsArray() -> [Expedition]
   {
      return sortExpeditionsByName( expeditionArray: Array( self.expeditionsSet ) )
   }

   func hasExpeditions() -> Bool
   {
      return !expeditionsSet.isEmpty
   }

   func sortedProgramsArray() -> [Program]
   {
      return sortProgramsByName( programArray: Array( self.programsSet ) )
   }

   func hasPrograms() -> Bool
   {
      return !programsSet.isEmpty
   }

   func sortedSpaceStationsArray() -> [SpaceStation]
   {
      return sortSpaceStationsByName( spaceStationArray: Array( self.spaceStationsSet ) )
   }

   func hasSpaceStations() -> Bool
   {
      return !spaceStationsSet.isEmpty
   }
}

func sortEventsByName( eventArray: [Event]? ) -> [Event]
{
   guard let eventArray = eventArray else { return [] }

   var events: [Event] = Array( eventArray )
   events.sort
   {
      event1, event2 in

      if let name1: String = event1.name,
         let name2: String = event2.name
      {
         return name1 < name2
      }
      else
      {
         return false
      }
   }

   return events
}
