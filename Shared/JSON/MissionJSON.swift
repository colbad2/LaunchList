import Foundation
import CoreData

/**
   Mission being serviced by a launch.

   Part of a [LaunchJSON] object

   example JSON:
   {
     "description": "T\u00fcrksat 5A is the first of two Turkish next generation communications satellites, which will be operated by T\u00fcrksat for commercial and military purposes.",
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

   var description: String?
   var id: Int64
   var launchDesignator: String?
   var launchLibraryID: Int64?
   var name: String?
   var orbit: OrbitJSON?
   var type: String?

   func addToCoreData( context: NSManagedObjectContext ) -> Mission
   {
      let newMission: Mission = Mission( context: context )

      newMission.missionDescription = self.description
      newMission.id = self.id
      newMission.launchDesignator = self.launchDesignator
      newMission.launchLibraryID = self.launchLibraryID ?? -1
      newMission.name = self.name

      newMission.orbit = self.orbit?.addToCoreData( context: context )
      newMission.orbit?.addToMissions( newMission )

      newMission.type = self.type

      return newMission
   }
}
