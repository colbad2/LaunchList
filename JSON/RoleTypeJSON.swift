// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 Astronaut role on a mission.

 This has no corresponding CoreData entity. All values are flattened to the `AstronautFlight` entity.

  ### Example JSON
       {
          "id": 21,
          "role": "pilot"
       }
 */
public class RoleTypeJSON: Decodable, Identifiable, JSONElement
{
   public let id: Int64
   let role: String?

   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.role = json[ "role" ] as? String
   }
}
