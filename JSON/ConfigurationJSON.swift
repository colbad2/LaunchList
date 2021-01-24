// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 Specific configuration of a rocket.

 Part of a `RocketJSON`. Merged with a `RocketJSON` to make a `Rocket` entity.

 ### Example JSON:
       {
          "family": "Falcon",
          "full_name": "Falcon 9 Block 5",
          "id": 164,
          "launch_library_id": 188,
          "name": "Falcon 9 Block 5",
          "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/164/",
          "variant": "Block 5"
       }
 */
public struct ConfigurationJSON: Decodable, Identifiable, JSONElement
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case family, fullName, id, name, url, variant

      case launchLibraryID = "launchLibraryId"
   }

   /** Broad name of the rocket family, like "Falcon 9". */
   var family: String?
   /** Merged string of the "family" and "type" attributes. */
   var fullName: String?
   /** ID of the location within the API. */
   public var id: Int64
   /** Old API database record ID */
   var launchLibraryID: Int64?
   /** Same as "fullName"? */
   var name: String?
   /** API URI for this location. */
   var url: String? // unused
   /** Specific type of the family, like "Block 5". */
   var variant: String?
}
