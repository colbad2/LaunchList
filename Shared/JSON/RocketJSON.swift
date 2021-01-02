import Foundation
import CoreData

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

   func updateEntity( entity: Rocket?, context: NSManagedObjectContext ) -> Void
   {
      if entity == nil { return }

      entity?.id = self.configuration?.id ?? -1
      entity?.rocketID = self.id
      entity?.family = self.configuration?.family
      entity?.fullName = self.configuration?.fullName
      entity?.configurationID = self.configuration?.id ?? -1
      entity?.name = self.configuration?.name
      entity?.variant = self.configuration?.variant
   }
}

// Core Data search/update

func getRocket( by id: Int64, context: NSManagedObjectContext ) -> Rocket?
{
   return getEntityByID( id: id, context: context, entityName: "Rocket" ) as? Rocket
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
   let decoder = JSONDecoder()
   decoder.keyDecodingStrategy = .convertFromSnakeCase

   do
   {
      let jsonData = sampleRocketJSON.data( using: .utf8 )!
      return try decoder.decode( RocketJSON.self, from: jsonData )
   }
   catch { print( "error: ", error) }

   return nil
}

let sampleRocketJSON =
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

