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
       id               integer
       configuration    LauncherConfigDetail{...}
       launcher_stage   [FirstStage{...}]
       spacecraft_stage SpacecraftFlightDetailedSerializerForLaunch{...}
 */
public class RocketJSON: Decodable, Identifiable, JSONElement, AutoEquatable, AutoHashable
{
   /** ID of the rocket within the API. */
   public var id: Int64
   /** Details about the kind of rocket. */
   var configuration: LauncherConfigJSON?
   var launcherStage: [FirstStageJSON] = []
   var spacecraftStage: SpacecraftFlightJSON?

   /**
    Make a `RocketJSON` from a JSON structure.

    - parameter json: `JSONStructure` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.configuration = LauncherConfigJSON( json: json[ "configuration" ] as? JSONStructure )
      self.launcherStage = ( json[ "launcher_stage" ] as? [JSONStructure] )?.compactMap { FirstStageJSON( json: $0 ) } ?? []
      self.spacecraftStage = SpacecraftFlightJSON( json: json[ "spacecraft_stage" ] as? JSONStructure )
   }
}
