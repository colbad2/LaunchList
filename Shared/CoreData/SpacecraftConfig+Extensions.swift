// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 Extensions to the Core Data generated {SpacecraftConfig} entity.
 */
extension SpacecraftConfig
{
}

func sortSpacecraftConfigsByName( spacecraftConfigArray: [SpacecraftConfig]? ) -> [SpacecraftConfig]
{
   guard let spacecraftConfigArray = spacecraftConfigArray else { return [] }

   var apacecraftConfigs: [SpacecraftConfig] = Array( spacecraftConfigArray )
   apacecraftConfigs.sort
   {
      spacecraftConfig1, spacecraftConfig2 in

      if let name1: String = spacecraftConfig1.name,
         let name2: String = spacecraftConfig2.name
      {
         return name1 < name2
      }
      else
      {
         return false
      }
   }

   return apacecraftConfigs
}
