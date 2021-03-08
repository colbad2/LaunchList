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
   public let id: Int64?
   let role: String?

   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      self.id = nonNegativeInt( json[ "id" ] )
      self.role = nonEmptyString( json[ "role" ] )
   }
}
