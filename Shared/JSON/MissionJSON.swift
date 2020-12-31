import Foundation
import CoreData

/**
   Mission being serviced by a launch.

   Part of a [LaunchJSON].

   example JSON:
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
struct MissionJSON: Decodable
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
   var id: Int64
   /** TODO unknown*/
   var launchDesignator: String?
   /** TODO unknown*/
   var launchLibraryID: Int64?
   /** Human-readable name of the mission. */
   var name: String?
   /** Orbit for the mission. */
   var orbit: OrbitJSON?
   /** Type of the mission, such as communications, etc. Often blank. */
   var type: String?

   /**
    Add this mission to Core Data as a [Mission] entity. The context still needs to be saved after the add.

    - Parameter context: Core Data context to add the entity to.
    - Returns: the added entity
    */
   func addToCoreData( context: NSManagedObjectContext ) -> Mission
   {
      let newMission: Mission = Mission( context: context )
      updateEntity( entity: newMission, context: context )

      return newMission
   }

   func updateEntity( entity: Mission?, context: NSManagedObjectContext ) -> Void
   {
      if entity == nil { return }

      entity?.missionDescription = self.description?.fixBadUTF()
      entity?.id = self.id
      entity?.launchDesignator = self.launchDesignator
      entity?.name = self.name?.fixBadUTF()

      entity?.orbitName = self.orbit?.name
      entity?.orbitAbbreviation = self.orbit?.abbreviation
      entity?.orbitID = self.orbit?.id ?? -1

      entity?.type = self.type
   }
}


// Core Data search/update

func getMission( by id: Int64, context: NSManagedObjectContext ) -> Mission?
{
   return getEntityByID( id: id, context: context, entityName: "Mission" ) as? Mission
}

func fetchMission( mission: MissionJSON, context: NSManagedObjectContext ) -> Mission
{
   let missionEntity = getMission( by: mission.id, context: context )
   mission.updateEntity( entity: missionEntity, context: context )
   return missionEntity ?? mission.addToCoreData( context: context )
}

func getMissionCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "Mission", context: context )
}


func getSampleMission() -> MissionJSON?
{
   let decoder = JSONDecoder()
   decoder.keyDecodingStrategy = .convertFromSnakeCase

   do
   {
      let jsonData = sampleMissionJSON.data( using: .utf8 )!
      return try decoder.decode( MissionJSON.self, from: jsonData )
   }
   catch { print("error: ", error) }

   return nil
}

let sampleMissionJSON =
"""
      {
        "id": 1087,
        "launch_library_id": 1284,
        "name": "Europa Clipper",
        "description": "Europa Clipper is the first dedicated mission to study Jupiter's moon Europa. Mission is developed by NASA and comprises of an orbiter spacecraft, which, while in orbit around Jupiter, will perform numerous flybys over Europa. Europa Clipper payload suit included high-resolution cameras and spectrometers for imaging Europa's surface and thin atmosphere, an ice-penetrating radar to search for subsurface water, and a magnetometer and gravity measurements to measure the moon's magnetic field and unlock clues about its ocean and deep interior.",
        "launch_designator": null,
        "type": "Planetary Science",
        "orbit": {
          "id": 6,
          "name": "Heliocentric N/A",
          "abbrev": "Helio-N/A"
        }
      }
"""
