// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 ### Spec( API models: AstronautRole)
       id       integer
       role*    string maxLength: 255 minLength: 1
       priority integer maximum: 2147483647 minimum: -2147483648
 */
public class AstronautRole: Decodable, Identifiable, JSONElement
{
   public let id: Int64
   let role: String?
   let priority: Int64?

   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.role = json[ "role" ] as? String
      self.priority = json[ "priority" ] as? Int64
   }
}
