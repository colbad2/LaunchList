// Copyright © 2021 Bradford Holcombe. All rights reserved.

extension SpaceStation
{
   var eventsSet: Set< Event > { self.events as? Set< Event > ?? Set< Event >() }

   var expeditionsSet: Set< Expedition > { self.expeditions as? Set< Expedition > ?? Set< Expedition >() }

   func sortedEventsArray() -> [Event]
   {
      return sortEventsByName( eventArray: Array( self.eventsSet ) )
   }

   func hasEvents() -> Bool
   {
      return !eventsSet.isEmpty
   }

   func sortedExpeditionsArray() -> [Expedition]
   {
      return sortExpeditionsByName( expeditionArray: Array( self.expeditionsSet ) )
   }

   func hasExpeditions() -> Bool
   {
      return !expeditionsSet.isEmpty
   }
}

func sortSpaceStationsByName( spaceStationArray: [SpaceStation]? ) -> [SpaceStation]
{
   guard let spaceStationArray = spaceStationArray else { return [] }

   var spaceStations: [SpaceStation] = Array( spaceStationArray )
   spaceStations.sort
   {
      spaceStation1, spaceStation2 in

      if let name1: String = spaceStation1.name,
         let name2: String = spaceStation2.name
      {
         return name1 < name2
      }
      else
      {
         return false
      }
   }

   return spaceStations
}
