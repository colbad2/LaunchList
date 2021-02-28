// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

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
public class ConfigurationJSON: Decodable, Identifiable, JSONElement
{
   // translate API attribute names into better var names
//   enum CodingKeys: String, CodingKey
//   {
//      case family, fullName, id, name, url, variant
//
//      case launchLibraryID = "launchLibraryId"
//   }

   /** ID of the location within the API. */
   public var id: Int64
   /** Broad name of the rocket family, like "Falcon 9". */
   var family: String?
   /** Merged string of the "family" and "type" attributes. */
   var fullName: String?
   /** Old API database record ID. Unused. */
   var launchLibraryID: Int64?
   /** Same as "fullName"? */
   var name: String?
   /** API URI for this location. Unused. */
   var url: String?
   /** Specific type of the family, like "Block 5". */
   var variant: String?

   /**
    Make a `ConfigurationJSON` from a JSON structure.

    - parameter json: `JSONStructure` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.family = json[ "family" ] as? String
      self.fullName = json[ "fullName" ] as? String
      self.launchLibraryID = json[ "launchLibraryId" ] as? Int64
      self.name = json[ "name" ] as? String
      self.url = json[ "url" ] as? String
      self.variant = json[ "variant" ] as? String
   }

   /**
    Add this configuration to Core Data as a `Configuration` entity. The context still needs to be saved after the add.

    - parameter context: Core Data context to add the entity to.
    - returns: the added entity
    */
   func addToCoreData( context: NSManagedObjectContext ) -> Configuration
   {
      let newConfiguration: Configuration = Configuration( context: context )
      updateEntity( entity: newConfiguration, context: context )

      return newConfiguration
   }

   /**
    Set or update the values of the `Configuration` entity,

    - parameter entity: `Configuration?` entity to fill/update
    - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
    */
   func updateEntity( entity: Configuration?, context: NSManagedObjectContext )
   {
      guard let configurationEntity = entity else { return }

      configurationEntity.id = id
      configurationEntity.family = family
      configurationEntity.fullName = fullName
      configurationEntity.name = name
      configurationEntity.url = url

      configurationEntity.fetched = Date()
   }
}
