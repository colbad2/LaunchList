// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 Extensions to the Core Data generated {Astronaut} entity.
 */
extension Astronaut
{
}

func sortAstronautsByName( astronautArray: [Astronaut]? ) -> [Astronaut]
{
   guard let astronautArray = astronautArray else { return [] }

   var astronauts: [Astronaut] = Array( astronautArray )
   astronauts.sort
   {
      astronaut1, astronaut2 in

      if let name1: String = astronaut1.name,
         let name2: String = astronaut2.name
      {
         return name1 < name2
      }
      else
      {
         return false
      }
   }

   return astronauts
}
