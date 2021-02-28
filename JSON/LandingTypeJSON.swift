// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 Type of a landing.
 */
public class LandingTypeJSON: Decodable, Identifiable, JSONElement
{
   /** ID of the landing type within the API. */
   public let id: Int64
   let name: String?
   var abbreviation: String?
   var typeDescription: String?

   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.name = json[ "name" ] as? String
      self.abbreviation = json[ "abbrev" ] as? String
      self.typeDescription = json[ "description" ] as? String
   }
}
