// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 Status of a launch.
 */
public class LaunchStatusJSON
{
   // translate API attribute names into better var names
//   enum CodingKeys: String, CodingKey
//   {
//      case id, name
//
//      case abbreviation = "abbrev"
//      case statusDescription = "description"
//   }

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
