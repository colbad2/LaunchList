// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 Used in many JSON structs as a name/ID pair, interpreted by where it is.

 ### Example JSON
       {
          "id": 21,
          "name": "Cryoproof Test"
       }

 ### Spec (API models: SpacecraftConfigType, AstronautStatus, AstronautType, SpacecraftStatus,
                         AgencyType, DockingLocation, EventType, FirstStagetype, MissionType, NoticeType,
                         RoadClosureStatus, SpaceStationStatus, SpaceStationType)
     id   integer
     name string maxLength: 255
 */
public class IDNameJSON: Decodable, Identifiable, JSONElement
{
   public let id: Int64
   let name: String?

   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.name = json[ "name" ] as? String
   }
}
