// Copyright © 2021 Bradford Holcombe. All rights reserved.

extension Expedition
{
   var eventsSet: Set< Event > { self.events as? Set< Event > ?? Set< Event >() }

   func sortedAgenciesArray() -> [Event]
   {
      return sortEventsByName( eventArray: Array( self.eventsSet ) )
   }

   func hasAgencies() -> Bool
   {
      return !eventsSet.isEmpty
   }
}

func sortExpeditionsByName( expeditionArray: [Expedition]? ) -> [Expedition]
{
   guard let expeditionArray = expeditionArray else { return [] }

   var expeditions: [Expedition] = Array( expeditionArray )
   expeditions.sort
   {
      expedition1, expedition2 in

      if let name1: String = expedition1.name,
         let name2: String = expedition2.name
      {
         return name1 < name2
      }
      else
      {
         return false
      }
   }

   return expeditions
}
