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

 ### Spec (API Model: RocketSerializerCommon, RocketDetailed)
       id               integer
       configuration    LauncherConfigList{...} pr LauncherConfigDetail{}
       launcher_stage   [FirstStage{...}]
       spacecraft_stage SpacecraftFlightDetailedSerializerForLaunch{...}
 */
public class RocketJSON: Identifiable, JSONElement, AutoEquatable, AutoHashable
{
   /** ID of the rocket within the API. */
   public var id: Int64?
   /** Details about the kind of rocket. */
   var configuration: LauncherConfigJSON?
   var launcherStage: [FirstStageJSON] = []
   var spacecraftStage: SpacecraftFlightJSON?

   /**
    Make a `RocketJSON` from a JSON structure.

    - parameter json: `Any` JSON to parse
    */
   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      self.id = nonNegativeInt( json[ "id" ] )
      self.configuration = LauncherConfigJSON( json[ "configuration" ] )
      self.launcherStage = parseArray( json[ "launcher_stage" ] )
      self.spacecraftStage = SpacecraftFlightJSON( json[ "spacecraft_stage" ] )
   }
}
