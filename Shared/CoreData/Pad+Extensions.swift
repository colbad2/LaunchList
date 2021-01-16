// Copyright © 2021 Bradford Holcombe. All rights reserved.

extension Pad
{
   var launchSet: Set< Launch > { self.launches as? Set< Launch > ?? Set< Launch >() }

   func sortedLaunchesArray() -> [Launch]
   {
      return sortLaunchesByName( launchArray: Array( self.launchSet ) )
   }

   func hasLaunches() -> Bool
   {
      return !launchSet.isEmpty
   }
}

func sortPadsByName( padArray: [Pad]? ) -> [Pad]
{
   guard let padArray = padArray else { return [] }

   var pads: [Pad] = Array( padArray )
   pads.sort
   {
      pad1, pad2 in

      if let name1: String = pad1.name,
         let name2: String = pad2.name
      {
         return name1 < name2
      }
      else
      {
         return false
      }
   }

   return pads
}
