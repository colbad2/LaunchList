// Copyright © 2021 Bradford Holcombe. All rights reserved.

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
public struct RocketJSON: Decodable
{
   /** Details about the kind of rocket. */
   var configuration: ConfigurationJSON?
   /** ID of the rocket within the API. */
   var id: Int64

   /**
    Add this rocket to Core Data as a [Rocket] entity. The context still needs to be saved after the add.

    - parameter context: Core Data context to add the entity to.
    - returns: the added entity
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
