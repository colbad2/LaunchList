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

 ### Spec
 id   integer
 configuration   LauncherConfigDetail{...}
 launcher_stage   [FirstStage{...}]
 spacecraft_stage   SpacecraftFlightDetailedSerializerForLaunch{...}
 */
public class RocketJSON: Decodable, Identifiable, JSONElement, AutoEquatable, AutoHashable
{
   /** ID of the rocket within the API. */
   public var id: Int64
   /** Details about the kind of rocket. */
   var configuration: ConfigurationJSON?
   var launcherStage: [FirstStageJSON] = []
   var spacecraftStage: SpacecraftFlightJSON?

   /**
    Make a `ConfigurationJSON` from a JSON structure.

    - parameter json: `JSONStructure` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.configuration = ConfigurationJSON( json: json[ "configuration" ] as? JSONStructure )
      self.launcherStage = ( json[ "launcher_stage" ] as? [JSONStructure] )?.compactMap { FirstStageJSON( json: $0 ) } ?? []
      self.spacecraftStage = SpacecraftFlightJSON( json: json[ "spacecraft_stage" ] as? JSONStructure )
   }

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

   /**
    Set or update the values of the `Rocket` entity,

    - parameter entity: `Rocket?` entity to fill/update
    - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
    */
   func updateEntity( entity: Rocket?, context: NSManagedObjectContext )
   {
      guard let rocketEntity = entity else { return }

      rocketEntity.id = id
      rocketEntity.addConfigurationFromJSON( configuration: configuration, context: context )
      rocketEntity.name = configuration?.name

      rocketEntity.fetched = Date()
   }
}
