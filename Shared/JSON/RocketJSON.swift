// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name

/**
 Rocket being used for the launch.
 
 Part of a [LaunchJSON] object

 example JSON:
 {
     "configuration": { … },
     "id": 136
 }
 */
struct RocketJSON: Decodable
{
   /** Details about the kind of rocket. */
   var configuration: ConfigurationJSON?
   /** ID of the rocket within the API. */
   var id: Int64

   /**
    Add this rocket to Core Data as a [Rocket] entity. The context still needs to be saved after the add.

    - Parameter context: Core Data context to add the entity to.
    - Returns: the added entity
    */
   func addToCoreData( context: NSManagedObjectContext ) -> Rocket
   {
      let newRocket: Rocket = Rocket( context: context )
      updateEntity( entity: newRocket, context: context )

      return newRocket
   }

   func updateEntity( entity: Rocket?, context: NSManagedObjectContext )
   {
      guard let entity = entity else { return }

      entity.id = self.configuration?.id ?? -1
      entity.rocketID = self.id
      entity.family = self.configuration?.family
      entity.fullName = self.configuration?.fullName
      entity.configurationID = self.configuration?.id ?? -1
      entity.name = self.configuration?.name
      entity.variant = self.configuration?.variant
   }
}

/**
 Specific configuration of a rocket.

 Part of a [RocketJSON]. Merged with a [RocketJSON] to make a [Rocket] entity.

 example JSON:
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
struct ConfigurationJSON: Decodable
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
   var id: Int64
   /** TODO unkown */
   var launchLibraryID: Int64?
   /** TODO Same as "fullName"? */
   var name: String?
   /** API URI for this location. */
   var url: String?
   /** Specific type of the family, like "Block 5". */
   var variant: String?
}

// Core Data search/update

func getRocket( by id: Int64, context: NSManagedObjectContext ) -> Rocket?
{
   return getEntityByID( entityID: id, context: context, entityName: "Rocket" ) as? Rocket
}

func fetchRocket( rocket: RocketJSON, context: NSManagedObjectContext ) -> Rocket?
{
   guard let id = rocket.configuration?.id else { return nil }

   let rocketEntity = getRocket( by: id, context: context )
   rocket.updateEntity( entity: rocketEntity, context: context )
   return rocketEntity ?? rocket.addToCoreData( context: context )
}

func getRocketCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "Rocket", context: context )
}

func getSampleRocket() -> RocketJSON?
{
   return parseJSONString( json: sampleRocketJSON )
}

private let sampleRocketJSON =
"""
{
  "id": 2663,
  "configuration": {
    "id": 143,
    "launch_library_id": 144,
    "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/143/",
    "name": "Space Launch System (SLS)",
    "family": "SLS",
    "full_name": "Space Launch System (SLS)",
    "variant": ""
  }
}
"""
