// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 ### Spec (API models: AstronautRole)
       id       integer
       role*    string maxLength: 255 minLength: 1
       priority integer maximum: 2147483647 minimum: -2147483648
 */
public class AstronautRole: Identifiable, JSONElement
{
   public let id: Int64?
   let role: String?
   let priority: Int64?

   public required init?(  _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      self.id = nonNegativeInt( json[ "id" ] )
      self.role = nonEmptyString( json[ "role" ] )
      self.priority = nonNegativeInt( json[ "priority" ] )
   }
}
