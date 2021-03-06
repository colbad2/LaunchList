// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 Mission orbit. All fields are promoted into the `Mission` entity, so there is no `Orbit` CoreData entity.

 ### Example JSON:
       {
           "abbrev": "GTO",
           "id": 2,
           "name": "Geostationary Transfer Orbit"
       }

 ### Spec (API model: Orbit)
       id   integer
       name*   string maxLength: 50 minLength: 1
       abbrev*   string  maxLength: 30 minLength: 1
 }
 */
public class OrbitJSON: Decodable, Identifiable, JSONElement
{
   /** ID of the astronaut within the API. */
   public var id: Int64
   let name: String?
   let abbreviation: String?

   /**
    Make a `ServiceProviderJSON` from a JSON structure.

    - parameter json: `JSONStructure` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.abbreviation = json[ "abbrev" ] as? String
      self.name = json[ "name" ] as? String
   }
}
