// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 Rocket being used for the launch.
 
 Part of a `LaunchJSON` object

 ### Example JSON:
       {
           "configuration": { … },
           "id": 136
       }
 */
public struct RocketJSON: Decodable, Identifiable, JSONElement
{
   /** Details about the kind of rocket. */
   var configuration: ConfigurationJSON?
   /** ID of the rocket within the API. */
   public var id: Int64

   /**
    Add this rocket to Core Data as a `Rocket` entity. The context still needs to be saved after the add.

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
      guard let rocketEntity = entity else { return }

      rocketEntity.id = configuration?.id ?? -1
      rocketEntity.rocketID = id
      rocketEntity.family = configuration?.family
      rocketEntity.fullName = configuration?.fullName
      rocketEntity.configurationID = configuration?.id ?? -1
      rocketEntity.name = configuration?.name
      rocketEntity.variant = configuration?.variant

      rocketEntity.fetched = Date()
   }
}
