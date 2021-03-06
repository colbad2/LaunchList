// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 ### Spec (API model: FirstStage)
      id                      integer
      type                    string
      reused                  boolean x-nullable: true
      launcher_flight_number  string
      launcher                LauncherDetailed{...}
      landing                 Landing{...}
      previous_flight_date    string
      turn_around_time_days   string
      previous_flight         Launch{...}
}
*/
public class FirstStageJSON: Decodable, Identifiable, JSONElement
{
   /** ID of the landing type within the API. */
   public let id: Int64
   var type: String?
   var reused: Bool?
   var launcherFlightNumber: String?
   var launcher: LauncherJSON?
   var landing: LandingJSON?
   var previousFlightDate: String?
   var turnaroundTimeDays: String?
   var previousFlight: LaunchJSON?

   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.type = json[ "type" ] as? String
      self.reused = json[ "reused" ] as? Bool
      self.launcherFlightNumber = json[ "launcher_flight_number" ] as? String
      self.launcher = LauncherJSON( json: json[ "reused" ] as? JSONStructure )
      self.landing = LandingJSON( json: json[ "landing" ] as? JSONStructure )
      self.previousFlightDate = json[ "previous_flight_date" ] as? String
      self.turnaroundTimeDays = json[ "turn_around_time_days" ] as? String
      self.previousFlight = LaunchJSON( json: json[ "previous_flight" ] as? JSONStructure )
   }
}
