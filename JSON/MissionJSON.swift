// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
   Mission being serviced by a launch.

   Part of a `LaunchJSON`.

   ### Example JSON:
         {
           "description": "T\u00fcrksat 5A is the first of two Turkish next generation communications satellites, which will be \
                            operated by T\u00fcrksat for commercial and military purposes.",
           "id": 1222,
           "launch_designator": null,
           "launch_library_id": null,
           "name": "T\u00fcrksat 5A",
           "orbit": { … },
           "type": "Communications"
         }
 */
public struct MissionJSON: Decodable, Identifiable, JSONElement
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case description, id, launchDesignator, name, orbit, type

      case launchLibraryID = "launchLibraryId"
   }

   /** Description of the mission. Can contain encoded Unicode elements like /u00fc, which are translated correctly on parse of JSON. */
   var description: String?
   /** ID of the mission within the API. */
   public var id: Int64
   /** unknown */
   var launchDesignator: String?
   /** ID from the previous API database. */
   var launchLibraryID: Int64?
   /** Human-readable name of the mission. */
   var name: String?
   /** Orbit for the mission. */
   var orbit: OrbitJSON?
   /** Type of the mission, such as communications, etc. Often blank. */
   var type: String?

   /**
    Add this mission to Core Data as a [Mission] entity. The context still needs to be saved after the add.

    - parameter context: `NSManagedObjectContext` Core Data context to add the entity to.
    - returns:           `Mission` the added entity
    */
   func addToCoreData( context: NSManagedObjectContext ) -> Mission
   {
      let newMission: Mission = Mission( context: context )
      updateEntity( entity: newMission, context: context )

      return newMission
   }

   func updateEntity( entity: Mission?, context: NSManagedObjectContext )
   {
      guard let missionEntity = entity else { return }

      missionEntity.missionDescription = description?.fixBadUTF()
      missionEntity.id = id
      missionEntity.launchDesignator = launchDesignator
      missionEntity.name = name?.fixBadUTF().trim()

      if let orbitName: String = orbit?.name
      {
         missionEntity.orbitName = normalizedOrbitName( orbitName, abbreviation: orbit?.abbreviation )
      }
      missionEntity.orbitAbbreviation = orbit?.abbreviation

      missionEntity.type = type

      missionEntity.fetched = Date()
   }
}

private func normalizedOrbitName( _ name: String?, abbreviation: String? = nil ) -> String?
{
   guard var orbitName = name else { return nil }

   if !orbitName.contains( " Orbit" )
   {
      orbitName += " Orbit"
   }

   if let abbreviation: String = abbreviation
   {
      orbitName += " (\(abbreviation))"
   }

   return orbitName
}
