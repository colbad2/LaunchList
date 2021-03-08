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
   public let id: Int64?
   let name: String?

   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      self.id = nonNegativeInt( json[ "id" ] )
      self.name = nonEmptyString( json[ "name" ] )
   }

   public init( id: Int64, name: String )
   {
      self.id = id
      self.name = name
   }
}
