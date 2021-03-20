// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 ### Spec (API models: AstronautRole)
       id       integer
       role*    string maxLength: 255 minLength: 1
       priority integer maximum: 2147483647 minimum: -2147483648
 */
public class AstronautRoleJSON: Identifiable, JSONElement
{
   public let id: Int64?
   let role: String?
   let priority: Int64?

   public required init?(  _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      id = nonNegativeInt( json[ "id" ] )
      role = nonEmptyString( json[ "role" ] )
      priority = nonNegativeInt( json[ "priority" ] )
   }

   init( id: Int64, role: String, priority: Int64? = 10 )
   {
      self.id = id
      self.role = role
      self.priority = priority
   }
}
