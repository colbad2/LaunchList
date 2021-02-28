// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for `Mission`. */
public let MISSION_ENTITY_NAME: String = "Mission"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated `Mission` entity.
 */
extension Mission
{
   // no sets
}

/**
 Add this mission to Core Data as a [Mission] entity. The context still needs to be saved after the add.

 - parameter json:    JSON to parse
 - parameter context: `NSManagedObjectContext` Core Data context to add the entity to.
 - returns:           `Mission` the added entity
 */
func addToCoreData( json: MissionJSON, context: NSManagedObjectContext ) -> Mission
{
   let newMission: Mission = Mission( context: context )
   updateEntity( json: json, entity: newMission, context: context )

   return newMission
}

/**
 Set or update the values of the `Mission` entity,

 - parameter json:    JSON to parse
 - parameter entity:  `Mission?` entity to fill/update
 - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
 */
func updateEntity( json: MissionJSON, entity: Mission?, context: NSManagedObjectContext )
{
   guard let missionEntity = entity else { return }

   missionEntity.missionDescription = json.description?.fixBadUTF()
   missionEntity.id = json.id
   missionEntity.launchDesignator = json.launchDesignator
   missionEntity.name = json.name?.fixBadUTF().trim()

   if let orbitName: String = json.orbit?.name
   {
      missionEntity.orbitName = normalizedOrbitName( orbitName, abbreviation: orbit?.abbreviation )
   }
   missionEntity.orbitAbbreviation = json.orbit?.abbreviation

   missionEntity.type = json.type

   missionEntity.fetched = Date()
}

/**
 Gets a `Mission` with the given ID in the given context.

 ### Example
     let mission: Mission = getMission( by: 2345, context: context )

 - parameter entityID: `Int64` ID of the `Mission` to fetch
 - parameter context: `NSManagedObjectContext` context to get the `Mission` from
 - returns: `Mission?` mission with the given ID in the context, nil if not found
 */
func getMission( by entityID: Int64, context: NSManagedObjectContext ) -> Mission?
{
   return getEntityByID( entityID: entityID, context: context, entityName: MISSION_ENTITY_NAME ) as? Mission
}

/**
 Fetches, updates, or creates a `Mission` from the context, given the data.

 - parameter mission: `MissionJSON` JSON data about the mission
 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: updated `Mission`
 */
func fetchMission( mission: MissionJSON, context: NSManagedObjectContext ) -> Mission
{
   let missionEntity: Mission? = getMission( by: mission.id, context: context )
   mission.updateEntity( entity: missionEntity, context: context )
   return missionEntity ?? mission.addToCoreData( context: context )
}

/**
 Returns the number of `Mission` records in the given context.

 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `Int?` Number of `Mission` records in the context
 */
func getMissionCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: MISSION_ENTITY_NAME, context: context )
}

/**
 Delete all `Mission` entities in the given context.

 - parameter context: `NSManagedObjectContext` context to remove entities from
 */
func deleteAllMissionEntities( context: NSManagedObjectContext )
{
   deleteAllEntities( entityType: MISSION_ENTITY_NAME, context: context )
}
