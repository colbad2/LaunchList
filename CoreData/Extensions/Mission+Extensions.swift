// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for [Mission]. */
public let MISSION_ENTITY_NAME: String = "Mission"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated [Mission] entity.
 */
extension Mission
{
   // no sets
}

func getMission( by entityID: Int64, context: NSManagedObjectContext ) -> Mission?
{
   return getEntityByID( entityID: entityID, context: context, entityName: MISSION_ENTITY_NAME ) as? Mission
}

func fetchMission( mission: MissionJSON, context: NSManagedObjectContext ) -> Mission
{
   let missionEntity: Mission? = getMission( by: mission.id, context: context )
   mission.updateEntity( entity: missionEntity, context: context )
   return missionEntity ?? mission.addToCoreData( context: context )
}

/**
 Returns the number of [Mission] records in the given context.

 - parameter context: Core Data object context
 - returns: [Int?] Number of [Mission] records in the context
 */
func getMissionCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: MISSION_ENTITY_NAME, context: context )
}
