// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for [SpacecraftConfig]. */
public let SPACECRAFT_CONFIG_ENTITY_NAME: String = "SpacecraftConfig"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated [SpacecraftConfig] entity.
 */
extension SpacecraftConfig
{
   // no sets
}

/**
 Returns a sorted version of the given [SpacecraftConfig] array.

 - parameter spacecraftConfigArray - list of [SpacecraftConfig]s to sort
 - returns: sorted version of the given [SpacecraftConfig] list
 */
func sortSpacecraftConfigsByName( spacecraftConfigArray: [SpacecraftConfig]? ) -> [SpacecraftConfig]
{
   guard let spacecraftConfigArray = spacecraftConfigArray else { return [] }

   var spacecraftConfigs: [SpacecraftConfig] = Array( spacecraftConfigArray )
   spacecraftConfigs.sort
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

   return spacecraftConfigs
}

public func getSpacecraftConfig( by entityID: Int64, context: NSManagedObjectContext ) -> SpacecraftConfig?
{
   return getEntityByID( entityID: entityID, context: context, entityName: SPACECRAFT_CONFIG_ENTITY_NAME ) as? SpacecraftConfig
}

public func fetchSpacecraftConfig( spacecraftConfig: SpacecraftConfigJSON, context: NSManagedObjectContext ) -> SpacecraftConfig
{
   let spacecraftConfigEntity: SpacecraftConfig? = getSpacecraftConfig( by: spacecraftConfig.id, context: context )
   spacecraftConfig.updateEntity( entity: spacecraftConfigEntity, context: context )
   return spacecraftConfigEntity ?? spacecraftConfig.addToCoreData( context: context )
}

/**
 Returns the number of [SpacecraftConfig] records in the given context.

 - parameter context: Core Data object context
 - returns: [Int?] Number of [SpacecraftConfig] records in the context
 */
public func getSpacecraftConfigCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: SPACECRAFT_CONFIG_ENTITY_NAME, context: context )
}
