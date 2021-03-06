// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 Status of a launch.

 ### Spec (API models: LaunchStatus)
       id*   integer maximum: 2147483647 minimum: -2147483648
       name   string
       abbrev   string maxLength: 255
       description   string maxLength: 2048
 */
public class LaunchStatusJSON
{
   /** ID of the launch status within the API. */
   public let id: Int64
   let name: String?
   var abbreviation: String?
   var statusDescription: String?

   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.name = json[ "name" ] as? String
      self.abbreviation = json[ "abbrev" ] as? String
      self.statusDescription = json[ "description" ] as? String
   }
}
